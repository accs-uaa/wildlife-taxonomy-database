# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Adjudicate names for foliar cover observations
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Last Updated: 2021-01-29
# Usage: Script should be executed in R 4.0.0+.
# Description: "Adjudicate names for foliar cover observations" joins the adjudicated names to the original names. A manual review is required after running this script to apply names that could not be automatically adjudicated.
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

# Define input folder
data_folder = paste(drive,
                    root_folder,
                    'Projects/VegetationEcology/AKVEG_PlotsDatabase/Data/Data_Plots',
                    sep = '/')

# Set repository directory
repository = 'C:/Users/timmn/Documents/Repositories/vegetation-plots-database'

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
                          'connectDatabasePostgreSQL.R',
                          sep = '/')
source(connection_script)

# Create a connection to the AKVEG PostgreSQL database
authentication = paste(drive,
                       root_folder,
                       'Administrative/Credentials/accs-postgresql/authentication_akveg.csv',
                       sep = '/')
database_connection = connect_database_postgresql(authentication)

# Read constraints into data frames from AKVEG
query_taxa = 'SELECT * FROM taxon_adjudicated'
taxa_data = as_tibble(dbGetQuery(database_connection, query_taxa))

# Iterate through target paths and produce output insert statements
for (target_path in target_paths) {
  # Parse target name into sequence and name
  project_name = substr(target_path, start = 4, stop = str_length(target_path))
  
  # Designate input file
  input_file = paste(project_name,
                     '_Cover.xlsx',
                     sep = '')
  input_file = paste(data_folder,
                     target_path,
                     input_file,
                     sep = '/')
  
  # Designate output csv file
  output_csv = 'cover_adjudicated.csv'
  output_csv = paste(data_folder,
                     target_path,
                     output_csv,
                     sep = '/')
  
  # Read input data into dataframe
  input_data = read_excel(input_file, sheet = 'cover')

  # Select necessary columns from the adjudicated names
  taxa_data = taxa_data %>%
    select(adjudicated_id, name_adjudicated)

  # Join adjudicated names to observation data
  observation_data = input_data %>%
    select(project, site_code, veg_observe_date, veg_observer, veg_recorder, cover_type, name_original, cover) %>%
    left_join(taxa_data, by = c('name_original' = 'name_adjudicated')) %>%
    left_join(taxa_data, by = 'adjudicated_id') %>%
    select(project, site_code, veg_observe_date, veg_observer, veg_recorder, cover_type, name_original, name_adjudicated, cover)

  # Export the adjudicated observations
  write.csv(observation_data, file = output_csv, fileEncoding = 'UTF-8', row.names = FALSE)
}