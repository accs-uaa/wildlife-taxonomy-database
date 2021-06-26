-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Amphibians & Reptiles Checklist
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Adapted for wildlife data by Amanda Droghini, Alaska Center for Conservation Science
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query Amphibians & Reptiles Checklist" queries amphibian and reptilian taxa (Class: Amphibia, Class: Reptilia) in a web checklist format.
-- ---------------------------------------------------------------------------

-- Compile amphibian and reptilian taxa checklist
SELECT taxon_synonyms.synonym_id as name_id
     , CONCAT('<i>', taxon_synonyms.name_given, '</i> ') as name
     , taxon_status.taxon_status as status
     , CONCAT('<i>', taxon_accepted.name_accepted, '</i> ') as name_accepted
     , taxon_accepted.name_common as name_common
     , family.family as family
     , tax_order.tax_order as "order"
     , class.class as class
     , taxon_accepted.link_source as source
     , taxon_level.level as level

FROM taxon_synonyms
         LEFT JOIN taxon_accepted ON taxon_synonyms.accepted_id = taxon_accepted.accepted_id
         LEFT JOIN taxon_status ON taxon_synonyms.taxon_status_id = taxon_status.taxon_status_id
         LEFT JOIN taxon_level ON taxon_accepted.level_id = taxon_level.level_id
         LEFT JOIN hierarchy ON taxon_accepted.hierarchy_id = hierarchy.hierarchy_id
         LEFT JOIN family ON hierarchy.family_id = family.family_id
         LEFT JOIN tax_order ON hierarchy.order_id = tax_order.order_id
         LEFT JOIN class ON hierarchy.class_id = class.class_id

WHERE class.class IN ('Amphibia','Reptilia')

ORDER BY class.class, tax_order.tax_order, family.family, taxon_accepted.name_accepted, taxon_status.taxon_status, taxon_synonyms.name_given;