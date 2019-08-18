SELECT speciesAdjudicated.adjudicatedID as 'ID'
, speciesAdjudicated.nameAdjudicated as 'nameAdjudicated'
, speciesAdjudicated.authAdjudicated as 'authAdjudicated'
, speciesStatusAdjudicated.statusSpecies as 'statusAdjudicated'
, speciesAccepted.nameAccepted as 'nameAccepted'
, speciesAccepted.authAccepted as 'authAccepted'
, family.family as 'family'
, speciesAccepted.tsnAccepted as 'tsnITIS'
, taxonSource.taxonSource as 'taxonSource'
, taxonLevel.level as 'level'
, category.category as 'category'
, growthHabit.growthHabit as 'growthHabit'
, speciesAccepted.native as 'native'
, speciesAccepted.non_native as 'non-native'
, speciesPlants.codePlants as 'codePlants'
, speciesPlants.namePlants as 'namePlants'
, speciesPlants.authPlants as 'authPlants'
, speciesStatusPlants.statusSpecies as 'statusPlants'
FROM speciesAdjudicated
 JOIN speciesAccepted ON speciesAdjudicated.acceptedID = speciesAccepted.acceptedID
 LEFT JOIN speciesPlants ON speciesAdjudicated.plantsID = speciesPlants.plantsID
 JOIN speciesStatus  speciesStatusAdjudicated ON speciesAdjudicated.statusAdjudicatedID = speciesStatusAdjudicated.statusSpeciesID
 JOIN speciesStatus  speciesStatusPlants ON speciesPlants.statusPlantsID = speciesStatusPlants.statusSpeciesID
 JOIN taxonLevel ON speciesAccepted.levelID = taxonLevel.levelID
 JOIN hierarchy ON speciesAccepted.hierarchyID = hierarchy.hierarchyID
 JOIN family ON hierarchy.familyID = family.familyID
 JOIN category ON hierarchy.categoryID = category.categoryID
 JOIN growthHabit ON speciesAccepted.growthHabitID = growthHabit.growthHabitID
 JOIN taxonSource ON speciesAccepted.taxonSourceID = taxonSource.taxonSourceID;