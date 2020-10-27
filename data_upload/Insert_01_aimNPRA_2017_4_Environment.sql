-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert environment data for aimNPRA_2017
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-10-27
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert environment data" pushes the environment data for the specified project into the environment table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert environment data into environment table
INSERT INTO environment (projectID, siteID, envObserveDate, envObserverID, soilObserverID, strataID, physiographyID, geomorphologyID, macrotopographyID, microtopographyID, microrelief, drainageID, moistureID, soilClassID, depthWater, depthMossDuff, depthRestrictiveLayer, restrictiveTypeID, soilPH10, conductivity10, temperature10, soilPH30, conductivity30, temperature30, waterPH, waterConductivity, waterTemperature, disturbanceID, homogenous) VALUES
(1, 1, '2012-08-01', 66, 66, NULL, 1, 33, 43, 34, NULL, 1, 10, NULL, NULL, 0, 0, 6, 5.3, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 2, '2012-08-01', 66, 66, NULL, 1, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, 0.2, 0, 6, 5.6, 30, NULL, 5.8, NULL, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 3, '2012-08-02', 30, 30, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, 0.1, 9.2, 6, 6.4, 130, 10.7, 6.7, 130, 9.8, NULL, NULL, NULL, NULL, FALSE),
(1, 4, '2013-07-30', 66, 66, NULL, 1, 33, 45, NULL, NULL, NULL, 9, NULL, NULL, 0, NULL, NULL, 5.9, 80, NULL, 5.4, NULL, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 5, '2013-08-01', 30, 30, NULL, 1, 33, 45, NULL, NULL, NULL, 9, NULL, NULL, 0, NULL, NULL, 7.1, 100, 15.6, 7, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 6, '2013-07-30', 66, 66, NULL, 1, 33, 48, NULL, NULL, 1, 10, NULL, NULL, 0, NULL, NULL, 5.8, 40, NULL, 5.9, NULL, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 7, '2015-07-25', 50, 58, NULL, 1, 33, 43, NULL, NULL, 1, 11, NULL, NULL, 1.6, NULL, NULL, 6.8, 80, NULL, 7.8, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 8, '2015-07-25', 66, 66, NULL, 1, 33, 43, NULL, NULL, 1, 10, NULL, NULL, 0.9, 98, 2, 7.2, 320, NULL, 7.9, NULL, NULL, NULL, NULL, NULL, 18, FALSE),
(1, 9, '2015-07-25', 50, 58, NULL, 1, 33, 43, 40, NULL, 1, 11, NULL, NULL, 2.1, NULL, NULL, 7.1, 80, NULL, 7.3, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 10, '2017-07-27', 17, 17, NULL, 1, 33, 45, NULL, NULL, NULL, 9, NULL, NULL, 0.9, NULL, NULL, 8.7, NULL, NULL, 8.9, 21, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 11, '2017-07-28', 35, 35, NULL, 1, 33, 43, 9, NULL, NULL, 9, NULL, NULL, 0.6, 71.5, 2, 7.9, 970, NULL, 7.5, 960, NULL, NULL, NULL, NULL, 11, FALSE),
(1, 12, '2017-07-22', 35, 35, NULL, 1, 33, 46, 9, NULL, NULL, 9, NULL, NULL, 0.7, 8.9, 6, 6.5, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, FALSE),
(1, 13, '2017-07-22', 58, 58, NULL, 1, 33, 43, NULL, NULL, NULL, 9, NULL, NULL, 3.8, 66.4, 2, 7.1, 210, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, FALSE),
(1, 14, '2017-07-22', 35, 35, NULL, 1, 33, 44, 9, NULL, NULL, 9, NULL, NULL, 0.6, 90, 2, 5.8, 20, NULL, 6.3, NULL, NULL, NULL, NULL, NULL, 11, FALSE),
(1, 15, '2012-08-03', 66, 66, NULL, 6, 18, 22, NULL, NULL, 1, 10, NULL, NULL, 0, NULL, NULL, 7.3, 110, NULL, 7.8, NULL, NULL, NULL, NULL, NULL, 16, FALSE),
(1, 16, '2012-08-07', 30, 30, NULL, 6, 18, 22, NULL, NULL, NULL, 9, NULL, NULL, 0, NULL, NULL, NULL, 50, 7.3, NULL, 60, 7.2, NULL, NULL, NULL, 16, FALSE),
(1, 17, '2012-08-04', 66, 66, NULL, 6, 18, 22, NULL, NULL, NULL, 8, NULL, 13.4, 8.4, 43.4, 2, 7.4, 250, NULL, 7.1, NULL, NULL, 7.1, NULL, NULL, 16, FALSE),
(1, 18, '2012-08-02', 30, 30, NULL, 6, 18, 22, NULL, NULL, 3, 5, NULL, 0, 3.7, 40.9, 2, 5.7, 30, 14.5, 5.9, 50, 12.6, NULL, NULL, NULL, NULL, FALSE),
(1, 19, '2013-07-30', 30, 30, NULL, 6, 18, 22, NULL, NULL, 3, 5, NULL, -5.2, 0.1, 85.2, 2, 7.6, 400, NULL, 7.6, NULL, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 20, '2013-07-30', 30, 30, NULL, 6, 18, 22, NULL, NULL, 3, 5, NULL, -3.9, NULL, 54.4, 2, 7.9, 190, NULL, 7.8, NULL, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 21, '2013-07-31', 30, 30, NULL, 6, 18, 19, NULL, NULL, 3, 5, NULL, -2.5, 0.3, 72.4, 2, 8, 170, NULL, 7.7, NULL, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 22, '2013-07-27', 52, 66, NULL, 6, 18, 17, NULL, NULL, 3, 5, NULL, 13.7, 4, 60.2, 2, 7.3, 330, NULL, 7.2, NULL, NULL, 7.1, NULL, NULL, NULL, FALSE),
(1, 23, '2012-08-04', 30, 30, NULL, 6, 18, 22, NULL, NULL, 3, 5, NULL, -1.2, 2.4, 43.5, 2, 5.9, 50, 11.6, 6.1, 40, 10, NULL, NULL, NULL, NULL, FALSE),
(1, 24, '2014-07-20', 16, 16, NULL, 6, 18, 22, NULL, NULL, 3, 5, NULL, -0.7, 0.6, 35.7, 2, 6.2, 40, NULL, 6.7, NULL, NULL, NULL, NULL, NULL, 25, FALSE),
(1, 25, '2014-07-24', 16, 16, NULL, 6, 18, 22, NULL, NULL, 3, 5, NULL, -3.8, 4.8, 44.7, 2, 8.1, 110, NULL, 7.5, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 26, '2014-07-24', 66, 66, NULL, 6, 18, 22, NULL, NULL, 3, 5, NULL, 0.1, 2.3, 68.6, 2, 6.9, 370, NULL, 6.8, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 27, '2015-07-27', 66, 66, NULL, 6, 2, 37, 24, NULL, NULL, 9, NULL, 45, 4.6, 51.3, 2, 6.9, 90, NULL, 7, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 28, '2015-07-27', 58, 58, NULL, 6, 18, 19, NULL, NULL, 3, 5, NULL, 10, 4.4, 65.6, 2, 7, 240, NULL, 6.8, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 29, '2015-07-28', 66, 66, NULL, 6, 2, 37, 24, NULL, 3, 5, NULL, 18, 4.4, 38.6, 2, 6.8, 120, NULL, 7, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 30, '2017-07-28', 17, 17, NULL, 6, 18, 22, NULL, NULL, 3, 7, NULL, 30, 12, 30, 2, 6.8, 4.3, NULL, 7.1, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 31, '2017-07-23', 35, 35, NULL, 6, 2, 39, 24, NULL, 3, 5, NULL, -2.5, 9.8, 26.4, 2, 5.9, 20, NULL, 6.2, NULL, NULL, 6.4, 80, NULL, 15, FALSE),
(1, 32, '2013-08-02', 30, 30, NULL, 6, 18, 22, NULL, NULL, NULL, 9, NULL, 45, 2.8, 51.8, 2, 6.7, 120, NULL, 6.3, NULL, NULL, NULL, NULL, NULL, 16, FALSE),
(1, 33, '2013-07-26', 66, 66, NULL, 6, 18, 22, NULL, NULL, 1, 11, NULL, NULL, 0.1, NULL, NULL, 8.4, 30, NULL, 8.5, NULL, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 34, '2013-07-31', 30, 30, NULL, 6, 18, 15, 39, NULL, 1, 10, NULL, NULL, 0.1, NULL, NULL, 7.9, 50, NULL, 8.1, NULL, NULL, NULL, NULL, NULL, 1, FALSE),
(1, 35, '2012-08-02', 66, 66, NULL, 6, 18, 22, 23, NULL, NULL, 9, NULL, NULL, 0.2, 17.7, 6, 6.4, 70, NULL, 6.9, NULL, NULL, NULL, NULL, NULL, 16, FALSE),
(1, 36, '2013-07-31', 30, 30, NULL, 6, 18, 15, 39, NULL, NULL, NULL, NULL, 45, 0.7, 105.7, 2, 8.1, 50, NULL, 8.1, NULL, NULL, NULL, NULL, NULL, 1, FALSE),
(1, 37, '2012-08-03', 30, 30, NULL, 6, 18, 22, NULL, NULL, 1, 11, NULL, NULL, 0, 9.6, 6, 5.9, 110, 12.2, 5.9, 0, 12, NULL, NULL, NULL, 16, FALSE),
(1, 38, '2014-07-24', 66, 66, NULL, 6, 18, 22, NULL, NULL, 1, 10, NULL, NULL, 0, 117, 2, 8.3, 70, NULL, 7.6, NULL, NULL, NULL, NULL, NULL, 1, FALSE),
(1, 39, '2015-07-28', 66, 66, NULL, 6, 18, 22, NULL, NULL, 1, 9, NULL, NULL, 0, 123, 2, 8.2, 80, NULL, 7.7, NULL, NULL, NULL, NULL, NULL, 24, FALSE),
(1, 40, '2015-07-27', 66, 66, NULL, 6, 18, 22, 39, NULL, 1, 10, NULL, NULL, 1, 113, 2, 7.5, 100, NULL, 7.7, NULL, NULL, NULL, NULL, NULL, 1, FALSE),
(1, 41, '2015-07-27', 58, 58, NULL, 6, 18, 45, NULL, NULL, NULL, 9, NULL, 82, 0.6, 117.9, 2, 7.4, 50, NULL, 7.6, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 42, '2015-07-31', 58, 58, NULL, 6, 18, 18, NULL, NULL, NULL, 9, NULL, NULL, 0.3, 118, 2, 7.4, 100, NULL, 7.7, NULL, NULL, NULL, NULL, NULL, 25, FALSE),
(1, 43, '2015-07-31', 66, 66, NULL, 6, 18, 22, 39, NULL, 1, 10, NULL, NULL, 0, 152, 2, 8, 60, NULL, 8.1, NULL, NULL, NULL, NULL, NULL, 1, FALSE),
(1, 44, '2017-07-27', 35, 35, NULL, 6, 18, 22, 27, NULL, NULL, 9, NULL, NULL, 0.2, 58.1, 2, 7.2, 110, NULL, 7.6, NULL, NULL, NULL, NULL, NULL, 16, FALSE),
(1, 45, '2017-07-26', 35, 35, NULL, 6, 18, 22, 27, NULL, NULL, 9, NULL, NULL, 0.1, 80.8, 2, 7.4, 170, NULL, 7.5, NULL, NULL, NULL, NULL, NULL, 16, FALSE),
(1, 46, '2017-07-25', 58, 58, NULL, 6, 18, 22, 27, NULL, NULL, 8, NULL, NULL, 0.3, 52, 6, 7.8, 330, NULL, 7.5, NULL, NULL, NULL, NULL, NULL, 26, FALSE),
(1, 47, '2012-08-07', 31, 31, NULL, 7, NULL, NULL, NULL, NULL, NULL, 9, NULL, 23, 4.1, 35.7, 2, 5.8, 40, NULL, 5.6, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 48, '2013-07-31', 66, 66, NULL, 7, 12, 34, NULL, NULL, 3, 5, NULL, -1.7, NULL, 48.8, 2, 6, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 49, '2013-07-31', 66, 66, NULL, 7, 7, 13, NULL, NULL, 3, 5, NULL, -0.2, 1.1, 48.4, 2, 6, 160, NULL, 6.1, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 50, '2012-08-07', 30, 30, NULL, 7, 12, 37, 24, NULL, 3, 7, NULL, 10, 0, 41.4, 2, 7.9, 170, 5.5, 7.7, 440, 5.6, NULL, NULL, NULL, 15, FALSE),
(1, 51, '2013-07-25', 30, 30, NULL, 7, 12, 34, 25, NULL, 3, 5, NULL, -3.9, NULL, 43.8, 2, 7, 30, 11.5, 6.6, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 52, '2013-07-26', 30, 30, NULL, 7, 12, 34, NULL, NULL, 3, 5, NULL, -3.6, 0.2, 40.3, 2, 6.9, 260, NULL, 6.8, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 53, '2013-07-27', 30, 30, NULL, 7, 12, 34, NULL, NULL, 3, 5, NULL, -3.9, 2.3, 55, 2, 6.8, 70, NULL, 6.8, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 54, '2012-08-08', 31, 31, NULL, 7, 12, 34, NULL, NULL, 3, 7, NULL, -2.7, 5.6, 47.3, 2, NULL, NULL, NULL, 6.4, 60, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 55, '2013-07-31', 66, 66, NULL, 7, 12, 34, NULL, NULL, 3, 5, NULL, -2.7, 2.7, 40.7, 2, 5.8, 110, NULL, 6.2, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 56, '2014-07-26', 66, 66, NULL, 7, 12, 37, 24, NULL, 3, 5, NULL, -9, NULL, 32.3, 2, 6.2, 240, NULL, 6.1, NULL, NULL, NULL, NULL, NULL, 25, FALSE),
(1, 57, '2014-07-21', 66, 66, NULL, 7, 7, 13, NULL, NULL, 3, 5, NULL, -5.6, NULL, 31.4, 2, 5.7, 200, NULL, 5.8, NULL, NULL, NULL, NULL, NULL, 25, FALSE),
(1, 58, '2014-07-26', 16, 16, NULL, 7, 12, 34, NULL, NULL, 3, 5, NULL, -8.8, 2, 27.8, 2, 6, 130, NULL, 5.9, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 59, '2014-07-20', 66, 66, NULL, 7, 7, 13, 35, NULL, 3, 5, NULL, -1.1, 3.3, 29.4, 2, 5.9, 110, NULL, 5.8, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 60, '2014-07-21', 66, 66, NULL, 7, 7, 13, NULL, NULL, 3, 5, NULL, -3.6, 3.4, 26.1, 2, 5.8, 160, NULL, 5.8, NULL, NULL, NULL, NULL, NULL, 25, FALSE),
(1, 61, '2015-08-01', 58, 58, NULL, 7, 12, 26, NULL, NULL, 3, 6, NULL, 13, 2.2, 61.1, 2, 6.2, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 62, '2015-08-01', 66, 66, NULL, 7, 7, 13, NULL, NULL, 3, 5, NULL, 19, 3.6, 48.2, 2, 5.2, 60, NULL, 6.1, NULL, NULL, NULL, NULL, NULL, 25, FALSE),
(1, 63, '2015-08-01', 58, 58, NULL, 7, 7, 13, NULL, NULL, 3, 6, NULL, 28, 1.5, 53.9, 2, 5.9, 40, NULL, 6, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 64, '2015-07-30', 66, 66, NULL, 7, 12, 37, 24, NULL, 3, 7, NULL, 21.4, 2.2, 34.8, 2, 6, 230, NULL, 6, NULL, NULL, NULL, NULL, NULL, 25, FALSE),
(1, 65, '2015-07-30', 58, 58, NULL, 7, 12, 37, 24, NULL, 3, 6, NULL, 13.9, 1.5, 33.5, 2, 5.8, 130, NULL, 5.7, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 66, '2017-07-25', 35, 35, NULL, 7, 12, 37, 24, NULL, 3, 5, NULL, -13, 16.7, 20.9, 2, 5.6, 20, NULL, 5.4, NULL, NULL, 5.6, 30, NULL, 15, FALSE),
(1, 67, '2017-07-23', 35, 35, NULL, 7, 12, 37, 24, NULL, 3, 5, NULL, 13.3, 5.6, 27.8, 2, 6.8, 30, NULL, 5.9, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 68, '2017-07-30', 35, 35, NULL, 7, 12, 13, NULL, NULL, 3, 5, NULL, -0.3, 8.8, 41.6, 2, 6.5, 1660, NULL, 6.7, NULL, NULL, NULL, NULL, NULL, 24, FALSE),
(1, 69, '2017-07-30', 35, 35, NULL, 7, 12, 37, 24, NULL, 3, 5, NULL, 0.8, 13.2, 21.8, 2, 6.2, 1650, NULL, 6.3, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 70, '2012-08-06', 31, 31, NULL, 7, 12, 46, NULL, NULL, NULL, 9, NULL, 36, 5.9, 36.2, 2, 6.5, 170, NULL, 6.3, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 71, '2013-07-25', 66, 30, NULL, 7, 12, 46, NULL, NULL, 3, 7, NULL, 14, 4.7, 31.7, 2, 5.3, 190, NULL, 5.8, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 72, '2013-07-25', 52, 66, NULL, 7, 12, 46, NULL, NULL, NULL, 9, NULL, NULL, 6.3, 30.3, 2, 5, 50, NULL, 5.5, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 73, '2013-07-27', 30, 30, NULL, 7, 12, 36, 24, NULL, 3, 5, NULL, 1.7, 3.4, 31.4, 2, 6, 30, NULL, 6.2, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 74, '2012-08-08', 30, 30, NULL, 7, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, 5.2, 34.8, 2, NULL, 30, 7, NULL, 10, 6.9, NULL, NULL, NULL, 14, FALSE),
(1, 75, '2012-08-07', 31, 31, NULL, 7, NULL, NULL, NULL, NULL, 3, 7, NULL, 28, 3, 33.9, 2, 5.6, 80, NULL, 6.4, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 76, '2014-07-26', 16, 16, NULL, 7, 12, 34, NULL, NULL, NULL, 9, NULL, 17.6, 3.8, 26.2, 2, 5.7, 50, NULL, 5.2, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 77, '2014-07-21', 16, 16, NULL, 7, 12, 34, NULL, NULL, NULL, 9, NULL, 14.3, 3.5, 21.8, 2, 5.1, 20, NULL, 5.4, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 78, '2014-07-25', 66, 66, NULL, 7, 12, 34, 24, NULL, NULL, 9, NULL, 7.4, 6.6, 29.7, 2, 6.2, 90, NULL, 5.9, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 79, '2014-07-25', 16, 16, NULL, 7, 12, 46, NULL, NULL, NULL, 9, NULL, 15.5, 4.6, 28.4, 2, 5.3, 30, NULL, 5.5, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 80, '2014-07-21', 16, 16, NULL, 7, 12, 34, NULL, NULL, NULL, 9, NULL, 15.7, 3.3, 24, 2, 4.7, 30, NULL, 5, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 81, '2014-07-26', 66, 66, NULL, 7, 12, 34, NULL, NULL, NULL, 9, NULL, NULL, 4.8, 22.2, 2, 4.8, 40, NULL, 6.1, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 82, '2014-07-26', 16, 16, NULL, 7, 12, 34, NULL, NULL, NULL, 9, NULL, 11.1, 4.1, 24.1, 2, 5.1, 30, NULL, 5.1, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 83, '2015-07-28', 58, 58, NULL, 7, 12, 36, 24, NULL, NULL, 8, NULL, NULL, 5.5, 31.2, 2, 6.2, 40, NULL, 6.3, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 84, '2015-07-25', 66, 66, NULL, 7, 12, 36, 24, NULL, NULL, 9, NULL, NULL, 4, 31.1, 2, 5.4, 40, NULL, 5.4, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 85, '2015-07-24', 50, 58, NULL, 7, 12, 36, 24, NULL, NULL, 9, NULL, NULL, 5.8, 37.8, 2, 4.1, 160, NULL, 6.5, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 86, '2015-07-26', 58, 58, NULL, 7, 12, 36, 24, NULL, NULL, 9, NULL, NULL, 7.9, 48.3, 2, 4.6, 40, NULL, 5.2, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 87, '2017-07-25', 58, 58, NULL, 7, 12, 36, 24, NULL, 3, 7, NULL, 19, 4.2, 31.7, 2, 5.8, 50, NULL, 5.6, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 88, '2017-07-21', 35, 58, NULL, 7, 12, 36, 24, NULL, 3, 5, NULL, 28, 2.5, 50.5, 2, 5.2, 20, NULL, 5, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 89, '2017-07-21', 58, 58, NULL, 7, 12, 46, NULL, NULL, 3, 7, NULL, NULL, 4.7, 38, 2, 4.6, 40, NULL, 4.8, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 90, '2013-07-29', 30, 30, NULL, 7, 12, 44, NULL, NULL, 1, 11, NULL, NULL, 0, NULL, NULL, 7.2, 50, NULL, 8.4, NULL, NULL, NULL, NULL, NULL, 1, FALSE),
(1, 91, '2012-08-06', 30, 30, NULL, 7, 12, 32, NULL, NULL, NULL, 9, NULL, NULL, 0, NULL, NULL, 8.8, 80, 9, 8.7, 130, 8.5, NULL, NULL, NULL, NULL, FALSE),
(1, 92, '2013-07-29', 30, 30, NULL, 7, 12, 15, 39, NULL, 1, 11, NULL, NULL, 0, NULL, NULL, 8, 70, NULL, 8.2, NULL, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 93, '2013-07-26', 66, 66, NULL, 7, 12, 15, 39, NULL, 1, 11, NULL, NULL, 0, NULL, NULL, 8.7, 40, NULL, 8.7, NULL, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 94, '2013-07-26', 66, 66, NULL, 7, 12, 15, 39, NULL, 1, 10, NULL, NULL, 0, 100, 2, 8.5, 40, NULL, 8.5, NULL, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 95, '2014-07-20', 16, 16, NULL, 7, 12, 15, 39, NULL, NULL, 9, NULL, NULL, 0, NULL, NULL, 7.8, 10, NULL, 8.2, NULL, NULL, NULL, NULL, NULL, 1, FALSE),
(1, 96, '2014-07-20', 66, 66, NULL, 7, 12, 15, 39, NULL, 1, 10, NULL, NULL, 0, NULL, NULL, 7.7, 30, NULL, 7.7, NULL, NULL, NULL, NULL, NULL, 1, FALSE),
(1, 97, '2014-07-20', 66, 66, NULL, 7, 12, 15, 39, NULL, 1, 10, NULL, NULL, 0, NULL, NULL, 7.3, 30, NULL, 7.6, NULL, NULL, NULL, NULL, NULL, 1, FALSE),
(1, 98, '2015-07-28', 58, 58, NULL, 7, 12, 15, 39, NULL, 1, 10, NULL, NULL, 0, 146, 2, 7.1, 10, NULL, 7.1, NULL, NULL, NULL, NULL, NULL, 1, FALSE),
(1, 99, '2015-07-31', 66, 66, NULL, 7, 12, 15, 39, NULL, 1, 11, NULL, NULL, 0, 182, 2, 7.9, 20, NULL, 7.5, NULL, NULL, NULL, NULL, NULL, 1, FALSE),
(1, 100, '2015-07-31', 58, 58, NULL, 7, 12, 15, 39, NULL, NULL, 9, NULL, NULL, 0, NULL, NULL, 7.5, 10, NULL, 7.8, NULL, NULL, NULL, NULL, NULL, 1, FALSE),
(1, 101, '2015-08-01', 50, 50, NULL, 7, 12, 15, 39, NULL, 1, 10, NULL, NULL, 0, 145, 2, 7.9, 20, NULL, 7.8, 40, NULL, NULL, NULL, NULL, 1, FALSE),
(1, 102, '2012-08-03', 66, 66, NULL, NULL, 23, 43, 40, NULL, NULL, 9, NULL, NULL, 7.3, 38.9, 2, 5.6, 40, NULL, 5.4, NULL, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 103, '2012-08-03', 66, 66, NULL, NULL, 23, 43, NULL, NULL, NULL, 9, NULL, NULL, 7.7, 32, 2, 5.1, 80, NULL, 5.5, NULL, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 104, '2012-08-03', 30, 30, NULL, NULL, NULL, NULL, 40, NULL, 3, 7, NULL, 35, 6.9, 36, 2, 6.3, 20, 12.1, 6.3, 70, 10.5, NULL, NULL, NULL, NULL, FALSE),
(1, 105, '2013-07-28', 30, 30, NULL, NULL, 23, 46, 40, NULL, NULL, 9, NULL, NULL, 4.6, 31.8, 2, 5.8, 70, NULL, 5.7, 60, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 106, '2013-07-28', 30, 30, NULL, NULL, 23, 46, 40, NULL, NULL, 9, NULL, 19, 4.3, 35.8, 2, 5.7, 110, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 107, '2013-07-28', 52, 66, NULL, NULL, 23, 46, 40, NULL, NULL, 9, NULL, NULL, 10.7, 23.4, 2, 5.1, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 108, '2013-07-29', 66, 66, NULL, NULL, 23, 46, 40, NULL, 3, 5, NULL, -0.5, 6.6, 47.6, 2, 7.8, 30, NULL, 7.9, NULL, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 109, '2014-07-22', 16, 16, NULL, NULL, 23, 44, NULL, NULL, NULL, 9, NULL, NULL, 3.8, 34.1, 2, 5, 20, NULL, 5.9, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 110, '2014-07-27', 16, 16, NULL, NULL, 35, 34, NULL, NULL, NULL, 9, NULL, NULL, 4.8, 28.2, 2, 5.5, 20, NULL, 5.9, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 111, '2014-07-27', 66, 66, NULL, NULL, 23, 46, 40, NULL, NULL, 9, NULL, NULL, 6.1, 22.4, 2, 5.2, 60, NULL, 5.7, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 112, '2015-07-24', 50, 58, NULL, NULL, 35, 34, NULL, NULL, NULL, NULL, NULL, NULL, 7.8, 23.4, 2, 5.4, 50, NULL, 5.8, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 113, '2015-07-26', 66, 66, NULL, NULL, 23, 46, NULL, NULL, NULL, 9, NULL, NULL, 3.8, 33.2, 2, 6.1, 80, NULL, 5.4, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 114, '2017-07-27', 17, 17, NULL, NULL, 23, 46, NULL, NULL, 3, 7, NULL, NULL, 14.7, 21.7, 2, 5.3, 18, NULL, 5.6, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 115, '2017-07-22', 58, 58, NULL, NULL, 35, 34, 17, NULL, NULL, 9, NULL, NULL, 7.6, 21.8, 2, 5.9, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 116, '2017-07-26', 7, 7, NULL, NULL, 35, 34, NULL, NULL, 3, 7, NULL, NULL, 13.7, 26.2, 2, 4.7, 30, NULL, 5.2, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 117, '2012-08-04', 30, 30, NULL, NULL, 23, NULL, 9, NULL, NULL, 8, NULL, NULL, 6.1, 39.7, 2, 4.6, 40, 9.7, 4.8, 30, 9.6, NULL, NULL, NULL, 14, FALSE),
(1, 118, '2013-07-29', 66, 66, NULL, NULL, 23, 46, NULL, NULL, NULL, 9, NULL, 20, 7.3, 29.8, 2, 5.3, 50, NULL, 5.4, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 119, '2013-08-02', 66, 66, NULL, NULL, 23, 46, NULL, NULL, 3, 7, NULL, 15, 6.4, 30.5, 2, 6.2, 30, NULL, 6, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 120, '2013-08-01', 66, 66, NULL, NULL, 23, 46, NULL, NULL, 3, 7, NULL, NULL, 6.3, 31.7, 2, 6.2, 110, NULL, 6.8, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 121, '2013-08-01', 66, 66, NULL, NULL, 23, 45, NULL, NULL, 3, 7, NULL, 19, 7.5, 28.9, 2, 6.3, 70, NULL, 6.3, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 122, '2014-07-22', 66, 66, NULL, NULL, 35, 36, 24, NULL, NULL, 9, NULL, NULL, 7.4, 18.3, 2, 5.5, 80, NULL, 5.7, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 123, '2014-07-27', 16, 16, NULL, NULL, 23, 45, NULL, NULL, NULL, 9, NULL, NULL, 5.4, 23, 2, 6, 80, NULL, 6.2, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 124, '2014-07-27', 66, 66, NULL, NULL, 35, 34, NULL, NULL, NULL, 9, NULL, NULL, 3.8, 34.4, 2, 5.3, 80, NULL, 5.4, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 125, '2014-07-27', 66, 66, NULL, NULL, 35, 34, NULL, NULL, NULL, 9, NULL, NULL, 4, 28.5, 2, 5, 60, NULL, 5.1, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 126, '2012-08-03', 30, 30, NULL, NULL, 35, 36, 24, NULL, NULL, 9, NULL, NULL, 5.5, 28.2, 2, 7, 20, 14.1, 7.5, 20, 12.2, NULL, NULL, NULL, 15, FALSE),
(1, 127, '2015-07-25', 66, 66, NULL, NULL, 23, 46, NULL, NULL, NULL, 9, NULL, NULL, 4.8, 32.8, 2, 4.9, 70, NULL, 5.1, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 128, '2015-07-24', 66, 66, NULL, NULL, 23, 46, NULL, NULL, NULL, 9, NULL, NULL, 5.9, 31.6, 2, 5.8, 90, NULL, 5.3, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 129, '2015-07-26', 58, 58, NULL, NULL, 23, 45, NULL, NULL, NULL, 9, NULL, NULL, 5.4, 33.1, 2, 6.5, 70, NULL, 6.6, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 130, '2017-07-27', 35, 35, NULL, NULL, 35, 53, NULL, NULL, 3, 5, NULL, 10, 6.1, 40.4, 2, 7, 30, NULL, 6.5, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 131, '2017-07-26', 35, 35, NULL, NULL, 35, 53, NULL, NULL, 3, 7, NULL, NULL, 13.1, 27.8, 2, 5.3, 10, NULL, 7, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 132, '2013-07-28', 30, 30, NULL, 6, 35, 34, NULL, NULL, 3, 5, NULL, -5, NULL, 49.6, 2, 6.4, 70, NULL, 6.7, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 133, '2012-08-06', 30, 30, NULL, 6, 18, 37, 24, NULL, 3, 7, NULL, 4.4, 3.1, 40, 2, 6.4, 210, 9, 6.9, 100, 8.3, NULL, NULL, NULL, 15, FALSE),
(1, 134, '2013-08-01', 30, 30, NULL, 6, 7, 13, 35, NULL, 3, 5, NULL, 0, 1.8, 46.5, 2, 6, 40, NULL, 5.8, NULL, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 135, '2013-07-28', 52, 66, NULL, 6, 35, 46, 40, NULL, 3, 5, NULL, -2.4, 14.7, 50.4, 2, 5.5, 70, NULL, 5.6, NULL, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 136, '2013-08-01', 2, 66, NULL, 6, 35, 46, 40, NULL, 3, 5, NULL, 3.7, 10, 40.6, 2, 5.6, 80, NULL, 5.8, NULL, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 137, '2014-07-22', 16, 16, NULL, 6, 35, 34, NULL, NULL, 3, 5, NULL, -5, NULL, 36.6, 2, 6, 20, NULL, 6.4, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 138, '2014-07-22', 66, 66, NULL, 6, 35, 34, 40, NULL, 3, 5, NULL, -3.1, 5.3, 38.3, 2, 5.9, 130, NULL, 6.1, NULL, NULL, NULL, NULL, NULL, 25, FALSE),
(1, 139, '2014-07-27', 16, 16, NULL, 6, 35, 34, NULL, NULL, 3, 5, NULL, -6.3, 4.1, 39.8, 2, 5.7, 20, NULL, 5.9, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 140, '2014-07-22', 66, 66, NULL, 6, 18, 17, NULL, NULL, 3, 5, NULL, -5, NULL, 40.9, 2, 6.3, 130, NULL, 6.4, NULL, NULL, NULL, NULL, NULL, 25, FALSE),
(1, 141, '2012-07-31', 66, 66, NULL, 6, 35, 34, NULL, NULL, 3, 5, NULL, 2.8, 2.2, 47.5, 2, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 142, '2015-07-24', 66, 66, NULL, 6, 7, 13, NULL, NULL, 3, 5, NULL, 25, 4.3, 43.8, 2, 5.4, 60, NULL, 6.4, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 143, '2017-07-28', 35, 35, NULL, 6, 7, 37, 24, NULL, 3, 5, NULL, -8.9, 11.3, 24.4, 2, 6.9, 970, NULL, 6.4, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 144, '2017-07-28', 17, 17, NULL, 6, 7, 13, 22, NULL, 3, 5, NULL, -10.3, NULL, 36.7, 2, 5.7, 16, NULL, 6.3, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 145, '2014-07-28', 16, 16, NULL, 7, 12, 34, NULL, NULL, 3, 5, NULL, -12.4, 6.3, 48.5, 2, 6.3, 40, NULL, 6, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 146, '2014-07-28', 16, 16, NULL, 7, 12, 34, 22, NULL, 3, 5, NULL, -8.8, 7.6, 33.3, 2, 6, 40, NULL, 5.1, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 147, '2014-07-28', 66, 66, NULL, 7, 7, 37, 24, NULL, 3, 5, NULL, -9.6, NULL, 39.1, 2, 6.2, 200, NULL, 6, NULL, NULL, NULL, NULL, NULL, 25, FALSE),
(1, 148, '2014-07-24', 16, 16, NULL, 7, 12, 34, NULL, NULL, 3, 7, NULL, -6.8, NULL, 35.5, 2, 6.3, 10, NULL, 5.9, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 149, '2014-07-28', 16, 16, NULL, 7, 12, 34, NULL, NULL, 3, 5, NULL, -6, 4.7, 29.7, 2, 5.4, 40, NULL, 5.3, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 150, '2014-07-28', 66, 66, NULL, 7, 12, 46, 40, NULL, 3, 5, NULL, -3.8, 4.2, 30.3, 2, 6.2, 80, NULL, 5.6, NULL, NULL, NULL, NULL, NULL, 3, FALSE),
(1, 151, '2015-07-28', 58, 58, NULL, 7, 7, 39, 24, NULL, 3, 6, NULL, 18.4, 2.5, 37.3, 2, 6.2, 70, NULL, 6, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 152, '2015-07-27', 66, 66, NULL, 7, 7, 37, 24, NULL, 3, 5, NULL, 0, 1.1, 42.3, 2, 6.3, 90, NULL, 6.4, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 153, '2015-07-27', 58, 58, NULL, 7, 12, 26, 24, NULL, 3, 5, NULL, -1.6, 2.4, 43.2, 2, 6.5, 90, NULL, 6.2, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 154, '2015-07-31', 66, 66, NULL, 7, 7, 37, 24, NULL, 3, 5, NULL, 28, 1.9, 55.5, 2, 6.1, 120, NULL, 6.7, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 155, '2015-07-31', 58, 58, NULL, 7, 12, 44, NULL, NULL, 3, 6, NULL, NULL, 1.1, 42, 2, 5.2, 100, NULL, 6.2, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 156, '2014-07-19', 66, 16, NULL, 7, 12, 40, NULL, NULL, 3, 7, NULL, 23, 3.1, 33.2, 2, 4.2, 250, NULL, 4.7, NULL, NULL, NULL, NULL, NULL, 1, FALSE),
(1, 157, '2014-07-19', 16, 16, NULL, 7, 12, 37, 24, NULL, NULL, 9, NULL, 15, 4.8, 22.1, 2, 5, 60, NULL, 5.7, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 158, '2014-07-24', 66, 66, NULL, 7, 12, 46, NULL, NULL, NULL, 9, NULL, 10, 6.1, 22.8, 2, 5.3, 50, NULL, 5.5, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 159, '2014-07-19', 66, 66, NULL, 7, 12, 40, NULL, NULL, NULL, 8, NULL, NULL, 3.7, 36.5, 2, 4.1, 30, NULL, 4.7, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 160, '2014-07-29', 16, 16, NULL, 7, 12, 45, NULL, NULL, NULL, 9, NULL, 41, 3, 55.4, 2, 4.2, 20, NULL, 4.8, NULL, NULL, NULL, NULL, NULL, 14, FALSE),
(1, 161, '2014-07-29', 66, 66, NULL, 7, 12, 40, NULL, NULL, 1, 10, NULL, NULL, 2.3, 54.5, 2, 4.2, 20, NULL, 5.2, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 162, '2015-07-28', 58, 58, NULL, 7, 12, 46, NULL, NULL, NULL, 9, NULL, NULL, 5.6, 30.4, 2, 5.4, 30, NULL, 6.1, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 163, '2015-07-28', 66, 66, NULL, 7, 12, 45, NULL, NULL, NULL, 9, NULL, NULL, 6.9, 30, 2, 4.8, 60, NULL, 5.6, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 164, '2015-07-23', 50, 58, NULL, 7, 12, 44, NULL, NULL, NULL, 9, NULL, NULL, 6.9, 27.1, 2, 5.3, 50, NULL, 5.7, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 165, '2015-07-23', 66, 66, NULL, 7, 12, 45, NULL, NULL, NULL, 9, NULL, NULL, 6, 24.7, 2, 6.1, 60, NULL, 6.2, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 166, '2015-07-31', 58, 58, NULL, 7, 12, 45, NULL, NULL, NULL, 9, NULL, NULL, 4.7, 35.2, 2, 5.9, 30, NULL, 6, NULL, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 167, '2012-08-05', 30, 30, NULL, 7, 12, 51, NULL, NULL, 3, 7, NULL, 31.7, 0, 49.9, 2, 7, 2500, 13.6, 6.9, 4500, 9.3, NULL, NULL, NULL, 20, FALSE),
(1, 168, '2012-08-05', 31, 31, NULL, 7, 12, 51, NULL, NULL, 3, 7, NULL, 22, 0, 77.6, 6, 6.9, 1080, NULL, 6.9, NULL, NULL, NULL, NULL, NULL, 20, FALSE),
(1, 169, '2012-08-07', 31, 31, NULL, 7, 12, 13, NULL, NULL, 3, 5, NULL, 10, 0.1, 41.5, 2, 6.2, 80, NULL, 6.8, NULL, NULL, NULL, 510, NULL, NULL, FALSE),
(1, 170, '2013-07-26', 30, 30, NULL, 7, 34, 51, NULL, NULL, NULL, 9, NULL, 40, 0, 59.6, 2, 7.6, 1840, 13.2, 7.9, NULL, NULL, NULL, NULL, NULL, NULL, FALSE),
(1, 171, '2012-08-05', 30, 30, NULL, 7, 12, 51, NULL, NULL, 3, 7, NULL, 13.4, 0, 63.8, 2, 7, 4000, 11.3, 7.3, 5600, 11.3, NULL, NULL, NULL, 20, FALSE),
(1, 172, '2013-07-26', 30, 30, NULL, 7, 34, 51, 24, NULL, 3, 5, NULL, 7.1, 0, 52.8, 2, 7.9, 1570, NULL, 7.9, NULL, NULL, NULL, NULL, NULL, 20, FALSE),
(1, 173, '2014-07-25', 16, 16, NULL, 7, 34, 51, NULL, NULL, 3, 5, NULL, -9.4, 0, 36.6, 2, 6.9, 270, NULL, 6.6, NULL, NULL, NULL, NULL, NULL, 25, FALSE),
(1, 174, '2014-07-25', 66, 66, NULL, 7, 34, 51, NULL, NULL, 3, 5, NULL, 24.6, 1.5, 36.8, 2, 6.8, 260, NULL, 6.8, NULL, NULL, NULL, NULL, NULL, 25, FALSE),
(1, 175, '2014-07-25', 66, 66, NULL, 7, 12, 51, NULL, NULL, 3, 5, NULL, -1, NULL, 31.2, 2, 6.8, 500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, FALSE),
(1, 176, '2014-07-25', 16, 16, NULL, 7, 34, 51, NULL, NULL, 3, 7, NULL, 19, 1.5, 61.6, 2, 7, 580, NULL, 6.6, NULL, NULL, NULL, NULL, NULL, 25, FALSE),
(1, 177, '2012-08-07', 30, 30, NULL, 7, 12, 51, NULL, NULL, 3, 5, NULL, -14.7, 0.8, 32.4, 2, 7.4, 480, 7.1, 7.2, 1070, 5.6, NULL, NULL, NULL, 20, FALSE),
(1, 178, '2015-07-30', 58, 58, NULL, 7, 12, 39, 24, NULL, NULL, 8, NULL, NULL, 2.5, 38.4, 2, 4.7, 3100, NULL, 4.9, 4700, NULL, NULL, NULL, NULL, 15, FALSE),
(1, 179, '2015-07-30', 58, 58, NULL, 7, 34, 51, NULL, NULL, NULL, 8, NULL, NULL, 0.4, 58.6, 2, 6.6, 4900, NULL, 6.6, NULL, NULL, NULL, NULL, NULL, 20, FALSE),
(1, 180, '2015-07-30', 66, 66, NULL, 7, 34, 51, 24, NULL, NULL, NULL, NULL, NULL, 0.2, 39.6, 2, 7.1, 6700, NULL, 6.8, 4700, NULL, NULL, NULL, NULL, 20, FALSE),
(1, 181, '2015-07-30', 58, 58, NULL, 7, 34, 51, NULL, NULL, NULL, 9, NULL, NULL, 0.2, 36.3, 2, 5.7, 770, NULL, 6.4, NULL, NULL, NULL, NULL, NULL, 20, FALSE),
(1, 182, '2015-07-30', 66, 66, NULL, 7, 34, 36, 24, NULL, NULL, 8, NULL, NULL, 2, 32.7, 2, 5.9, 190, NULL, 6.6, NULL, NULL, NULL, 450, NULL, 20, FALSE),
(1, 183, '2017-07-30', 17, 17, NULL, 7, 34, 36, 24, NULL, 3, 5, NULL, 2.8, 0, 79.1, 2, 7.3, 1594, NULL, 6.9, NULL, NULL, NULL, NULL, NULL, 25, FALSE),
(1, 184, '2017-07-30', 35, 35, NULL, 7, 34, 51, NULL, NULL, 3, 5, NULL, 3.5, 5.7, 84.1, 2, 7.4, 1780, NULL, 7, 978, NULL, NULL, NULL, NULL, 25, FALSE),
(1, 185, '2017-07-30', 17, 17, NULL, 7, 34, 51, NULL, NULL, 3, 5, NULL, 7.9, 0, 65.2, 2, 7.3, 640, NULL, 7.2, NULL, NULL, NULL, NULL, NULL, 25, FALSE);

-- Commit transaction
COMMIT TRANSACTION;
