# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Prepare conservation status ranks for upload
# Author: Amanda Droghini, Alaska Center for Conservation Science
# Usage: Script should be executed in R 4.1.0+.
# Description: "Prepare conservation status ranks for upload" creates conservation rank tables that can then be parsed into a SQL query for upload into empty tables.
# ---------------------------------------------------------------------------

rm(list=ls())

# Import required libraries ----
library(tidyverse)
library(readxl)

# Define directories ----

# Set root directory
drive = 'C:'
root_folder = 'ACCS_Work'
project_folder = 'Projects/Database_Taxonomy/Tables_Taxonomy'

# Identify conservation status tables
asrs_file = paste(drive,
                  root_folder,
                  project_folder,
                  'Data_Sources/ASRS_Database_Query_Heritage_Agency_Ranks.xlsx',
                      sep='/')
bcc_file = paste(drive,
                 root_folder,
                 project_folder,
                 'Data_Sources/USFWS_BCC_2021_Edited.xlsx',
                      sep='/')

# Identify taxonomy file
taxa_file = paste(drive,
                 root_folder,
                 project_folder,
                 'csv/taxon_synonyms.csv',
                 sep='/')

# Designate output sql file
sql_conservation = paste(drive, 
                     root_folder,
                     'GitHub/wildlife-taxonomy-database/02_data_insertion/03_b_Insert_Conservation_Status.sql',
                     sep = "/")

# Load packages and data ----

# Read taxonomy tables into dataframes
asrs_data = read_excel(asrs_file)
bcc_data = read_excel(bcc_file, sheet = 'Data')
taxonomy_data = read_csv(taxa_file)

# BCC data ----
# BCC data contains 3 conservation ranks: BCC, ESA, and PIF Watch List
# For Alaska subspecies only, I edited the data such that only the species name is listed.

# Remove extra whitespace between genus + species
bcc_data$Alaska_No_Subspecies <- str_squish(bcc_data$Alaska_No_Subspecies)

# Join with taxonomy data to get current name + unique ID
bcc_join <- inner_join(x=bcc_data, y=taxonomy_data,
                      by=c("Alaska_No_Subspecies" = "name_given"),keep=FALSE) %>% 
  select(-c("Order","Common_Name","Scale",
            "Alaska_No_Subspecies","taxon_status_id",
            "synonym_id")) %>% 
  rename(name_listed = Listed_Scientific_Name)

# Parse tables for SQL database ----
bcc_table <- bcc_join %>% filter(List == "BCC") %>% 
  rowid_to_column('usfws_bcc_id') %>% 
  select(-List)
esa_table <- bcc_join %>% filter(List == "ESA") %>% 
  select(-List) %>%
  rowid_to_column('usfws_esa_id')
wl_table <- bcc_join %>% filter(List == "WL") %>% 
  select(-List) %>%
  rowid_to_column('pif_wl_id')

# Export csvs ----
csv_bcc = paste(drive,root_folder,project_folder, 'csv', 'status_usfws_bcc.csv', sep = '/')
csv_esa = paste(drive,root_folder,project_folder, 'csv', 'status_usfws_esa.csv', sep = '/')
csv_wl = paste(drive,root_folder,project_folder, 'csv', 'status_pif_wl.csv', sep = '/')

write.csv(bcc_table, file = csv_bcc, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(esa_table, file = csv_esa, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(wl_table, file = csv_wl, fileEncoding = 'UTF-8', row.names = FALSE)

#### Write data to SQL file ----

# Write statement header
statement = c(
  '-- -*- coding: utf-8 -*-',
  '-- ---------------------------------------------------------------------------',
  '-- Insert conservation status data',
  '-- Author: Amanda Droghini, Alaska Center for Conservation Science',
  paste('-- Last Updated: ', Sys.Date()),
  '-- Usage: Script should be executed in a PostgreSQL 12 database.',
  '-- Description: "Insert conservation status data" pushes data from the conservation status tables into the database server. The script "Build conservation tables" should be run prior to this script to start with empty, properly formatted tables.',
  '-- ---------------------------------------------------------------------------',
  '',
  '-- Initialize transaction',
  'START TRANSACTION;',
  ''
)

# Add BCC statement
statement = c(statement,
              '',
              '-- Insert data into status_usfws_bcc table',
              'INSERT INTO status_usfws_bcc (usfws_bcc_id, name_listed, accepted_id) VALUES'
)
bcc_sql = bcc_table %>%
  mutate(name_listed = paste('\'', name_listed, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep = ''))
bcc_sql[nrow(bcc_sql),] = paste(str_sub(bcc_sql[nrow(bcc_sql),],
                                            start = 1,
                                            end = -2),
                                    ';',
                                    sep = '')
for (line in bcc_sql) {
  statement = c(statement, line)
}

# Finalize statement
statement = c(statement,
              '',
              '-- Commit transaction',
              'COMMIT TRANSACTION;')

# Write statement to SQL file
write_lines(statement, sql_conservation)
