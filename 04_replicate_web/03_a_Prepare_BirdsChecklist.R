# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Prepare birds checklist
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Adapated for wildlife data by Amanda Droghini, Alaska Center for Conservation Science
# Usage: Script should be executed in R 4.1.0+.
# Description: "Prepare birds checklist" prepares a SQL query to create a checklist for upload into a web available MySQL database.
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
sql_checklist = paste(drive,
                      root_folder,
                      'GitHub/wildlife-taxonomy-database/04_replicate_web/03_b_Insert_BirdsChecklist.sql',sep = "/")

# Identify taxonomy tables
checklist_file = paste(data_folder,
                      'Query_BirdsChecklist.csv',
                      sep='/')

# Load files and libraries ----
library(tidyverse)
library(readxl)

# Read checklist table into dataframe
checklist_data = read.csv(checklist_file, fileEncoding = 'UTF-8')

#### WRITE DATA TO SQL FILE

# Write statement header
statement = c(
  '-- -*- coding: utf-8 -*-',
  '-- ---------------------------------------------------------------------------',
  '-- Create birds checklist',
  '-- Author: Timm Nawrocki and Amanda Droghini, Alaska Center for Conservation Science',
  paste('-- Last Updated: ', Sys.Date()),
  '-- Usage: Script should be executed in a MySQL 5.6+ database.',
  '-- Description: "Create birds checklist" pushes data from a birds checklist export into the web database server.',
  '-- ---------------------------------------------------------------------------',
  '',
  '-- Drop birds checklist and create new version',
  'DROP TABLE IF EXISTS `birds_checklist`;',
  'CREATE TABLE `birds_checklist` (',
  '`name_id` int(5) NOT NULL,',
  '`name` varchar(255) NOT NULL,',
  '`status` varchar(30) NOT NULL,',
  '`name_accepted` varchar(255) NOT NULL,',
  '`family` varchar(80) NOT NULL,',
  '`order` varchar(30) NOT NULL,',
  '`class` varchar(10) NOT NULL',
  '`source` varchar(255) NOT NULL,',
  '`level` varchar(30) NOT NULL,',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8;',
  '',
  '-- Insert data into birds checklist',
  'INSERT INTO `birds_checklist` (`name_id`, `name`, `status`, `name_accepted`, `family`, `order`, `class`, `source`, `level`) VALUES'
)

checklist_sql = checklist_data %>%
  mutate_if(is.character,
            str_replace_all, pattern = '\'', replacement = '\\\\\'') %>%
  mutate(name = paste('\'', name, '\'', sep = '')) %>%
  mutate(status = paste('\'', status, '\'', sep = '')) %>%
  mutate(name_accepted = paste('\'', name_accepted, '\'', sep = '')) %>%
  mutate(family = paste('\'', family, '\'', sep = '')) %>%
  mutate(order = paste('\'', order, '\'', sep = '')) %>%
  mutate(class = paste('\'', class, '\'', sep = '')) %>%
  mutate(source = paste('\'', source, '\'', sep = '')) %>%
  mutate(level = paste('\'', level, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))

checklist_sql[nrow(checklist_sql),] = paste(str_sub(checklist_sql[nrow(checklist_sql),],
                                                    start = 1,
                                                    end = -2),
                                            ';',
                                            sep = '')

for (line in checklist_sql) {
  statement = c(statement, line)
}

# Finalize statement
statement = c(statement,
              '',
              '-- Commit transaction',
              'COMMIT;')

# Replace NA with NULL
statement = str_replace_all(statement, ', NA', ', NULL')
statement = str_replace_all(statement, ', \'NA\'', ', NULL')

# Write statement to SQL file
write_lines(statement, sql_checklist)