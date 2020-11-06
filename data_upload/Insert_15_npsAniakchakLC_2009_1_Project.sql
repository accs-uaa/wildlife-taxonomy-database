-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert project metadata for npsAniakchakLC_2009
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-05
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert project metadata" pushes the metadata for the specified project into the project table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert project data into project table
INSERT INTO project (projectID, originatorID, funderID, managerID, projectName, projectNameAbbr, completionID, yearStart, yearEnd, projectDescription) VALUES
(15, 2, 7, 40, 'Plant Associations, Vegetation Succession, and Earth Cover Classes of Aniakchak National Monument and Preserve', 'NPS Aniakchak LC', 1, 2009, 2012, 'Ground plots collected for the creation of a land cover map and plant associations for Aniakchak National Monument and Preserve.');

-- Commit transaction
COMMIT TRANSACTION;
