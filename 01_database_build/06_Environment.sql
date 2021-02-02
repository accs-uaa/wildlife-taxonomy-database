-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Build environment tables
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2021-01-27
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
    environment_id serial PRIMARY KEY,
    project_id smallint NOT NULL REFERENCES project,
    site_id integer NOT NULL REFERENCES site,
    env_observe_date date NOT NULL,
    env_observer_id smallint NOT NULL REFERENCES personnel,
    soil_observer_id smallint REFERENCES personnel,
    strata_id smallint REFERENCES stratification,
    physiography_id smallint REFERENCES physiography,
    geomorphology_id smallint REFERENCES geomorphology,
    macrotopography_id smallint REFERENCES macrotopography,
    microtopography_id smallint REFERENCES microtopography,
    microrelief decimal(4,1),
    drainage_id smallint REFERENCES drainage,
    moisture_id smallint REFERENCES moisture,
    soil_class_id smallint REFERENCES soil_class,
    depth_water decimal(4,1),
    depth_moss_duff decimal(4,1),
    depth_restrictive_layer decimal(4,1),
    restrictive_type_id smallint REFERENCES restrictive_type,
    soil_ph_10 decimal(4,2),
    conductivity_10 decimal(7,2),
    temperature_10 decimal(5,2),
    soil_ph_30 decimal(4,2),
    conductivity_30 decimal(7,2),
    temperature_30 decimal(5,2),
    water_ph decimal(4,2),
    water_conductivity decimal(7,2),
    water_temperature decimal(5,2),
    disturbance_id smallint REFERENCES disturbance,
    homogenous boolean NOT NULL DEFAULT FALSE
);

-- Commit transaction
COMMIT TRANSACTION;