DROP TABLE IF EXISTS `vegCover`
CREATE TABLE `vegCover` AS
SELECT abundance.abundanceID as 'ID'
, project.name as 'Project'
, site.siteCode as 'Site Code'
, abundance.vegObserveDate as 'Date'
, personnel1.name as 'Observer Primary'
, personnel2.name as 'Observer Secondary'
, site.latitude as 'Latitude (dd)'
, site.longitude as 'Longitude (dd)'
, datum.datum as 'Datum'
, speciesAccepted.nameAccepted as 'Accepted Name'
, abundance.cover as 'Cover'
FROM abundance
 JOIN site ON abundance.siteID = site.siteID
 JOIN project ON abundance.projectID = project.projectID
 JOIN speciesAdjudicated ON abundance.adjudicatedID = speciesAdjudicated.adjudicatedID
 JOIN speciesAccepted ON speciesAdjudicated.acceptedID = speciesAccepted.acceptedID
 JOIN datum ON site.datumID = datum.datumID
 JOIN personnel personnel1 ON abundance.vegObserver1ID = personnel1.personnelID
 LEFT JOIN personnel personnel2 ON abundance.vegObserver2ID = personnel2.personnelID;