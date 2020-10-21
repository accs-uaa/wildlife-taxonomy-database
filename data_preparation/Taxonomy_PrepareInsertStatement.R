# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Prepare taxonomic data for upload
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Last Updated: 2020-10-19
# Usage: Script should be executed in R 4.0.0+.
# Description: "Prepare taxonomic data for upload" merges taxonomy tables for vascular plants, bryophytes, and lichens; and parses data into a SQL query for upload into empty tables.
# ---------------------------------------------------------------------------

# Set root directory
drive = 'N:'
root_folder = 'ACCS_Work'

# Define input folders
data_folder = paste(drive,
                    root_folder,
                    'Projects/VegetationEcology/AKVEG_PlotsDatabase/Data/Tables_Taxonomy',
                    sep = '/')

# Designate output sql file
sql_taxonomy = 'C:/Users/timmn/Documents/Repositories/vegetation-plots-database/database/Insert_1_Taxonomy.sql'

# Identify taxonomy tables
vascular_file = paste(data_folder,
                      'vascularPlants.xlsx',
                      sep='/')
bryophyte_file = paste(data_folder,
                       'bryophytes.xlsx',
                       sep='/')
lichen_file = paste(data_folder,
                    'lichens.xlsx',
                    sep='/')
unknown_file = paste(data_folder,
                     'unknowns.xlsx',
                     sep = '/')
citation_file = paste(data_folder,
                      'citations.xlsx',
                      sep='/')

# Import required libraries
library(dplyr)
library(readr)
library(readxl)
library(stringr)
library(tibble)
library(tidyr)

# Read taxonomy tables into dataframes
vascular_data = read_excel(vascular_file, sheet = 'taxonomy')
bryophyte_data = read_excel(bryophyte_file, sheet = 'taxonomy')
lichen_data = read_excel(lichen_file, sheet = 'taxonomy')
unknown_data = read_excel(unknown_file, sheet = 'taxonomy')
citation_data = read_excel(citation_file, sheet = 'citations')

# Merge taxonomy tables to single dataframe
taxonomy_data = bind_rows(vascular_data, bryophyte_data, lichen_data, unknown_data)

# Export merged taxonomy table
csv_taxonomy = paste(data_folder, 'csv', 'taxonomy.csv', sep = '/')
write.csv(taxonomy_data, file = csv_taxonomy, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse author names table
author_table = taxonomy_data %>%
  distinct(authAdjudicated) %>%
  arrange(authAdjudicated) %>%
  rename(author = authAdjudicated) %>%
  rowid_to_column('authorID')

# Export author table
csv_author = paste(data_folder, 'csv', 'author.csv', sep = '/')
write.csv(author_table, file = csv_author, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse category table
category_table = taxonomy_data %>%
  distinct(category) %>%
  arrange(category) %>%
  rowid_to_column('categoryID')

# Export category table
csv_category = paste(data_folder, 'csv', 'category.csv', sep = '/')
write.csv(category_table, file = csv_category, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse family table
family_table = taxonomy_data %>%
  distinct(family) %>%
  arrange(family) %>%
  rowid_to_column('familyID')

# Export family table
csv_family = paste(data_folder, 'csv', 'family.csv', sep = '/')
write.csv(family_table, file = csv_family, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse growth habit table
habit_table = taxonomy_data %>%
  distinct(habit) %>%
  arrange(habit) %>%
  rowid_to_column('habitID')

# Export growth habit table
csv_habit = paste(data_folder, 'csv', 'habit.csv', sep = '/')
write.csv(habit_table, file = csv_habit, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse taxonomic status table
status_table = taxonomy_data %>%
  distinct(statusAdjudicated) %>%
  arrange(statusAdjudicated) %>%
  rename(taxonStatus = statusAdjudicated) %>%
  rowid_to_column('taxonStatusID')

# Export taxonomic status table
csv_status = paste(data_folder, 'csv', 'taxonStatus.csv', sep = '/')
write.csv(status_table, file = csv_status, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse taxonomic level table
level_table = taxonomy_data %>%
  distinct(level) %>%
  arrange(level) %>%
  rowid_to_column('levelID')

# Export taxonomic level table
csv_level = paste(data_folder, 'csv', 'taxonLevel.csv', sep = '/')
write.csv(level_table, file = csv_level, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse taxonomic source table
source_table = taxonomy_data %>%
  distinct(taxonSource) %>%
  arrange(taxonSource) %>%
  left_join(citation_data, by = 'taxonSource') %>%
  rowid_to_column('taxonSourceID')

# Export taxonomic source table
csv_source = paste(data_folder, 'csv', 'taxonSource.csv', sep = '/')
write.csv(source_table, file = csv_source, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse hierarchy table
hierarchy_table = taxonomy_data %>%
  filter(level == 'genus' |
           level == 'unknown') %>%
  filter(statusAdjudicated == 'accepted' |
           statusAdjudicated == 'provisional') %>%
  mutate(nameAccepted = case_when(level == 'unknown' ~ 'Unknown',
                                 TRUE ~ nameAccepted)) %>%
  distinct(nameAccepted, .keep_all = TRUE) %>%
  left_join(family_table, by = 'family') %>%
  left_join(category_table, by = 'category') %>%
  rename(genusAccepted = nameAccepted) %>%
  arrange(genusAccepted) %>%
  rowid_to_column('hierarchyID') %>%
  select(hierarchyID, genusAccepted, familyID, categoryID)

# Export hierarchy table
csv_hierarchy = paste(data_folder, 'csv', 'hierarchy.csv', sep = '/')
write.csv(hierarchy_table, file = csv_hierarchy, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse taxon accepted table
accepted_table = taxonomy_data %>%
  filter(statusAdjudicated == 'accepted' |
           statusAdjudicated == 'provisional') %>%
  left_join(author_table, by = c('authAccepted' = 'author')) %>%
  separate(nameAccepted, c('genusAccepted'), extra = 'drop', sep = '([ ])', remove = FALSE) %>%
  mutate(genusAccepted = case_when(level == 'unknown' ~ 'Unknown',
                                   TRUE ~ genusAccepted)) %>%
  left_join(hierarchy_table, by = 'genusAccepted') %>%
  left_join(source_table, by = 'taxonSource') %>%
  left_join(level_table, by = 'level') %>%
  left_join(habit_table, by = 'habit') %>%
  arrange(nameAccepted) %>%
  rowid_to_column('acceptedID') %>%
  rename(authAcceptedID = authorID) %>%
  select(acceptedID, nameAccepted, authAcceptedID, hierarchyID, taxonSourceID, linkSource, levelID, habitID, native, non_native)

# Export taxon accepted table
csv_accepted = paste(data_folder, 'csv', 'taxonAccepted.csv', sep = '/')
write.csv(accepted_table, file = csv_accepted, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse taxon adjudicated table
adjudicated_table = taxonomy_data %>%
  rename(adjudicatedID = ID) %>%
  left_join(author_table, by = c('authAdjudicated' = 'author')) %>%
  left_join(status_table, by = c('statusAdjudicated' = 'taxonStatus')) %>%
  left_join(accepted_table, by = 'nameAccepted') %>%
  rename(authAdjudicatedID = authorID) %>%
  rename(statusAdjudicatedID = taxonStatusID) %>%
  arrange(nameAdjudicated) %>%
  select(adjudicatedID, nameAdjudicated, authAdjudicatedID, statusAdjudicatedID, acceptedID)

# Export taxon adjudicated table
csv_adjudicated = paste(data_folder, 'csv', 'taxonAdjudicated.csv', sep = '/')
write.csv(adjudicated_table, file = csv_adjudicated, fileEncoding = 'UTF-8', row.names = FALSE)

#### WRITE DATA TO SQL FILE

# Write statement header
statement = c(
  '-- -*- coding: utf-8 -*-',
  '-- ---------------------------------------------------------------------------',
  '-- Insert taxonomy data',
  '-- Author: Timm Nawrocki, Alaska Center for Conservation Science',
  paste('-- Last Updated: ', Sys.Date()),
  '-- Usage: Script should be executed in a PostgreSQL 12 database.',
  '-- Description: "Insert taxonomy data" pushes data from the taxonomy editing tables into the database server. The script "Build taxonomy tables" should be run prior to this script to start with empty, properly formatted tables.',
  '-- ---------------------------------------------------------------------------',
  '',
  '-- Initialize transaction',
  'START TRANSACTION;',
  ''
  )

# Add author statement
statement = c(statement,
              '-- Insert data into author table',
              'INSERT INTO author (authorID, author) VALUES'
              )
author_sql = author_table %>%
  mutate_if(is.character,
            str_replace_all, pattern = '\'', replacement = '\'\'') %>%
  mutate(author = paste('\'', author, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
print(author_sql[890,])
author_sql[nrow(author_sql),] = paste(str_sub(author_sql[nrow(author_sql),],
                                              start = 1,
                                              end = -2),
                                      ';',
                                      sep = '')
for (line in author_sql) {
  statement = c(statement, line)
}

# Add category statement
statement = c(statement,
              '',
              '-- Insert data into category table',
              'INSERT INTO category (categoryID, category) VALUES'
              )
category_sql = category_table %>%
  mutate(category = paste('\'', category, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep = ''))
category_sql[nrow(category_sql),] = paste(str_sub(category_sql[nrow(category_sql),],
                                              start = 1,
                                              end = -2),
                                          ';',
                                          sep = '')
for (line in category_sql) {
  statement = c(statement, line)
}

# Add family statement
statement = c(statement,
              '',
              '-- Insert data into family table',
              'INSERT INTO family (familyID, family) VALUES'
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

# Add habit statement
statement = c(statement,
              '',
              '-- Insert data into habit table',
              'INSERT INTO habit (habitID, habit) VALUES'
)
habit_sql = habit_table %>%
  mutate(habit = paste('\'', habit, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep = ''))
habit_sql[nrow(habit_sql),] = paste(str_sub(habit_sql[nrow(habit_sql),],
                                              start = 1,
                                              end = -2),
                                      ';',
                                      sep = '')
for (line in habit_sql) {
  statement = c(statement, line)
}

# Add taxon status statement
statement = c(statement,
              '',
              '-- Insert data into taxon status table',
              'INSERT INTO taxonStatus (taxonStatusID, taxonStatus) VALUES'
)
status_sql = status_table %>%
  mutate(taxonStatus = paste('\'', taxonStatus, '\'', sep = '')) %>%
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
              'INSERT INTO taxonLevel (levelID, level) VALUES'
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
              'INSERT INTO taxonSource (taxonSourceID, taxonSource, citation) VALUES'
)
source_sql = source_table %>%
  mutate_if(is.character,
            str_replace_all, pattern = '\'', replacement = '\'\'') %>%
  mutate(taxonSource = paste('\'', taxonSource, '\'', sep = '')) %>%
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
              'INSERT INTO hierarchy (hierarchyID, genusAccepted, familyID, categoryID) VALUES'
)
hierarchy_sql = hierarchy_table %>%
  mutate(genusAccepted = paste('\'', genusAccepted, '\'', sep = '')) %>%
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
              'INSERT INTO taxonAccepted (acceptedID, nameAccepted, authAcceptedID, hierarchyID, taxonSourceID, linkSource, levelID, habitID, native, non_native) VALUES'
)
accepted_sql = accepted_table %>%
  mutate_if(is.character,
            str_replace_all, pattern = '\'', replacement = '\'\'') %>%
  mutate(nameAccepted = paste('\'', nameAccepted, '\'', sep = '')) %>%
  mutate(linkSource = paste('\'', linkSource, '\'', sep = '')) %>%
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

# Add taxon adjudicated statement
statement = c(statement,
              '',
              '-- Insert data into adjudicated taxon table',
              'INSERT INTO taxonAdjudicated (adjudicatedID, nameAdjudicated, authAdjudicatedID, statusAdjudicatedID, acceptedID) VALUES'
)
adjudicated_sql = adjudicated_table %>%
  mutate(nameAdjudicated = paste('\'', nameAdjudicated, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep = ''))
adjudicated_sql[nrow(adjudicated_sql),] = paste(str_sub(adjudicated_sql[nrow(adjudicated_sql),],
                                                  start = 1,
                                                  end = -2),
                                          ';',
                                          sep = '')
for (line in adjudicated_sql) {
  statement = c(statement, line)
}

# Finalize statement
statement = c(statement,
              '',
              '-- Commit transaction',
              'COMMIT TRANSACTION;')

# Write statement to SQL file
write_lines(statement, sql_taxonomy)