-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert project metadata for poplarBreen_2006
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-05
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert project metadata" pushes the metadata for the specified project into the project table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert project data into project table
INSERT INTO project (projectID, originatorID, funderID, managerID, projectName, projectNameAbbr, completionID, yearStart, yearEnd, projectDescription) VALUES
(3, 13, 8, 6, 'Balsam Poplar Communities on the Arctic Slope of Alaska', 'Breen Poplar', 1, 2003, 2006, 'The vegetation associated with balsam poplar stands in the Arctic Foothills of Alaska and the interior boreal forests of Alaska and Yukon was described by Breen (2014) as part of her doctoral dissertation research.');

-- Commit transaction
COMMIT TRANSACTION;
