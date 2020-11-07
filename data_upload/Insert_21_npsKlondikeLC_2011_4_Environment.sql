-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert environment data for npsKlondikeLC_2011
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-06
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert environment data" pushes the environment data for the specified project into the environment table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert environment data into environment table
INSERT INTO environment (projectID, siteID, envObserveDate, envObserverID, soilObserverID, strataID, physiographyID, geomorphologyID, macrotopographyID, microtopographyID, microrelief, drainageID, moistureID, soilClassID, depthWater, depthMossDuff, depthRestrictiveLayer, restrictiveTypeID, soilPH10, conductivity10, temperature10, soilPH30, conductivity30, temperature30, waterPH, waterConductivity, waterTemperature, disturbanceID, homogenous) VALUES
(21, 3284, '2011-08-21', 46, NULL, 26, 7, 35, 52, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3285, '2011-08-21', 46, NULL, 12, 7, 35, 7, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, TRUE),
(21, 3286, '2011-08-21', 46, NULL, 9, 7, 35, 7, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, TRUE),
(21, 3287, '2011-08-22', 60, NULL, 26, 7, 16, 53, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3288, '2011-08-22', 60, NULL, 9, 7, 35, 52, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, TRUE),
(21, 3289, '2011-08-22', 60, NULL, 9, 7, 35, 52, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3290, '2011-08-22', 60, NULL, 12, 7, 35, 52, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3291, '2011-08-22', 60, NULL, 12, 7, 35, 52, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3292, '2011-08-22', 46, NULL, 9, 7, 35, 52, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, TRUE),
(21, 3293, '2011-08-22', 60, NULL, 9, 5, 18, 17, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, TRUE),
(21, 3294, '2011-08-22', 46, NULL, 9, 7, 35, 35, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, TRUE),
(21, 3295, '2011-08-22', 60, NULL, 26, 7, 16, 53, NULL, NULL, 5, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3296, '2011-08-22', 60, NULL, 9, 7, 16, 53, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3297, '2011-08-22', 60, NULL, 9, 7, 35, 35, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3298, '2011-08-22', 60, NULL, 20, 6, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3299, '2011-08-22', 60, NULL, 20, 6, 42, 35, NULL, NULL, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, TRUE),
(21, 3300, '2011-08-09', 81, NULL, 9, 7, 18, 23, NULL, NULL, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3301, '2011-08-09', 81, NULL, 12, 7, 18, 23, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3302, '2011-08-09', 81, NULL, 9, 7, 16, 53, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3303, '2011-08-09', 81, NULL, 9, 7, 35, 35, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3304, '2011-08-09', 81, NULL, 9, 7, 35, 35, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, TRUE),
(21, 3305, '2011-08-21', 46, NULL, 20, 7, 35, 35, NULL, NULL, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3306, '2011-08-21', 46, NULL, 18, 10, 18, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, TRUE),
(21, 3307, '2011-08-21', 46, NULL, 28, 10, 16, 53, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3308, '2011-08-21', 46, NULL, 20, 6, 42, 35, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, TRUE),
(21, 3309, '2011-08-21', 46, NULL, 20, 6, 42, 35, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, TRUE),
(21, 3310, '2011-08-20', 60, NULL, 18, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3311, '2011-08-20', 60, NULL, 18, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3312, '2011-08-20', 46, NULL, 18, 3, 34, 44, NULL, NULL, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3313, '2011-08-20', 46, NULL, 18, 6, 42, 35, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3314, '2011-08-20', 46, NULL, 18, 6, 42, 35, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3315, '2011-08-20', 46, NULL, 15, 6, 42, 35, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3316, '2011-08-20', 60, NULL, 4, 6, 42, 35, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3317, '2011-08-20', 60, NULL, 4, 6, 42, 35, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, TRUE),
(21, 3318, '2011-08-20', 81, NULL, 18, 10, 18, 23, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, TRUE),
(21, 3319, '2011-08-20', 81, NULL, 18, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, TRUE),
(21, 3320, '2011-08-20', 81, NULL, 25, 10, 18, 23, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, TRUE),
(21, 3321, '2011-08-20', 81, NULL, 4, 10, 18, 23, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, TRUE),
(21, 3322, '2011-08-20', 81, NULL, 18, 10, 18, 23, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3323, '2011-08-20', 81, NULL, 4, 10, 18, 23, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3324, '2011-08-20', 81, NULL, 4, 10, 18, 23, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3325, '2011-08-20', 81, NULL, 25, 10, 18, 23, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3326, '2011-08-20', 81, NULL, 4, 10, 18, 23, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3327, '2011-08-18', 46, NULL, 18, 6, 18, 17, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3328, '2011-08-18', 46, NULL, 18, 6, 18, 17, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3329, '2011-08-18', 46, NULL, 18, 6, 18, 17, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3330, '2011-08-18', 46, NULL, 20, 6, 18, 17, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3331, '2011-08-18', 46, NULL, 4, 10, 18, 23, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3332, '2011-08-18', 46, NULL, 18, 10, 18, 23, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3333, '2011-08-18', 46, NULL, 18, 6, 18, 17, NULL, NULL, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3334, '2011-08-18', 46, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3335, '2011-08-19', 46, NULL, 18, 6, 42, 35, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3336, '2011-08-19', 46, NULL, 18, 6, 18, 17, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3337, '2011-08-19', 46, NULL, 18, 6, 42, 35, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3338, '2011-08-19', 46, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3339, '2011-08-19', 46, NULL, 18, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3340, '2011-08-17', 46, NULL, 18, 10, 18, 23, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3341, '2011-08-17', 46, NULL, 20, 6, 18, 17, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, TRUE),
(21, 3342, '2011-08-17', 46, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3343, '2011-08-17', 60, NULL, 18, 6, 18, 17, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3344, '2011-08-17', 60, NULL, 20, 5, 23, 49, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3345, '2011-08-16', 81, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3346, '2011-08-16', 81, NULL, 4, 10, 18, 23, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3347, '2011-08-16', 81, NULL, 4, 10, 18, 23, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3348, '2011-08-16', 81, NULL, 18, 10, 18, 23, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3349, '2011-08-16', 81, NULL, 18, 10, 18, 23, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3350, '2011-08-16', 81, NULL, 4, 10, 18, 23, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3351, '2011-08-16', 46, NULL, 20, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3352, '2011-08-16', 46, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3353, '2011-08-16', 46, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3354, '2011-08-16', 46, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, TRUE),
(21, 3355, '2011-08-16', 46, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3356, '2011-08-11', 46, NULL, 20, 3, 34, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3357, '2011-08-11', 46, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3358, '2011-08-11', 46, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3359, '2011-08-11', 46, NULL, 20, 6, 18, 17, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3360, '2011-08-12', 46, NULL, 25, 3, 13, 11, 7, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, TRUE),
(21, 3361, '2011-08-12', 46, NULL, 4, 6, 18, 17, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3362, '2011-08-12', 46, NULL, 20, 3, 13, 11, 7, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, TRUE),
(21, 3363, '2011-08-12', 46, NULL, 18, 3, 13, 44, 7, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, TRUE),
(21, 3364, '2011-08-12', 46, NULL, 18, 6, 18, 17, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3365, '2011-08-12', 46, NULL, 4, 10, 18, 23, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3366, '2011-08-12', 81, NULL, 4, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, TRUE),
(21, 3367, '2011-08-12', 81, NULL, 2, 1, 34, 44, 34, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, TRUE),
(21, 3368, '2011-08-12', 81, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, TRUE),
(21, 3369, '2011-08-12', 81, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, TRUE),
(21, 3370, '2011-08-12', 81, NULL, 20, 1, 13, 44, 2, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3371, '2011-08-12', 81, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, TRUE),
(21, 3372, '2011-08-12', 81, NULL, 18, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, TRUE),
(21, 3373, '2011-08-12', 81, NULL, 18, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3374, '2011-08-12', 81, NULL, 25, 10, 18, 23, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3375, '2011-08-15', 81, NULL, 25, 5, NULL, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3376, '2011-08-15', 81, NULL, 2, 3, 13, 11, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, TRUE),
(21, 3377, '2011-08-15', 46, NULL, 25, 3, 34, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3378, '2011-08-15', 81, NULL, 4, 6, 42, 35, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3379, '2011-08-15', 46, NULL, 20, 6, 42, 35, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3380, '2011-08-15', 81, NULL, 20, 5, 23, 41, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3381, '2011-08-15', 46, NULL, 20, 3, 34, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3382, '2011-08-15', 81, NULL, 25, 10, 18, 23, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3383, '2011-08-15', 46, NULL, 4, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3384, '2011-08-14', 81, NULL, 7, 1, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3385, '2011-08-14', 81, NULL, 7, 10, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3386, '2011-08-14', 81, NULL, 2, 10, 18, 18, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3387, '2011-08-14', 81, NULL, 20, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3388, '2011-08-14', 81, NULL, 25, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, TRUE),
(21, 3389, '2011-08-14', 81, NULL, 20, 3, 34, 41, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, TRUE),
(21, 3390, '2011-08-14', 81, NULL, 7, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3391, '2011-08-14', 81, NULL, 7, 3, 34, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3392, '2011-08-14', 81, NULL, 7, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3393, '2011-08-14', 81, NULL, 7, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, TRUE),
(21, 3394, '2011-08-14', 46, NULL, 7, 6, 42, 35, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3395, '2011-08-14', 46, NULL, 9, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3396, '2011-08-14', 46, NULL, 7, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3397, '2011-08-14', 46, NULL, 7, 3, 34, 44, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, TRUE),
(21, 3398, '2011-08-14', 46, NULL, 7, 10, 18, 23, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, TRUE),
(21, 3399, '2011-08-14', 46, NULL, 25, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3400, '2011-08-14', 46, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3401, '2011-08-14', 46, NULL, 7, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3402, '2011-08-13', 46, NULL, 7, 1, 34, 43, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3403, '2011-08-13', 46, NULL, 7, 1, 34, 8, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3404, '2011-08-15', 46, NULL, 7, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, TRUE),
(21, 3405, '2011-08-13', 81, NULL, 7, 1, 34, 41, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3406, '2011-08-13', 81, NULL, 7, 1, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3407, '2011-08-13', 81, NULL, 7, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3408, '2011-08-13', 81, NULL, 7, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3409, '2011-08-21', 81, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3410, '2011-08-21', 81, NULL, 20, 3, 34, 8, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3411, '2011-08-21', 81, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3412, '2011-08-21', 81, NULL, 20, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3413, '2011-08-21', 81, NULL, 20, 6, 42, 35, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3414, '2011-08-21', 81, NULL, 18, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, TRUE),
(21, 3415, '2011-08-21', 81, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3416, '2011-08-18', 81, NULL, 20, 1, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3417, '2011-08-18', 81, NULL, 20, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3418, '2011-08-18', 81, NULL, 7, 1, 34, 45, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3419, '2011-08-18', 81, NULL, 20, 1, 34, 45, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3420, '2011-08-18', 81, NULL, 7, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3421, '2011-08-18', 81, NULL, 20, 3, 34, 45, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3422, '2011-08-18', 81, NULL, 7, 3, 34, 46, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3423, '2011-08-18', 81, NULL, 28, 10, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3424, '2011-08-18', 81, NULL, 28, 5, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3425, '2011-08-19', 81, NULL, 9, 10, 18, 23, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3426, '2011-08-19', 81, NULL, 20, 6, 42, 35, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3427, '2011-08-19', 81, NULL, 28, 10, 18, 23, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3428, '2011-08-19', 81, NULL, 20, 3, 34, 46, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3429, '2011-08-19', 81, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3430, '2011-08-19', 81, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3431, '2011-08-19', 81, NULL, 7, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3432, '2011-08-19', 81, NULL, 28, 5, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3433, '2011-08-19', 81, NULL, 7, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, TRUE),
(21, 3434, '2011-08-19', 81, NULL, 25, 6, 42, 35, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3435, '2011-08-19', 81, NULL, 7, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3436, '2011-08-22', 81, NULL, 20, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3437, '2011-08-22', 81, NULL, 25, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, TRUE),
(21, 3438, '2011-08-22', 81, NULL, 25, 6, 42, 35, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3439, '2011-08-22', 81, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3440, '2011-08-22', 81, NULL, 7, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3441, '2011-08-22', 81, NULL, 20, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3442, '2011-08-11', 81, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, TRUE),
(21, 3443, '2011-08-11', 81, NULL, 20, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, TRUE),
(21, 3444, '2011-08-11', 81, NULL, 20, 3, 34, 8, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3445, '2011-08-11', 81, NULL, 20, 6, 42, 35, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3446, '2011-08-11', 81, NULL, 18, 10, 18, 23, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3447, '2011-08-11', 81, NULL, 18, 10, 18, 23, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, TRUE),
(21, 3448, '2011-08-11', 81, NULL, 18, 6, 18, 17, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3449, '2011-08-11', 81, NULL, 20, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3450, '2011-08-11', 81, NULL, 18, 6, 18, 17, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, TRUE),
(21, 3451, '2011-08-16', 81, NULL, 20, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3452, '2011-08-17', 81, NULL, 18, 3, 34, 44, 3, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3453, '2011-08-17', 81, NULL, 18, 3, 34, 46, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3454, '2011-08-17', 81, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3455, '2012-07-11', 81, NULL, 7, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3456, '2012-07-11', 81, NULL, 7, 3, 34, 44, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3457, '2012-07-11', 81, NULL, 7, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3458, '2012-07-11', 81, NULL, 7, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, TRUE),
(21, 3459, '2012-07-11', 81, NULL, 7, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, TRUE),
(21, 3460, '2012-07-11', 81, NULL, 7, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3461, '2012-07-11', 81, NULL, 7, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3462, '2012-07-12', 81, NULL, 18, 3, 34, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE),
(21, 3463, '2012-07-13', 81, NULL, 20, 3, 34, 44, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, TRUE);

-- Commit transaction
COMMIT TRANSACTION;