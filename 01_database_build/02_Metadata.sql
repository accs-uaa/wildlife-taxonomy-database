-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Build metadata and constraint tables
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Adapted for wildlife data by Amanda Droghini, Alaska Center for Conservation Science
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Build metadata and constraint tables" creates the empty tables for the metadata components of the AKVEG database, including the schema and data dictionary. WARNING: THIS SCRIPT WILL ERASE ALL DATA IN EXISTING METADATA TABLES.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Drop metadata tables if they exist
DROP TABLE IF EXISTS
    database_dictionary,
    database_schema,
    data_type,
    schema_category,
    schema_table
CASCADE;

-- Create constraint tables
CREATE TABLE data_type (
    data_type_id smallint PRIMARY KEY,
    data_type varchar(80) UNIQUE NOT NULL
);

CREATE TABLE schema_category (
    schema_category_id smallint PRIMARY KEY,
    schema_category varchar(80) UNIQUE NOT NULL
);
CREATE TABLE schema_table (
    schema_table_id smallint PRIMARY KEY,
    schema_table varchar(80) UNIQUE NOT NULL
);

-- Create schema table
CREATE TABLE database_schema (
    field_id smallint PRIMARY KEY,
    schema_category_id smallint NOT NULL REFERENCES schema_category,
    schema_table_id smallint NOT NULL REFERENCES schema_table,
    field varchar(50) NOT NULL,
    data_type_id smallint NOT NULL REFERENCES data_type,
    field_length varchar(10),
    is_unique boolean NOT NULL,
    is_key boolean NOT NULL,
    required boolean NOT NULL,
    link_table_id smallint REFERENCES schema_table,
    field_description varchar(255)
);

-- Create dictionary table
CREATE TABLE database_dictionary (
    dictionary_id integer PRIMARY KEY,
    field_id smallint NOT NULL REFERENCES database_schema,
    attribute_id integer NOT NULL,
    attribute varchar(120) NOT NULL
);

-- Commit transaction
COMMIT TRANSACTION;