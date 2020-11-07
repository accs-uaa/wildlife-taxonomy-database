-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Bryophyte Checklist
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated:  2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query Bryophyte Checklist" queries the bryophyte taxa in a web checklist format.
-- ---------------------------------------------------------------------------

-- Compile bryophyte checklist
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
         LEFT JOIN author authorAdjudicated ON taxonAdjudicated.authAdjudicatedID = authorAdjudicated.authorID
         LEFT JOIN taxonAccepted ON taxonAdjudicated.acceptedID = taxonAccepted.acceptedID
         LEFT JOIN author authorAccepted ON taxonAccepted.authAcceptedID = authorAccepted.authorID
         LEFT JOIN taxonStatus ON taxonAdjudicated.statusAdjudicatedID = taxonStatus.taxonStatusID
         LEFT JOIN taxonLevel ON taxonAccepted.levelID = taxonLevel.levelID
         LEFT JOIN hierarchy ON taxonAccepted.hierarchyID = hierarchy.hierarchyID
         LEFT JOIN family ON hierarchy.familyID = family.familyID
         LEFT JOIN category ON hierarchy.categoryID = category.categoryID
         LEFT JOIN habit ON taxonAccepted.habitID = habit.habitID
WHERE taxonAccepted.levelID != 6
  AND category.category IN ('Hornwort', 'Liverwort', 'Moss')
ORDER BY family.family, taxonAccepted.nameAccepted, taxonStatus.taxonStatus, taxonAdjudicated.nameAdjudicated;