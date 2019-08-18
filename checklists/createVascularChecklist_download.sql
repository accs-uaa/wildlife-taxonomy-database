SELECT DISTINCT speciesAccepted.acceptedID as 'ID'
, speciesAccepted.nameAccepted as 'nameAccepted'
, family.family as 'family'
, speciesAccepted.tsnAccepted as 'tsnITIS'
, taxonSource.taxonSource as 'nameSource'
, taxonLevel.level as 'level'
, category.category as 'category'
, growthHabit.growthHabit as 'growthHabit'
, GROUP_CONCAT(speciesAdjudicated.nameAdjudicated SEPARATOR ', ') as 'synonyms'
FROM speciesAccepted
 JOIN speciesAdjudicated ON speciesAccepted.acceptedID = speciesAdjudicated.acceptedID
 JOIN taxonLevel ON speciesAccepted.levelID = taxonLevel.levelID
 JOIN taxonSource ON speciesAccepted.taxonSourceID = taxonSource.taxonSourceID
 JOIN hierarchy ON speciesAccepted.hierarchyID = hierarchy.hierarchyID
 JOIN family ON hierarchy.familyID = family.familyID
 JOIN category ON hierarchy.categoryID = category.categoryID
 JOIN growthHabit ON speciesAccepted.growthHabitID = growthHabit.growthHabitID
WHERE speciesAccepted.levelID IN (2, 3, 4, 6) AND hierarchy.vascular = 1
GROUP BY speciesAccepted.acceptedID;