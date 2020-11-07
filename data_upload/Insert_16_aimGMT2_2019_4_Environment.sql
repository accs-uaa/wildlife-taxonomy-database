-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert environment data for aimGMT2_2019
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert environment data" pushes the environment data for the specified project into the environment table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert environment data into environment table
INSERT INTO environment (projectID, siteID, envObserveDate, envObserverID, soilObserverID, strataID, physiographyID, geomorphologyID, macrotopographyID, microtopographyID, microrelief, drainageID, moistureID, soilClassID, depthWater, depthMossDuff, depthRestrictiveLayer, restrictiveTypeID, soilPH10, conductivity10, temperature10, soilPH30, conductivity30, temperature30, waterPH, waterConductivity, waterTemperature, disturbanceID, homogenous) VALUES
(16, 2079, '2019-08-07', 48, 48, NULL, 7, 18, 23, 23, NULL, 3, 5, NULL, 0.2, 12, 47.2, 2, 6.6, 119, NULL, 7.1, NULL, NULL, NULL, NULL, NULL, 25, FALSE),
(16, 2080, '2019-08-02', 73, 73, NULL, 7, 18, 23, 39, NULL, 3, 6, NULL, -40, 2.3, 58.5, 2, 7.4, 95, NULL, 7, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2081, '2019-08-05', 73, 73, NULL, 7, 18, 37, 24, NULL, 3, 6, NULL, -15, 0.9, 103.1, 2, 6.5, 142, NULL, 6.6, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2082, '2019-08-03', 73, 73, NULL, 7, 12, 37, 24, NULL, NULL, 6, NULL, -25.4, 4.8, 36.3, 2, 6.9, 66.2, NULL, 7.2, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2083, '2019-08-03', 73, 73, NULL, 7, 12, 40, 24, NULL, 3, 7, NULL, -17.7, 4.7, 34.6, 2, 5.9, 74.5, NULL, 6.4, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2084, '2019-08-08', 48, 48, NULL, 7, 12, 38, 24, NULL, 3, 5, NULL, 10.7, 8.8, 37.8, 2, 6.5, 76, NULL, 6.5, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2085, '2019-08-04', 48, 48, NULL, 7, 12, 38, 24, NULL, 3, 5, NULL, 1.2, 8.7, 28.9, 2, 6, 5.9, NULL, 6, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(16, 2086, '2019-08-04', 48, 48, NULL, 7, 12, 38, 24, NULL, 3, 5, NULL, 1.5, 16, 25.9, 2, 5.9, 54, NULL, 6.1, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2087, '2019-08-09', 73, 73, NULL, 7, 12, 38, 24, NULL, 3, 5, NULL, 11.3, 2.5, 58.9, 2, 6.6, 5.9, NULL, 6.6, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2088, '2019-08-04', 73, 73, NULL, 7, 12, 38, 24, NULL, 3, 5, NULL, 1, 3.2, 35.5, 2, 5.9, 90.7, NULL, 6.4, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2089, '2019-08-04', 48, 48, NULL, 7, 12, 38, 24, NULL, 3, 5, NULL, 0, 9.2, 29.8, 2, 6.4, 44.3, NULL, 6.3, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2090, '2019-08-04', 48, 48, NULL, 7, 12, 37, 24, NULL, 3, 7, NULL, -15.8, 11.2, 29.5, 2, 6.3, 52.2, NULL, 6.1, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2091, '2019-08-04', 73, 73, NULL, 7, 12, 35, NULL, NULL, 3, 5, NULL, -2.6, 4.5, 42.6, 2, 6.2, 67.2, NULL, 6.4, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(16, 2092, '2019-08-05', 48, 48, NULL, 7, 18, 23, 37, NULL, NULL, 9, NULL, NULL, 4.1, 99.4, 2, 7, 562, NULL, 6.9, NULL, NULL, NULL, NULL, NULL, 16, FALSE),
(16, 2093, '2019-08-05', 48, 48, NULL, 7, 18, 15, 39, NULL, 1, 9, NULL, NULL, NULL, NULL, NULL, 7.2, 300, NULL, 7.3, NULL, NULL, NULL, NULL, NULL, 1, FALSE),
(16, 2094, '2019-08-05', 73, 73, NULL, 7, 18, 38, 24, NULL, NULL, 9, NULL, -8.1, 1.4, 45, 2, 5.8, 154.3, 6.3, NULL, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2095, '2019-08-07', 48, 48, NULL, 7, 18, 38, 24, NULL, 3, 5, NULL, 2.5, 13.3, 36.5, 2, 6.5, 48.2, NULL, 6.4, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2096, '2019-08-01', 48, 48, NULL, 7, 12, 35, NULL, NULL, NULL, 9, NULL, -9, 9.9, 27.7, 2, 6.6, 98.3, NULL, 6.4, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2097, '2019-08-07', 73, 73, NULL, 7, 12, 36, 24, NULL, 3, 5, NULL, 1.8, 5.7, 41.3, 2, 6.4, 198.7, NULL, 6.2, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2098, '2019-08-02', 48, 48, NULL, 7, 18, 23, 35, NULL, 3, 5, NULL, 9.2, 11.9, 34.8, 2, 6.5, 37.6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2099, '2019-08-10', 73, 73, NULL, 7, 18, 36, 24, NULL, NULL, 9, NULL, NULL, 1.6, 49.4, 2, 6.6, 67.2, NULL, 7.4, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2100, '2019-08-09', 73, 73, NULL, 7, 12, 38, 24, NULL, 3, 5, NULL, 10.2, NULL, 46.8, 2, 6.5, 162.9, NULL, 6.4, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2101, '2019-08-01', 73, 73, NULL, 7, 12, 35, 17, NULL, 3, 5, NULL, 1.6, 4.6, 51.6, 2, 6.3, 44.5, NULL, 6.6, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(16, 2102, '2019-08-01', 73, 73, NULL, 7, 12, 35, 17, NULL, 3, 5, NULL, 3.1, NULL, 51.8, 2, 6.5, 58.8, NULL, 6.5, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(16, 2103, '2019-08-05', 48, 48, NULL, 7, 12, 38, 24, NULL, 3, 7, NULL, NULL, 9.2, 29.3, 2, 6.2, 50.3, NULL, 6.1, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2104, '2019-08-01', 48, 48, NULL, 7, 12, 3, NULL, NULL, NULL, 9, NULL, -14, 8.5, 27.6, 2, 6.1, 125, NULL, 6.1, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(16, 2105, '2019-08-09', 48, 48, NULL, 7, 12, 40, 24, NULL, NULL, 9, NULL, NULL, 5.9, 34, 2, 6.1, 30.2, NULL, 6.4, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2106, '2019-08-09', 48, 48, NULL, 7, 12, 38, 24, NULL, 3, 5, NULL, -1.4, 6, 49.2, 2, 6.1, 76, NULL, 6, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(16, 2107, '2019-08-02', 48, 48, NULL, 7, 18, 38, 24, NULL, 3, 7, NULL, -15.7, 6.8, 32.5, 2, 5.6, 48.7, NULL, 6.1, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2108, '2019-08-01', 73, 73, NULL, 7, 12, 38, 24, NULL, 3, 5, NULL, 3.2, 7.2, 38.2, 2, 5.9, 49.6, NULL, 6.1, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2109, '2019-08-06', 73, 73, NULL, 7, 12, 38, 24, NULL, 3, 5, NULL, 9.3, NULL, 47.8, 2, 6, 80.1, NULL, 6.2, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2110, '2019-08-06', 73, 73, NULL, 7, 12, 40, 24, NULL, NULL, 8, NULL, NULL, 4.9, 32.2, 2, 6.2, 48.2, NULL, 7.2, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2111, '2019-08-06', 48, 48, NULL, 7, 12, 38, 24, NULL, 3, 7, NULL, -15.5, 6.5, 33.6, 2, 7.1, 47.1, NULL, 6.6, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2112, '2019-08-06', 48, 48, NULL, 7, 12, 40, 24, NULL, NULL, 9, NULL, -29, 11.3, 37.7, 2, 6.1, 20.8, NULL, 6.5, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2113, '2019-08-08', 73, 73, NULL, 7, 12, 38, 24, NULL, 3, 5, NULL, 8.4, NULL, 49, 2, 6.2, 121.5, NULL, 6.3, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2114, '2019-08-08', 73, 73, NULL, 7, 12, 40, 24, NULL, 3, 5, NULL, 9.2, 7.1, 35, 2, 6.2, 40.7, NULL, 6.3, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2115, '2019-08-07', 73, 73, NULL, 7, 12, 36, 24, NULL, NULL, 9, NULL, NULL, 5, 32.6, 2, 5.8, 81.9, NULL, 6.1, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2116, '2019-08-04', 73, 73, NULL, 7, 12, 40, 24, NULL, NULL, 8, NULL, -22.5, 3.2, 35.4, 2, 6, 53.3, NULL, 5.8, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2117, '2019-08-05', 73, 73, NULL, 7, 18, 38, 24, NULL, 3, 5, NULL, 4.2, 5.9, 37, 2, 6.3, 113.6, NULL, 6.5, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2118, '2019-08-02', 48, 48, NULL, 7, 2, 38, 24, NULL, 3, 5, NULL, -18.6, 8.1, 32, 2, 6.1, 55.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(16, 2119, '2019-08-03', 48, 48, NULL, 7, 12, 44, NULL, NULL, 3, 5, NULL, -10, 9.2, 27.3, 2, 5.7, 40.2, NULL, 6.1, NULL, NULL, NULL, NULL, NULL, 14, FALSE);

-- Commit transaction
COMMIT TRANSACTION;
