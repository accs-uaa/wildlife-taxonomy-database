-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Project Status
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated:  2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query project status" queries the project status metadata.
-- ---------------------------------------------------------------------------

-- Compile project status
SELECT projectStatus.projectStatusID as projectStatusID
     , project.projectNameAbbr as project
     , projectStatus.projectModified as projectModified
     , projectStatus.siteModified as siteModified
     , projectStatus.coverModified as coverModified
     , projectStatus.environmentModified as environmentModified
     , personnel.personnel as modifiedBy
FROM projectStatus
    LEFT JOIN project ON projectStatus.projectID = project.projectID
    LEFT JOIN personnel ON projectStatus.modifiedByID = personnel.personnelID
ORDER BY projectStatusID;