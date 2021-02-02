# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Prepare site data for upload
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Last Updated: 2021-01-29
# Usage: Script should be executed in R 4.0.0+.
# Description: "Prepare site data for upload" parses site data for upload into the site table.
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
                   'sites.csv',
                   sep = '/'
)
output_sql = paste(repository,
                   '02_data_insertion',
                   '04_b_Insert_Site.sql',
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
query_perspective = 'SELECT * FROM perspective'
query_method = 'SELECT * FROM cover_method'
query_scope = 'SELECT * FROM scope'
query_dimensions = 'SELECT * FROM plot_dimensions'
query_datum = 'SELECT * FROM datum'
perspective_data = as_tibble(dbGetQuery(database_connection, query_perspective))
method_data = as_tibble(dbGetQuery(database_connection, query_method))
scope_data = as_tibble(dbGetQuery(database_connection, query_scope))
dimensions_data = as_tibble(dbGetQuery(database_connection, query_dimensions))
datum_data = as_tibble(dbGetQuery(database_connection, query_datum))

# Read project table into dataframe
query_project = 'SELECT * FROM project'
project_data = as_tibble(dbGetQuery(database_connection, query_project))

# Create empty list to store site files
site_files = list()

# Iterate through target paths and create file list
for (target_path in target_paths) {
  # Parse target name into sequence and name
  project_name = substr(target_path, start = 4, stop = str_length(target_path))
  
  # Designate input site file
  site_file = paste(project_name,
                    '_Site.xlsx',
                    sep = '')
  site_file = paste(data_folder,
                    target_path,
                    site_file,
                    sep = '/')
  
  # If site file exists, add it to file list
  if (file.exists(site_file)) {
    site_files = append(site_files, list(site_file))
  }
}

# Read site files into list
site_list = lapply(site_files, read_excel, sheet = 'site')

# Combine site list into data frame
site_data = do.call(rbind, site_list)

# Join metadata tables to site table
site_table = site_data %>%
  left_join(project_data, by = c('initial_project' = 'project_abbr')) %>%
  left_join(perspective_data, by = 'perspective') %>%
  left_join(method_data, by = 'cover_method') %>%
  left_join(scope_data, by = c('scope_vascular'= 'scope')) %>%
  rename(scope_vascular_id = scope_id) %>%
  left_join(scope_data, by = c('scope_bryophyte' = 'scope')) %>%
  rename(scope_bryophyte_id = scope_id) %>%
  left_join(scope_data, by = c('scope_lichen' = 'scope')) %>%
  rename(scope_lichen_id = scope_id) %>%
  left_join(dimensions_data, by = 'plot_dimensions') %>%
  left_join(datum_data, by = 'datum') %>%
  select(site_id, site_code, project_id, perspective_id, cover_method_id, scope_vascular_id, scope_bryophyte_id, scope_lichen_id, plot_dimensions_id, datum_id, latitude, longitude, error)
  
# Export the adjudicated observations
write.csv(site_table, file = output_csv, fileEncoding = 'UTF-8', row.names = FALSE)

#### WRITE DATA TO SQL FILE

# Write statement header
statement = c(
  '-- -*- coding: utf-8 -*-',
  '-- ---------------------------------------------------------------------------',
  '-- Insert site data',
  '-- Author: Timm Nawrocki, Alaska Center for Conservation Science',
  paste('-- Last Updated:', Sys.Date(), sep = ' '),
  '-- Usage: Script should be executed in a PostgreSQL 12 database.',
  '-- Description: "Insert site data" pushes all site data into the site table of the database.',
  '-- ---------------------------------------------------------------------------',
  '',
  '-- Initialize transaction',
  'START TRANSACTION;',
  ''
)

# Add data insert statement
statement = c(
  statement,
  '-- Insert site data into site table',
  'INSERT INTO site (site_id, site_code, project_id, perspective_id, cover_method_id, scope_vascular_id, scope_bryophyte_id, scope_lichen_id, plot_dimensions_id, datum_id, latitude, longitude, error) VALUES'
)
input_sql = site_table %>%
  mutate_if(is.character,
            str_replace_all, pattern = '\'', replacement = '\'\'') %>%
  mutate(site_code = paste('\'', site_code, '\'', sep = '')) %>%
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

# Write statement to SQL file
write_lines(statement, output_sql)