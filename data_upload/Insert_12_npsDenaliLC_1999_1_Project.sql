-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert project metadata for npsDenaliLC_1999
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert project metadata" pushes the metadata for the specified project into the project table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert project data into project table
INSERT INTO project (projectID, originatorID, funderID, managerID, projectName, projectNameAbbr, completionID, yearStart, yearEnd, projectDescription) VALUES
(12, 2, 7, 40, 'Land Cover and Plant Associations of Denali National Park and Preserve', 'NPS Denali LC', 1, 1998, 1999, 'Ground plots collected for the creation of a land cover map and plant associations for Denali National Park and Preserve.');

-- Commit transaction
COMMIT TRANSACTION;
