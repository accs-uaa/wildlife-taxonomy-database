-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Build site tables
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2021-01-27
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
    site_id integer PRIMARY KEY,
    site_code varchar(50) UNIQUE NOT NULL,
    project_id smallint NOT NULL REFERENCES project,
    perspective_id smallint NOT NULL REFERENCES perspective,
    cover_method_id smallint NOT NULL REFERENCES cover_method,
    scope_vascular_id smallint NOT NULL REFERENCES scope,
    scope_bryophyte_id smallint NOT NULL REFERENCES scope,
    scope_lichen_id smallint NOT NULL REFERENCES scope,
    plot_dimensions_id smallint NOT NULL REFERENCES plot_dimensions,
    datum_id smallint NOT NULL REFERENCES datum,
    latitude decimal(12,9) NOT NULL,
    longitude decimal(12,9) NOT NULL,
    error decimal(6,2) NOT NULL DEFAULT -999
);

-- Commit transaction
COMMIT TRANSACTION;