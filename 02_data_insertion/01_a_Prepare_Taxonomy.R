# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Prepare taxonomic data for upload
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Adapted for wildlife data by Amanda Droghini, Alaska Center for Conservation Science
# Usage: Script should be executed in R 4.1.0+.
# Description: "Prepare taxonomic data for upload" parses data into a SQL query for upload into empty tables.
# ---------------------------------------------------------------------------

# Define directories ----

# Set root directory
drive = 'C:'
root_folder = 'ACCS_Work'

# Define input folders
data_folder = paste(drive,
                    root_folder,
                    'Taxonomy_Database/Data/Tables_Taxonomy',
                    sep = '/')

# Designate output sql file
sql_taxonomy = paste(drive, 
                     root_folder,
                     'GitHub/wildlife-taxonomy-database/02_data_insertion/01_b_Insert_Taxonomy.sql',
                     sep = "/")

# Identify taxonomy tables
wildlife_file = paste(data_folder,
                      'vertebrateTaxa.xlsx',
                      sep='/')
citation_file = paste(data_folder,
                      'citations.xlsx',
                      sep='/')

# Load packages and data ----

# Import required libraries
library(tidyverse)
library(readxl)

# Read taxonomy tables into dataframes
taxonomy_data = read_excel(wildlife_file, sheet = 'taxonomy')
citation_data = read_excel(citation_file, sheet = 'citations')

# Format data ----

# Exclude subspecies and population 
# Current database only includes species
# Create genus column
taxonomy_data <- taxonomy_data %>% 
  dplyr::filter(level == "species") %>% 
  arrange(class,order,family,name_given) %>% 
  dplyr::mutate(genus = word(name_given,1), id = row_number()) %>% 
  dplyr::select(id, name_given, name_status, name_accepted, genus, class, order, family, taxon_source, link_source, level, native, non_native, endemic)
  
# Export taxonomy table as csv
csv_taxonomy = paste(data_folder, 'csv', 'taxonomy.csv', sep = '/')
write.csv(taxonomy_data, file = csv_taxonomy, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse tables for SQL database ----

# Parse class table
class_table = taxonomy_data %>%
  distinct(class) %>%
  arrange(class) %>%
  rowid_to_column('class_id')

# Export class table
csv_class = paste(data_folder, 'csv', 'class.csv', sep = '/')
write.csv(class_table, file = csv_class, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse order table
order_table = taxonomy_data %>%
  distinct(order) %>%
  arrange(order) %>%
  rowid_to_column('order_id')

# Export order table
csv_order = paste(data_folder, 'csv', 'order.csv', sep = '/')
write.csv(order_table, file = csv_order, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse family table
family_table = taxonomy_data %>%
  distinct(family) %>%
  arrange(family) %>%
  rowid_to_column('family_id')

# Export family table
csv_family = paste(data_folder, 'csv', 'family.csv', sep = '/')
write.csv(family_table, file = csv_family, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse taxonomic status table
status_table = taxonomy_data %>%
  distinct(name_status) %>%
  arrange(name_status) %>%
  rename(taxon_status = name_status) %>%
  rowid_to_column('taxon_status_id')

# Export taxonomic status table
csv_status = paste(data_folder, 'csv', 'taxon_status.csv', sep = '/')
write.csv(status_table, file = csv_status, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse taxonomic level table
level_table = taxonomy_data %>%
  distinct(level) %>%
  arrange(level) %>%
  rowid_to_column('level_id')

# Export taxonomic level table
csv_level = paste(data_folder, 'csv', 'taxon_level.csv', sep = '/')
write.csv(level_table, file = csv_level, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse taxonomic source table
# Remove missing values (haven't listed sources for synonyms yet)
source_table = taxonomy_data %>%
  filter(!is.na(taxon_source)) %>% 
  distinct(taxon_source) %>%
  arrange(taxon_source) %>%
  left_join(citation_data, by = 'taxon_source') %>%
  rowid_to_column('taxon_source_id')

# Export taxonomic source table
csv_source = paste(data_folder, 'csv', 'taxon_source.csv', sep = '/')
write.csv(source_table, file = csv_source, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse hierarchy table
hierarchy_table = taxonomy_data %>%
  filter(name_status == 'accepted' |
           name_status == 'provisional') %>%
  distinct(genus, .keep_all = TRUE) %>%
  left_join(family_table, by = 'family') %>%
  left_join(order_table, by = 'order') %>%
  left_join(class_table, by = 'class') %>%
  rename(genus_accepted = genus) %>%
  arrange(genus_accepted) %>%
  rowid_to_column('hierarchy_id') %>%
  select(hierarchy_id, genus_accepted, family_id, order_id, class_id)

# Export hierarchy table
csv_hierarchy = paste(data_folder, 'csv', 'hierarchy.csv', sep = '/')
write.csv(hierarchy_table, file = csv_hierarchy, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse taxon accepted table
accepted_table = taxonomy_data %>%
  filter(name_status == 'accepted' |
           name_status == 'provisional') %>%
  separate(name_accepted, c('genus_accepted'), extra = 'drop', sep = '([ ])', remove = FALSE) %>%
  left_join(hierarchy_table, by = 'genus_accepted') %>%
  left_join(source_table, by = 'taxon_source') %>%
  left_join(level_table, by = 'level') %>%
  arrange(name_accepted) %>%
  rowid_to_column('accepted_id') %>%
  select(accepted_id, name_accepted, hierarchy_id, taxon_source_id, link_source, level_id, native, non_native, endemic)

# Export taxon accepted table
csv_accepted = paste(data_folder, 'csv', 'taxon_accepted.csv', sep = '/')
write.csv(accepted_table, file = csv_accepted, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse synonym taxon table
synonyms_table = taxonomy_data %>%
  rename(synonym_id = id) %>%
  left_join(status_table, by = c('name_status' = 'taxon_status')) %>%
  left_join(accepted_table, by = 'name_accepted') %>%
  arrange(name_given) %>%
  select(synonym_id, name_given, taxon_status_id, accepted_id)

# Export given name table
csv_synonym = paste(data_folder, 'csv', 'taxon_synonyms.csv', sep = '/')
write.csv(synonyms_table, file = csv_synonym, fileEncoding = 'UTF-8', row.names = FALSE)

#### Write data to SQL file ----

# Write statement header
statement = c(
  '-- -*- coding: utf-8 -*-',
  '-- ---------------------------------------------------------------------------',
  '-- Insert taxonomy data',
  '-- Author: Timm Nawrocki & Amanda Droghini, Alaska Center for Conservation Science',
  paste('-- Last Updated: ', Sys.Date()),
  '-- Usage: Script should be executed in a PostgreSQL 12 database.',
  '-- Description: "Insert taxonomy data" pushes data from the taxonomy editing tables into the database server. The script "Build taxonomy tables" should be run prior to this script to start with empty, properly formatted tables.',
  '-- ---------------------------------------------------------------------------',
  '',
  '-- Initialize transaction',
  'START TRANSACTION;',
  ''
  )

# Add class statement
statement = c(statement,
              '',
              '-- Insert data into class table',
              'INSERT INTO class (class_id, class) VALUES'
              )
class_sql = class_table %>%
  mutate(class = paste('\'', class, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep = ''))
class_sql[nrow(class_sql),] = paste(str_sub(class_sql[nrow(class_sql),],
                                              start = 1,
                                              end = -2),
                                          ';',
                                          sep = '')
for (line in class_sql) {
  statement = c(statement, line)
}

# Add order statement
statement = c(statement,
              '',
              '-- Insert data into order table',
              'INSERT INTO tax_order (order_id, tax_order) VALUES'
)
order_sql = order_table %>%
  mutate(order = paste('\'', order, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep = ''))
order_sql[nrow(order_sql),] = paste(str_sub(order_sql[nrow(order_sql),],
                                            start = 1,
                                            end = -2),
                                    ';',
                                    sep = '')
for (line in order_sql) {
  statement = c(statement, line)
}

# Add family statement
statement = c(statement,
              '',
              '-- Insert data into family table',
              'INSERT INTO family (family_id, family) VALUES'
              )
family_sql = family_table %>%
  mutate(family = paste('\'', family, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep = ''))
family_sql[nrow(family_sql),] = paste(str_sub(family_sql[nrow(family_sql),],
                                                  start = 1,
                                                  end = -2),
                                      ';',
                                      sep = '')
for (line in family_sql) {
  statement = c(statement, line)
}

# Add taxon status statement
statement = c(statement,
              '',
              '-- Insert data into taxon status table',
              'INSERT INTO taxon_status (taxon_status_id, taxon_status) VALUES'
)
status_sql = status_table %>%
  mutate(taxon_status = paste('\'', taxon_status, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep = ''))
status_sql[nrow(status_sql),] = paste(str_sub(status_sql[nrow(status_sql),],
                                            start = 1,
                                            end = -2),
                                    ';',
                                    sep = '')
for (line in status_sql) {
  statement = c(statement, line)
}

# Add taxon level statement
statement = c(statement,
              '',
              '-- Insert data into taxon level table',
              'INSERT INTO taxon_level (level_id, level) VALUES'
)
level_sql = level_table %>%
  mutate(level = paste('\'', level, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep = ''))
level_sql[nrow(level_sql),] = paste(str_sub(level_sql[nrow(level_sql),],
                                              start = 1,
                                              end = -2),
                                      ';',
                                      sep = '')
for (line in level_sql) {
  statement = c(statement, line)
}

# Add taxon source statement
statement = c(statement,
              '',
              '-- Insert data into taxon source table',
              'INSERT INTO taxon_source (taxon_source_id, taxon_source, citation) VALUES'
)
source_sql = source_table %>%
  mutate_if(is.character,
            str_replace_all, pattern = '\'', replacement = '\'\'') %>%
  mutate(taxon_source = paste('\'', taxon_source, '\'', sep = '')) %>%
  mutate(citation = paste('\'', citation, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep = ''))
source_sql[nrow(source_sql),] = paste(str_sub(source_sql[nrow(source_sql),],
                                            start = 1,
                                            end = -2),
                                    ';',
                                    sep = '')
for (line in source_sql) {
  statement = c(statement, line)
}

# Add hierarchy statement
statement = c(statement,
              '',
              '-- Insert data into hierarchy table',
              'INSERT INTO hierarchy (hierarchy_id, genus_accepted, family_id, order_id, class_id) VALUES'
)
hierarchy_sql = hierarchy_table %>%
  mutate(genus_accepted = paste('\'', genus_accepted, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep = ''))
hierarchy_sql[nrow(hierarchy_sql),] = paste(str_sub(hierarchy_sql[nrow(hierarchy_sql),],
                                            start = 1,
                                            end = -2),
                                    ';',
                                    sep = '')
for (line in hierarchy_sql) {
  statement = c(statement, line)
}

# Add taxon accepted statement
statement = c(statement,
              '',
              '-- Insert data into accepted taxon table',
              'INSERT INTO taxon_accepted (accepted_id, name_accepted, hierarchy_id, taxon_source_id, link_source, level_id, native, non_native, endemic) VALUES'
)
accepted_sql = accepted_table %>%
  mutate_if(is.character,
            str_replace_all, pattern = '\'', replacement = '\'\'') %>%
  mutate(name_accepted = paste('\'', name_accepted, '\'', sep = '')) %>%
  mutate(link_source = paste('\'', link_source, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep = ''))
accepted_sql[nrow(accepted_sql),] = paste(str_sub(accepted_sql[nrow(accepted_sql),],
                                                    start = 1,
                                                    end = -2),
                                            ';',
                                            sep = '')
for (line in accepted_sql) {
  statement = c(statement, line)
}

# Add taxon synonyms statement
statement = c(statement,
              '',
              '-- Insert data into synonyms taxon table',
              'INSERT INTO taxon_synonyms (synonym_id, name_given, taxon_status_id, accepted_id) VALUES'
)
synonyms_sql = synonyms_table %>%
  mutate(name_given = paste('\'', name_given, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep = ''))
synonyms_sql[nrow(synonyms_sql),] = paste(str_sub(synonyms_sql[nrow(synonyms_sql),],
                                                  start = 1,
                                                  end = -2),
                                          ';',
                                          sep = '')
for (line in synonyms_sql) {
  statement = c(statement, line)
}

# Finalize statement
statement = c(statement,
              '',
              '-- Commit transaction',
              'COMMIT TRANSACTION;')

# Replace NA with NULL
statement = str_replace_all(statement, ', NA', ', NULL')

# Write statement to SQL file
write_lines(statement, sql_taxonomy)