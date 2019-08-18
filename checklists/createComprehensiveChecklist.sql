DROP TABLE IF EXISTS `viewComprehensiveChecklist`;
CREATE TABLE `viewComprehensiveChecklist` AS
SELECT speciesAdjudicated.adjudicatedID as 'ID'
, CONCAT("<i>", speciesAdjudicated.nameAdjudicated, "</i> ", speciesAdjudicated.authAdjudicated) as 'name'
, speciesStatus.statusSpecies as 'nameStatus'
, CONCAT("<i>", speciesAccepted.nameAccepted, "</i> ", speciesAccepted.authAccepted) as 'nameAccepted'
, family.family as 'family'
, speciesAccepted.linkITIS as 'tsnITIS'
, speciesPlants.linkPlants as 'codePlants'
, speciesAccepted.linkSource as 'source'
, taxonLevel.level as 'level'
, category.category as 'category'
, growthHabit.growthHabit as 'growthHabit'
FROM speciesAdjudicated
 JOIN speciesAccepted ON speciesAdjudicated.acceptedID = speciesAccepted.acceptedID
 LEFT JOIN speciesPlants ON speciesAdjudicated.plantsID = speciesPlants.plantsID
 JOIN speciesStatus ON speciesAdjudicated.statusAdjudicatedID = speciesStatus.statusSpeciesID
 JOIN taxonLevel ON speciesAccepted.levelID = taxonLevel.levelID
 JOIN hierarchy ON speciesAccepted.hierarchyID = hierarchy.hierarchyID
 JOIN family ON hierarchy.familyID = family.familyID
 JOIN category ON hierarchy.categoryID = category.categoryID
 JOIN growthHabit ON speciesAccepted.growthHabitID = growthHabit.growthHabitID
WHERE speciesAccepted.levelID IN (2, 3, 4, 6);