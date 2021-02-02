-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Build project tables
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2021-01-27
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Build project tables" creates the empty tables for the vegetation survey and monitoring projects components of the AKVEG database. WARNING: THIS SCRIPT WILL ERASE ALL DATA IN EXISTING PROJECT TABLES.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Drop project tables if they exist
DROP TABLE IF EXISTS
    project,
    project_status
CASCADE;

-- Create projects table
CREATE TABLE project (
    project_id smallint PRIMARY KEY,
    originator_id smallint NOT NULL REFERENCES organization,
    funder_id smallint NOT NULL REFERENCES organization,
    manager_id smallint NOT NULL REFERENCES personnel,
    project_name varchar(250) UNIQUE NOT NULL,
    project_abbr varchar(20) UNIQUE NOT NULL,
    completion_id smallint NOT NULL REFERENCES completion,
    year_start smallint NOT NULL,
    year_end smallint,
    project_description varchar(500) NOT NULL
);

-- Create project status table
CREATE TABLE project_status (
    project_status_id smallint PRIMARY KEY,
    project_id smallint NOT NULL REFERENCES project,
    project_modified date NOT NULL,
    site_modified date,
    cover_modified date,
    environment_modified date,
    modified_by_id smallint NOT NULL
);

-- Commit transaction
COMMIT TRANSACTION;