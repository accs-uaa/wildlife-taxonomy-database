# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Prepare cover data for upload
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Last Updated: 2020-11-06
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
                 '22_npsSitkaLC_2012')

# Set root directory
drive = 'N:'
root_folder = 'ACCS_Work'

# Define input folders
data_folder = paste(drive,
                    root_folder,
                    'Projects/VegetationEcology/AKVEG_PlotsDatabase/Data',
                    sep = '/')

# Set repository directory
repository = 'C:/Users/timmn/Documents/Repositories/vegetation-plots-database'

# Import required libraries
library(dplyr)
library(readr)
library(readxl)
library(stringr)
library(tibble)
library(tidyr)

# Identify metadata tables
coverType_file = paste(data_folder,
                       'Tables_Metadata',
                       'csv',
                       'coverType.csv',
                       sep = '/')
personnel_file = paste(data_folder,
                       'Tables_Metadata',
                       'csv',
                       'personnel.csv',
                       sep = '/')
taxonAdjudicated_file = paste(data_folder,
                              'Tables_Taxonomy',
                              'csv',
                              'taxonAdjudicated.csv',
                              sep = '/')

# Read metadata into data frames
coverType_data = read.csv(coverType_file, fileEncoding = 'UTF-8')
personnel_data = read.csv(personnel_file, fileEncoding = 'UTF-8')
taxonAdjudicated_data = read.csv(taxonAdjudicated_file, fileEncoding = 'UTF-8')

# Iterate through target paths and produce output insert statements
for (target_path in target_paths) {
  # Parse target name into sequence and name
  project_name = substr(target_path, start = 4, stop = str_length(target_path))

  # Designate input file
  input_file = paste(project_name,
                    '_Cover.xlsx',
                    sep = '')
  input_file = paste(data_folder,
                    'Data_Plots',
                    target_path,
                    input_file,
                    sep = '/')

  # Designate output csv file
  output_csv = paste(project_name,
                    '_Cover.csv',
                    sep = '')
  output_csv = paste(data_folder,
                    'Data_Plots',
                    target_path,
                    'upload',
                    output_csv,
                    sep = '/')

  # Designate output sql file
  output_sql = paste('Insert_',
                      target_path,
                      '_3_Cover.sql',
                      sep = '')
  output_sql = paste(repository,
                    'data_upload',
                    output_sql,
                    sep = '/')
  
  # Identify project table
  project_file = paste(project_name,
                      '_Project.csv',
                      sep = '')
  project_file = paste(data_folder,
                      'Data_Plots',
                      target_path,
                      'upload',
                      project_file,
                      sep = '/')

  # Identify site table
  site_file = paste(project_name,
                    '_Site.csv',
                    sep = '')
  site_file = paste(data_folder,
                    'Data_Plots',
                    target_path,
                    'upload',
                    site_file,
                    sep = '/')
  
  # Read project data into data frames
  project_data = read.csv(project_file, fileEncoding = 'UTF-8')
  site_data = read.csv(site_file, fileEncoding = 'UTF-8')
  input_data = read_excel(input_file, sheet = 'cover')

  # Join metadata tables to input table
  input_table = input_data %>%
    mutate(vegRecorder = as.character(vegRecorder)) %>%
    left_join(site_data, by = 'siteCode') %>%
    rename(initialProjectID = projectID) %>%
    left_join(project_data, by = c('project' = 'projectNameAbbr')) %>%
    left_join(coverType_data, by = 'coverType') %>%
    left_join(personnel_data, by = c('vegObserver'= 'personnel')) %>%
    rename(vegObserverID = personnelID) %>%
    left_join(personnel_data, by = c('vegRecorder' = 'personnel')) %>%
    rename(vegRecorderID = personnelID) %>%
    left_join(taxonAdjudicated_data, by = 'nameAdjudicated') %>%
    select(projectID, siteID, vegObserveDate, vegObserverID, vegRecorderID, coverTypeID, nameOriginal, adjudicatedID, cover)

  # Export the adjudicated observations
  write.csv(input_table, file = output_csv, fileEncoding = 'UTF-8', row.names = FALSE)

  #### WRITE DATA TO SQL FILE

  # Write statement header
  statement = c(
    '-- -*- coding: utf-8 -*-',
    '-- ---------------------------------------------------------------------------',
    paste('-- Insert cover data for', project_name, sep = ' '),
    '-- Author: Timm Nawrocki, Alaska Center for Conservation Science',
    paste('-- Last Updated:', Sys.Date(), sep = ' '),
    '-- Usage: Script should be executed in a PostgreSQL 12 database.',
    '-- Description: "Insert cover data" pushes the cover data for the specified project into the cover table of the database.',
    '-- ---------------------------------------------------------------------------',
    '',
    '-- Initialize transaction',
    'START TRANSACTION;',
    ''
  )

  # Add data insert statement
  statement = c(statement,
                '-- Insert cover data into cover table',
                'INSERT INTO cover (projectID, siteID, vegObserveDate, vegObserverID, vegRecorderID, coverTypeID, nameOriginal, adjudicatedID, cover) VALUES'
  )
  input_sql = input_table %>%
    mutate_if(is.character,
              str_replace_all, pattern = '\'', replacement = '\'\'') %>%
    mutate(vegObserveDate = paste('\'', vegObserveDate, '\'', sep = '')) %>%
    mutate(nameOriginal = paste('\'', nameOriginal, '\'', sep = '')) %>%
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
  statement = c(statement,
                '',
                '-- Commit transaction',
                'COMMIT TRANSACTION;')

  # Replace NA values in statement
  statement = str_replace(statement, ', NA,', ', NULL,')

  # Write statement to SQL file
  write_lines(statement, output_sql)
}