# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Build personnel list
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Last Updated: 2021-01-27
# Usage: Script should be executed in R 4.0.0+.
# Description: "Build personnel list" exports a csv table of observer and recorder names from the cover and environment tables to enter into the database dictionary.
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

# Define sheet names
cover_sheet = 'cover'
environment_sheet = 'environment'

# Define an output csv
output_csv = paste(data_folder,
                   'Tables_Metadata',
                   'personnel_unique.csv',
                   sep = '/')

# Import required libraries
library(dplyr)
library(readr)
library(readxl)
library(RPostgres)
library(stringr)
library(tibble)
library(tidyr)

# Create empty lists to store cover and environment files
cover_files = list()
environment_files = list()

# Iterate through target paths and create file lists
for (target_path in target_paths) {
  # Parse target name into sequence and name
  project_name = substr(target_path, start = 4, stop = str_length(target_path))
  
  # Designate input cover file
  cover_file = paste(project_name,
                     '_Cover.xlsx',
                     sep = '')
  cover_file = paste(data_folder,
                     'Data_Plots',
                     target_path,
                     cover_file,
                     sep = '/')
  
  # Designate input environment file
  environment_file = paste(project_name,
                           '_Environment.xlsx',
                           sep = '')
  environment_file = paste(data_folder,
                           'Data_Plots',
                           target_path,
                           environment_file,
                           sep = '/')
  
  # If cover file exists, add it to file list
  if (file.exists(cover_file)) {
    cover_files = append(cover_files, list(cover_file))
  }
  
  # If environment file exists, add it to file list
  if (file.exists(environment_file)) {
    environment_files = append(environment_files, list(environment_file))
  }
}

# Read cover files into list
cover_list = lapply(cover_files, read_excel, sheet = 'cover')

# Read environment files into list
environment_list = lapply(environment_files, read_excel, sheet = 'environment')

# Combine cover list into data frame
cover_data = do.call(rbind, cover_list)

# Combine environment list into data frame
environment_data = do.call(rbind, environment_list)

# Subset unique values from each name column
veg_observer = cover_data %>%
  distinct(veg_observer) %>%
  rename(personnel = veg_observer) %>%
  drop_na()
veg_recorder = cover_data %>%
  distinct(veg_recorder) %>%
  rename(personnel = veg_recorder) %>%
  drop_na()
env_observer = environment_data %>%
  distinct(env_observer) %>%
  rename(personnel = env_observer) %>%
  drop_na()
soil_observer = environment_data %>%
  distinct(soil_observer) %>%
  rename(personnel = soil_observer) %>%
  drop_na()

# Combine personnel into a single dataframe of unique values
personnel_data = rbind(veg_observer,
                       veg_recorder,
                       env_observer,
                       soil_observer)
personnel_unique = personnel_data %>%
  distinct(personnel)

# Export the joined table as a csv file
write.csv(personnel_unique, file = output_csv, fileEncoding = 'UTF-8', row.names = FALSE)