# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Prepare database schema
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Adapted for wildlife data by Amanda Droghini, Alaska Center for Conservation Science
# Usage: Script should be executed in R 4.1.0+.
# Description: "Prepare database schema" prepares a SQL query to create a database schema table for upload into a web available MySQL database.
# ---------------------------------------------------------------------------

# Define file and directories ----

# Set root directory
drive = 'C:'
root_folder = 'ACCS_Work'

# Define input folders
data_folder = paste(drive,
                    root_folder,
                    'Taxonomy_Database/Data/Queries',
                    sep = '/')

# Designate output sql file
sql_output = paste(drive,
                   root_folder,
                   'GitHub/wildlife-taxonomy-database/04_replicate_web/06_b_Insert_DatabaseSchema.sql', sep = "/")

# Identify schema table
schema_file = paste(data_folder,
                    'Query_DatabaseSchema.csv',
                    sep = '/')

# Load data and libraries ----

# Import required libraries
library(tidyverse)
library(readxl)

# Read schema table into data frame
schema_data = read.csv(schema_file, fileEncoding = 'UTF-8')

#### WRITE DATA TO SQL FILE

# Write statement header
statement = c(
  '-- -*- coding: utf-8 -*-',
  '-- ---------------------------------------------------------------------------',
  '-- Create database schema table',
  '-- Author: Timm Nawrocki and Amanda Droghini, Alaska Center for Conservation Science',
  paste('-- Last Updated: ', Sys.Date()),
  '-- Usage: Script should be executed in a MySQL 5.6+ database.',
  '-- Description: "Create database schema table" pushes metadata for the database schema into the web database server.',
  '-- ---------------------------------------------------------------------------',
  '',
  '-- Drop schema table and create new version',
  'DROP TABLE IF EXISTS',
  '`database_schema`;',
  'CREATE TABLE `database_schema` (',
  '`field_id` int(4) NOT NULL,',
  '`schema_category` varchar(80) NOT NULL,',
  '`schema_table` varchar(80) NOT NULL,',
  '`field` varchar(50) NOT NULL,',
  '`data_type` varchar(80) NOT NULL,',
  '`field_length` varchar(10),',
  '`is_unique` varchar(5) NOT NULL,',
  '`is_key` varchar(5) NOT NULL,',
  '`required` varchar(5) NOT NULL,',
  '`link_table` varchar(80),',
  '`field_description` varchar(255)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8;',
  ''
)

# Insert schema metadata
statement = c(statement,
              '-- Insert database schema table',
              'INSERT INTO `database_schema` (`field_id`, `schema_category`, `schema_table`, `field`, `data_type`, `field_length`, `is_unique`, `is_key`, `required`, `link_table`, `field_description`) VALUES'
)
schema_sql = schema_data %>%
  mutate_if(is.character,
            str_replace_all, pattern = '\'', replacement = '\\\\\'') %>%
  mutate(schema_category = paste('\'', schema_category, '\'', sep = '')) %>%
  mutate(schema_table = paste('\'', schema_table, '\'', sep = '')) %>%
  mutate(field = paste('\'', field, '\'', sep = '')) %>%
  mutate(data_type = paste('\'', data_type, '\'', sep = '')) %>%
  mutate(field_length = paste('\'', field_length, '\'', sep = '')) %>%
  mutate(is_unique = paste('\'', is_unique, '\'', sep = '')) %>%
  mutate(is_key = paste('\'', is_key, '\'', sep = '')) %>%
  mutate(required = paste('\'', required, '\'', sep = '')) %>%
  mutate(link_table = paste('\'', link_table, '\'', sep = '')) %>%
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

# Finalize statement
statement = c(statement,
              '',
              '-- Commit transaction',
              'COMMIT;')

# Write statement to SQL file
write_lines(statement, sql_output)