-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Build taxonomy tables
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Adapted for wildlife data by Amanda Droghini, Alaska Center for Conservation Science
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Build taxonomy tables" creates the empty tables for the taxonomy components of the AKWILD database.
-- WARNING: THIS SCRIPT WILL ERASE ALL DATA IN EXISTING TAXONOMY TABLES.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Drop taxonomy tables if they exist
DROP TABLE IF EXISTS
    taxon_synonyms,
    taxon_accepted,
    hierarchy,
    class,
    tax_order,
    family,
    taxon_status,
    taxon_level,
    taxon_source
CASCADE;

-- Create constraint tables
CREATE TABLE class (
    class_id smallint PRIMARY KEY,
    class varchar(10) UNIQUE NOT NULL
);

CREATE TABLE tax_order (
    order_id smallint PRIMARY KEY,
    tax_order varchar(30) UNIQUE NOT NULL
);

CREATE TABLE family (
    family_id smallint PRIMARY KEY,
    family varchar(30) UNIQUE NOT NULL
);

CREATE TABLE taxon_status (
    taxon_status_id smallint PRIMARY KEY,
    taxon_status varchar(20) UNIQUE NOT NULL
);
CREATE TABLE taxon_level (
    level_id smallint PRIMARY KEY,
    level varchar(30) UNIQUE NOT NULL
);
CREATE TABLE taxon_source (
    taxon_source_id smallint PRIMARY KEY,
    taxon_source varchar(50) UNIQUE NOT NULL,
    citation varchar(500) UNIQUE NOT NULL
);

-- Create hierarchy table
CREATE TABLE hierarchy (
    hierarchy_id smallint PRIMARY KEY,
    genus_accepted varchar(50) UNIQUE NOT NULL,
    family_id smallint NOT NULL REFERENCES family,
    order_id smallint NOT NULL REFERENCES tax_order,
    class_id smallint NOT NULL REFERENCES class
);

-- Create accepted taxa table
CREATE TABLE taxon_accepted (
    accepted_id integer PRIMARY KEY,
    name_accepted varchar(120) UNIQUE NOT NULL,
    hierarchy_id smallint NOT NULL REFERENCES hierarchy,
    taxon_source_id smallint REFERENCES taxon_source,
    link_source varchar(255),
    level_id smallint NOT NULL REFERENCES taxon_level,
    native boolean,
    non_native boolean,
    endemic boolean
);

-- Create synonyms taxa table
CREATE TABLE taxon_synonyms (
    synonym_id integer PRIMARY KEY,
    name_given varchar(120) NOT NULL,
    taxon_status_id smallint NOT NULL REFERENCES taxon_status,
    accepted_id integer NOT NULL REFERENCES taxon_accepted
);

-- Commit transaction
COMMIT TRANSACTION;
