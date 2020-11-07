-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert project metadata for npsSitkaLC_2012
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert project metadata" pushes the metadata for the specified project into the project table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert project data into project table
INSERT INTO project (projectID, originatorID, funderID, managerID, projectName, projectNameAbbr, completionID, yearStart, yearEnd, projectDescription) VALUES
(22, 2, 7, 46, 'Landcover Classes of Sitka National Historic Park', 'NPS Sitka LC', 1, 2011, 2013, 'Ground plots collected for the creation of a land cover map for Sitka National Historic Park.');

-- Commit transaction
COMMIT TRANSACTION;
