-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Database Dictionary
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query database dictionary" queries the database dictionary.
-- ---------------------------------------------------------------------------

-- Compile database dictionary
SELECT database_dictionary.dictionary_id as dictionary_id
     , database_schema.field as field
     , database_dictionary.attribute_id as attribute_id
     , database_dictionary.attribute as attribute
FROM database_dictionary
    LEFT JOIN database_schema ON database_dictionary.field_id = database_schema.field_id
ORDER BY dictionary_id;