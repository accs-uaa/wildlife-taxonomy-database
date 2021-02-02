-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Build metadata and constraint tables
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2021-01-27
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Build metadata and constraint tables" creates the empty tables for the metadata components of the AKVEG database, including the schema and data dictionary. WARNING: THIS SCRIPT WILL ERASE ALL DATA IN EXISTING METADATA TABLES.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Drop metadata tables if they exist
DROP TABLE IF EXISTS
    completion,
    cover_method,
    cover_type,
    database_dictionary,
    database_schema,
    data_type,
    datum,
    disturbance,
    drainage,
    geomorphology,
    macrotopography,
    microtopography,
    moisture,
    organization,
    organization_type,
    personnel,
    perspective,
    physiography,
    plot_dimensions,
    restrictive_type,
    schema_category,
    schema_table,
    scope,
    soil_class,
    stratification
CASCADE;

-- Create constraint tables
CREATE TABLE completion (
    completion_id smallint PRIMARY KEY,
    completion varchar(30) UNIQUE NOT NULL
);
CREATE TABLE cover_method (
    cover_method_id smallint PRIMARY KEY,
    cover_method varchar(50) UNIQUE NOT NULL
);
CREATE TABLE cover_type (
    cover_type_id smallint PRIMARY KEY,
    cover_type varchar(50) UNIQUE NOT NULL
);
CREATE TABLE data_type (
    data_type_id smallint PRIMARY KEY,
    data_type varchar(80) UNIQUE NOT NULL
);
CREATE TABLE datum (
    datum_id smallint PRIMARY KEY,
    datum varchar(50) UNIQUE NOT NULL
);
CREATE TABLE disturbance (
    disturbance_id smallint PRIMARY KEY,
    disturbance varchar(50) UNIQUE NOT NULL
);
CREATE TABLE drainage (
    drainage_id smallint PRIMARY KEY,
    drainage varchar(50) UNIQUE NOT NULL
);
CREATE TABLE geomorphology (
    geomorphology_id smallint PRIMARY KEY,
    geomorphology varchar(50) UNIQUE NOT NULL
);
CREATE TABLE macrotopography (
    macrotopography_id smallint PRIMARY KEY,
    macrotopography varchar(50) UNIQUE NOT NULL
);
CREATE TABLE microtopography (
    microtopography_id smallint PRIMARY KEY,
    microtopography varchar(50) UNIQUE NOT NULL
);
CREATE TABLE moisture (
    moisture_id smallint PRIMARY KEY,
    moisture varchar(50) UNIQUE NOT NULL
);
CREATE TABLE organization_type (
    organization_type_id smallint PRIMARY KEY,
    organization_type varchar(50) UNIQUE NOT NULL
);
CREATE TABLE personnel (
    personnel_id smallint PRIMARY KEY,
    personnel varchar(50) UNIQUE NOT NULL
);
CREATE TABLE perspective (
    perspective_id smallint PRIMARY KEY,
    perspective varchar(50) UNIQUE NOT NULL
);
CREATE TABLE physiography (
    physiography_id smallint PRIMARY KEY,
    physiography varchar(50) UNIQUE NOT NULL
);
CREATE TABLE plot_dimensions (
    plot_dimensions_id smallint PRIMARY KEY,
    plot_dimensions varchar(50) UNIQUE NOT NULL
);
CREATE TABLE restrictive_type (
    restrictive_type_id smallint PRIMARY KEY,
    restrictive_type varchar(50) UNIQUE NOT NULL
);
CREATE TABLE schema_category (
    schema_category_id smallint PRIMARY KEY,
    schema_category varchar(80) UNIQUE NOT NULL
);
CREATE TABLE schema_table (
    schema_table_id smallint PRIMARY KEY,
    schema_table varchar(80) UNIQUE NOT NULL
);
CREATE TABLE scope (
    scope_id smallint PRIMARY KEY,
    scope varchar(30) UNIQUE NOT NULL
);
CREATE TABLE soil_class (
    soil_class_id smallint PRIMARY KEY,
    soil_class varchar(50) UNIQUE NOT NULL
);
CREATE TABLE stratification (
    strata_id smallint PRIMARY KEY,
    strata varchar(50) UNIQUE NOT NULL
);

-- Create organization table
CREATE TABLE organization (
    organization_id smallint PRIMARY KEY,
    organization varchar(250) UNIQUE NOT NULL,
    organization_abbr varchar(20) UNIQUE NOT NULL,
    organization_type_id smallint NOT NULL REFERENCES organization_type
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