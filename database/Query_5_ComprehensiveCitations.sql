-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Comprehensive Citations
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated:  2020-10-21
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query Comprehensive Citations" queries all of the taxonomic citations except "None".
-- ---------------------------------------------------------------------------

-- Create comprehensive checklist
SELECT * FROM taxonSource
WHERE taxonSource.taxonSource != 'None'
ORDER BY citation;