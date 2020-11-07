-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert project metadata for accsColville_2015
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert project metadata" pushes the metadata for the specified project into the project table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert project data into project table
INSERT INTO project (projectID, originatorID, funderID, managerID, projectName, projectNameAbbr, completionID, yearStart, yearEnd, projectDescription) VALUES
(2, 2, 3, 80, 'Colville River Small Mammal Surveys', 'ACCS Colville', 1, 2015, 2015, 'Vegetation plots assessed during small mammal surveys conducted along the Colville River in 2015 by ACCS.');

-- Commit transaction
COMMIT TRANSACTION;
