# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Merge Lichen Checklist 1.1 with CNALH Alaska Lichens
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Last Updated: 2020-09-18
# Usage: Script should be executed in R 4.0.0+.
# Description: "Merge Lichen Checklist 1.1 with CNALH Alaska Lichens" merges the original AKVEG lichen checklist (with slight manual modifications - version 1.1) with the accepted names checklist extracted from Consortium of North American Lichen Herbaria (CNALH).
# ---------------------------------------------------------------------------

# Set root directory
drive = 'N:'
root_folder = 'ACCS_Work'

# Define input folder
data_folder = paste(drive,
                    root_folder,
                    'Projects/VegetationEcology/AKVEG_Taxonomy/Version_1-1/Lichens_Working',
                    sep = '/')

# Identify taxonomy tables
lichen_plants_file = paste(data_folder,
                      'Lichen_Old.xlsx',
                      sep='/')
lichen_cnalh_file = paste(data_folder,
                       'CNALH_Lichens.xlsx',
                       sep='/')

# Import required libraries
library(dplyr)
library(readxl)
library(tidyr)

# Read taxonomy tables into dataframes
lichen_plants = read_excel(lichen_plants_file, sheet = 'taxonomy')
lichen_cnalh = read_excel(lichen_cnalh_file, sheet = 'Unique')

# Merge taxonomy tables to single dataframe
lichen_merged = full_join(lichen_cnalh, lichen_plants, by = 'nameJoin')

# Export merged taxonomy tables
output_csv = paste(data_folder, 'lichen_merged.csv', sep = '/')
write.csv(lichen_merged, file = output_csv, fileEncoding = 'UTF-8')