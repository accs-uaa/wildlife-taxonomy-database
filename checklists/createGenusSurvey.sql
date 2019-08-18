DROP TABLE IF EXISTS `viewGenusSurvey`;
CREATE TABLE `viewGenusSurvey` AS
SELECT hierarchy.hierarchyID as 'ID'
, category.category as 'categry'
, family.family as 'family'
, hierarchy.genusAccepted as 'genus'
, CONCAT("https://floraofalaska.org/vascular-flora/?wdt_column_filter[1]=", hierarchy.genusAccepted, "&wdt_column_filter[2]=", family.family) as 'link'
FROM hierarchy
 JOIN family ON hierarchy.familyID = family.familyID
 JOIN category ON hierarchy.categoryID = category.categoryID
WHERE hierarchy.vascular = 1;