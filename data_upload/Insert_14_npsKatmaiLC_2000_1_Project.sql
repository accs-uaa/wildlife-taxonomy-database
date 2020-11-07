-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert project metadata for npsKatmaiLC_2000
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert project metadata" pushes the metadata for the specified project into the project table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert project data into project table
INSERT INTO project (projectID, originatorID, funderID, managerID, projectName, projectNameAbbr, completionID, yearStart, yearEnd, projectDescription) VALUES
(14, 2, 7, 40, 'Landcover Classes, Ecoregions, and Plant Associations of Katmai National Park and Preserve', 'NPS Katmai LC', 1, 2000, 2003, 'Ground plots collected for the creation of a land cover map and plant associations for Katmai National Park and Preserve.');

-- Commit transaction
COMMIT TRANSACTION;
