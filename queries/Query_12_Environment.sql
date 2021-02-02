-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Environment
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated:  2021-02-02
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query environment" queries the environment data.
-- ---------------------------------------------------------------------------

-- Compile environment data
SELECT environment.environment_id as environment_id
     , project.project_abbr as project
     , site.site_code as site_code
     , environment.env_observe_date as env_observe_date
     , env_observer.personnel as env_observer
     , soil_observer.personnel as soil_observer
     , stratification.strata as strata
     , physiography.physiography as physiography
     , geomorphology.geomorphology as geomorphology
     , macrotopography.macrotopography as macrotopography
     , microtopography.microtopography as microtopography
     , environment.microrelief as microrelief
     , drainage.drainage as drainage
     , moisture.moisture as moisture
     , soil_class.soil_class as soil_class
     , environment.depth_water as depth_water
     , environment.depth_moss_duff as depth_moss_duff
     , environment.depth_restrictive_layer as depth_restrictive_layer
     , restrictive_type.restrictive_type as restrictive_type
     , environment.soil_ph_10 as soil_ph_10
     , environment.conductivity_10 as conductivity_10
     , environment.temperature_10 as temperature_10
     , environment.soil_ph_30 as soil_ph_30
     , environment.conductivity_30 as conductivity_30
     , environment.temperature_30 as temperature_30
     , environment.water_ph as water_ph
     , environment.water_conductivity as water_conductivity
     , environment.water_temperature as water_temperature
     , disturbance.disturbance as disturbance
     , environment.homogenous as homogenous
FROM environment
    LEFT JOIN project ON environment.project_id = project.project_id
    LEFT JOIN site ON environment.site_id = site.site_id
    LEFT JOIN personnel env_observer ON environment.env_observer_id = env_observer.personnel_id
    LEFT JOIN personnel soil_observer ON environment.soil_observer_id = soil_observer.personnel_id
    LEFT JOIN stratification ON environment.strata_id = stratification.strata_id
    LEFT JOIN physiography ON environment.physiography_id = physiography.physiography_id
    LEFT JOIN geomorphology ON environment.geomorphology_id = geomorphology.geomorphology_id
    LEFT JOIN macrotopography ON environment.macrotopography_id = macrotopography.macrotopography_id
    LEFT JOIN microtopography ON environment.microtopography_id = microtopography.microtopography_id
    LEFT JOIN drainage ON environment.drainage_id = drainage.drainage_id
    LEFT JOIN moisture ON environment.moisture_id = moisture.moisture_id
    LEFT JOIN soil_class ON environment.soil_class_id = soil_class.soil_class_id
    LEFT JOIN restrictive_type ON environment.restrictive_type_id = restrictive_type.restrictive_type_id
    LEFT JOIN disturbance ON environment.disturbance_id = disturbance.disturbance_id
ORDER BY environment_id;