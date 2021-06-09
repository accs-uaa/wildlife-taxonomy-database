# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Prepare database dictionary
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Adapated for wildlife data by Amanda Droghini, Alaska Center for Conservation Science
# Usage: Script should be executed in R 4.1.0+.
# Description: "Prepare database dictionary" prepares a SQL query to create a database dictionary table for upload into a web available MySQL database.
# ---------------------------------------------------------------------------

# Define files and directories ----

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
'GitHub/wildlife-taxonomy-database/04_replicate_web/07_b_Prepare_DatabaseDictionary.sql',
sep = "/")

# Identify dictionary table
dictionary_file = paste(data_folder,
                        'Query_DatabaseDictionary.csv',
                        sep = '/')

# Load data and libraries ----

# Import required libraries
library(tidyverse)
library(readxl)

# Read dictionary table into data frame
dictionary_data = read.csv(dictionary_file, fileEncoding = 'UTF-8')

#### WRITE DATA TO SQL FILE ----

# Write statement header
statement = c(
  '-- -*- coding: utf-8 -*-',
  '-- ---------------------------------------------------------------------------',
  '-- Create database dictionary table',
  '-- Author: Timm Nawrocki and Amanda Droghini, Alaska Center for Conservation Science',
  paste('-- Last Updated: ', Sys.Date()),
  '-- Usage: Script should be executed in a MySQL 5.6+ database.',
  '-- Description: "Create database dictionary table" pushes metadata for the database dictionary into the web database server.',
  '-- ---------------------------------------------------------------------------',
  '',
  '-- Drop dictionary table and create new version',
  'DROP TABLE IF EXISTS',
  '`database_dictionary`;',
  'CREATE TABLE `database_dictionary` (',
  '`dictionary_id` int(6) NOT NULL,',
  '`field` varchar(50) NOT NULL,',
  '`attribute_id` int(6) NOT NULL,',
  '`attribute` varchar(120) NOT NULL',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8;',
  ''
)

# Insert dictionary metadata
statement = c(statement,
              '-- Insert database dictionary table',
              'INSERT INTO `database_dictionary` (`dictionary_id`, `field`, `attribute_id`, `attribute`) VALUES'
)
dictionary_sql = dictionary_data %>%
  mutate_if(is.character,
            str_replace_all, pattern = '\'', replacement = '\\\\\'') %>%
  mutate(field = paste('\'', field, '\'', sep = '')) %>%
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
              'COMMIT;')

# Write statement to SQL file
write_lines(statement, sql_output)