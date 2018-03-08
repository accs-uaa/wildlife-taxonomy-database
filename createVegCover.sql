DROP TABLE IF EXISTS `viewVegCover`;
CREATE TABLE `viewVegCover` AS
SELECT abundance.abundanceID as 'ID'
, project.shortName as 'project'
, site.siteCode as 'siteCode'
, methodSurvey.methodSurvey as 'methodSurvey'
, methodCover.methodCover as 'methodCover'
, abundance.vegObserveDate as 'date'
, personnel1.name as 'vegObserver1'
, personnel2.name as 'vegObserver2'
, site.latitude as 'latitude'
, site.longitude as 'longitude'
, datum.datum as 'datum'
, speciesAccepted.nameAccepted as 'nameAccepted'
, speciesAccepted.tsnAccepted as 'tsnITIS'
, abundance.cover as 'cover'
FROM abundance
 JOIN site ON abundance.siteID = site.siteID
 JOIN method ON site.methodID = method.methodID
 JOIN methodSurvey ON method.methodSurveyID = methodSurvey.methodSurveyID
 JOIN methodCover ON method.methodCoverID = methodCover.methodCoverID
 JOIN project ON abundance.projectID = project.projectID
 JOIN speciesAdjudicated ON abundance.adjudicatedID = speciesAdjudicated.adjudicatedID
 JOIN speciesAccepted ON speciesAdjudicated.acceptedID = speciesAccepted.acceptedID
 JOIN datum ON site.datumID = datum.datumID
 JOIN personnel personnel1 ON abundance.vegObserver1ID = personnel1.personnelID
 LEFT JOIN personnel personnel2 ON abundance.vegObserver2ID = personnel2.personnelID;