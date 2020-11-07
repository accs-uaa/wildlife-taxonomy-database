-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert project metadata for accsRibdon_2019
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert project metadata" pushes the metadata for the specified project into the project table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert project data into project table
INSERT INTO project (projectID, originatorID, funderID, managerID, projectName, projectNameAbbr, completionID, yearStart, yearEnd, projectDescription) VALUES
(18, 2, 2, 80, 'Vegetation Mapping of North American Beringia', 'ACCS Beringia VC', 2, 2019, NULL, 'Vegetation plots collected for development of species- or aggregate-level foliar cover maps and other quantitative vegetation maps of North American Beringia.');

-- Commit transaction
COMMIT TRANSACTION;
