-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Build environment tables
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-10-20
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Build environment tables" creates the empty tables for the environment components of the AKVEG database. WARNING: THIS SCRIPT WILL ERASE ALL DATA IN EXISTING ENVIRONMENT TABLES.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Drop environment tables if they exist
DROP TABLE IF EXISTS
    environment;

-- Create environment table
CREATE TABLE environment (
    environmentID serial PRIMARY KEY,
    projectID smallint NOT NULL REFERENCES project,
    siteID integer NOT NULL REFERENCES site,
    envObserveDate date NOT NULL,
    envObserverID smallint NOT NULL REFERENCES personnel,
    soilObserverID smallint REFERENCES personnel,
    strataID smallint REFERENCES stratification,
    physiographyID smallint REFERENCES physiography,
    geomorphologyID smallint REFERENCES geomorphology,
    macrotopographyID smallint REFERENCES macrotopography,
    microtopographyID smallint REFERENCES microtopography,
    microrelief decimal(4,1),
    drainageID smallint REFERENCES drainage,
    moistureID smallint REFERENCES moisture,
    soilClassID smallint REFERENCES soilClass,
    depthWater decimal(4,1),
    depthMossDuff decimal(4,1),
    depthRestrictiveLayer decimal(4,1),
    restrictiveTypeID smallint REFERENCES restrictiveType,
    soilPH10 decimal(4,2),
    conductivity10 decimal(7,2),
    temperature10 decimal(5,2),
    soilPH30 decimal(4,2),
    conductivity30 decimal(7,2),
    temperature30 decimal(5,2),
    waterPH decimal(4,2),
    waterConductivity decimal(7,2),
    waterTemperature decimal(5,2),
    disturbanceID smallint REFERENCES disturbance,
    homogenous boolean NOT NULL DEFAULT FALSE
);

-- Commit transaction
COMMIT TRANSACTION;