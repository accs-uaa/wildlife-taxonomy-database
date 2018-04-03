DROP TABLE IF EXISTS `viewProjectData`;
CREATE TABLE `viewProjectData` AS
SELECT project.projectID as 'ID'
, project.shortName as 'initialProject'
, project.name as 'initialProjectTitle'
, personnel.name as 'manager'
, organization1.organizationName as 'originator'
, organization2.organizationName as 'client'
, project.yearStart as 'yearStart'
, project.yearEnd as 'yearEnd'
, genLocation.genLocation as 'location'
, region.region as 'region'
, completion.completion as 'completion'
, scopeTypeP1.scopeType as 'vascularScope'
, scopeTypeP2.scopeType as 'nonvascularScope'
, scopeTypeP3.scopeType as 'lichenScope'
, project.description as 'description'
FROM project
 JOIN personnel ON project.managerID = personnel.personnelID
 JOIN organization organization1 ON project.originatorID = organization1.organizationID
 JOIN organization organization2 ON project.clientID = organization2.organizationID
 JOIN genLocation ON project.genLocationID = genLocation.genLocationID
 JOIN region ON genLocation.regionID = region.regionID
 JOIN completion ON project.completionID = completion.completionID
 JOIN methodScope ON project.scopeID = methodScope.scopeID
 JOIN scopeType scopeTypeP1 ON methodScope.vascularScopeID = scopeTypeP1.scopeTypeID
 JOIN scopeType scopeTypeP2 ON methodScope.nonvascularScopeID = scopeTypeP2.scopeTypeID
 JOIN scopeType scopeTypeP3 ON methodScope.lichenScopeID = scopeTypeP3.scopeTypeID