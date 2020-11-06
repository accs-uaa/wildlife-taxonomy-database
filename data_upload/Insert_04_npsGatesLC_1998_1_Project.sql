-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert project metadata for npsGatesLC_1998
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-05
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert project metadata" pushes the metadata for the specified project into the project table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert project data into project table
INSERT INTO project (projectID, originatorID, funderID, managerID, projectName, projectNameAbbr, completionID, yearStart, yearEnd, projectDescription) VALUES
(4, 2, 7, 40, 'Landsat Derived Map and Landcover Descriptions for Gates of the Arctic National Park and Preserve', 'NPS Gates LC', 1, 1998, 1999, 'Ground and aerial plots collected for the creation of a land cover map for Gates of the Arctic National Park and Preserve.');

-- Commit transaction
COMMIT TRANSACTION;
