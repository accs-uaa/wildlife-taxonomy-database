-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert project metadata for accsNuyakuk_2019
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert project metadata" pushes the metadata for the specified project into the project table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert project data into project table
INSERT INTO project (projectID, originatorID, funderID, managerID, projectName, projectNameAbbr, completionID, yearStart, yearEnd, projectDescription) VALUES
(17, 2, 3, 80, 'Bristol Bay Vegetation Cover', 'ACCS Bristol Bay VC', 1, 2019, 2019, 'Vegetation plots with focus towards likely moose habitat for development of species- or aggregate-level foliar cover maps.');

-- Commit transaction
COMMIT TRANSACTION;
