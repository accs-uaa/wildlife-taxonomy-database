-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Sites
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated:  2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query sites" queries the site data.
-- ---------------------------------------------------------------------------

-- Compile site data
SELECT site.siteID as siteID
     , site.siteCode as siteCode
     , project.projectNameAbbr as initialProject
     , perspective.perspective as perspective
     , coverMethod.coverMethod as coverMethod
     , scopeVascular.scope as scopeVascular
     , scopeBryophyte.scope as scopeBryophyte
     , scopeLichen.scope as scopeLichen
     , plotDimensions.plotDimensions as plotDimensions
     , datum.datum as datum
     , site.latitude as latitude
     , site.longitude as longitude
     , site.error as error
FROM site
    LEFT JOIN project ON site.projectID = project.projectID
    LEFT JOIN perspective ON site.perspectiveID = perspective.perspectiveID
    LEFT JOIN coverMethod ON site.coverMethodID = coverMethod.coverMethodID
    LEFT JOIN scope scopeVascular ON site.scopeVascularID = scopeVascular.scopeID
    LEFT JOIN scope scopeBryophyte ON site.scopeVascularID = scopeBryophyte.scopeID
    LEFT JOIN scope scopeLichen ON site.scopeVascularID = scopeLichen.scopeID
    LEFT JOIN plotDimensions ON site.plotDimensionsID = plotDimensions.plotDimensionsID
    LEFT JOIN datum ON site.datumID = datum.datumID
ORDER BY siteID;