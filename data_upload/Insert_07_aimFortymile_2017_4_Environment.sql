-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert environment data for aimFortymile_2017
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert environment data" pushes the environment data for the specified project into the environment table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert environment data into environment table
INSERT INTO environment (projectID, siteID, envObserveDate, envObserverID, soilObserverID, strataID, physiographyID, geomorphologyID, macrotopographyID, microtopographyID, microrelief, drainageID, moistureID, soilClassID, depthWater, depthMossDuff, depthRestrictiveLayer, restrictiveTypeID, soilPH10, conductivity10, temperature10, soilPH30, conductivity30, temperature30, waterPH, waterConductivity, waterTemperature, disturbanceID, homogenous) VALUES
(7, 623, '2016-08-10', 66, 66, 20, 5, 18, 44, NULL, NULL, NULL, 7, NULL, -70, 6, NULL, NULL, 6.2, 70, NULL, 7.1, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(7, 624, '2016-08-10', 81, 81, 20, 5, 18, 23, 37, NULL, NULL, 9, NULL, NULL, 5, NULL, NULL, 7.6, 90, NULL, 7.7, NULL, NULL, NULL, NULL, NULL, 16, FALSE),
(7, 625, '2016-08-11', 66, 66, 20, 5, 18, 23, 37, NULL, NULL, 7, NULL, NULL, 6, 40, 2, 5.5, 60, NULL, 6.2, NULL, NULL, NULL, NULL, NULL, 16, FALSE),
(7, 626, '2016-08-11', 81, 81, 20, 5, 18, 18, 3, NULL, NULL, 9, NULL, -56, NULL, NULL, NULL, 8.3, 20, NULL, 8.3, NULL, NULL, NULL, NULL, NULL, 16, FALSE),
(7, 627, '2016-08-12', 81, 81, 20, 5, 18, 23, 37, NULL, NULL, 9, NULL, NULL, 8, 37, 2, 5.5, 70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, FALSE),
(7, 628, '2016-08-12', 66, 66, 20, 5, 18, 2, NULL, NULL, NULL, 7, NULL, -42, 6, 60, 2, 5.6, 40, NULL, 5.4, NULL, NULL, NULL, NULL, NULL, 16, FALSE),
(7, 629, '2016-08-13', 66, 66, 20, 5, 18, 23, 37, NULL, NULL, 11, NULL, NULL, 0, NULL, NULL, 6, 40, NULL, 5.4, NULL, NULL, NULL, NULL, NULL, 16, FALSE),
(7, 630, '2016-08-13', 81, 81, NULL, 5, 18, 19, NULL, NULL, NULL, 7, NULL, -55, 0, NULL, NULL, 5.4, 100, NULL, 6.4, NULL, NULL, NULL, NULL, NULL, 16, FALSE),
(7, 632, '2016-08-16', 81, 23, NULL, 5, 18, 23, 37, NULL, NULL, 9, NULL, NULL, 2.7, NULL, NULL, 7.6, 80, NULL, 7, NULL, NULL, NULL, NULL, NULL, 16, FALSE),
(7, 633, '2016-08-17', 66, 66, 20, 5, 18, 44, NULL, NULL, NULL, 9, NULL, NULL, 3, NULL, NULL, 6.3, 40, NULL, 6.6, NULL, NULL, NULL, NULL, NULL, 16, FALSE),
(7, 634, '2016-08-17', 81, 23, 20, 5, 18, 18, NULL, NULL, NULL, 9, NULL, NULL, 2, NULL, NULL, 7.7, 150, NULL, 8, NULL, NULL, NULL, NULL, NULL, 16, FALSE),
(7, 642, '2017-08-13', 48, 48, 20, 5, 18, 44, NULL, NULL, NULL, 9, NULL, NULL, 4, NULL, NULL, 5.6, 50, NULL, 6.5, NULL, NULL, NULL, NULL, NULL, 10, FALSE),
(7, 643, '2017-08-11', 23, 23, 20, 5, 18, 44, NULL, NULL, NULL, 10, NULL, NULL, 1, NULL, NULL, 6.2, 43, NULL, 6.6, NULL, NULL, NULL, NULL, NULL, 16, FALSE),
(7, 644, '2017-08-10', 48, 48, 20, 5, 18, 23, 37, NULL, NULL, 9, NULL, NULL, 8, NULL, NULL, 4.2, 40, NULL, 5.6, NULL, NULL, NULL, NULL, NULL, 16, FALSE),
(7, 645, '2017-08-09', 23, 23, 20, 5, 18, 23, 37, NULL, NULL, 9, NULL, NULL, 0, NULL, NULL, 6.4, 33, NULL, 6.8, NULL, NULL, NULL, NULL, NULL, 16, FALSE),
(7, 646, '2017-08-09', 48, 48, 20, 5, 18, 23, 37, NULL, NULL, 10, NULL, NULL, 5, NULL, NULL, 4.2, 40, NULL, 4.6, NULL, NULL, NULL, NULL, NULL, 16, FALSE),
(7, 647, '2017-08-15', 48, 48, 20, 5, 18, 23, 37, NULL, NULL, 5, NULL, -33, 0, NULL, NULL, 6.5, 10, NULL, 6.5, NULL, NULL, NULL, NULL, NULL, 16, FALSE);

-- Commit transaction
COMMIT TRANSACTION;
