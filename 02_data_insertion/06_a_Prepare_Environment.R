# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Prepare environment data for upload
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Last Updated: 2021-01-27
# Usage: Script should be executed in R 4.0.0+.
# Description: "Prepare environment data for upload" parses environment data for upload into the environment table.
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
                   'environment.csv',
                   sep = '/'
)
output_sql = paste(repository,
                   '02_data_insertion',
                   '06_b_Insert_Environment.sql',
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
query_personnel = 'SELECT * FROM personnel'
query_stratification = 'SELECT * FROM stratification'
query_physiography = 'SELECT * FROM physiography'
query_geomorphology = 'SELECT * FROM geomorphology'
query_macrotopography = 'SELECT * FROM macrotopography'
query_microtopography = 'SELECT * FROM microtopography'
query_drainage = 'SELECT * FROM drainage'
query_moisture = 'SELECT * FROM moisture'
query_soil = 'SELECT * FROM soil_class'
query_restrictive = 'SELECT * FROM restrictive_type'
query_disturbance = 'SELECT * FROM disturbance'
personnel_data = as_tibble(dbGetQuery(database_connection, query_personnel))
stratification_data = as_tibble(dbGetQuery(database_connection, query_stratification))
physiography_data = as_tibble(dbGetQuery(database_connection, query_physiography))
geomorphology_data = as_tibble(dbGetQuery(database_connection, query_geomorphology))
macrotopography_data = as_tibble(dbGetQuery(database_connection, query_macrotopography))
microtopography_data = as_tibble(dbGetQuery(database_connection, query_microtopography))
drainage_data = as_tibble(dbGetQuery(database_connection, query_drainage))
moisture_data = as_tibble(dbGetQuery(database_connection, query_moisture))
soil_data = as_tibble(dbGetQuery(database_connection, query_soil))
restrictive_data = as_tibble(dbGetQuery(database_connection, query_restrictive))
disturbance_data = as_tibble(dbGetQuery(database_connection, query_disturbance))

# Read project table into dataframe
query_project = 'SELECT * FROM project'
project_data = as_tibble(dbGetQuery(database_connection, query_project))

# Read site table into dataframe
query_site = 'SELECT * FROM site'
site_data = as_tibble(dbGetQuery(database_connection, query_site))

# Create empty list to store environment files
environment_files = list()

# Iterate through target paths and create file list
for (target_path in target_paths) {
  # Parse target name into sequence and name
  project_name = substr(target_path, start = 4, stop = str_length(target_path))
  
  # Designate input environment file
  environment_file = paste(project_name,
                           '_Environment.xlsx',
                           sep = '')
  environment_file = paste(data_folder,
                           target_path,
                           environment_file,
                           sep = '/')
  
  # If environment file exists, add it to file list
  if (file.exists(environment_file)) {
    environment_files = append(environment_files, list(environment_file))
  }
}

# Read environment files into list
environment_list = lapply(environment_files, read_excel, sheet = 'environment')

# Combine environment list into dataframe
environment_data = do.call(rbind, environment_list)
  
# Join metadata tables to input table
environment_table = environment_data %>%
  mutate(soil_observer = as.character(soil_observer)) %>%
  mutate(strata = as.character(strata)) %>%
  mutate(physiography = as.character(physiography)) %>%
  mutate(geomorphology = as.character(geomorphology)) %>%
  mutate(macrotopography = as.character(macrotopography)) %>%
  mutate(microtopography = as.character(microtopography)) %>%
  mutate(drainage = as.character(drainage)) %>%
  mutate(moisture = as.character(moisture)) %>%
  mutate(soil_class = as.character(soil_class)) %>%
  mutate(restrictive_type = as.character(restrictive_type)) %>%
  mutate(disturbance = as.character(disturbance)) %>%
  left_join(site_data, by = 'site_code') %>%
  rename(initial_project_id = project_id) %>%
  left_join(project_data, by = c('project' = 'project_abbr')) %>%
  left_join(personnel_data, by = c('env_observer'= 'personnel')) %>%
  rename(env_observer_id = personnel_id) %>%
  left_join(personnel_data, by = c('soil_observer' = 'personnel')) %>%
  rename(soil_observer_id = personnel_id) %>%
  left_join(stratification_data, by = 'strata') %>%
  left_join(physiography_data, by = 'physiography') %>%
  left_join(geomorphology_data, by = 'geomorphology') %>%
  left_join(macrotopography_data, by = 'macrotopography') %>%
  left_join(microtopography_data, by = 'microtopography') %>%
  left_join(drainage_data, by = 'drainage') %>%
  left_join(moisture_data, by = 'moisture') %>%
  left_join(soil_data, by = 'soil_class') %>%
  left_join(restrictive_data, by = 'restrictive_type') %>%
  left_join(disturbance_data, by = 'disturbance') %>%
  select(project_id, site_id, env_observe_date, env_observer_id, soil_observer_id, strata_id, physiography_id, geomorphology_id, macrotopography_id, microtopography_id, microrelief, drainage_id, moisture_id, soil_class_id, depth_water, depth_moss_duff, depth_restrictive_layer, restrictive_type_id, soil_ph_10, conductivity_10, temperature_10, soil_ph_30, conductivity_30, temperature_30, water_ph, water_conductivity, water_temperature, disturbance_id, homogenous)

# Export the adjudicated observations
write.csv(environment_table, file = output_csv, fileEncoding = 'UTF-8', row.names = FALSE)

#### WRITE DATA TO SQL FILE

# Write statement header
statement = c(
  '-- -*- coding: utf-8 -*-',
  '-- ---------------------------------------------------------------------------',
  '-- Insert environment data',
  '-- Author: Timm Nawrocki, Alaska Center for Conservation Science',
  paste('-- Last Updated:', Sys.Date(), sep = ' '),
  '-- Usage: Script should be executed in a PostgreSQL 12 database.',
  '-- Description: "Insert environment data" pushes all environment data into the environment table of the database.',
  '-- ---------------------------------------------------------------------------',
  '',
  '-- Initialize transaction',
  'START TRANSACTION;',
  ''
)

# Add data insert statement
statement = c(
  statement,
  '-- Insert environment data into environment table',
  'INSERT INTO environment (project_id, site_id, env_observe_date, env_observer_id, soil_observer_id, strata_id, physiography_id, geomorphology_id, macrotopography_id, microtopography_id, microrelief, drainage_id, moisture_id, soil_class_id, depth_water, depth_moss_duff, depth_restrictive_layer, restrictive_type_id, soil_ph_10, conductivity_10, temperature_10, soil_ph_30, conductivity_30, temperature_30, water_ph, water_conductivity, water_temperature, disturbance_id, homogenous) VALUES'
)
input_sql = environment_table %>%
  mutate(env_observe_date = paste('\'', env_observe_date, '\'', sep = '')) %>%
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
statement = str_replace_all(statement, ', NA', ', NULL')

# Write statement to SQL file
write_lines(statement, output_sql)