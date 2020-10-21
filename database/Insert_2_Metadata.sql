-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert metadata and constraints
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated:  2020-10-20
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert metadata and constraints" pushes data from the database dictionary and schema into the database server. The script "Build metadata and constraint tables" should be run prior to this script to start with empty, properly formatted tables.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert data into constraint tables
INSERT INTO completion (completionID, completion)
VALUES (1, 'finished'),
       (2, 'ongoing');

-- Insert data into database dictionary
INSERT INTO databaseDictionary (dictionaryID, fieldID, attributeID, attribute)
VALUES

-- Commit transaction
COMMIT TRANSACTION;
