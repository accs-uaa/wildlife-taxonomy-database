-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Create database dictionary table
-- Author: Timm Nawrocki and Amanda Droghini, Alaska Center for Conservation Science
-- Last Updated:  2021-06-09
-- Usage: Script should be executed in a MySQL 5.6+ database.
-- Description: "Create database dictionary table" pushes metadata for the database dictionary into the web database server.
-- ---------------------------------------------------------------------------

-- Drop dictionary table and create new version
DROP TABLE IF EXISTS
`database_dictionary`;
CREATE TABLE `database_dictionary` (
`dictionary_id` int(6) NOT NULL,
`field` varchar(50) NOT NULL,
`attribute_id` int(6) NOT NULL,
`attribute` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Insert database dictionary table
INSERT INTO `database_dictionary` (`dictionary_id`, `field`, `attribute_id`, `attribute`) VALUES
(1, 'data_type', 1, 'boolean'),
(2, 'data_type', 2, 'date'),
(3, 'data_type', 3, 'decimal'),
(4, 'data_type', 4, 'integer'),
(5, 'data_type', 5, 'serial'),
(6, 'data_type', 6, 'smallint'),
(7, 'data_type', 7, 'varchar'),
(8, 'schema_category', 1, 'metadata'),
(9, 'schema_category', 2, 'taxonomy'),
(10, 'schema_table', 1, 'class'),
(11, 'schema_table', 2, 'data_type'),
(12, 'schema_table', 3, 'database_dictionary'),
(13, 'schema_table', 4, 'database_schema'),
(14, 'schema_table', 5, 'family'),
(15, 'schema_table', 6, 'hierarchy'),
(16, 'schema_table', 7, 'schema_category'),
(17, 'schema_table', 8, 'schema_table'),
(18, 'schema_table', 9, 'tax_order'),
(19, 'schema_table', 10, 'taxon_accepted'),
(20, 'schema_table', 11, 'taxon_level'),
(21, 'schema_table', 12, 'taxon_source'),
(22, 'schema_table', 13, 'taxon_status'),
(23, 'schema_table', 14, 'taxon_synonyms');

-- Commit transaction
COMMIT;
