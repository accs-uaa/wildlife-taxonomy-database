-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Sites
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated:  2021-01-29
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query sites" queries the site data.
-- ---------------------------------------------------------------------------

-- Compile site data
SELECT site.site_id as site_id
     , site.site_code as site_code
     , project.project_abbr as initial_project
     , perspective.perspective as perspective
     , cover_method.cover_method as cover_method
     , scope_vascular.scope as scope_vascular
     , scope_bryophyte.scope as scope_bryophyte
     , scope_lichen.scope as scope_lichen
     , plot_dimensions.plot_dimensions as plot_dimensions
     , datum.datum as datum
     , site.latitude as latitude
     , site.longitude as longitude
     , site.error as error
FROM site
    LEFT JOIN project ON site.project_id = project.project_id
    LEFT JOIN perspective ON site.perspective_id = perspective.perspective_id
    LEFT JOIN cover_method ON site.cover_method_id = cover_method.cover_method_id
    LEFT JOIN scope scope_vascular ON site.scope_vascular_id = scope_vascular.scope_id
    LEFT JOIN scope scope_bryophyte ON site.scope_bryophyte_id = scope_bryophyte.scope_id
    LEFT JOIN scope scope_lichen ON site.scope_lichen_id = scope_lichen.scope_id
    LEFT JOIN plot_dimensions ON site.plot_dimensions_id = plot_dimensions.plot_dimensions_id
    LEFT JOIN datum ON site.datum_id = datum.datum_id
ORDER BY site_id;