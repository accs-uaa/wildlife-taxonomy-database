-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Build project tables
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-10-19
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Build project tables" creates the empty tables for the vegetation survey and monitoring projects components of the AKVEG database. WARNING: THIS SCRIPT WILL ERASE ALL DATA IN EXISTING ENVIRONMENT TABLES.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Drop project tables if they exist
DROP TABLE IF EXISTS
    project,
    projectStatus;

-- Create projects table
CREATE TABLE project (
    projectID smallint PRIMARY KEY,
    originatorID smallint NOT NULL REFERENCES organization,
    funderID smallint NOT NULL REFERENCES organization,
    managerID smallint NOT NULL REFERENCES personnel,
    projectName varchar(250) UNIQUE NOT NULL,
    projectNameAbbr varchar(20) UNIQUE NOT NULL,
    completionID smallint NOT NULL REFERENCES completion,
    yearStart smallint NOT NULL,
    yearEnd smallint
);

-- Create project status table
CREATE TABLE projectStatus (
    projectStatusID smallint PRIMARY KEY,
    projectID smallint NOT NULL REFERENCES project,
    projectModified date NOT NULL,
    siteModified date,
    coverModified date,
    environmentModified date,
    modifiedByID smallint NOT NULL
);

-- Commit transaction
COMMIT TRANSACTION;