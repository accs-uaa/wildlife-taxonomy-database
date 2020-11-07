-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert project metadata for aimGMT2_2019
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert project metadata" pushes the metadata for the specified project into the project table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert project data into project table
INSERT INTO project (projectID, originatorID, funderID, managerID, projectName, projectNameAbbr, completionID, yearStart, yearEnd, projectDescription) VALUES
(16, 2, 5, 29, 'GMT-2 Assessment, Inventory, and Monitoring', 'AIM GMT-2', 2, 2019, 2020, 'Establishment of vegetation monitoring plots within the Greater Mooses Tooth 2 Oil and Gas Lease Area for BLM Assessment, Inventory, and Monitoring.');

-- Commit transaction
COMMIT TRANSACTION;
