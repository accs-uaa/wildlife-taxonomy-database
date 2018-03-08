DROP TABLE IF EXISTS `viewEnvData`
CREATE TABLE `viewEnvData` AS
SELECT environment.environmentID as 'ID'
, project.shortName as 'project'
, site.siteCode as 'siteCode'
, environment.envObserveDate as 'date'
, personnel1.name as 'envObserver1'
, personnel2.name as 'envObserver2'
, site.latitude as 'latitude'
, site.longitude as 'longitude'
, datum.datum as 'datum'
, physiography.physiography as 'physiography'
, stratification.strata as 'strata'
, geomorphCoarse.geomorphCoarse as 'GeomorphCoarse'
, geomorphFine.geomorphFine as 'geomorphFine'
, macrotopography.macrotopography as 'macrotopo'
, microtopography.microtopography as 'microtopo'
, environment.microrelief as 'microrelief'
, drainage.drainage as 'drainage'
, moisture.moisture as 'moisture'
, environment.depthWater as 'depthWater'
, environment.depthMossDuff as 'depthMossDuff'
, environment.depthPermafrost as 'depthPermafrost'
, environment.depthRock as 'depthRock'
, environment.soilPH10 as 'soilPH10'
, environment.temperature10 as 'temperature10'
, environment.conductivity10 as 'conductivity10'
, environment.soilPH30 as 'soilPH30'
, environment.temperature30 as 'temperature30'
, environment.conductivity30 as 'conductivity30'
, soilClass.soilClass as 'soilClass'
, disturbance.disturbance as 'disturbance'
, disturbanceType.disturbanceType as 'disturbType'
, environment.elevation as 'elevation'
, environment.slope as 'slope'
, environment.aspect as 'aspect'
, environment.homogenous as 'homogenous'
FROM environment
 JOIN site ON environment.siteID = site.siteID
 JOIN project ON environment.projectID = project.projectID
 JOIN datum ON site.datumID = datum.datumID
 JOIN personnel personnel1 ON environment.envObserver1ID = personnel1.personnelID
 LEFT JOIN personnel personnel2 ON environment.envObserver2ID = personnel2.personnelID
 LEFT JOIN physiography ON environment.physiographyID = physiography.physiographyID
 LEFT JOIN stratification ON environment.strataID = stratification.strataID
 LEFT JOIN geomorphology ON environment.geomorphologyID = geomorphology.geomorphologyID
 LEFT JOIN geomorphCoarse ON geomorphology.geomorphCoarseID = geomorphCoarse.geomorphCoarseID
 LEFT JOIN geomorphFine ON geomorphology.geomorphFineID = geomorphFine.geomorphFineID
 LEFT JOIN macrotopography ON environment.macrotopographyID = macrotopography.macrotopographyID
 LEFT JOIN microtopography ON environment.microtopographyID = microtopography.microtopographyID
 LEFT JOIN drainage ON environment.drainageID = drainage.drainageID
 LEFT JOIN moisture ON environment.moistureID = moisture.moistureID
 LEFT JOIN soilClass ON environment.soilClassID = soilClass.soilClassID
 LEFT JOIN disturbance ON environment.disturbanceID = disturbance.disturbanceID
 LEFT JOIN disturbanceType ON disturbance.disturbanceTypeID = disturbanceType.disturbanceTypeID;