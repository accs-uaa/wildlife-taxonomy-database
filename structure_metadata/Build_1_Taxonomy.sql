-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Build taxonomy tables
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-10-19
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Build taxonomy tables" creates the empty tables for the taxonomy components of the AKVEG database. WARNING: THIS SCRIPT WILL ERASE ALL DATA IN EXISTING TAXONOMY TABLES.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Drop taxonomy tables if they exist
DROP TABLE IF EXISTS
    taxonAdjudicated,
    taxonAccepted,
    hierarchy,
    author,
    category,
    family,
    habit,
    taxonStatus,
    taxonLevel,
    taxonSource
CASCADE;

-- Create constraint tables
CREATE TABLE author (
    authorID integer PRIMARY KEY,
    author varchar(120) UNIQUE NOT NULL
);
CREATE TABLE category (
    categoryID smallint PRIMARY KEY,
    category varchar(30) UNIQUE NOT NULL
);
CREATE TABLE family (
    familyID smallint PRIMARY KEY,
    family varchar(80) UNIQUE NOT NULL
);
CREATE TABLE habit (
    habitID smallint PRIMARY KEY,
    habit varchar(80) UNIQUE NOT NULL
);
CREATE TABLE taxonStatus (
    taxonStatusID smallint PRIMARY KEY,
    taxonStatus varchar(30) UNIQUE NOT NULL
);
CREATE TABLE taxonLevel (
    levelID smallint PRIMARY KEY,
    level varchar(30) UNIQUE NOT NULL
);
CREATE TABLE taxonSource (
    taxonSourceID smallint PRIMARY KEY,
    taxonSource varchar(50) UNIQUE NOT NULL,
    citation varchar(500) UNIQUE NOT NULL
);

-- Create hierarchy table
CREATE TABLE hierarchy (
    hierarchyID smallint PRIMARY KEY,
    genusAccepted varchar(50) UNIQUE NOT NULL,
    familyID smallint NOT NULL REFERENCES family,
    categoryID smallint NOT NULL REFERENCES category
);

-- Create accepted taxa table
CREATE TABLE taxonAccepted (
    acceptedID integer PRIMARY KEY,
    nameAccepted varchar(120) UNIQUE NOT NULL,
    authAcceptedID integer NOT NULL REFERENCES author,
    hierarchyID smallint NOT NULL REFERENCES hierarchy,
    taxonSourceID smallint REFERENCES taxonSource,
    linkSource varchar(255),
    levelID smallint NOT NULL REFERENCES taxonLevel,
    habitID smallint NOT NULL REFERENCES habit,
    native boolean NOT NULL,
    non_native boolean NOT NULL
);

-- Create adjudicated taxa table
CREATE TABLE taxonAdjudicated (
    adjudicatedID integer PRIMARY KEY,
    nameAdjudicated varchar(120) NOT NULL,
    authAdjudicatedID integer NOT NULL REFERENCES author,
    statusAdjudicatedID smallint NOT NULL REFERENCES taxonStatus,
    acceptedID integer NOT NULL REFERENCES taxonAccepted
);

-- Commit transaction
COMMIT TRANSACTION;
