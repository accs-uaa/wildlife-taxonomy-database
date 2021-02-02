# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Prepare metadata and constraints for upload
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Last Updated: 2021-01-27
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
sql_metadata = 'C:/Users/timmn/Documents/Repositories/vegetation-plots-database/02_data_insertion/02_b_Insert_Metadata.sql'

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
  select(attribute_id, attribute) %>%
  rename(completion_id = attribute_id) %>%
  rename(completion = attribute)
cover_method_table = dictionary_data %>%
  filter(field == 'cover_method') %>%
  select(attribute_id, attribute) %>%
  rename(cover_method_id = attribute_id) %>%
  rename(cover_method = attribute)
cover_type_table = dictionary_data %>%
  filter(field == 'cover_type') %>%
  select(attribute_id, attribute) %>%
  rename(cover_type_id = attribute_id) %>%
  rename(cover_type = attribute)
data_type_table = dictionary_data %>%
  filter(field == 'data_type') %>%
  select(attribute_id, attribute) %>%
  rename(data_type_id = attribute_id) %>%
  rename(data_type = attribute)
datum_table = dictionary_data %>%
  filter(field == 'datum') %>%
  select(attribute_id, attribute) %>%
  rename(datum_id = attribute_id) %>%
  rename(datum = attribute)
disturbance_table = dictionary_data %>%
  filter(field == 'disturbance') %>%
  select(attribute_id, attribute) %>%
  rename(disturbance_id = attribute_id) %>%
  rename(disturbance = attribute)
drainage_table = dictionary_data %>%
  filter(field == 'drainage') %>%
  select(attribute_id, attribute) %>%
  rename(drainage_id = attribute_id) %>%
  rename(drainage = attribute)
geomorphology_table = dictionary_data %>%
  filter(field == 'geomorphology') %>%
  select(attribute_id, attribute) %>%
  rename(geomorphology_id = attribute_id) %>%
  rename(geomorphology = attribute)
macrotopography_table = dictionary_data %>%
  filter(field == 'macrotopography') %>%
  select(attribute_id, attribute) %>%
  rename(macrotopography_id = attribute_id) %>%
  rename(macrotopography = attribute)
microtopography_table = dictionary_data %>%
  filter(field == 'microtopography') %>%
  select(attribute_id, attribute) %>%
  rename(microtopography_id = attribute_id) %>%
  rename(microtopography = attribute)
moisture_table = dictionary_data %>%
  filter(field == 'moisture') %>%
  select(attribute_id, attribute) %>%
  rename(moisture_id = attribute_id) %>%
  rename(moisture = attribute)
organization_type_table = dictionary_data %>%
  filter(field == 'organization_type') %>%
  select(attribute_id, attribute) %>%
  rename(organization_type_id = attribute_id) %>%
  rename(organization_type = attribute)
personnel_table = dictionary_data %>%
  filter(field == 'personnel') %>%
  select(attribute_id, attribute) %>%
  rename(personnel_id = attribute_id) %>%
  rename(personnel = attribute)
perspective_table = dictionary_data %>%
  filter(field == 'perspective') %>%
  select(attribute_id, attribute) %>%
  rename(perspective_id = attribute_id) %>%
  rename(perspective = attribute)
physiography_table = dictionary_data %>%
  filter(field == 'physiography') %>%
  select(attribute_id, attribute) %>%
  rename(physiography_id = attribute_id) %>%
  rename(physiography = attribute)
plot_dimensions_table = dictionary_data %>%
  filter(field == 'plot_dimensions') %>%
  select(attribute_id, attribute) %>%
  rename(plot_dimensions_id = attribute_id) %>%
  rename(plot_dimensions = attribute)
restrictive_type_table = dictionary_data %>%
  filter(field == 'restrictive_type') %>%
  select(attribute_id, attribute) %>%
  rename(restrictive_type_id = attribute_id) %>%
  rename(restrictive_type = attribute)
schema_category_table = dictionary_data %>%
  filter(field == 'schema_category') %>%
  select(attribute_id, attribute) %>%
  rename(schema_category_id = attribute_id) %>%
  rename(schema_category = attribute)
schema_table_table = dictionary_data %>%
  filter(field == 'schema_table') %>%
  select(attribute_id, attribute) %>%
  rename(schema_table_id = attribute_id) %>%
  rename(schema_table = attribute)
scope_table = dictionary_data %>%
  filter(field == 'scope') %>%
  select(attribute_id, attribute) %>%
  rename(scope_id = attribute_id) %>%
  rename(scope = attribute)
soil_class_table = dictionary_data %>%
  filter(field == 'soil_class') %>%
  select(attribute_id, attribute) %>%
  rename(soil_class_id = attribute_id) %>%
  rename(soil_class = attribute)
stratification_table = dictionary_data %>%
  filter(field == 'strata') %>%
  select(attribute_id, attribute) %>%
  rename(strata_id = attribute_id) %>%
  rename(strata = attribute)

# Export constraint tables
completion_csv = paste(data_folder, 'csv', 'completion.csv', sep = '/')
cover_method_csv = paste(data_folder, 'csv', 'cover_method.csv', sep = '/')
cover_type_csv = paste(data_folder, 'csv', 'cover_type.csv', sep = '/')
data_type_csv = paste(data_folder, 'csv', 'data_type.csv', sep = '/')
datum_csv = paste(data_folder, 'csv', 'datum.csv', sep = '/')
disturbance_csv = paste(data_folder, 'csv', 'disturbance.csv', sep = '/')
drainage_csv = paste(data_folder, 'csv', 'drainage.csv', sep = '/')
geomorphology_csv = paste(data_folder, 'csv', 'geomorphology.csv', sep = '/')
macrotopography_csv = paste(data_folder, 'csv', 'macrotopography.csv', sep = '/')
microtopography_csv = paste(data_folder, 'csv', 'microtopography.csv', sep = '/')
moisture_csv = paste(data_folder, 'csv', 'moisture.csv', sep = '/')
organization_type_csv = paste(data_folder, 'csv', 'organization_type.csv', sep = '/')
personnel_csv = paste(data_folder, 'csv', 'personnel.csv', sep = '/')
perspective_csv = paste(data_folder, 'csv', 'perspective.csv', sep = '/')
physiography_csv = paste(data_folder, 'csv', 'physiography.csv', sep = '/')
plot_dimensions_csv = paste(data_folder, 'csv', 'plot_dimensions.csv', sep = '/')
restrictive_type_csv = paste(data_folder, 'csv', 'restrictive_type.csv', sep = '/')
schema_category_csv = paste(data_folder, 'csv', 'schema_category.csv', sep = '/')
schema_table_csv = paste(data_folder, 'csv', 'schema_table.csv', sep = '/')
scope_csv = paste(data_folder, 'csv', 'scope.csv', sep = '/')
soil_class_csv = paste(data_folder, 'csv', 'soil_class.csv', sep = '/')
stratification_csv = paste(data_folder, 'csv', 'stratification.csv', sep = '/')
write.csv(completion_table, file = completion_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(cover_method_table, file = cover_method_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(cover_type_table, file = cover_type_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(data_type_table, file = data_type_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(datum_table, file = datum_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(disturbance_table, file = disturbance_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(drainage_table, file = drainage_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(geomorphology_table, file = geomorphology_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(macrotopography_table, file = macrotopography_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(microtopography_table, file = microtopography_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(moisture_table, file = moisture_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(organization_type_table, file = organization_type_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(personnel_table, file = personnel_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(perspective_table, file = perspective_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(physiography_table, file = physiography_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(plot_dimensions_table, file = plot_dimensions_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(restrictive_type_table, file = restrictive_type_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(schema_category_table, file = schema_category_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(schema_table_table, file = schema_table_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(scope_table, file = scope_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(soil_class_table, file = soil_class_csv, fileEncoding = 'UTF-8', row.names = FALSE)
write.csv(stratification_table, file = stratification_csv, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse organization table
organization_table = organization_data %>%
  left_join(organization_type_table) %>%
  select(organization_id, organization, organization_abbr, organization_type_id)

# Export organization table
organization_csv = paste(data_folder, 'csv', 'organization.csv', sep = '/')
write.csv(organization_table, file = organization_csv, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse schema table
schema_table = schema_data %>%
  left_join(schema_category_table) %>%
  left_join(schema_table_table, by = c('link_table' = 'schema_table')) %>%
  rename(link_table_id = schema_table_id) %>%
  left_join(schema_table_table, by = 'schema_table') %>%
  left_join(data_type_table) %>%
  rowid_to_column('field_id') %>%
  mutate(link_table_id = replace_na(link_table_id, 'NULL')) %>%
  select(field_id, schema_category_id, schema_table_id, field, data_type_id, field_length, is_unique, is_key, required, link_table_id, field_description) %>%
  mutate_if(is.character,
            str_replace_all, pattern = '\'NA\'', replacement = 'NULL')

# Export schema table
schema_csv = paste(data_folder, 'csv', 'database_schema.csv', sep = '/')
write.csv(schema_table, file = schema_csv, fileEncoding = 'UTF-8', row.names = FALSE)

# Parse dictionary table
dictionary_table = dictionary_data %>%
  left_join(schema_table) %>%
  rowid_to_column('dictionary_id') %>%
  select(dictionary_id, field_id, attribute_id, attribute)

# Export dictionary table
dictionary_csv = paste(data_folder, 'csv', 'database_dictionary.csv', sep = '/')
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
              'INSERT INTO completion (completion_id, completion) VALUES'
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
              'INSERT INTO cover_method (cover_method_id, cover_method) VALUES'
)
cover_method_sql = cover_method_table %>%
  mutate(cover_method = paste('\'', cover_method, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
cover_method_sql[nrow(cover_method_sql),] = paste(str_sub(cover_method_sql[nrow(cover_method_sql),],
                                                      start = 1,
                                                      end = -2),
                                              ';',
                                              sep = '')
for (line in cover_method_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO cover_type (cover_type_id, cover_type) VALUES'
)
cover_type_sql = cover_type_table %>%
  mutate(cover_type = paste('\'', cover_type, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
cover_type_sql[nrow(cover_type_sql),] = paste(str_sub(cover_type_sql[nrow(cover_type_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in cover_type_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO data_type (data_type_id, data_type) VALUES'
)
data_type_sql = data_type_table %>%
  mutate(data_type = paste('\'', data_type, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
data_type_sql[nrow(data_type_sql),] = paste(str_sub(data_type_sql[nrow(data_type_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in data_type_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO datum (datum_id, datum) VALUES'
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
              'INSERT INTO disturbance (disturbance_id, disturbance) VALUES'
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
              'INSERT INTO drainage (drainage_id, drainage) VALUES'
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
              'INSERT INTO geomorphology (geomorphology_id, geomorphology) VALUES'
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
              'INSERT INTO macrotopography (macrotopography_id, macrotopography) VALUES'
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
              'INSERT INTO microtopography (microtopography_id, microtopography) VALUES'
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
              'INSERT INTO moisture (moisture_id, moisture) VALUES'
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
              'INSERT INTO organization_type (organization_type_id, organization_type) VALUES'
)
organization_type_sql = organization_type_table %>%
  mutate(organization_type = paste('\'', organization_type, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
organization_type_sql[nrow(organization_type_sql),] = paste(str_sub(organization_type_sql[nrow(organization_type_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in organization_type_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO personnel (personnel_id, personnel) VALUES'
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
              'INSERT INTO perspective (perspective_id, perspective) VALUES'
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
              'INSERT INTO physiography (physiography_id, physiography) VALUES'
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
              'INSERT INTO plot_dimensions (plot_dimensions_id, plot_dimensions) VALUES'
)
plot_dimensions_sql = plot_dimensions_table %>%
  mutate(plot_dimensions = paste('\'', plot_dimensions, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
plot_dimensions_sql[nrow(plot_dimensions_sql),] = paste(str_sub(plot_dimensions_sql[nrow(plot_dimensions_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in plot_dimensions_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO restrictive_type (restrictive_type_id, restrictive_type) VALUES'
)
restrictive_type_sql = restrictive_type_table %>%
  mutate(restrictive_type = paste('\'', restrictive_type, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
restrictive_type_sql[nrow(restrictive_type_sql),] = paste(str_sub(restrictive_type_sql[nrow(restrictive_type_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in restrictive_type_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO schema_category (schema_category_id, schema_category) VALUES'
)
schema_category_sql = schema_category_table %>%
  mutate(schema_category = paste('\'', schema_category, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
schema_category_sql[nrow(schema_category_sql),] = paste(str_sub(schema_category_sql[nrow(schema_category_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in schema_category_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO schema_table (schema_table_id, schema_table) VALUES'
)
schema_table_sql = schema_table_table %>%
  mutate(schema_table = paste('\'', schema_table, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
schema_table_sql[nrow(schema_table_sql),] = paste(str_sub(schema_table_sql[nrow(schema_table_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in schema_table_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO scope (scope_id, scope) VALUES'
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
              'INSERT INTO soil_class (soil_class_id, soil_class) VALUES'
)
soil_class_sql = soil_class_table %>%
  mutate(soil_class = paste('\'', soil_class, '\'', sep = '')) %>%
  unite(sql, sep = ', ', remove = TRUE) %>%
  mutate(sql = paste('(', sql, '),', sep =''))
soil_class_sql[nrow(soil_class_sql),] = paste(str_sub(soil_class_sql[nrow(soil_class_sql),],
                                                        start = 1,
                                                        end = -2),
                                                ';',
                                                sep = '')
for (line in soil_class_sql) {
  statement = c(statement, line)
}
statement = c(statement,
              'INSERT INTO stratification (strata_id, strata) VALUES'
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
              'INSERT INTO organization (organization_id, organization, organization_abbr, organization_type_id) VALUES'
)
organization_sql = organization_table %>%
  mutate(organization = paste('\'', organization, '\'', sep = '')) %>%
  mutate(organization_abbr = paste('\'', organization_abbr, '\'', sep = '')) %>%
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
              'INSERT INTO database_schema (field_id, schema_category_id, schema_table_id, field, data_type_id, field_length, is_unique, is_key, required, link_table_id, field_description) VALUES'
)
schema_sql = schema_table %>%
  mutate(field = paste('\'', field, '\'', sep = '')) %>%
  mutate(field_length = paste('\'', field_length, '\'', sep = '')) %>%
  mutate(field_description = paste('\'', field_description, '\'', sep = '')) %>%
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
              'INSERT INTO database_dictionary (dictionary_id, field_id, attribute_id, attribute) VALUES'
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

# Replace NA values in statement
statement = str_replace(statement, ', \'NA\',', ', NULL,')

# Write statement to SQL file
write_lines(statement, sql_metadata)
