-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Database Schema
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated:  2020-11-05
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query database schema" queries the database schema.
-- ---------------------------------------------------------------------------

-- Create comprehensive checklist
SELECT databaseSchema.fieldID as fieldID
     , schemaCategory.schemaCategory as category
     , nativeTable.schemaTable as table
     , databaseSchema.field as field
     , databaseSchema.fieldLength as fieldLength
     , databaseSchema.isUnique as isUnique
     , databaseSchema.isKey as isKey
     , databaseSchema.required as required
     , linkTable.schemaTable as linkTable
     , databaseSchema.fieldDescription as fieldDescription
FROM databaseSchema
    LEFT JOIN schemaCategory ON databaseSchema.schemaCategoryID = schemaCategory.schemaCategoryID
    LEFT JOIN schemaTable nativeTable ON databaseSchema.schemaTableID = nativeTable.schemaTableID
    LEFT JOIN schemaTable linkTable ON databaseSchema.linkTableID = linkTable.schemaTableID
ORDER BY fieldID ASC;