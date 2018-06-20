DROP TABLE IF EXISTS `viewSiteData`;
CREATE TABLE `viewSiteData` AS
SELECT site.siteID as 'ID'
, site.siteCode as 'siteCode'
, project.shortName as 'initialProject'
, project.name as 'initialProjectTitle'
, methodSurvey.methodSurvey as 'methodSurvey'
, methodCover.methodCover as 'methodCover'
, plotDimensions.plotDimensions as 'plotDimensions'
, vascularScope1.scopeType as 'vascularScope'
, nonvascularScope1.scopeType as 'nonvascularScope'
, lichenScope1.scopeType as 'lichenScope'
, datum.datum as 'datum'
, site.latitude as 'latitude'
, site.longitude as 'longitude'
FROM site
 JOIN project on site.projectID = project.projectID
 JOIN method on site.methodID = method.methodID
 JOIN methodSurvey ON method.methodSurveyID = methodSurvey.methodSurveyID
 JOIN methodCover ON method.methodCoverID = methodCover.methodCoverID
 JOIN datum ON site.datumID = datum.datumID
 JOIN plotDimensions ON site.plotDimensionsID = plotDimensions.plotDimensionsID
 JOIN methodScope ON project.scopeID = methodScope.scopeID
 JOIN scopeType vascularScope1 ON methodScope.vascularScopeID = vascularScope1.scopeTypeID
 JOIN scopeType nonvascularScope1 ON methodScope.nonvascularScopeID = nonvascularScope1.scopeTypeID
 JOIN scopeType lichenScope1 ON methodScope.lichenScopeID = lichenScope1.scopeTypeID
ORDER BY site.siteID ASC;