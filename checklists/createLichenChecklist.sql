DROP TABLE IF EXISTS `viewLichenChecklist`;
CREATE TABLE `viewLichenChecklist` AS
SELECT DISTINCT speciesAccepted.acceptedID as 'ID'
, CONCAT("<i>", speciesAccepted.nameAccepted, "</i> ", speciesAccepted.authAccepted) as 'nameAccepted'
, family.family as 'family'
, speciesAccepted.linkITIS as 'tsnITIS'
, speciesAccepted.linkSource as 'source'
, taxonLevel.level as 'level'
, category.category as 'category'
, growthHabit.growthHabit as 'growthHabit'
, GROUP_CONCAT(speciesAdjudicated.nameAdjudicated SEPARATOR ', ') as 'namesAll'
FROM speciesAccepted
 JOIN speciesAdjudicated ON speciesAccepted.acceptedID = speciesAdjudicated.acceptedID
 JOIN taxonLevel ON speciesAccepted.levelID = taxonLevel.levelID
 JOIN hierarchy ON speciesAccepted.hierarchyID = hierarchy.hierarchyID
 JOIN family ON hierarchy.familyID = family.familyID
 JOIN category ON hierarchy.categoryID = category.categoryID
 JOIN growthHabit ON speciesAccepted.growthHabitID = growthHabit.growthHabitID
WHERE speciesAccepted.levelID IN (2, 3, 4, 6) AND hierarchy.categoryID = 7
GROUP BY speciesAccepted.acceptedID;