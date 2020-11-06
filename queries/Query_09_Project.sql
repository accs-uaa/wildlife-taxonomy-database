-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Projects
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated:  2020-11-05
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query projects" queries the project metadata.
-- ---------------------------------------------------------------------------

-- Compile project data
SELECT project.projectID as projectID
     , originator.organization as organization
     , funder.organization as organization
     , personnel.personnel as manager
     , project.projectName as projectName
     , project.projectNameAbbr as abbreviation
     , completion.completion as projectStatus
     , project.yearStart as yearStart
     , project.yearEnd as yearEnd
     , project.projectDescription
FROM project
    LEFT JOIN organization originator ON project.originatorID = originator.organizationID
    LEFT JOIN organization funder ON project.funderID = funder.organizationID
    LEFT JOIN personnel ON project.managerID = personnel.personnelID
    LEFT JOIN completion ON project.completionID = completion.completionID
ORDER BY projectID ASC;