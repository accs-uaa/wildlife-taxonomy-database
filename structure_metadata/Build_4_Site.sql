-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Build site tables
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-10-19
-- Usage: Script should be executed in a PostgreSQL database.
-- Description: "Build site tables" creates the empty tables for the site components of the AKVEG database. WARNING: THIS SCRIPT WILL ERASE ALL DATA IN EXISTING SITE TABLE.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Drop site tables if they exist
DROP TABLE IF EXISTS
    site
CASCADE;

-- Create site table
CREATE TABLE site (
    siteID integer PRIMARY KEY,
    siteCode varchar(50) UNIQUE NOT NULL,
    projectID smallint NOT NULL REFERENCES project,
    perspectiveID smallint NOT NULL REFERENCES perspective,
    coverMethodID smallint NOT NULL REFERENCES coverMethod,
    scopeVascularID smallint NOT NULL REFERENCES scope,
    scopeBryophyteID smallint NOT NULL REFERENCES scope,
    scopeLichenID smallint NOT NULL REFERENCES scope,
    plotDimensionsID smallint NOT NULL REFERENCES plotDimensions,
    datumID smallint NOT NULL REFERENCES datum,
    latitude decimal(12,9) NOT NULL,
    longitude decimal(12,9) NOT NULL,
    error decimal(6,2) NOT NULL DEFAULT -999
);

-- Commit transaction
COMMIT TRANSACTION;