-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert site data for accsColville_2015
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-05
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert site data" pushes the site data for the specified project into the site table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert site data into site table
INSERT INTO site (siteID, siteCode, projectID, perspectiveID, coverMethodID, scopeVascularID, scopeBryophyteID, scopeLichenID, plotDimensionsID, datumID, latitude, longitude, error) VALUES
(186, 'S1L1V01', 2, 1, 3, 1, 5, 5, 41, 1, 69.00548, -158.26443, 3),
(187, 'S1L2V02', 2, 1, 3, 1, 5, 5, 41, 1, 69.00806, -158.26649, 3),
(188, 'S1L3V03', 2, 1, 3, 1, 5, 5, 41, 1, 69.00917, -158.26912, 3),
(189, 'S2L1V04', 2, 1, 3, 1, 5, 5, 41, 1, 68.89871, -156.45634, 3),
(190, 'S2L1V05', 2, 1, 3, 1, 5, 5, 41, 1, 68.89954, -156.45941, 3),
(191, 'S2L2V06', 2, 1, 3, 1, 5, 5, 41, 1, 68.89758, -156.47171, 3),
(192, 'S2L3V07', 2, 1, 3, 1, 5, 5, 41, 1, 68.90283, -156.44005, 3),
(193, 'S3L3V08', 2, 1, 3, 1, 5, 5, 41, 1, 69.06385, -154.24757, 3),
(194, 'S3L2V09', 2, 1, 3, 1, 5, 5, 41, 1, 69.06095, -154.24036, 3),
(195, 'S3L1V10', 2, 1, 3, 1, 5, 5, 41, 1, 69.05948, -154.24371, 3),
(196, 'S4L3V11', 2, 1, 3, 1, 5, 5, 41, 1, 69.18528, -153.16077, 3),
(197, 'S4L2V12', 2, 1, 3, 1, 5, 5, 41, 1, 69.18419, -153.15729, 3),
(198, 'S4L1V13', 2, 1, 3, 1, 5, 5, 41, 1, 69.18361, -153.15244, 3),
(199, 'S5L1V14', 2, 1, 3, 1, 5, 5, 41, 1, 69.37106, -152.14661, 3),
(200, 'S5L3V15', 2, 1, 3, 1, 5, 5, 41, 1, 69.36888, -152.15413, 3),
(201, 'S5L2V16', 2, 1, 3, 1, 5, 5, 41, 1, 69.36423, -152.12624, 3);

-- Commit transaction
COMMIT TRANSACTION;
