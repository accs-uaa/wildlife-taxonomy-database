-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Projects
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated:  2021-01-29
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query projects" queries the project metadata.
-- ---------------------------------------------------------------------------

-- Compile project data
SELECT project.project_id as project_id
     , originator.organization as originator
     , funder.organization as funder
     , personnel.personnel as manager
     , project.project_name as project_name
     , project.project_abbr as project_abbr
     , completion.completion as project_status
     , project.year_start as year_start
     , project.year_end as year_end
     , project.project_description
FROM project
    LEFT JOIN organization originator ON project.originator_id = originator.organization_id
    LEFT JOIN organization funder ON project.funder_id = funder.organization_id
    LEFT JOIN personnel ON project.manager_id = personnel.personnel_id
    LEFT JOIN completion ON project.completion_id = completion.completion_id
ORDER BY project_id;