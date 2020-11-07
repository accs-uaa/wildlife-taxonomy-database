# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Adjudicate names for foliar cover observations
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Last Updated: 2020-10-22
# Usage: Script should be executed in R 4.0.0+.
# Description: "Adjudicate names for foliar cover observations" joins the adjudicated names to the original names. A manual review is required after running this script to apply names that could not be automatically adjudicated.
# ---------------------------------------------------------------------------

# Set root directory
drive = 'N:'
root_folder = 'ACCS_Work'
data_folder = 'Projects/VegetationEcology/AKVEG_PlotsDatabase/Data/Data_Plots/22_npsSitkaLC_2012'

# Define input data
observation_file = file.choose()
names_file = paste(drive,
                   root_folder,
                   'Projects/VegetationEcology/AKVEG_PlotsDatabase/Data/Tables_Taxonomy/csv/taxonAdjudicated.csv',
                   sep = '/')

# Designate output csv file
adjudicated_csv = paste(drive,
                        root_folder,
                        data_folder,
                        'cover_adjudicated.csv',
                        sep = '/')

# Import required libraries
library(dplyr)
library(readr)
library(readxl)
library(stringr)
library(tibble)
library(tidyr)

# Read taxonomy tables into dataframes
observation_data = read_excel(observation_file, sheet = 'cover')
names_data = read.csv(names_file, fileEncoding = 'UTF-8')

# Select necessary columns from the names data
names_data = names_data %>%
  select(adjudicatedID, nameAdjudicated)

# Join adjudicated names to observation data
observation_data = observation_data %>%
  select(siteCode, vegObserveDate, vegObserver1, vegObserver2, coverType, nameOriginal, cover) %>%
  left_join(names_data, by = c('nameOriginal' = 'nameAdjudicated')) %>%
  left_join(names_data) %>%
  select(siteCode, vegObserveDate, vegObserver1, vegObserver2, coverType, nameOriginal, nameAdjudicated, cover)

# Export the adjudicated observations
write.csv(observation_data, file = adjudicated_csv, fileEncoding = 'UTF-8', row.names = FALSE)