-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Database Schema
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated:  2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query database schema" queries the database schema.
-- ---------------------------------------------------------------------------

-- Compile database schema
SELECT databaseSchema.fieldID as fieldID
     , schemaCategory.schemaCategory as schemaCategory
     , nativeTable.schemaTable as schemaTable
     , databaseSchema.field as field
     , dataType.dataType as dataType
     , databaseSchema.fieldLength as fieldLength
     , databaseSchema.isUnique as isUnique
     , databaseSchema.isKey as isKey
     , databaseSchema.required as required
     , linkTable.schemaTable as linkTable
     , databaseSchema.fieldDescription as fieldDescription
FROM databaseSchema
    LEFT JOIN schemaCategory ON databaseSchema.schemaCategoryID = schemaCategory.schemaCategoryID
    LEFT JOIN schemaTable nativeTable ON databaseSchema.schemaTableID = nativeTable.schemaTableID
    LEFT JOIN dataType ON databaseSchema.dataTypeID = dataType.dataTypeID
    LEFT JOIN schemaTable linkTable ON databaseSchema.linkTableID = linkTable.schemaTableID
ORDER BY fieldID;