-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Database Dictionary
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated:  2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query database dictionary" queries the database dictionary.
-- ---------------------------------------------------------------------------

-- Compile database dictionary
SELECT databaseDictionary.dictionaryID as dictionaryID
     , databaseSchema.field as field
     , databaseDictionary.attributeid as attributeID
     , databaseDictionary.attribute as attribute
FROM databaseDictionary
    LEFT JOIN databaseSchema ON databaseDictionary.fieldID = databaseSchema.fieldID
ORDER BY dictionaryID;