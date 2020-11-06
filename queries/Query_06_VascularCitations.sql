-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Vascular Plant Citations
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated:  2020-10-21
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query Vascular Plant Citations" queries the vascular plant citations except "None".
-- ---------------------------------------------------------------------------

-- Create comprehensive checklist
SELECT DISTINCT taxonAccepted.taxonSourceID
    , taxonSource.taxonSource
    , taxonSource.citation
FROM taxonAccepted
    JOIN taxonSource ON taxonAccepted.taxonSourceID = taxonSource.taxonSourceID
    JOIN hierarchy ON taxonAccepted.hierarchyID = hierarchy.hierarchyID
    JOIN category ON hierarchy.categoryID = category.categoryID
WHERE taxonSource.taxonSource != 'None'
  AND category.category IN ('Eudicot', 'Fern', 'Gymnosperm', 'Horsetail', 'Lycophyte', 'Monocot')
ORDER BY citation;