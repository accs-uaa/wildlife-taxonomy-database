-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Build metadata and constraint tables
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-10-20
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Build metadata and constraint tables" creates the empty tables for the metadata components of the AKVEG database, including the schema and data dictionary. WARNING: THIS SCRIPT WILL ERASE ALL DATA IN EXISTING ENVIRONMENT TABLES.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Drop metadata tables if they exist
DROP TABLE IF EXISTS
    completion,
    coverMethod,
    coverType,
    databaseDictionary,
    databaseSchema,
    dataType,
    datum,
    disturbance,
    drainage,
    geomorphology,
    macrotopography,
    microtopography,
    moisture,
    organization,
    organizationType,
    personnel,
    perspective,
    physiography,
    plotDimensions,
    restrictiveType,
    schemaCategory,
    schemaTable,
    scope,
    soilClass,
    stratification
CASCADE;

-- Create constraint tables
CREATE TABLE completion (
    completionID smallint PRIMARY KEY,
    completion varchar(30) UNIQUE NOT NULL
);
CREATE TABLE coverMethod (
    coverMethodID smallint PRIMARY KEY,
    coverMethod varchar(50) UNIQUE NOT NULL
);
CREATE TABLE coverType (
    coverTypeID smallint PRIMARY KEY,
    coverType varchar(50) UNIQUE NOT NULL
);
CREATE TABLE dataType (
    dataTypeID smallint PRIMARY KEY,
    dataType varchar(80) UNIQUE NOT NULL
);
CREATE TABLE datum (
    datumID smallint PRIMARY KEY,
    datum varchar(50) UNIQUE NOT NULL
);
CREATE TABLE disturbance (
    disturbanceID smallint PRIMARY KEY,
    disturbanceTypeID smallint NOT NULL REFERENCES disturbanceType,
    disturbance varchar(50) UNIQUE NOT NULL
);
CREATE TABLE drainage (
    drainageID smallint PRIMARY KEY,
    drainage varchar(50) UNIQUE NOT NULL
);
CREATE TABLE geomorphology (
    geomorphologyID smallint PRIMARY KEY,
    geomorphology varchar(50) UNIQUE NOT NULL
);
CREATE TABLE macrotopography (
    macrotopographyID smallint PRIMARY KEY,
    macrotopography varchar(50) UNIQUE NOT NULL
);
CREATE TABLE microtopography (
    microtopographyID smallint PRIMARY KEY,
    microtopography varchar(50) UNIQUE NOT NULL
);
CREATE TABLE moisture (
    moistureID smallint PRIMARY KEY,
    moisture varchar(50) UNIQUE NOT NULL
);
CREATE TABLE organizationType (
    organizationTypeID smallint PRIMARY KEY,
    organizationType varchar(50) UNIQUE NOT NULL
);
CREATE TABLE personnel (
    personnelID smallint PRIMARY KEY,
    personnel varchar(50) UNIQUE NOT NULL
);
CREATE TABLE perspective (
    perspectiveID smallint PRIMARY KEY,
    perspective varchar(50) UNIQUE NOT NULL
);
CREATE TABLE physiography (
    physiographyID smallint PRIMARY KEY,
    physiography varchar(50) UNIQUE NOT NULL
);
CREATE TABLE plotDimensions (
    plotDimensionsID smallint PRIMARY KEY,
    plotDimensions varchar(50) UNIQUE NOT NULL
);
CREATE TABLE restrictiveType (
    restrictiveTypeID smallint PRIMARY KEY,
    restrictiveType varchar(50) UNIQUE NOT NULL
);
CREATE TABLE schemaCategory (
    schemaCategoryID smallint PRIMARY KEY,
    schemaCategory varchar(80) UNIQUE NOT NULL
);
CREATE TABLE schemaTable (
    schemaTableID smallint PRIMARY KEY,
    schemaTable varchar(80) UNIQUE NOT NULL
);
CREATE TABLE scope (
    scopeID smallint PRIMARY KEY,
    scope varchar(30) UNIQUE NOT NULL
);
CREATE TABLE soilClass (
    soilClassID smallint PRIMARY KEY,
    soilClass varchar(50) UNIQUE NOT NULL
);
CREATE TABLE stratification (
    strataID smallint PRIMARY KEY,
    strata varchar(50) UNIQUE NOT NULL
);

-- Create organization table
CREATE TABLE organization (
    organizationID smallint PRIMARY KEY,
    organization varchar(250) UNIQUE NOT NULL,
    organizationAbbr varchar(20) UNIQUE NOT NULL,
    organizationTypeID smallint NOT NULL REFERENCES organizationType
);

-- Create schema table
CREATE TABLE databaseSchema (
    fieldID smallint PRIMARY KEY,
    schemaCategoryID smallint NOT NULL REFERENCES schemaCategory,
    schemaTableID smallint NOT NULL REFERENCES schemaTable,
    field varchar(50) NOT NULL,
    dataTypeID smallint NOT NULL REFERENCES dataType,
    fieldLength varchar(10),
    isUnique boolean NOT NULL,
    isKey boolean NOT NULL,
    required boolean NOT NULL,
    linkTable smallint REFERENCES schemaTable,
    fieldDescription varchar(255)
);

-- Create dictionary table
CREATE TABLE databaseDictionary (
    dictionaryID integer PRIMARY KEY,
    fieldID smallint NOT NULL REFERENCES databaseSchema,
    attributeID integer NOT NULL,
    attribute varchar(120) NOT NULL
);

-- Commit transaction
COMMIT TRANSACTION;