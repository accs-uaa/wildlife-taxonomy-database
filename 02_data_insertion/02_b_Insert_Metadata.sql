-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert metadata and constraints
-- Author: Timm Nawrocki & Amanda Droghini, Alaska Center for Conservation Science
-- Last Updated:  2021-06-05
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert metadata and constraints" pushes data from the database dictionary and schema into the database server. The script "Build metadata and constraint tables" should be run prior to this script to start with empty, properly formatted tables.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

INSERT INTO data_type (data_type_id, data_type) VALUES
(1, 'boolean'),
(2, 'date'),
(3, 'decimal'),
(4, 'integer'),
(5, 'serial'),
(6, 'smallint'),
(7, 'varchar');
INSERT INTO schema_category (schema_category_id, schema_category) VALUES
(1, 'metadata'),
(2, 'taxonomy');
INSERT INTO schema_table (schema_table_id, schema_table) VALUES
(1, 'class'),
(2, 'data_type'),
(3, 'database_dictionary'),
(4, 'database_schema'),
(5, 'family'),
(6, 'hierarchy'),
(7, 'schema_category'),
(8, 'schema_table'),
(9, 'tax_order'),
(10, 'taxon_accepted'),
(11, 'taxon_level'),
(12, 'taxon_source'),
(13, 'taxon_status'),
(14, 'taxon_synonyms');

-- Insert data into database schema
INSERT INTO database_schema (field_id, schema_category_id, schema_table_id, field, data_type_id, field_length, is_unique, is_key, required, link_table_id, field_description) VALUES
(1, 1, 3, 'dictionary_id', 4, NULL, TRUE, TRUE, TRUE, NULL, 'Unique integer key value per constrained data attribute.'),
(2, 1, 3, 'field_id', 6, NULL, FALSE, TRUE, TRUE, 4, 'Foreign key value that identifies the schema category to which a particular data attribute belongs.'),
(3, 1, 3, 'attribute_id', 4, NULL, FALSE, FALSE, TRUE, NULL, 'Key value used for a particular attribute in a particular constraint table.'),
(4, 1, 3, 'attribute', 7, '120', FALSE, FALSE, TRUE, NULL, 'Valid attribute value character string in a constraint table. These are the possible data values that can populate a particular constrained field.'),
(5, 1, 4, 'field_id', 6, NULL, TRUE, TRUE, TRUE, NULL, 'Unique integer key value per schema table-field combination.'),
(6, 1, 4, 'schema_category_id', 6, NULL, FALSE, TRUE, TRUE, 7, 'Foreign key value that identifies the schema category to which a particular field belongs.'),
(7, 1, 4, 'schema_table_id', 6, NULL, FALSE, TRUE, TRUE, 8, 'Foreign key value that identifies the schema table to which a particular field belongs.'),
(8, 1, 4, 'field', 7, '50', FALSE, FALSE, TRUE, NULL, 'Field name in database.'),
(9, 1, 4, 'data_type_id', 6, NULL, FALSE, TRUE, TRUE, 2, 'Foreign key value that identifies the data type stored in the field.'),
(10, 1, 4, 'field_length', 7, '10', FALSE, FALSE, FALSE, NULL, 'Integer value representing the maximum possible character length stored in the field.'),
(11, 1, 4, 'is_unique', 1, NULL, FALSE, FALSE, TRUE, NULL, 'Boolean value indicating whether the field requires unique entries or not.'),
(12, 1, 4, 'is_key', 1, NULL, FALSE, FALSE, TRUE, NULL, 'Boolean value indicating whether the field contains key values or not.'),
(13, 1, 4, 'required', 1, NULL, FALSE, FALSE, TRUE, NULL, 'Boolean value indicating whether the field requires values or accepts null.'),
(14, 1, 4, 'link_table_id', 6, NULL, FALSE, FALSE, FALSE, 8, 'Foreign key value that identifies the table in which a foreign key identifies a primary key value.'),
(15, 1, 4, 'field_description', 7, '255', FALSE, FALSE, TRUE, NULL, 'Description of the data stored in the field.'),
(16, 1, 2, 'data_type_id', 6, NULL, TRUE, TRUE, TRUE, NULL, 'Unique integer key value of the data type stored in the field.'),
(17, 1, 2, 'data_type', 7, '80', TRUE, TRUE, TRUE, NULL, 'Name of the data type stored in the field.'),
(18, 1, 7, 'schema_category_id', 6, NULL, TRUE, TRUE, TRUE, NULL, 'Unique integer key value per schema category.'),
(19, 1, 7, 'schema_category', 7, '80', TRUE, FALSE, TRUE, NULL, 'One word description of the purpose of the data stored in a particular field.'),
(20, 1, 8, 'schema_table_id', 6, NULL, TRUE, TRUE, TRUE, NULL, 'Unique integer key value per name of table in database.'),
(21, 1, 8, 'schema_table', 7, '80', TRUE, FALSE, TRUE, NULL, 'Name of table in database.'),
(22, 2, 1, 'class_id', 6, NULL, TRUE, TRUE, TRUE, NULL, 'Unique integer key value per taxonomic class.'),
(23, 2, 1, 'class', 7, '10', TRUE, FALSE, TRUE, NULL, 'Full name of the taxonomic class.'),
(24, 2, 9, 'order_id', 6, NULL, TRUE, TRUE, TRUE, NULL, 'Unique integer key value per taxonomic order.'),
(25, 2, 9, 'tax_order', 7, '30', TRUE, FALSE, TRUE, NULL, 'Full name of the taxonomic order.'),
(26, 2, 5, 'family_id', 6, NULL, TRUE, TRUE, TRUE, NULL, 'Unique integer key value per taxonomic family.'),
(27, 2, 5, 'family', 7, '30', TRUE, FALSE, TRUE, NULL, 'Full name of the taxonomic family.'),
(28, 2, 6, 'hierarchy_id', 6, NULL, TRUE, TRUE, TRUE, NULL, 'Unique integer key value per accepted genus.'),
(29, 2, 6, 'genus_accepted', 7, '50', TRUE, FALSE, TRUE, NULL, 'Full name of accepted genus.'),
(30, 2, 6, 'family_id', 6, NULL, FALSE, TRUE, TRUE, 5, 'Foreign key value that identifies the taxonomic family that encompasses the accepted genus.'),
(31, 2, 6, 'order_id', 6, NULL, FALSE, TRUE, TRUE, 9, 'Foreign key value that identifies the taxonomic order that encompasses the accepted genus.'),
(32, 2, 6, 'class_id', 6, NULL, FALSE, TRUE, TRUE, 1, 'Foreign key value that identifies the taxonomic class that encompasses the accepted genus.'),
(33, 2, 10, 'accepted_id', 4, NULL, TRUE, TRUE, TRUE, NULL, 'Unique integer key value per taxon, inclusive of subspecies, populations, and species.'),
(34, 2, 10, 'name_accepted', 7, '120', TRUE, FALSE, TRUE, NULL, 'Taxon name, inclusive of infraspecies, inclusive of subspecies, populations, and species.'),
(35, 2, 10, 'hierarchy_id', 6, NULL, FALSE, TRUE, FALSE, 6, 'Foreign key value that identifies the hierarchy of the taxon genus.'),
(36, 2, 10, 'taxon_source_id', 6, NULL, FALSE, TRUE, FALSE, 12, 'Foreign key value that identifies the primary name source defining the taxon concept applied in the database.'),
(37, 2, 10, 'link_source', 7, '255', TRUE, FALSE, FALSE, NULL, 'Html link to the primary name source that defines the taxon concept applied in the database.'),
(38, 2, 10, 'level_id', 6, NULL, FALSE, TRUE, FALSE, 11, 'Foreign key value that identifies the taxonomic level of the accepted taxon.'),
(39, 2, 10, 'native', 1, NULL, FALSE, FALSE, FALSE, NULL, 'Boolean value with 1 indicating that the taxon is native in Alaska, which is not exclusive to the taxon also being non-native in Alaska.'),
(40, 2, 10, 'non_native', 1, NULL, FALSE, FALSE, FALSE, NULL, 'Boolean value with 1 indicating that the taxon is non-native in Alaska, which is not exclusive to the taxon also being native in Alaska.'),
(41, 2, 10, 'endemic', 1, NULL, FALSE, FALSE, FALSE, NULL, 'Boolean value with 1 indicating that the taxon is endemic to Alaska, which is exclusive to the taxon being native in Alaska.'),
(42, 2, 14, 'synonym_id', 4, NULL, TRUE, TRUE, TRUE, NULL, 'Unique integer key value per taxon name that has been applied in Alaska (includes accepted names, synonyms, misapplied names, and orthographic variants).'),
(43, 2, 14, 'name_given', 7, '120', TRUE, FALSE, TRUE, NULL, 'Taxon name that has been applied in Alaska (includes accepted names, synonyms, misapplied names, and orthographic variants).'),
(44, 2, 14, 'taxon_status_id', 6, NULL, FALSE, TRUE, FALSE, 13, 'Foreign key value that identifies the taxonomic status of the name.'),
(45, 2, 14, 'accepted_id', 4, NULL, FALSE, TRUE, TRUE, 10, 'Foreign key value that identifies the accepted name to which the given name should refer.'),
(46, 2, 11, 'level_id', 6, NULL, TRUE, TRUE, TRUE, NULL, 'Unique integer key value per taxonomic level.'),
(47, 2, 11, 'level', 7, '30', TRUE, FALSE, TRUE, NULL, 'Taxonomic level of name.'),
(48, 2, 12, 'taxon_source_id', 6, NULL, TRUE, TRUE, TRUE, NULL, 'Unique integer key value per name source.'),
(49, 2, 12, 'taxon_source', 7, '50', TRUE, FALSE, TRUE, NULL, 'Short reference for source of taxon concept applied in database.'),
(50, 2, 12, 'citation', 7, '500', TRUE, FALSE, TRUE, NULL, 'Full citation for source of taxon concept applied in database.'),
(51, 2, 13, 'taxon_status_id', 6, NULL, TRUE, TRUE, TRUE, NULL, 'Unique integer key value per taxon status.'),
(52, 2, 13, 'taxon_status', 7, '20', TRUE, FALSE, TRUE, NULL, 'One to two word description of the taxonomic status of the name.');

-- Insert data into database dictionary
INSERT INTO database_dictionary (dictionary_id, field_id, attribute_id, attribute) VALUES
(1, 17, 1, 'boolean'),
(2, 17, 2, 'date'),
(3, 17, 3, 'decimal'),
(4, 17, 4, 'integer'),
(5, 17, 5, 'serial'),
(6, 17, 6, 'smallint'),
(7, 17, 7, 'varchar'),
(8, 19, 1, 'metadata'),
(9, 19, 2, 'taxonomy'),
(10, 21, 1, 'class'),
(11, 21, 2, 'data_type'),
(12, 21, 3, 'database_dictionary'),
(13, 21, 4, 'database_schema'),
(14, 21, 5, 'family'),
(15, 21, 6, 'hierarchy'),
(16, 21, 7, 'schema_category'),
(17, 21, 8, 'schema_table'),
(18, 21, 9, 'tax_order'),
(19, 21, 10, 'taxon_accepted'),
(20, 21, 11, 'taxon_level'),
(21, 21, 12, 'taxon_source'),
(22, 21, 13, 'taxon_status'),
(23, 21, 14, 'taxon_synonyms');

-- Commit transaction
COMMIT TRANSACTION;
