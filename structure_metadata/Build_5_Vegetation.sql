-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Build vegetation tables
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-10-19
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Build vegetation tables" creates the empty tables for the vegetation components of the AKVEG database. WARNING: THIS SCRIPT WILL ERASE ALL DATA IN EXISTING ENVIRONMENT TABLES.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Drop project tables if they exist
DROP TABLE IF EXISTS
    cover;

-- Create total cover table
CREATE TABLE cover (
    coverID serial PRIMARY KEY,
    projectID smallint NOT NULL REFERENCES project,
    siteID integer NOT NULL REFERENCES site,
    vegObserveDate date NOT NULL,
    vegObserverID smallint NOT NULL REFERENCES personnel,
    vegRecorderID smallint REFERENCES personnel,
    coverTypeID smallint NOT NULL REFERENCES coverType,
    nameOriginal varchar(120) NOT NULL,
    adjudicatedID integer NOT NULL REFERENCES taxonadjudicated,
    cover decimal(6,3) NOT NULL
);

-- Commit transaction
COMMIT TRANSACTION;