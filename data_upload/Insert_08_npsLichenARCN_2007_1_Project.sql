-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert project metadata for npsLichenARCN_2007
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert project metadata" pushes the metadata for the specified project into the project table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert project data into project table
INSERT INTO project (projectID, originatorID, funderID, managerID, projectName, projectNameAbbr, completionID, yearStart, yearEnd, projectDescription) VALUES
(8, 7, 7, 58, 'Lichen Inventory of the National Park Service Arctic Network', 'NPS ARCN Lichen', 1, 1996, 2007, 'Lichen and bryophyte ground plots for describing lichen community structure and its relation to environment in NPS Arctic Network.');

-- Commit transaction
COMMIT TRANSACTION;
