-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert project metadata for usfwsSelawikTalbot_2005
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert project metadata" pushes the metadata for the specified project into the project table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert project data into project table
INSERT INTO project (projectID, originatorID, funderID, managerID, projectName, projectNameAbbr, completionID, yearStart, yearEnd, projectDescription) VALUES
(9, 10, 10, 76, 'Plant Associations of the Selawik National Wildlife Refuge', 'USFWS SELA PA', 1, 2005, 2005, 'Vegetation plots collected to classify plant associations of the Selawik National Wildlife Refuge by Stephen Talbot.');

-- Commit transaction
COMMIT TRANSACTION;
