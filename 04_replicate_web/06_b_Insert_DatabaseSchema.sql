-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Create database schema table
-- Author: Timm Nawrocki and Amanda Droghini, Alaska Center for Conservation Science
-- Last Updated:  2021-06-09
-- Usage: Script should be executed in a MySQL 5.6+ database.
-- Description: "Create database schema table" pushes metadata for the database schema into the web database server.
-- ---------------------------------------------------------------------------

-- Drop schema table and create new version
DROP TABLE IF EXISTS
`database_schema`;
CREATE TABLE `database_schema` (
`field_id` int(4) NOT NULL,
`schema_category` varchar(80) NOT NULL,
`schema_table` varchar(80) NOT NULL,
`field` varchar(50) NOT NULL,
`data_type` varchar(80) NOT NULL,
`field_length` varchar(10),
`is_unique` varchar(5) NOT NULL,
`is_key` varchar(5) NOT NULL,
`required` varchar(5) NOT NULL,
`link_table` varchar(80),
`field_description` varchar(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Insert database schema table
INSERT INTO `database_schema` (`field_id`, `schema_category`, `schema_table`, `field`, `data_type`, `field_length`, `is_unique`, `is_key`, `required`, `link_table`, `field_description`) VALUES
(1, 'metadata', 'database_dictionary', 'dictionary_id', 'integer', 'NA', 'true', 'true', 'true', '', 'Unique integer key value per constrained data attribute.'),
(2, 'metadata', 'database_dictionary', 'field_id', 'smallint', 'NA', 'false', 'true', 'true', 'database_schema', 'Foreign key value that identifies the schema category to which a particular data attribute belongs.'),
(3, 'metadata', 'database_dictionary', 'attribute_id', 'integer', 'NA', 'false', 'false', 'true', '', 'Key value used for a particular attribute in a particular constraint table.'),
(4, 'metadata', 'database_dictionary', 'attribute', 'varchar', '120', 'false', 'false', 'true', '', 'Valid attribute value character string in a constraint table. These are the possible data values that can populate a particular constrained field.'),
(5, 'metadata', 'database_schema', 'field_id', 'smallint', 'NA', 'true', 'true', 'true', '', 'Unique integer key value per schema table-field combination.'),
(6, 'metadata', 'database_schema', 'schema_category_id', 'smallint', 'NA', 'false', 'true', 'true', 'schema_category', 'Foreign key value that identifies the schema category to which a particular field belongs.'),
(7, 'metadata', 'database_schema', 'schema_table_id', 'smallint', 'NA', 'false', 'true', 'true', 'schema_table', 'Foreign key value that identifies the schema table to which a particular field belongs.'),
(8, 'metadata', 'database_schema', 'field', 'varchar', '50', 'false', 'false', 'true', '', 'Field name in database.'),
(9, 'metadata', 'database_schema', 'data_type_id', 'smallint', 'NA', 'false', 'true', 'true', 'data_type', 'Foreign key value that identifies the data type stored in the field.'),
(10, 'metadata', 'database_schema', 'field_length', 'varchar', '10', 'false', 'false', 'false', '', 'Integer value representing the maximum possible character length stored in the field.'),
(11, 'metadata', 'database_schema', 'is_unique', 'boolean', 'NA', 'false', 'false', 'true', '', 'Boolean value indicating whether the field requires unique entries or not.'),
(12, 'metadata', 'database_schema', 'is_key', 'boolean', 'NA', 'false', 'false', 'true', '', 'Boolean value indicating whether the field contains key values or not.'),
(13, 'metadata', 'database_schema', 'required', 'boolean', 'NA', 'false', 'false', 'true', '', 'Boolean value indicating whether the field requires values or accepts null.'),
(14, 'metadata', 'database_schema', 'link_table_id', 'smallint', 'NA', 'false', 'false', 'false', 'schema_table', 'Foreign key value that identifies the table in which a foreign key identifies a primary key value.'),
(15, 'metadata', 'database_schema', 'field_description', 'varchar', '255', 'false', 'false', 'true', '', 'Description of the data stored in the field.'),
(16, 'metadata', 'data_type', 'data_type_id', 'smallint', 'NA', 'true', 'true', 'true', '', 'Unique integer key value of the data type stored in the field.'),
(17, 'metadata', 'data_type', 'data_type', 'varchar', '80', 'true', 'true', 'true', '', 'Name of the data type stored in the field.'),
(18, 'metadata', 'schema_category', 'schema_category_id', 'smallint', 'NA', 'true', 'true', 'true', '', 'Unique integer key value per schema category.'),
(19, 'metadata', 'schema_category', 'schema_category', 'varchar', '80', 'true', 'false', 'true', '', 'One word description of the purpose of the data stored in a particular field.'),
(20, 'metadata', 'schema_table', 'schema_table_id', 'smallint', 'NA', 'true', 'true', 'true', '', 'Unique integer key value per name of table in database.'),
(21, 'metadata', 'schema_table', 'schema_table', 'varchar', '80', 'true', 'false', 'true', '', 'Name of table in database.'),
(22, 'taxonomy', 'class', 'class_id', 'smallint', 'NA', 'true', 'true', 'true', '', 'Unique integer key value per taxonomic class.'),
(23, 'taxonomy', 'class', 'class', 'varchar', '10', 'true', 'false', 'true', '', 'Full name of the taxonomic class.'),
(24, 'taxonomy', 'tax_order', 'order_id', 'smallint', 'NA', 'true', 'true', 'true', '', 'Unique integer key value per taxonomic order.'),
(25, 'taxonomy', 'tax_order', 'tax_order', 'varchar', '30', 'true', 'false', 'true', '', 'Full name of the taxonomic order.'),
(26, 'taxonomy', 'family', 'family_id', 'smallint', 'NA', 'true', 'true', 'true', '', 'Unique integer key value per taxonomic family.'),
(27, 'taxonomy', 'family', 'family', 'varchar', '30', 'true', 'false', 'true', '', 'Full name of the taxonomic family.'),
(28, 'taxonomy', 'hierarchy', 'hierarchy_id', 'smallint', 'NA', 'true', 'true', 'true', '', 'Unique integer key value per accepted genus.'),
(29, 'taxonomy', 'hierarchy', 'genus_accepted', 'varchar', '50', 'true', 'false', 'true', '', 'Full name of accepted genus.'),
(30, 'taxonomy', 'hierarchy', 'family_id', 'smallint', 'NA', 'false', 'true', 'true', 'family', 'Foreign key value that identifies the taxonomic family that encompasses the accepted genus.'),
(31, 'taxonomy', 'hierarchy', 'order_id', 'smallint', 'NA', 'false', 'true', 'true', 'tax_order', 'Foreign key value that identifies the taxonomic order that encompasses the accepted genus.'),
(32, 'taxonomy', 'hierarchy', 'class_id', 'smallint', 'NA', 'false', 'true', 'true', 'class', 'Foreign key value that identifies the taxonomic class that encompasses the accepted genus.'),
(33, 'taxonomy', 'taxon_accepted', 'accepted_id', 'integer', 'NA', 'true', 'true', 'true', '', 'Unique integer key value per taxon, inclusive of subspecies, populations, and species.'),
(34, 'taxonomy', 'taxon_accepted', 'name_accepted', 'varchar', '120', 'true', 'false', 'true', '', 'Taxon name, inclusive of infraspecies, inclusive of subspecies, populations, and species.'),
(35, 'taxonomy', 'taxon_accepted', 'hierarchy_id', 'smallint', 'NA', 'false', 'true', 'false', 'hierarchy', 'Foreign key value that identifies the hierarchy of the taxon genus.'),
(36, 'taxonomy', 'taxon_accepted', 'taxon_source_id', 'smallint', 'NA', 'false', 'true', 'false', 'taxon_source', 'Foreign key value that identifies the primary name source defining the taxon concept applied in the database.'),
(37, 'taxonomy', 'taxon_accepted', 'link_source', 'varchar', '255', 'true', 'false', 'false', '', 'Html link to the primary name source that defines the taxon concept applied in the database.'),
(38, 'taxonomy', 'taxon_accepted', 'level_id', 'smallint', 'NA', 'false', 'true', 'false', 'taxon_level', 'Foreign key value that identifies the taxonomic level of the accepted taxon.'),
(39, 'taxonomy', 'taxon_accepted', 'native', 'boolean', 'NA', 'false', 'false', 'false', '', 'Boolean value with 1 indicating that the taxon is native in Alaska, which is not exclusive to the taxon also being non-native in Alaska.'),
(40, 'taxonomy', 'taxon_accepted', 'non_native', 'boolean', 'NA', 'false', 'false', 'false', '', 'Boolean value with 1 indicating that the taxon is non-native in Alaska, which is not exclusive to the taxon also being native in Alaska.'),
(41, 'taxonomy', 'taxon_accepted', 'endemic', 'boolean', 'NA', 'false', 'false', 'false', '', 'Boolean value with 1 indicating that the taxon is endemic to Alaska, which is exclusive to the taxon being native in Alaska.'),
(42, 'taxonomy', 'taxon_synonyms', 'synonym_id', 'integer', 'NA', 'true', 'true', 'true', '', 'Unique integer key value per taxon name that has been applied in Alaska (includes accepted names, synonyms, misapplied names, and orthographic variants).'),
(43, 'taxonomy', 'taxon_synonyms', 'name_given', 'varchar', '120', 'true', 'false', 'true', '', 'Taxon name that has been applied in Alaska (includes accepted names, synonyms, misapplied names, and orthographic variants).'),
(44, 'taxonomy', 'taxon_synonyms', 'taxon_status_id', 'smallint', 'NA', 'false', 'true', 'false', 'taxon_status', 'Foreign key value that identifies the taxonomic status of the name.'),
(45, 'taxonomy', 'taxon_synonyms', 'accepted_id', 'integer', 'NA', 'false', 'true', 'true', 'taxon_accepted', 'Foreign key value that identifies the accepted name to which the given name should refer.'),
(46, 'taxonomy', 'taxon_level', 'level_id', 'smallint', 'NA', 'true', 'true', 'true', '', 'Unique integer key value per taxonomic level.'),
(47, 'taxonomy', 'taxon_level', 'level', 'varchar', '30', 'true', 'false', 'true', '', 'Taxonomic level of name.'),
(48, 'taxonomy', 'taxon_source', 'taxon_source_id', 'smallint', 'NA', 'true', 'true', 'true', '', 'Unique integer key value per name source.'),
(49, 'taxonomy', 'taxon_source', 'taxon_source', 'varchar', '50', 'true', 'false', 'true', '', 'Short reference for source of taxon concept applied in database.'),
(50, 'taxonomy', 'taxon_source', 'citation', 'varchar', '500', 'true', 'false', 'true', '', 'Full citation for source of taxon concept applied in database.'),
(51, 'taxonomy', 'taxon_status', 'taxon_status_id', 'smallint', 'NA', 'true', 'true', 'true', '', 'Unique integer key value per taxon status.'),
(52, 'taxonomy', 'taxon_status', 'taxon_status', 'varchar', '20', 'true', 'false', 'true', '', 'One to two word description of the taxonomic status of the name.');

-- Commit transaction
COMMIT;
