# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Prepare environment data for upload
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Last Updated: 2020-11-05
# Usage: Script should be executed in R 4.0.0+.
# Description: "Prepare environment data for upload" parses environment data for upload into the environment table.
# ---------------------------------------------------------------------------

# Set target name
target_paths = c('01_aimNPRA_2017',
                 '04_npsGatesLC_1998',
                 '06_npsYukonCharleyPA_2003',
                 '07_aimFortymile_2017',
                 '12_npsDenaliLC_1999',
                 '13_npsAlagnakLC_2010',
                 '14_npsKatmaiLC_2000',
                 '15_npsAniakchakLC_2009',
                 '16_aimGMT2_2019',
                 '21_npsKlondikeLC_2011')

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
personnel_file = paste(data_folder,
                       'Tables_Metadata',
                       'csv',
                       'personnel.csv',
                       sep = '/')
stratification_file = paste(data_folder,
                            'Tables_Metadata',
                            'csv',
                            'stratification.csv',
                            sep = '/')
physiography_file = paste(data_folder,
                          'Tables_Metadata',
                          'csv',
                          'physiography.csv',
                          sep = '/')
geomorphology_file = paste(data_folder,
                           'Tables_Metadata',
                           'csv',
                           'geomorphology.csv',
                           sep = '/')
macrotopography_file = paste(data_folder,
                             'Tables_Metadata',
                             'csv',
                             'macrotopography.csv',
                             sep = '/')
microtopography_file = paste(data_folder,
                             'Tables_Metadata',
                             'csv',
                             'microtopography.csv',
                             sep = '/')
drainage_file = paste(data_folder,
                      'Tables_Metadata',
                      'csv',
                      'drainage.csv',
                      sep = '/')
moisture_file = paste(data_folder,
                      'Tables_Metadata',
                      'csv',
                      'moisture.csv',
                      sep = '/')
soilClass_file = paste(data_folder,
                       'Tables_Metadata',
                       'csv',
                       'soilClass.csv',
                       sep = '/')
restrictiveType_file = paste(data_folder,
                             'Tables_Metadata',
                             'csv',
                             'restrictiveType.csv',
                             sep = '/')
disturbance_file = paste(data_folder,
                         'Tables_Metadata',
                         'csv',
                         'disturbance.csv',
                         sep = '/')

# Read data and metadata into dataframes
personnel_data = read.csv(personnel_file, fileEncoding = 'UTF-8')
stratification_data = read.csv(stratification_file, fileEncoding = 'UTF-8')
physiography_data = read.csv(physiography_file, fileEncoding = 'UTF-8')
geomorphology_data = read.csv(geomorphology_file, fileEncoding = 'UTF-8')
macrotopography_data = read.csv(macrotopography_file, fileEncoding = 'UTF-8')
microtopography_data = read.csv(microtopography_file, fileEncoding = 'UTF-8')
drainage_data = read.csv(drainage_file, fileEncoding = 'UTF-8')
moisture_data = read.csv(moisture_file, fileEncoding = 'UTF-8')
soilClass_data = read.csv(soilClass_file, fileEncoding = 'UTF-8')
restrictiveType_data = read.csv(restrictiveType_file, fileEncoding = 'UTF-8')
disturbance_data = read.csv(disturbance_file, fileEncoding = 'UTF-8')

# Iterate through target paths and produce output insert statements
for (target_path in target_paths) {
  # Parse target name into sequence and name
  project_name = substr(target_path, start = 4, stop = str_length(target_path))

  # Designate input file
  input_file = paste(project_name,
                    '_Environment.xlsx',
                    sep = '')
  input_file = paste(data_folder,
                    'Data_Plots',
                    target_path,
                    input_file,
                    sep = '/')

  # Designate output csv file
  output_csv = paste(project_name,
                    '_Environment.csv',
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
                      '_4_Environment.sql',
                      sep = ''
                      )
  output_sql = paste(repository,
                    'data_upload',
                    output_sql,
                    sep = '/'
                    )
  
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
  input_data = read_excel(input_file, sheet = 'environment')
  
  # Join metadata tables to input table
  input_table = input_data %>%
    mutate(soilObserver = as.character(soilObserver)) %>%
    mutate(strata = as.character(strata)) %>%
    mutate(physiography = as.character(physiography)) %>%
    mutate(geomorphology = as.character(geomorphology)) %>%
    mutate(macrotopography = as.character(macrotopography)) %>%
    mutate(microtopography = as.character(microtopography)) %>%
    mutate(drainage = as.character(drainage)) %>%
    mutate(moisture = as.character(moisture)) %>%
    mutate(soilClass = as.character(soilClass)) %>%
    mutate(restrictiveType = as.character(restrictiveType)) %>%
    mutate(disturbance = as.character(disturbance)) %>%
    left_join(site_data, by = 'siteCode') %>%
    rename(initialProjectID = projectID) %>%
    left_join(project_data, by = c('project' = 'projectNameAbbr')) %>%
    left_join(personnel_data, by = c('envObserver'= 'personnel')) %>%
    rename(envObserverID = personnelID) %>%
    left_join(personnel_data, by = c('soilObserver' = 'personnel')) %>%
    rename(soilObserverID = personnelID) %>%
    left_join(stratification_data, by = 'strata') %>%
    left_join(physiography_data, by = 'physiography') %>%
    left_join(geomorphology_data, by = 'geomorphology') %>%
    left_join(macrotopography_data, by = 'macrotopography') %>%
    left_join(microtopography_data, by = 'microtopography') %>%
    left_join(drainage_data, by = 'drainage') %>%
    left_join(moisture_data, by = 'moisture') %>%
    left_join(soilClass_data, by = 'soilClass') %>%
    left_join(restrictiveType_data, by = 'restrictiveType') %>%
    left_join(disturbance_data, by = 'disturbance') %>%
    select(projectID, siteID, envObserveDate, envObserverID, soilObserverID, strataID, physiographyID, geomorphologyID, macrotopographyID, microtopographyID, microrelief, drainageID, moistureID, soilClassID, depthWater, depthMossDuff, depthRestrictiveLayer, restrictiveTypeID, soilPH10, conductivity10, temperature10, soilPH30, conductivity30, temperature30, waterPH, waterConductivity, waterTemperature, disturbanceID, homogenous)

  # Export the adjudicated observations
  write.csv(input_table, file = output_csv, fileEncoding = 'UTF-8', row.names = FALSE)

  #### WRITE DATA TO SQL FILE

  # Write statement header
  statement = c(
    '-- -*- coding: utf-8 -*-',
    '-- ---------------------------------------------------------------------------',
    paste('-- Insert environment data for', project_name, sep = ' '),
    '-- Author: Timm Nawrocki, Alaska Center for Conservation Science',
    paste('-- Last Updated:', Sys.Date(), sep = ' '),
    '-- Usage: Script should be executed in a PostgreSQL 12 database.',
    '-- Description: "Insert environment data" pushes the environment data for the specified project into the environment table of the database.',
    '-- ---------------------------------------------------------------------------',
    '',
    '-- Initialize transaction',
    'START TRANSACTION;',
    ''
  )

  # Add data insert statement
  statement = c(statement,
                '-- Insert environment data into environment table',
                'INSERT INTO environment (projectID, siteID, envObserveDate, envObserverID, soilObserverID, strataID, physiographyID, geomorphologyID, macrotopographyID, microtopographyID, microrelief, drainageID, moistureID, soilClassID, depthWater, depthMossDuff, depthRestrictiveLayer, restrictiveTypeID, soilPH10, conductivity10, temperature10, soilPH30, conductivity30, temperature30, waterPH, waterConductivity, waterTemperature, disturbanceID, homogenous) VALUES'
  )
  input_sql = input_table %>%
    mutate(envObserveDate = paste('\'', envObserveDate, '\'', sep = '')) %>%
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
  statement = str_replace_all(statement, ', NA', ', NULL')

  # Write statement to SQL file
  write_lines(statement, output_sql)
}