# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Prepare cover data for upload
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Last Updated: 2021-01-29
# Usage: Script should be executed in R 4.0.0+.
# Description: "Prepare cover data for upload" parses cover data for upload into the cover table.
# ---------------------------------------------------------------------------

# Set target name
target_paths = c('01_aimNPRA_2017',
                 '02_accsColville_2015',
                 '03_poplarBreen_2006',
                 '04_npsGatesLC_1998',
                 '05_northSlopeLC_2011',
                 '06_npsYukonCharleyPA_2003',
                 '07_aimFortymile_2017',
                 '08_npsLichenARCN_2007',
                 '09_usfwsSelawikTalbot_2005',
                 '10_usfwsSelawikLC_2005',
                 '11_usfwsInterior_2014',
                 '12_npsDenaliLC_1999',
                 '13_npsAlagnakLC_2010',
                 '14_npsKatmaiLC_2000',
                 '15_npsAniakchakLC_2009',
                 '16_aimGMT2_2019',
                 '17_accsNuyakuk_2019',
                 '18_accsRibdon_2019',
                 '19_npsKenaiFjordsLC_2004',
                 '20_npsGlacierBayLC_2001',
                 '21_npsKlondikeLC_2011',
                 '22_npsSitkaLC_2012',
                 '23_landfire_2010')

# Set root directory
drive = 'N:'
root_folder = 'ACCS_Work'

# Define input folders
data_folder = paste(drive,
                    root_folder,
                    'Projects/VegetationEcology/AKVEG_PlotsDatabase/Data/Data_Plots',
                    sep = '/')

# Set repository directory
repository = 'C:/Users/timmn/Documents/Repositories/vegetation-plots-database'

# Define output files
output_csv = paste(data_folder,
                   'processed',
                   'cover.csv',
                   sep = '/'
)
output_sql = paste(repository,
                   '02_data_insertion',
                   '05_b_Insert_Cover.sql',
                   sep = '/')

# Import required libraries
library(dplyr)
library(readr)
library(readxl)
library(RPostgres)
library(stringr)
library(tibble)
library(tidyr)

# Import database connection function
connection_script = paste(repository,
                          'package_DataProcessing',
                          'connectDatabasePostGreSQL.R',
                          sep = '/')
source(connection_script)

# Create a connection to the AKVEG PostgreSQL database
authentication = paste(drive,
                       root_folder,
                       'Administrative/Credentials/accs-postgresql/authentication_akveg.csv',
                       sep = '/')
database_connection = connect_database_postgresql(authentication)

# Read constraints into dataframes from AKVEG
query_type = 'SELECT * FROM cover_type'
query_personnel = 'SELECT * FROM personnel'
query_taxa = 'SELECT * FROM taxon_adjudicated'
type_data = as_tibble(dbGetQuery(database_connection, query_type))
personnel_data = as_tibble(dbGetQuery(database_connection, query_personnel))
taxa_data = as_tibble(dbGetQuery(database_connection, query_taxa))

# Read project table into dataframe
query_project = 'SELECT * FROM project'
project_data = as_tibble(dbGetQuery(database_connection, query_project))

# Read site table into dataframe
query_site = 'SELECT * FROM site'
site_data = as_tibble(dbGetQuery(database_connection, query_site))

# Create empty list to store cover files
cover_files = list()

# Iterate through target paths and create file list
for (target_path in target_paths) {
  # Parse target name into sequence and name
  project_name = substr(target_path, start = 4, stop = str_length(target_path))
  
  # Designate input cover file
  cover_file = paste(project_name,
                    '_Cover.xlsx',
                    sep = '')
  cover_file = paste(data_folder,
                     target_path,
                     cover_file,
                     sep = '/')
  
  # If cover file exists, add it to file list
  if (file.exists(cover_file)) {
    cover_files = append(cover_files, list(cover_file))
  }
}

# Read cover files into list
cover_list = lapply(cover_files, read_excel, sheet = 'cover')

# Combine cover list into dataframe
cover_data = do.call(rbind, cover_list)

# Join metadata tables to cover table
cover_table = cover_data %>%
  mutate(veg_recorder = as.character(veg_recorder)) %>%
  left_join(site_data, by = 'site_code') %>%
  rename(initial_project_id = project_id) %>%
  left_join(project_data, by = c('project' = 'project_abbr')) %>%
  left_join(type_data, by = 'cover_type') %>%
  left_join(personnel_data, by = c('veg_observer'= 'personnel')) %>%
  rename(veg_observer_id = personnel_id) %>%
  left_join(personnel_data, by = c('veg_recorder' = 'personnel')) %>%
  rename(veg_recorder_id = personnel_id) %>%
  left_join(taxa_data, by = 'name_adjudicated') %>%
  select(project_id, site_id, veg_observe_date, veg_observer_id, veg_recorder_id, cover_type_id, name_original, adjudicated_id, cover)

# Export the cover data
write.csv(cover_table, file = output_csv, fileEncoding = 'UTF-8', row.names = FALSE)

#### WRITE DATA TO SQL FILE

# Write statement header
statement = c(
  '-- -*- coding: utf-8 -*-',
  '-- ---------------------------------------------------------------------------',
  '-- Insert cover data',
  '-- Author: Timm Nawrocki, Alaska Center for Conservation Science',
  paste('-- Last Updated:', Sys.Date(), sep = ' '),
  '-- Usage: Script should be executed in a PostgreSQL 12 database.',
  '-- Description: "Insert cover data" pushes all cover data into the cover table of the database.',
  '-- ---------------------------------------------------------------------------',
  '',
  '-- Initialize transaction',
  'START TRANSACTION;',
  ''
)

# Add data insert statement
statement = c(
  statement,
  '-- Insert cover data into cover table',
  'INSERT INTO cover (project_id, site_id, veg_observe_date, veg_observer_id, veg_recorder_id, cover_type_id, name_original, adjudicated_id, cover) VALUES'
)
input_sql = cover_table %>%
  mutate_if(is.character,
            str_replace_all, pattern = '\'', replacement = '\'\'') %>%
  mutate(veg_observe_date = paste('\'', veg_observe_date, '\'', sep = '')) %>%
  mutate(name_original = paste('\'', name_original, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
input_sql[nrow(input_sql),] = paste(str_sub(input_sql[nrow(input_sql),],
                                            start = 1,
                                            end = -2),
                                    ';',
                                    sep = '')
for (line in input_sql) {
  statement = c(statement, line)
}

# Finalize statement
statement = c(
  statement,
  '',
  '-- Commit transaction',
  'COMMIT TRANSACTION;'
)

# Replace NA values in statement
statement = str_replace(statement, ', NA,', ', NULL,')

# Write statement to SQL file
write_lines(statement, output_sql)