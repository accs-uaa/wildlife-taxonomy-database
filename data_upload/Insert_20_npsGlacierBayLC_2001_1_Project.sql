-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert project metadata for npsGlacierBayLC_2001
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-05
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert project metadata" pushes the metadata for the specified project into the project table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert project data into project table
INSERT INTO project (projectID, originatorID, funderID, managerID, projectName, projectNameAbbr, completionID, yearStart, yearEnd, projectDescription) VALUES
(20, 2, 7, 40, 'Landcover Classes and Plant Associations for Glacier Bay National Park and Preserve', 'NPS Glacier Bay LC', 1, 2001, 2008, 'Ground plots collected for the creation of a land cover map and plant associations for Kenai Fjords National Park.');

-- Commit transaction
COMMIT TRANSACTION;
