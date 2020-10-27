-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert project metadata for aimNPRA_2017
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-10-27
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert project metadata" pushes the metadata for the specified project into the project table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert project data into project table
INSERT INTO project (projectID, originatorID, funderID, managerID, projectName, projectNameAbbr, completionID, yearStart, yearEnd, projectDescription) VALUES
(1, 2, 5, 66, 'Assessment, Inventory, and Monitoring Pilot for National Petroleum Reserve - Alaska', 'AIM NPR-A', 1, 2012, 2017, 'Establishment and measure of long-term monitoring plots for the BLM Assessment, Inventory, and Monitoring Program in National Petroleum Reserve - Alaska.');

-- Commit transaction
COMMIT TRANSACTION;
