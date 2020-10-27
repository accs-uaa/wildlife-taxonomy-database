# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Prepare project data for upload
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Last Updated: 2020-10-26
# Usage: Script should be executed in R 4.0.0+.
# Description: "Prepare project data for upload" parses project data for upload into the project table.
# ---------------------------------------------------------------------------

# Set target name
target_path = '01_aimNPRA_2017'

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

# Parse target name into sequence and name
project_name = substr(target_path, start = 4, stop = str_length(target_path))

# Designate input file
input_file = paste(project_name,
                   '_Project.xlsx',
                   sep='')
input_file = paste(data_folder,
                   'Data_Plots',
                   target_path,
                   input_file,
                   sep='/')

# Designate output csv file
output_csv = paste(project_name,
                   '_Project.csv',
                   sep='')
output_csv = paste(data_folder,
                   'Data_Plots',
                   target_path,
                   'upload',
                   output_csv,
                   sep='/')

# Designate output sql file
output_sql = paste('Insert_',
                    target_path,
                    '_1_Project.sql',
                    sep=''
                    )
output_sql = paste(repository,
                   'data_upload',
                   output_sql,
                   sep='/'
                   )

# Identify metadata tables
completion_file = paste(data_folder,
                        'Tables_Metadata',
                        'csv',
                        'completion.csv',
                        sep='/')
organization_file = paste(data_folder,
                       'Tables_Metadata',
                       'csv',
                       'organization.csv',
                       sep='/')
personnel_file = paste(data_folder,
                      'Tables_Metadata',
                      'csv',
                      'personnel.csv',
                      sep='/')

# Read data and metadata into dataframes
input_data = read_excel(input_file, sheet = 'project')
completion_data = read.csv(completion_file, fileEncoding = 'UTF-8')
organization_data = read.csv(organization_file, fileEncoding = 'UTF-8')
personnel_data = read.csv(personnel_file, fileEncoding = 'UTF-8')

# Join metadata tables to input table
input_table = input_data %>%
  left_join(completion_data, by = 'completion') %>%
  left_join(organization_data, by = c('originator' = 'organization')) %>%
  rename(originatorID = organizationID) %>%
  left_join(organization_data, by = c('funder' = 'organization')) %>%
  rename(funderID = organizationID) %>%
  left_join(personnel_data, by = c('manager' = 'personnel')) %>%
  rename(managerID = personnelID) %>%
  select(projectID, originatorID, funderID, managerID, projectName, projectNameAbbr, completionID, yearStart, yearEnd, projectDescription)

# Export the adjudicated observations
write.csv(input_table, file = output_csv, fileEncoding = 'UTF-8', row.names = FALSE)

#### WRITE DATA TO SQL FILE

# Write statement header
statement = c(
  '-- -*- coding: utf-8 -*-',
  '-- ---------------------------------------------------------------------------',
  paste('-- Insert project metadata for', project_name, sep = ' '),
  '-- Author: Timm Nawrocki, Alaska Center for Conservation Science',
  paste('-- Last Updated:', Sys.Date(), sep = ' '),
  '-- Usage: Script should be executed in a PostgreSQL 12 database.',
  '-- Description: "Insert project metadata" pushes the metadata for the specified project into the project table of the database.',
  '-- ---------------------------------------------------------------------------',
  '',
  '-- Initialize transaction',
  'START TRANSACTION;',
  ''
)

# Add data insert statement
statement = c(statement,
              '-- Insert project data into project table',
              'INSERT INTO project (projectID, originatorID, funderID, managerID, projectName, projectNameAbbr, completionID, yearStart, yearEnd, projectDescription) VALUES'
)
input_sql = input_table %>%
  mutate_if(is.character,
            str_replace_all, pattern = '\'', replacement = '\'\'') %>%
  mutate(projectName = paste('\'', projectName, '\'', sep = '')) %>%
  mutate(projectNameAbbr = paste('\'', projectNameAbbr, '\'', sep = '')) %>%
  mutate(projectDescription = paste('\'', projectDescription, '\'', sep = '')) %>%
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
