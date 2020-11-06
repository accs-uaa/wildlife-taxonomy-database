# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Build personnel list
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Last Updated: 2020-11-05
# Usage: Script should be executed in R 4.0.0+.
# Description: "Build personnel list" exports a csv table of observer and recorder names from the cover and environment tables to enter into the database dictionary.
# ---------------------------------------------------------------------------

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

# Define target cover tables
cover_file_01 = paste(data_folder,
                      'Data_Plots',
                      '01_aimNPRA_2017',
                      'aimNPRA_2017_Cover.xlsx',
                      sep = '/')
cover_file_02 = paste(data_folder,
                      'Data_Plots',
                      '02_accsColville_2015',
                      'accsColville_2015_Cover.xlsx',
                      sep = '/')
cover_file_03 = paste(data_folder,
                      'Data_Plots',
                      '03_poplarBreen_2006',
                      'poplarBreen_2006_Cover.xlsx',
                      sep = '/')
cover_file_04 = paste(data_folder,
                      'Data_Plots',
                      '04_npsGatesLC_1998',
                      'npsGatesLC_1998_Cover.xlsx',
                      sep = '/')
cover_file_05 = paste(data_folder,
                      'Data_Plots',
                      '05_northSlopeLC_2011',
                      'northSlopeLC_2011_Cover.xlsx',
                      sep = '/')
cover_file_06 = paste(data_folder,
                      'Data_Plots',
                      '06_npsYukonCharleyPA_2003',
                      'npsYukonCharleyPA_2003_Cover.xlsx',
                      sep = '/')
cover_file_07 = paste(data_folder,
                      'Data_Plots',
                      '07_aimFortymile_2017',
                      'aimFortymile_2017_Cover.xlsx',
                      sep = '/')
cover_file_08 = paste(data_folder,
                      'Data_Plots',
                      '08_npsLichenARCN_2007',
                      'npsLichenARCN_2007_Cover.xlsx',
                      sep = '/')
cover_file_09 = paste(data_folder,
                      'Data_Plots',
                      '09_usfwsSelawikTalbot_2005',
                      'usfwsSelawikTalbot_2005_Cover.xlsx',
                      sep = '/')
cover_file_10 = paste(data_folder,
                      'Data_Plots',
                      '10_usfwsSelawikLC_2005',
                      'usfwsSelawikLC_2005_Cover.xlsx',
                      sep = '/')
cover_file_11 = paste(data_folder,
                      'Data_Plots',
                      '11_usfwsInterior_2014',
                      'usfwsInterior_2014_Cover.xlsx',
                      sep = '/')
cover_file_12 = paste(data_folder,
                      'Data_Plots',
                      '12_npsDenaliLC_1999',
                      'npsDenaliLC_1999_Cover.xlsx',
                      sep = '/')
cover_file_13 = paste(data_folder,
                      'Data_Plots',
                      '13_npsAlagnakLC_2010',
                      'npsAlagnakLC_2010_Cover.xlsx',
                      sep = '/')
cover_file_14 = paste(data_folder,
                      'Data_Plots',
                      '14_npsKatmaiLC_2000',
                      'npsKatmaiLC_2000_Cover.xlsx',
                      sep = '/')
cover_file_15 = paste(data_folder,
                      'Data_Plots',
                      '15_npsAniakchakLC_2009',
                      'npsAniakchakLC_2009_Cover.xlsx',
                      sep = '/')
cover_file_16 = paste(data_folder,
                      'Data_Plots',
                      '16_aimGMT2_2019',
                      'aimGMT2_2019_Cover.xlsx',
                      sep = '/')
cover_file_17 = paste(data_folder,
                      'Data_Plots',
                      '17_accsNuyakuk_2019',
                      'accsNuyakuk_2019_Cover.xlsx',
                      sep = '/')
cover_file_18 = paste(data_folder,
                      'Data_Plots',
                      '18_accsRibdon_2019',
                      'accsRibdon_2019_Cover.xlsx',
                      sep = '/')
cover_file_19 = paste(data_folder,
                      'Data_Plots',
                      '19_npsKenaiFjordsLC_2004',
                      'npsKenaiFjordsLC_2004_Cover.xlsx',
                      sep = '/')
cover_file_20 = paste(data_folder,
                      'Data_Plots',
                      '20_npsGlacierBayLC_2001',
                      'npsGlacierBayLC_2001_Cover.xlsx',
                      sep = '/')
cover_file_21 = paste(data_folder,
                      'Data_Plots',
                      '21_npsKlondikeLC_2011',
                      'npsKlondikeLC_2011_Cover.xlsx',
                      sep = '/')
cover_file_22 = paste(data_folder,
                      'Data_Plots',
                      '22_npsSitkaLC_2012',
                      'npsSitkaLC_2012_Cover.xlsx',
                      sep = '/')

# Define target environment tables
environment_file_01 = paste(data_folder,
                           'Data_Plots',
                           '01_aimNPRA_2017',
                           'aimNPRA_2017_Environment.xlsx',
                           sep = '/')
environment_file_04 = paste(data_folder,
                           'Data_Plots',
                           '04_npsGatesLC_1998',
                           'npsGatesLC_1998_Environment.xlsx',
                           sep = '/')
environment_file_06 = paste(data_folder,
                           'Data_Plots',
                           '06_npsYukonCharleyPA_2003',
                           'npsYukonCharleyPA_2003_Environment.xlsx',
                           sep = '/')
environment_file_07 = paste(data_folder,
                           'Data_Plots',
                           '07_aimFortymile_2017',
                           'aimFortymile_2017_Environment.xlsx',
                           sep = '/')
environment_file_12 = paste(data_folder,
                           'Data_Plots',
                           '12_npsDenaliLC_1999',
                           'npsDenaliLC_1999_Environment.xlsx',
                           sep = '/')
environment_file_13 = paste(data_folder,
                            'Data_Plots',
                            '13_npsAlagnakLC_2010',
                            'npsAlagnakLC_2010_Environment.xlsx',
                            sep = '/')
environment_file_14 = paste(data_folder,
                            'Data_Plots',
                            '14_npsKatmaiLC_2000',
                            'npsKatmaiLC_2000_Environment.xlsx',
                            sep = '/')
environment_file_15 = paste(data_folder,
                            'Data_Plots',
                            '15_npsAniakchakLC_2009',
                            'npsAniakchakLC_2009_Environment.xlsx',
                            sep = '/')
environment_file_16 = paste(data_folder,
                            'Data_Plots',
                            '16_aimGMT2_2019',
                            'aimGMT2_2019_Environment.xlsx',
                            sep = '/')
environment_file_21 = paste(data_folder,
                            'Data_Plots',
                            '21_npsKlondikeLC_2011',
                            'npsKlondikeLC_2011_Environment.xlsx',
                            sep = '/')

# Define table lists
cover_files = list(cover_file_01,
                   cover_file_02,
                   cover_file_03,
                   cover_file_04,
                   cover_file_05,
                   cover_file_06,
                   cover_file_07,
                   cover_file_08,
                   cover_file_09,
                   cover_file_10,
                   cover_file_11,
                   cover_file_12,
                   cover_file_13,
                   cover_file_14,
                   cover_file_15,
                   cover_file_16,
                   cover_file_17,
                   cover_file_18,
                   cover_file_19,
                   cover_file_20,
                   cover_file_21,
                   cover_file_22
                   )
environment_files = list(environment_file_01,
                         environment_file_04,
                         environment_file_06,
                         environment_file_07,
                         environment_file_12,
                         environment_file_13,
                         environment_file_14,
                         environment_file_15,
                         environment_file_16)

# Define an output csv
output_csv = paste(data_folder,
                   'Tables_Metadata',
                   'personnel_unique.csv',
                   sep = '/')

# Import required libraries
library(dplyr)
library(readr)
library(readxl)
library(stringr)
library(tibble)
library(tidyr)

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
  distinct(vegObserver) %>%
  rename(personnel = vegObserver) %>%
  drop_na()
veg_recorder = cover_data %>%
  distinct(vegRecorder) %>%
  rename(personnel = vegRecorder) %>%
  drop_na()
env_observer = environment_data %>%
  distinct(envObserver) %>%
  rename(personnel = envObserver) %>%
  drop_na()
soil_observer = environment_data %>%
  distinct(soilObserver) %>%
  rename(personnel = soilObserver) %>%
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