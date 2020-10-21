# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Prepare metadata and constraints for upload
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Last Updated: 2020-10-20
# Usage: Script should be executed in R 4.0.0+.
# Description: "Prepare metadata and constraints for upload" parses metadata and constraints into a SQL query for upload into empty tables.
# ---------------------------------------------------------------------------

# Set root directory
drive = 'N:'
root_folder = 'ACCS_Work'

# Define input folders
data_folder = paste(drive,
                    root_folder,
                    'Projects/VegetationEcology/AKVEG_PlotsDatabase/Data/Tables_Metadata',
                    sep = '/')

# Designate output sql file
sql_metadata = 'C:/Users/timmn/Documents/Repositories/vegetation-plots-database/database/Insert_2_Metadata.sql'

# Identify metadata tables
dictionary_file = paste(data_folder,
                      'database_dictionary.xlsx',
                      sep='/')
schema_file = paste(data_folder,
                    'database_schema.xlsx',sep='/')
organization_file = paste(data_folder,
                          'organization.xlsx',
                          sep='/')

# Import required libraries
library(dplyr)
library(readr)
library(readxl)
library(stringr)
library(tibble)
library(tidyr)

# Read taxonomy tables into dataframes
dictionary_data = read_excel(dictionary_file, sheet = 'dictionary')
schema_data = read_excel(schema_file, sheet = 'schema')
organization_data = read_excel(organization_file, sheet = 'organization')

# Parse constraint tables
completion_table = dictionary_data %>%
  filter(field == 'completion') %>%
  select(attributeID, attribute) %>%
  rename(completionID = attributeID) %>%
  rename(completion = attribute)
coverMethod_table = dictionary_data %>%
  filter(field == 'coverMethod') %>%
  select(attributeID, attribute) %>%
  rename(coverMethodID = attributeID) %>%
  rename(coverMethod = attribute)
coverType_table = dictionary_data %>%
  filter(field == 'coverType') %>%
  select(attributeID, attribute) %>%
  rename(coverTypeID = attributeID) %>%
  rename(coverType = attribute)
dataType_table = dictionary_data %>%
  filter(field == 'dataType') %>%
  select(attributeID, attribute) %>%
  rename(dataTypeID = attributeID) %>%
  rename(dataType = attribute)
datum_table = dictionary_data %>%
  filter(field == 'datum') %>%
  select(attributeID, attribute) %>%
  rename(datumID = attributeID) %>%
  rename(datum = attribute)
disturbance_table = dictionary_data %>%
  filter(field == 'disturbance') %>%
  select(attributeID, attribute) %>%
  rename(disturbanceID = attributeID) %>%
  rename(disturbance = attribute)
drainage_table = dictionary_data %>%
  filter(field == 'drainage') %>%
  select(attributeID, attribute) %>%
  rename(drainageID = attributeID) %>%
  rename(drainage = attribute)
geomorphology_table = dictionary_data %>%
  filter(field == 'geomorphology') %>%
  select(attributeID, attribute) %>%
  rename(geomorphologyID = attributeID) %>%
  rename(geomorphology = attribute)
macrotopography_table = dictionary_data %>%
  filter(field == 'macrotopography') %>%
  select(attributeID, attribute) %>%
  rename(macrotopographyID = attributeID) %>%
  rename(macrotopography = attribute)
microtopography_table = dictionary_data %>%
  filter(field == 'microtopography') %>%
  select(attributeID, attribute) %>%
  rename(microtopographyID = attributeID) %>%
  rename(microtopography = attribute)
moisture_table = dictionary_data %>%
  filter(field == 'moisture') %>%
  select(attributeID, attribute) %>%
  rename(moistureID = attributeID) %>%
  rename(moisture = attribute)
organizationType_table = dictionary_data %>%
  filter(field == 'organizationType') %>%
  select(attributeID, attribute) %>%
  rename(organizationTypeID = attributeID) %>%
  rename(organizationType = attribute)
personnel_table = dictionary_data %>%
  filter(field == 'personnel') %>%
  select(attributeID, attribute) %>%
  rename(personnelID = attributeID) %>%
  rename(personnel = attribute)
perspective_table = dictionary_data %>%
  filter(field == 'perspective') %>%
  select(attributeID, attribute) %>%
  rename(perspectiveID = attributeID) %>%
  rename(perspective = attribute)
physiography_table = dictionary_data %>%
  filter(field == 'physiography') %>%
  select(attributeID, attribute) %>%
  rename(physiographyID = attributeID) %>%
  rename(physiography = attribute)
plotDimensions_table = dictionary_data %>%
  filter(field == 'plotDimensions') %>%
  select(attributeID, attribute) %>%
  rename(plotDimensionsID = attributeID) %>%
  rename(plotDimensions = attribute)
restrictiveType_table = dictionary_data %>%
  filter(field == 'restrictiveType') %>%
  select(attributeID, attribute) %>%
  rename(restrictiveTypeID = attributeID) %>%
  rename(restrictiveType = attribute)
schemaCategory_table = dictionary_data %>%
  filter(field == 'schemaCategory') %>%
  select(attributeID, attribute) %>%
  rename(schemaCategoryID = attributeID) %>%
  rename(schemaCategory = attribute)
schemaTable_table = dictionary_data %>%
  filter(field == 'schemaTable') %>%
  select(attributeID, attribute) %>%
  rename(schemaTableID = attributeID) %>%
  rename(schemaTable = attribute)
scope_table = dictionary_data %>%
  filter(field == 'scope') %>%
  select(attributeID, attribute) %>%
  rename(scopeID = attributeID) %>%
  rename(scope = attribute)
soilClass_table = dictionary_data %>%
  filter(field == 'soilClass') %>%
  select(attributeID, attribute) %>%
  rename(soilClassID = attributeID) %>%
  rename(soilClass = attribute)
stratification_table = dictionary_data %>%
  filter(field == 'stratification') %>%
  select(attributeID, attribute) %>%
  rename(stratificationID = attributeID) %>%
  rename(stratification = attribute)

#### WRITE DATA TO SQL FILE

# Write statement header
statement = c(
  '-- -*- coding: utf-8 -*-',
  '-- ---------------------------------------------------------------------------',
  '-- Insert metadata and constraints',
  '-- Author: Timm Nawrocki, Alaska Center for Conservation Science',
  paste('-- Last Updated: ', Sys.Date()),
  '-- Usage: Script should be executed in a PostgreSQL 12 database.',
  '-- Description: "Insert metadata and constraints" pushes data from the database dictionary and schema into the database server. The script "Build metadata and constraint tables" should be run prior to this script to start with empty, properly formatted tables.',
  '-- ---------------------------------------------------------------------------',
  '',
  '-- Initialize transaction',
  'START TRANSACTION;',
  ''
)

# Add author statement
statement = c(statement,
              '-- Insert data into constraint tables',
              'INSERT INTO completion (completionID, completion) VALUES'
)
completion_sql = completion_table %>%
  mutate(completion = paste('\'', completion, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
completion_sql[nrow(completion_sql),] = paste(str_sub(completion_sql[nrow(completion_sql),],
                                              start = 1,
                                              end = -2),
                                      ';',
                                      sep = '')
for (line in completion_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO coverMethod (coverMethodID, coverMethod) VALUES'
)
coverMethod_sql = coverMethod_table %>%
  mutate(coverMethod = paste('\'', coverMethod, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
coverMethod_sql[nrow(coverMethod_sql),] = paste(str_sub(coverMethod_sql[nrow(coverMethod_sql),],
                                                      start = 1,
                                                      end = -2),
                                              ';',
                                              sep = '')
for (line in coverMethod_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO coverType (coverTypeID, coverType) VALUES'
)
coverType_sql = coverType_table %>%
  mutate(coverType = paste('\'', coverType, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
coverType_sql[nrow(coverType_sql),] = paste(str_sub(coverType_sql[nrow(coverType_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in coverType_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO dataType (dataTypeID, dataType) VALUES'
)
dataType_sql = dataType_table %>%
  mutate(dataType = paste('\'', dataType, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
dataType_sql[nrow(dataType_sql),] = paste(str_sub(dataType_sql[nrow(dataType_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in dataType_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO datum (datumID, datum) VALUES'
)
datum_sql = datum_table %>%
  mutate(datum = paste('\'', datum, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
datum_sql[nrow(datum_sql),] = paste(str_sub(datum_sql[nrow(datum_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in datum_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO disturbance (disturbanceID, disturbance) VALUES'
)
disturbance_sql = disturbance_table %>%
  mutate(disturbance = paste('\'', disturbance, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
disturbance_sql[nrow(disturbance_sql),] = paste(str_sub(disturbance_sql[nrow(disturbance_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in disturbance_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO drainage (drainageID, drainage) VALUES'
)
drainage_sql = drainage_table %>%
  mutate(drainage = paste('\'', drainage, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
drainage_sql[nrow(drainage_sql),] = paste(str_sub(drainage_sql[nrow(drainage_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in drainage_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO geomorphology (geomorphologyID, geomorphology) VALUES'
)
geomorphology_sql = geomorphology_table %>%
  mutate(geomorphology = paste('\'', geomorphology, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
geomorphology_sql[nrow(geomorphology_sql),] = paste(str_sub(geomorphology_sql[nrow(geomorphology_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in geomorphology_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO macrotopography (macrotopographyID, macrotopography) VALUES'
)
macrotopography_sql = macrotopography_table %>%
  mutate(macrotopography = paste('\'', macrotopography, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
macrotopography_sql[nrow(macrotopography_sql),] = paste(str_sub(macrotopography_sql[nrow(macrotopography_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in macrotopography_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO microtopography (microtopographyID, microtopography) VALUES'
)
microtopography_sql = microtopography_table %>%
  mutate(microtopography = paste('\'', microtopography, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
microtopography_sql[nrow(microtopography_sql),] = paste(str_sub(microtopography_sql[nrow(microtopography_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in microtopography_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO moisture (moistureID, moisture) VALUES'
)
moisture_sql = moisture_table %>%
  mutate(moisture = paste('\'', moisture, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
moisture_sql[nrow(moisture_sql),] = paste(str_sub(moisture_sql[nrow(moisture_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in moisture_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO organizationType (organizationTypeID, organizationType) VALUES'
)
organizationType_sql = organizationType_table %>%
  mutate(organizationType = paste('\'', organizationType, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
organizationType_sql[nrow(organizationType_sql),] = paste(str_sub(organizationType_sql[nrow(organizationType_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in organizationType_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO personnel (personnelID, personnel) VALUES'
)
personnel_sql = personnel_table %>%
  mutate(personnel = paste('\'', personnel, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
personnel_sql[nrow(personnel_sql),] = paste(str_sub(personnel_sql[nrow(personnel_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in personnel_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO perspective (perspectiveID, perspective) VALUES'
)
perspective_sql = perspective_table %>%
  mutate(perspective = paste('\'', coverMethod, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
coverMethod_sql[nrow(coverMethod_sql),] = paste(str_sub(coverMethod_sql[nrow(coverMethod_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in coverMethod_sql) {
  statement = c(statement, line)
}





# Add database dictionary statement
statement = c(statement,
              '',
              '-- Insert data into database dictionary',
              'INSERT INTO databaseDictionary (dictionaryID, fieldID, attributeID, attribute) VALUES'
)

# Finalize statement
statement = c(statement,
              '',
              '-- Commit transaction',
              'COMMIT TRANSACTION;')

# Write statement to SQL file
write_lines(statement, sql_metadata)
