-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Cover
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated:  2021-02-02
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query cover" queries the cover data.
-- ---------------------------------------------------------------------------

-- Compile cover data
SELECT cover.cover_id as cover_id
     , project.project_abbr as project
     , site.site_code as site_code
     , cover.veg_observe_date as veg_observe_date
     , veg_observer.personnel as veg_observer
     , veg_recorder.personnel as veg_recorder
     , cover_type.cover_type as cover_type
     , taxon_accepted.name_accepted as name_accepted
     , cover.cover as cover
FROM cover
    LEFT JOIN project ON cover.project_id = project.project_id
    LEFT JOIN site ON cover.site_id = site.site_id
    LEFT JOIN personnel veg_observer ON cover.veg_observer_id = veg_observer.personnel_id
    LEFT JOIN personnel veg_recorder ON cover.veg_recorder_id = veg_recorder.personnel_id
    LEFT JOIN cover_type ON cover.cover_type_id = cover_type.cover_type_id
    LEFT JOIN taxon_adjudicated ON cover.adjudicated_id = taxon_adjudicated.adjudicated_id
    LEFT JOIN taxon_accepted ON taxon_adjudicated.accepted_id = taxon_accepted.accepted_id
ORDER BY cover_id;