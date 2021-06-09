# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Prepare citation tables
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Adapted for wildlife data by Amanda Droghini, Alaska Center for Conservation Science
# Usage: Script should be executed in R 4.1.0+.
# Description: "Prepare citation tables" prepares a SQL query to create citations tables for upload into a web available MySQL database.
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
sql_citations = paste(drive,
                      root_folder,
                      'GitHub/wildlife-taxonomy-database/04_replicate_web/05_b_Insert_Citations.sql', sep = "/")

# Identify taxonomy tables
comprehensive_file = paste(data_folder,
                           'Query_ComprehensiveCitations.csv',
                           sep='/')

# Import required libraries
library(tidyverse)
library(readxl)

# Read citations tables into dataframe
comprehensive_data = read.csv(comprehensive_file, fileEncoding = 'UTF-8')

#### WRITE DATA TO SQL FILE

# Write statement header
statement = c(
  '-- -*- coding: utf-8 -*-',
  '-- ---------------------------------------------------------------------------',
  '-- Create citations tables',
  '-- Author: Timm Nawrocki and Amanda Droghini, Alaska Center for Conservation Science',
  paste('-- Last Updated: ', Sys.Date()),
  '-- Usage: Script should be executed in a MySQL 5.6+ database.',
  '-- Description: "Create citations tables" pushes data for comprehensive citations into the web database server.',
  '-- ---------------------------------------------------------------------------',
  '',
  '-- Drop citation tables and create new versions',
  'DROP TABLE IF EXISTS',
  '`comprehensive_citations`;',
  'CREATE TABLE `comprehensive_citations` (',
  '`taxon_source_id` int(4) NOT NULL,',
  '`taxon_source` varchar(50) NOT NULL,',
  '`citation` varchar(500) NOT NULL',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8;',
  ''
)

# Insert comprehensive citations
statement = c(statement,
              '',
              '-- Insert comprehensive citations',
              'INSERT INTO `comprehensive_citations` (`taxon_source_id`, `taxon_source`, `citation`) VALUES'
)
comprehensive_sql = comprehensive_data %>%
  mutate_if(is.character,
            str_replace_all, pattern = '\'', replacement = '\\\\\'') %>%
  mutate(taxon_source = paste('\'', taxon_source, '\'', sep = '')) %>%
  mutate(citation = paste('\'', citation, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
comprehensive_sql[nrow(comprehensive_sql),] = paste(str_sub(comprehensive_sql[nrow(comprehensive_sql),],
                                                  start = 1,
                                                  end = -2),
                                          ';',
                                          sep = '')
for (line in comprehensive_sql) {
  statement = c(statement, line)
}

# Finalize statement
statement = c(statement,
              '',
              '-- Commit transaction',
              'COMMIT;')

# Write statement to SQL file
write_lines(statement, sql_citations)