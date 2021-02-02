-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Project Status
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated:  2021-02-02
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query project status" queries the project status metadata.
-- ---------------------------------------------------------------------------

-- Compile project status
SELECT project_status.project_status_id as project_status_id
     , project.project_abbr as project
     , project_status.project_modified as project_modified
     , project_status.site_modified as site_modified
     , project_status.cover_modified as cover_modified
     , project_status.environment_modified as environment_modified
     , personnel.personnel as modified_by
FROM project_status
    LEFT JOIN project ON project_status.project_id = project.project_id
    LEFT JOIN personnel ON project_status.modified_by_id = personnel.personnel_id
ORDER BY project_status_id;