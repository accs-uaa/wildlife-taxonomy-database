-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Vascular Plant Citations
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated:  2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query Vascular Plant Citations" queries the vascular plant citations except "None".
-- ---------------------------------------------------------------------------

-- Compile vascular plant checklist citations
SELECT DISTINCT taxonAccepted.taxonSourceID
    , taxonSource.taxonSource
    , taxonSource.citation
FROM taxonAccepted
    LEFT JOIN taxonSource ON taxonAccepted.taxonSourceID = taxonSource.taxonSourceID
    LEFT JOIN hierarchy ON taxonAccepted.hierarchyID = hierarchy.hierarchyID
    LEFT JOIN category ON hierarchy.categoryID = category.categoryID
WHERE taxonSource.taxonSource != 'None'
  AND category.category IN ('Eudicot', 'Fern', 'Gymnosperm', 'Horsetail', 'Lycophyte', 'Monocot')
ORDER BY citation;