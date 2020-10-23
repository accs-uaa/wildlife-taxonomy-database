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
  filter(field == 'strata') %>%
  select(attributeID, attribute) %>%
  rename(strataID = attributeID) %>%
  rename(strata = attribute)

# Export constraint tables
completion_csv = paste(data_folder, 'csv', 'completion.csv', sep = '/')
coverMethod_csv = paste(data_folder, 'csv', 'coverMethod.csv', sep = '/')
coverType_csv = paste(data_folder, 'csv', 'coverType.csv', sep = '/')
dataType_csv = paste(data_folder, 'csv', 'dataType.csv', sep = '/')
datum_csv = paste(data_folder, 'csv', 'datum.csv', sep = '/')
disturbance_csv = paste(data_folder, 'csv', 'disturbance.csv', sep = '/')
drainage_csv = paste(data_folder, 'csv', 'drainage.csv', sep = '/')
geomorphology_csv = paste(data_folder, 'csv', 'geomorphology.csv', sep = '/')
macrotopography_csv = paste(data_folder, 'csv', 'macroptopography.csv', sep = '/')
microtopography_csv = paste(data_folder, 'csv', 'microtopography.csv', sep = '/')
moisture_csv = paste(data_folder, 'csv', 'moisture.csv', sep = '/')
organizationType_csv = paste(data_folder, 'csv', 'organizationType.csv', sep = '/')
personnel_csv = paste(data_folder, 'csv', 'personnel.csv', sep = '/')
perspective_csv = paste(data_folder, 'csv', 'perspective.csv', sep = '/')
physiography_csv = paste(data_folder, 'csv', 'physiography.csv', sep = '/')
plotDimensions_csv = paste(data_folder, 'csv', 'plotDimensions.csv', sep = '/')
restrictiveType_csv = paste(data_folder, 'csv', 'restrictiveType.csv', sep = '/')
schemaCategory_csv = paste(data_folder, 'csv', 'schemaCategory.csv', sep = '/')
schemaTable_csv = paste(data_folder, 'csv', 'schemaTable.csv', sep = '/')
scope_csv = paste(data_folder, 'csv', 'scope.csv', sep = '/')
soilClass_csv = paste(data_folder, 'csv', 'soilClass.csv', sep = '/')
stratification_csv = paste(data_folder, 'csv', 'stratification.csv', sep = '/')
write.csv(completion_table, file = completion_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(coverMethod_table, file = coverMethod_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(coverType_table, file = coverType_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(dataType_table, file = dataType_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(datum_table, file = datum_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(disturbance_table, file = disturbance_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(drainage_table, file = drainage_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(geomorphology_table, file = geomorphology_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(macrotopography_table, file = macrotopography_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(microtopography_table, file = microtopography_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(moisture_table, file = moisture_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(organizationType_table, file = organizationType_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(personnel_table, file = personnel_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(perspective_table, file = perspective_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(physiography_table, file = physiography_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(plotDimensions_table, file = plotDimensions_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(restrictiveType_table, file = restrictiveType_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(schemaCategory_table, file = schemaCategory_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(schemaTable_table, file = schemaTable_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(scope_table, file = scope_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(soilClass_table, file = soilClass_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(stratification_table, file = stratification_csv, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse organization table
organization_table = organization_data %>%
  left_join(organizationType_table) %>%
  select(organizationID, organization, organizationAbbr, organizationTypeID)

# Export organization table
organization_csv = paste(data_folder, 'csv', 'organization.csv', sep = '/')
write.csv(organization_table, file = organization_csv, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse schema table
schema_table = schema_data %>%
  left_join(schemaCategory_table) %>%
  left_join(schemaTable_table, by = c('linkTable' = 'schemaTable')) %>%
  rename(linkTableID = schemaTableID) %>%
  left_join(schemaTable_table) %>%
  left_join(dataType_table) %>%
  rowid_to_column('fieldID') %>%
  mutate(linkTableID = replace_na(linkTableID, 'NULL')) %>%
  select(fieldID, schemaCategoryID, schemaTableID, field, dataTypeID, fieldLength, isUnique, isKey, required, linkTableID, fieldDescription) %>%
  mutate_if(is.character,
            str_replace_all, pattern = '\'NA\'', replacement = 'NULL')

# Export schema table
schema_csv = paste(data_folder, 'csv', 'databaseSchema.csv', sep = '/')
write.csv(schema_table, file = schema_csv, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse dictionary table
dictionary_table = dictionary_data %>%
  left_join(schema_table) %>%
  rowid_to_column('dictionaryID') %>%
  select(dictionaryID, fieldID, attributeID, attribute)

# Export dictionary table
dictionary_csv = paste(data_folder, 'csv', 'databaseDictionary.csv', sep = '/')
write.csv(dictionary_table, file = dictionary_csv, fileEncoding = 'UTF-8', row.names = FALSE)

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
  mutate(perspective = paste('\'', perspective, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
perspective_sql[nrow(perspective_sql),] = paste(str_sub(perspective_sql[nrow(perspective_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in perspective_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO physiography (physiographyID, physiography) VALUES'
)
physiography_sql = physiography_table %>%
  mutate(physiography = paste('\'', physiography, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
physiography_sql[nrow(physiography_sql),] = paste(str_sub(physiography_sql[nrow(physiography_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in physiography_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO plotDimensions (plotDimensionsID, plotDimensions) VALUES'
)
plotDimensions_sql = plotDimensions_table %>%
  mutate(plotDimensions = paste('\'', plotDimensions, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
plotDimensions_sql[nrow(plotDimensions_sql),] = paste(str_sub(plotDimensions_sql[nrow(plotDimensions_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in plotDimensions_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO restrictiveType (restrictiveTypeID, restrictiveType) VALUES'
)
restrictiveType_sql = restrictiveType_table %>%
  mutate(restrictiveType = paste('\'', restrictiveType, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
restrictiveType_sql[nrow(restrictiveType_sql),] = paste(str_sub(restrictiveType_sql[nrow(restrictiveType_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in restrictiveType_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO schemaCategory (schemaCategoryID, schemaCategory) VALUES'
)
schemaCategory_sql = schemaCategory_table %>%
  mutate(schemaCategory = paste('\'', schemaCategory, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
schemaCategory_sql[nrow(schemaCategory_sql),] = paste(str_sub(schemaCategory_sql[nrow(schemaCategory_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in schemaCategory_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO schemaTable (schemaTableID, schemaTable) VALUES'
)
schemaTable_sql = schemaTable_table %>%
  mutate(schemaTable = paste('\'', schemaTable, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
schemaTable_sql[nrow(schemaTable_sql),] = paste(str_sub(schemaTable_sql[nrow(schemaTable_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in schemaTable_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO scope (scopeID, scope) VALUES'
)
scope_sql = scope_table %>%
  mutate(scope = paste('\'', scope, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
scope_sql[nrow(scope_sql),] = paste(str_sub(scope_sql[nrow(scope_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in scope_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO soilClass (soilClassID, soilClass) VALUES'
)
soilClass_sql = soilClass_table %>%
  mutate(soilClass = paste('\'', soilClass, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
soilClass_sql[nrow(soilClass_sql),] = paste(str_sub(soilClass_sql[nrow(soilClass_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in soilClass_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO stratification (strataID, strata) VALUES'
)
stratification_sql = stratification_table %>%
  mutate(strata = paste('\'', strata, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
stratification_sql[nrow(stratification_sql),] = paste(str_sub(stratification_sql[nrow(stratification_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in stratification_sql) {
  statement = c(statement, line)
}


# Add organization statement
statement = c(statement,
              'INSERT INTO organization (organizationID, organization, organizationAbbr, organizationTypeID) VALUES'
)
organization_sql = organization_table %>%
  mutate(organization = paste('\'', organization, '\'', sep = '')) %>%
  mutate(organizationAbbr = paste('\'', organizationAbbr, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
organization_sql[nrow(organization_sql),] = paste(str_sub(organization_sql[nrow(organization_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in organization_sql) {
  statement = c(statement, line)
}

# Add database schema statement
statement = c(statement,
              '',
              '-- Insert data into database schema',
              'INSERT INTO databaseSchema (fieldID, schemaCategoryID, schemaTableID, field, dataTypeID, fieldLength, isUnique, isKey, required, linkTableID, fieldDescription) VALUES'
)
schema_sql = schema_table %>%
  mutate(field = paste('\'', field, '\'', sep = '')) %>%
  mutate(fieldLength = paste('\'', fieldLength, '\'', sep = '')) %>%
  mutate(fieldDescription = paste('\'', fieldDescription, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
schema_sql[nrow(schema_sql),] = paste(str_sub(schema_sql[nrow(schema_sql),],
                                                          start = 1,
                                                          end = -2),
                                                  ';',
                                                  sep = '')
for (line in schema_sql) {
  statement = c(statement, line)
}

# Add database schema statement
statement = c(statement,
              '',
              '-- Insert data into database dictionary',
              'INSERT INTO databaseDictionary (dictionaryID, fieldID, attributeID, attribute) VALUES'
)
dictionary_sql = dictionary_table %>%
  mutate(attribute = paste('\'', attribute, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
dictionary_sql[nrow(dictionary_sql),] = paste(str_sub(dictionary_sql[nrow(dictionary_sql),],
                                              start = 1,
                                              end = -2),
                                      ';',
                                      sep = '')
for (line in dictionary_sql) {
  statement = c(statement, line)
}


# Finalize statement
statement = c(statement,
              '',
              '-- Commit transaction',
              'COMMIT TRANSACTION;')

# Write statement to SQL file
write_lines(statement, sql_metadata)
