-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Comprehensive Citations
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated:  2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query Comprehensive Citations" queries all of the taxonomic citations except "None".
-- ---------------------------------------------------------------------------

-- Compile comprehensive checklist citations
SELECT * FROM taxonSource
WHERE taxonSource.taxonSource != 'None'
ORDER BY citation;