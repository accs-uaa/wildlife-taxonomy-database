# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Prepare project data for upload
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Last Updated: 2021-01-29
# Usage: Script should be executed in R 4.0.0+.
# Description: "Prepare project data for upload" parses project data for upload into the project table.
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
                   'projects.csv',
                   sep = '/'
                   )
output_sql = paste(repository,
                   '02_data_insertion',
                   '03_b_Insert_Project.sql',
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

# Read constraints into data frames from AKVEG
query_completion = 'SELECT * FROM completion'
query_organization = 'SELECT * FROM organization'
query_personnel = 'SELECT * FROM personnel'
completion_data = as_tibble(dbGetQuery(database_connection, query_completion))
organization_data = as_tibble(dbGetQuery(database_connection, query_organization))
personnel_data = as_tibble(dbGetQuery(database_connection, query_personnel))

# Create empty list to store project files
project_files = list()

# Iterate through target paths and create file list
for (target_path in target_paths) {
  # Parse target name into sequence and name
  project_name = substr(target_path, start = 4, stop = str_length(target_path))
  
  # Designate input project file
  project_file = paste(project_name,
                     '_Project.xlsx',
                     sep = '')
  project_file = paste(data_folder,
                     target_path,
                     project_file,
                     sep = '/')
  
  # If project file exists, add it to file list
  if (file.exists(project_file)) {
    project_files = append(project_files, list(project_file))
  }
}

# Read project files into list
project_list = lapply(project_files, read_excel, sheet = 'project')

# Combine project list into data frame
project_data = do.call(rbind, project_list)
  
# Join metadata tables to project table
project_table = project_data %>%
  left_join(completion_data, by = 'completion') %>%
  left_join(organization_data, by = c('originator' = 'organization')) %>%
  rename(originator_id = organization_id) %>%
  left_join(organization_data, by = c('funder' = 'organization')) %>%
  rename(funder_id = organization_id) %>%
  left_join(personnel_data, by = c('manager' = 'personnel')) %>%
  rename(manager_id = personnel_id) %>%
  select(project_id, originator_id, funder_id, manager_id, project_name, project_abbr, completion_id, year_start, year_end, project_description)
  
# Export the project data
write.csv(project_table, file = output_csv, fileEncoding = 'UTF-8', row.names = FALSE)
  
#### WRITE DATA TO SQL FILE
  
# Write statement header
statement = c(
  '-- -*- coding: utf-8 -*-',
  '-- ---------------------------------------------------------------------------',
  '-- Insert project metadata',
  '-- Author: Timm Nawrocki, Alaska Center for Conservation Science',
  paste('-- Last Updated:', Sys.Date(), sep = ' '),
  '-- Usage: Script should be executed in a PostgreSQL 12 database.',
  '-- Description: "Insert project metadata" pushes the metadata for all projects into the project table of the database.',
  '-- ---------------------------------------------------------------------------',
  '',
  '-- Initialize transaction',
  'START TRANSACTION;',
  ''
)
  
# Add data insert statement
statement = c(
  statement,
  '-- Insert project data into project table',
  'INSERT INTO project (project_id, originator_id, funder_id, manager_id, project_name, project_abbr, completion_id, year_start, year_end, project_description) VALUES'
)
input_sql = project_table %>%
  mutate_if(is.character,
            str_replace_all, pattern = '\'', replacement = '\'\'') %>%
  mutate(project_name = paste('\'', project_name, '\'', sep = '')) %>%
  mutate(project_abbr = paste('\'', project_abbr, '\'', sep = '')) %>%
  mutate(project_description = paste('\'', project_description, '\'', sep = '')) %>%
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