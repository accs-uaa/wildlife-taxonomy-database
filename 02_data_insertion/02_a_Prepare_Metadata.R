# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Prepare metadata and constraints for upload
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Adapted for wildlife data by Amanda Droghini, Alaska Center for Conservation Science
# Usage: Script should be executed in R 4.1.0+.
# Description: "Prepare metadata and constraints for upload" parses metadata and constraints into a SQL query for upload into empty tables.
# ---------------------------------------------------------------------------

# Define directories ----

# Set root directory
drive = 'C:'
root_folder = 'ACCS_Work'
project_folder = 'Projects/Database_Taxonomy'

# Define input folders
data_folder = paste(drive,
                    root_folder,
                    project_folder,
                    'Tables_Metadata',
                    sep = '/')

# Designate output sql file
sql_metadata = paste(drive, 
                     root_folder,
                     'GitHub/wildlife-taxonomy-database/02_data_insertion/02_b_Insert_Metadata.sql',
                     sep = "/")

# Identify metadata tables
dictionary_file = paste(data_folder,
                      'database_dictionary.xlsx',
                      sep='/')
schema_file = paste(data_folder,
                    'database_schema.xlsx',sep='/')

# Load packages and data ----

library(tidyverse)
library(readxl)

# Read taxonomy tables into dataframes
dictionary_data = read_excel(dictionary_file, sheet = 'dictionary')
schema_data = read_excel(schema_file, sheet = 'schema')

# Parse tables for SQL database ----

# Parse constraint tables
data_type_table = dictionary_data %>%
  filter(field == 'data_type') %>%
  select(attribute_id, attribute) %>%
  rename(data_type_id = attribute_id) %>%
  rename(data_type = attribute)
schema_category_table = dictionary_data %>%
  filter(field == 'schema_category') %>%
  select(attribute_id, attribute) %>%
  rename(schema_category_id = attribute_id) %>%
  rename(schema_category = attribute)
schema_table_table = dictionary_data %>%
  filter(field == 'schema_table') %>%
  select(attribute_id, attribute) %>%
  rename(schema_table_id = attribute_id) %>%
  rename(schema_table = attribute)

# Export constraint tables
data_type_csv = paste(data_folder, 'csv', 'data_type.csv', sep = '/')
schema_category_csv = paste(data_folder, 'csv', 'schema_category.csv', sep = '/')
schema_table_csv = paste(data_folder, 'csv', 'schema_table.csv', sep = '/')

write.csv(data_type_table, file = data_type_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(schema_category_table, file = schema_category_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(schema_table_table, file = schema_table_csv, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse schema table
schema_table = schema_data %>%
  left_join(schema_category_table) %>%
  left_join(schema_table_table, by = c('link_table' = 'schema_table')) %>%
  rename(link_table_id = schema_table_id) %>%
  left_join(schema_table_table, by = 'schema_table') %>%
  left_join(data_type_table) %>%
  rowid_to_column('field_id') %>%
  mutate(link_table_id = replace_na(as.character(link_table_id), 'NULL'),
         field_length = replace_na(as.character(field_length),'NULL')) %>%
  select(field_id, schema_category_id, schema_table_id, field, data_type_id, field_length, is_unique, is_key, required, link_table_id, field_description) %>%
  mutate_if(is.character,str_replace_all, pattern = '\'NA\'', replacement = 'NULL')

# Export schema table
schema_csv = paste(data_folder, 'csv', 'database_schema.csv', sep = '/')
write.csv(schema_table, file = schema_csv, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse dictionary table
dictionary_table = dictionary_data %>%
  left_join(schema_table) %>%
  rowid_to_column('dictionary_id') %>%
  select(dictionary_id, field_id, attribute_id, attribute)

# Export dictionary table
dictionary_csv = paste(data_folder, 'csv', 'database_dictionary.csv', sep = '/')
write.csv(dictionary_table, file = dictionary_csv, fileEncoding = 'UTF-8', row.names = FALSE)

#### Write data to SQL file ----

# Write statement header
statement = c(
  '-- -*- coding: utf-8 -*-',
  '-- ---------------------------------------------------------------------------',
  '-- Insert metadata and constraints',
  '-- Author: Timm Nawrocki & Amanda Droghini, Alaska Center for Conservation Science',
  paste('-- Last Updated: ', Sys.Date()),
  '-- Usage: Script should be executed in a PostgreSQL 12 database.',
  '-- Description: "Insert metadata and constraints" pushes data from the database dictionary and schema into the database server. The script "Build metadata and constraint tables" should be run prior to this script to start with empty, properly formatted tables.',
  '-- ---------------------------------------------------------------------------',
  '',
  '-- Initialize transaction',
  'START TRANSACTION;',
  ''
)

# Add data type statement
statement = c(statement,
              'INSERT INTO data_type (data_type_id, data_type) VALUES'
)
data_type_sql = data_type_table %>%
  mutate(data_type = paste('\'', data_type, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
data_type_sql[nrow(data_type_sql),] = paste(str_sub(data_type_sql[nrow(data_type_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in data_type_sql) {
  statement = c(statement, line)
}

# Add schema category statement
statement = c(statement,
              'INSERT INTO schema_category (schema_category_id, schema_category) VALUES'
)
schema_category_sql = schema_category_table %>%
  mutate(schema_category = paste('\'', schema_category, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
schema_category_sql[nrow(schema_category_sql),] = paste(str_sub(schema_category_sql[nrow(schema_category_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in schema_category_sql) {
  statement = c(statement, line)
}

# Add schema table statement
statement = c(statement,
              'INSERT INTO schema_table (schema_table_id, schema_table) VALUES'
)
schema_table_sql = schema_table_table %>%
  mutate(schema_table = paste('\'', schema_table, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
schema_table_sql[nrow(schema_table_sql),] = paste(str_sub(schema_table_sql[nrow(schema_table_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in schema_table_sql) {
  statement = c(statement, line)
}

# Add database schema statement
statement = c(statement,
              '',
              '-- Insert data into database schema',
              'INSERT INTO database_schema (field_id, schema_category_id, schema_table_id, field, data_type_id, field_length, is_unique, is_key, required, link_table_id, field_description) VALUES'
)
schema_sql = schema_table %>%
  mutate(field = paste('\'', field, '\'', sep = '')) %>%
  mutate(field_length = paste('\'', field_length, '\'', sep = '')) %>%
  mutate(field_description = paste('\'', field_description, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
schema_sql[nrow(schema_sql),] = paste(str_sub(schema_sql[nrow(schema_sql),],
                                                          start = 1,
                                                          end = -2),
                                                  ';',
                                                  sep = '')
for (line in schema_sql) {
  statement = c(statement, line)
}

# Add database schema statement
statement = c(statement,
              '',
              '-- Insert data into database dictionary',
              'INSERT INTO database_dictionary (dictionary_id, field_id, attribute_id, attribute) VALUES'
)
dictionary_sql = dictionary_table %>%
  mutate(attribute = paste('\'', attribute, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
dictionary_sql[nrow(dictionary_sql),] = paste(str_sub(dictionary_sql[nrow(dictionary_sql),],
                                              start = 1,
                                              end = -2),
                                      ';',
                                      sep = '')
for (line in dictionary_sql) {
  statement = c(statement, line)
}


# Finalize statement
statement = c(statement,
              '',
              '-- Commit transaction',
              'COMMIT TRANSACTION;')

# Replace NA values in statement
statement = str_replace(statement, ', \'NA\',', ', NULL,')

# Write statement to SQL file
write_lines(statement, sql_metadata)