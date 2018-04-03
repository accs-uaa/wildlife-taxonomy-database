DROP TABLE IF EXISTS `viewProjectStatus`;
CREATE TABLE `viewProjectStatus` AS
SELECT statusProject.statusID as 'ID'
, project.shortName as 'projectAbbr'
, project.name as 'projectTitle'
, statusProject.projectModified as 'project'
, statusProject.siteModified as 'site'
, statusProject.abundanceModified as 'abundance'
, statusProject.environmentModified as 'environment'
, statusProject.soilsModified as 'soils'
, statusProject.groundcoverModified as 'groundCover'
, statusProject.absoluteCoverModified as 'absoluteCover'
, personnel.name as 'modifiedBy'
FROM statusProject
 JOIN project ON statusProject.projectID = project.projectID
 LEFT JOIN personnel ON statusProject.modifiedByID = personnel.personnelID
WHERE statusProject.projectModified IS NOT NULL;