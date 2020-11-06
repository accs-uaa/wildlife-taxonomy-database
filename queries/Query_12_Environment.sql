-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Environment
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated:  2020-11-05
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query environment" queries the environment data.
-- ---------------------------------------------------------------------------

-- Compile environment data
SELECT environment.environmentID as environmentID
     , project.projectNameAbbr as project
     , site.siteCode as siteCode
     , environment.envObserveDate as envObserveDate
     , envObserver.personnel as envObserver
     , soilObserver.personnel as soilObserver
     , stratification.strata as strata
     , physiography.physiography as physiography
     , geomorphology.geomorphology as geomorphology
     , macrotopography.macrotopography as macrotopography
     , microtopography.microtopography as microtopography
     , environment.microrelief as microrelief
     , drainage.drainage as drainage
     , moisture.moisture as moisture
     , soilClass.soilClass as soilClass
     , environment.depthWater as depthWater
     , environment.depthMossDuff as depthMossDuff
     , environment.depthRestrictiveLayer as depthRestrictiveLayer
     , restrictiveType.restrictiveType as restrictiveType
     , environment.soilPH10 as soilPH10
     , environment.conductivity10 as conductivity10
     , environment.temperature10 as temperature10
     , environment.soilPH30 as soilPH30
     , environment.conductivity30 as conductivity30
     , environment.temperature30 as temperature30
     , environment.waterPH as waterPH
     , environment.waterConductivity as waterConductivity
     , environment.waterTemperature as waterTemperature
     , disturbance.disturbance as disturbance
     , environment.homogenous as homogenous
FROM environment
    LEFT JOIN project ON environment.projectID = project.projectID
    LEFT JOIN site ON environment.siteID = site.siteID
    LEFT JOIN personnel envObserver ON environment.envObserverID = envObserver.personnelID
    LEFT JOIN personnel soilObserver ON environment.soilObserverID = soilObserver.personnelID
    LEFT JOIN stratification ON environment.strataID = stratification.strataID
    LEFT JOIN physiography ON environment.physiographyID = physiography.physiographyID
    LEFT JOIN geomorphology ON environment.geomorphologyID = geomorphology.geomorphologyID
    LEFT JOIN macrotopography ON environment.macrotopographyID = macrotopography.macrotopographyID
    LEFT JOIN microtopography ON environment.microtopographyID = microtopography.microtopographyID
    LEFT JOIN drainage ON environment.drainageID = drainage.drainageID
    LEFT JOIN moisture ON environment.moistureID = moisture.moistureID
    LEFT JOIN soilClass ON environment.soilClassID = soilClass.soilClassID
    LEFT JOIN restrictiveType ON environment.restrictiveTypeID = restrictiveType.restrictiveTypeID
    LEFT JOIN disturbance ON environment.disturbanceID = disturbance.disturbanceID
ORDER BY environmentID ASC;