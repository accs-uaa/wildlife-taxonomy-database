-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert project metadata for usfwsSelawikLC_2005
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-05
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert project metadata" pushes the metadata for the specified project into the project table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert project data into project table
INSERT INTO project (projectID, originatorID, funderID, managerID, projectName, projectNameAbbr, completionID, yearStart, yearEnd, projectDescription) VALUES
(10, 10, 10, 76, 'Selawik National Wildlife Refuge Land Cover', 'USFWS Selawik LC', 1, 1996, 1998, 'Ground plot data collected by USFWS in Selawik National Wildlife Refuge for development of a land cover map.');

-- Commit transaction
COMMIT TRANSACTION;
