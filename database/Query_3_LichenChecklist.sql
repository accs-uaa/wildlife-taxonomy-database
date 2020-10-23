-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Lichen Checklist
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated:  2020-10-21
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query Lichen Checklist" queries the lichen and lichenicolous fungi taxa in a web checklist format.
-- ---------------------------------------------------------------------------

-- Create lichen checklist
SELECT taxonAdjudicated.adjudicatedID as nameID
     , CONCAT('<i>', taxonAdjudicated.nameAdjudicated, '</i> ', authorAdjudicated.author) as name
     , taxonStatus.taxonStatus as status
     , CONCAT('<i>', taxonAccepted.nameAccepted, '</i> ', authorAccepted.author) as nameAccepted
     , family.family as family
     , taxonAccepted.linkSource as source
     , taxonLevel.level as level
     , category.category as category
     , habit.habit as habit
FROM taxonAdjudicated
         JOIN author authorAdjudicated ON taxonAdjudicated.authAdjudicatedID = authorAdjudicated.authorID
         JOIN taxonAccepted ON taxonAdjudicated.acceptedID = taxonAccepted.acceptedID
         JOIN author authorAccepted ON taxonAccepted.authAcceptedID = authorAccepted.authorID
         JOIN taxonStatus ON taxonAdjudicated.statusAdjudicatedID = taxonStatus.taxonStatusID
         JOIN taxonLevel ON taxonAccepted.levelID = taxonLevel.levelID
         JOIN hierarchy ON taxonAccepted.hierarchyID = hierarchy.hierarchyID
         JOIN family ON hierarchy.familyID = family.familyID
         JOIN category ON hierarchy.categoryID = category.categoryID
         JOIN habit ON taxonAccepted.habitID = habit.habitID
WHERE taxonAccepted.levelID != 6
  AND category.category = 'Lichen'
ORDER BY family.family, taxonAccepted.nameAccepted, taxonAdjudicated.nameAdjudicated;