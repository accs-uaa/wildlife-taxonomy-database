-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert project metadata for aimFortymile_2017
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert project metadata" pushes the metadata for the specified project into the project table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert project data into project table
INSERT INTO project (projectID, originatorID, funderID, managerID, projectName, projectNameAbbr, completionID, yearStart, yearEnd, projectDescription) VALUES
(7, 2, 5, 81, 'Fortymile River Region Assessment, Inventory, and Monitoring', 'AIM Fortymile', 1, 2016, 2017, 'Establishment and measure of long-term monitoring plots for the BLM Assessment, Inventory, and Monitoring Program in Fortymile River Region of Eastern Interior Field Office (EIFO).');

-- Commit transaction
COMMIT TRANSACTION;
