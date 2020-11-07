-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert project metadata for npsYukonCharleyPA_2003
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert project metadata" pushes the metadata for the specified project into the project table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert project data into project table
INSERT INTO project (projectID, originatorID, funderID, managerID, projectName, projectNameAbbr, completionID, yearStart, yearEnd, projectDescription) VALUES
(6, 2, 7, 40, 'Plant Associations and Post-fire Succession in Yukon-Charley Rivers National Preserve', 'NPS Yukon-Charley PA', 1, 2003, 2003, 'Ground plots collected to describe plant associations of Yukon-Charley Rivers National Preserve.');

-- Commit transaction
COMMIT TRANSACTION;
