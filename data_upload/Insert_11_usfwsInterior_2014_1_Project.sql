-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert project metadata for usfwsInterior_2014
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-05
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert project metadata" pushes the metadata for the specified project into the project table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert project data into project table
INSERT INTO project (projectID, originatorID, funderID, managerID, projectName, projectNameAbbr, completionID, yearStart, yearEnd, projectDescription) VALUES
(11, 10, 10, 61, 'Vegetation Monitoring in Interior Refuges', 'USFWS Interior', 1, 2013, 2014, 'Vegetation plot data collected in Interior Alaska Refuges as part of the Alaska Regional Refuge Inventory and Monitoring Strategic Plan.');

-- Commit transaction
COMMIT TRANSACTION;
