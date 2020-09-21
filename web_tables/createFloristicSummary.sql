DROP TABLE IF EXISTS `viewFloristicSummary`;
CREATE TABLE `viewFloristicSummary` AS
SELECT DISTINCT family.familyID as 'ID'
, category.category as 'category'
, family.family as 'family'
, COUNT(DISTINCT acceptedID) as speciesCount
FROM family
 JOIN hierarchy ON family.familyID = hierarchy.familyID
 JOIN category ON hierarchy.categoryID = category.categoryID
 JOIN speciesAccepted ON hierarchy.hierarchyID = speciesAccepted.hierarchyID
WHERE speciesAccepted.levelID = 3 AND hierarchy.vascular = 1
GROUP BY family.familyID;