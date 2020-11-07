# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Prepare site data for upload
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Last Updated: 2020-11-06
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
perspective_file = paste(data_folder,
                         'Tables_Metadata',
                         'csv',
                         'perspective.csv',
                         sep = '/')
coverMethod_file = paste(data_folder,
                         'Tables_Metadata',
                         'csv',
                         'coverMethod.csv',
                         sep = '/')
scope_file = paste(data_folder,
                   'Tables_Metadata',
                   'csv',
                   'scope.csv',
                   sep = '/')
plotDimensions_file = paste(data_folder,
                            'Tables_Metadata',
                            'csv',
                            'plotDimensions.csv',
                            sep = '/')
datum_file = paste(data_folder,
                   'Tables_Metadata',
                   'csv',
                   'datum.csv',
                   sep = '/')

# Read metadata into data frames
perspective_data = read.csv(perspective_file, fileEncoding = 'UTF-8')
coverMethod_data = read.csv(coverMethod_file, fileEncoding = 'UTF-8')
scope_data = read.csv(scope_file, fileEncoding = 'UTF-8')
plotDimensions_data = read.csv(plotDimensions_file, fileEncoding = 'UTF-8')
datum_data = read.csv(datum_file, fileEncoding = 'UTF-8')

# Iterate through target paths and produce output insert statements
for (target_path in target_paths) {
  # Parse target name into sequence and name
  project_name = substr(target_path, start = 4, stop = str_length(target_path))
  
  # Designate input file
  input_file = paste(project_name,
                     '_Site.xlsx',
                     sep = '')
  input_file = paste(data_folder,
                     'Data_Plots',
                     target_path,
                     input_file,
                     sep = '/')
  
  # Designate output csv file
  output_csv = paste(project_name,
                     '_Site.csv',
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
                     '_2_Site.sql',
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
  
  # Read project data into data frame
  project_data = read.csv(project_file, fileEncoding = 'UTF-8')
  input_data = read_excel(input_file, sheet = 'site')

  # Join metadata tables to input table
  input_table = input_data %>%
    left_join(project_data, by = c('initialProject' = 'projectNameAbbr')) %>%
    left_join(perspective_data, by = 'perspective') %>%
    left_join(coverMethod_data, by = 'coverMethod') %>%
    left_join(scope_data, by = c('scopeVascular'= 'scope')) %>%
    rename(scopeVascularID = scopeID) %>%
    left_join(scope_data, by = c('scopeBryophyte' = 'scope')) %>%
    rename(scopeBryophyteID = scopeID) %>%
    left_join(scope_data, by = c('scopeLichen' = 'scope')) %>%
    rename(scopeLichenID = scopeID) %>%
    left_join(plotDimensions_data, by = 'plotDimensions') %>%
    left_join(datum_data, by = 'datum') %>%
    select(siteID, siteCode, projectID, perspectiveID, coverMethodID, scopeVascularID, scopeBryophyteID, scopeLichenID, plotDimensionsID, datumID, latitude, longitude, error)
  
  # Export the adjudicated observations
  write.csv(input_table, file = output_csv, fileEncoding = 'UTF-8', row.names = FALSE)

  #### WRITE DATA TO SQL FILE

  # Write statement header
  statement = c(
    '-- -*- coding: utf-8 -*-',
    '-- ---------------------------------------------------------------------------',
    paste('-- Insert site data for', project_name, sep = ' '),
    '-- Author: Timm Nawrocki, Alaska Center for Conservation Science',
    paste('-- Last Updated:', Sys.Date(), sep = ' '),
    '-- Usage: Script should be executed in a PostgreSQL 12 database.',
    '-- Description: "Insert site data" pushes the site data for the specified project into the site table of the database.',
    '-- ---------------------------------------------------------------------------',
    '',
    '-- Initialize transaction',
    'START TRANSACTION;',
    ''
    )

  # Add data insert statement
  statement = c(statement,
                '-- Insert site data into site table',
                'INSERT INTO site (siteID, siteCode, projectID, perspectiveID, coverMethodID, scopeVascularID, scopeBryophyteID, scopeLichenID, plotDimensionsID, datumID, latitude, longitude, error) VALUES'
  )
  input_sql = input_table %>%
    mutate_if(is.character,
              str_replace_all, pattern = '\'', replacement = '\'\'') %>%
    mutate(siteCode = paste('\'', siteCode, '\'', sep = '')) %>%
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

  # Write statement to SQL file
  write_lines(statement, output_sql)
}
