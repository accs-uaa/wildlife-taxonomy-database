-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Insert site data for accsRibdon_2019
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-11-05
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Insert site data" pushes the site data for the specified project into the site table of the database.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Insert site data into site table
INSERT INTO site (siteID, siteCode, projectID, perspectiveID, coverMethodID, scopeVascularID, scopeBryophyteID, scopeLichenID, plotDimensionsID, datumID, latitude, longitude, error) VALUES
(2181, 'RIBD2019-001', 18, 1, 2, 1, 3, 3, 41, 1, 68.49509, -147.85661, 3),
(2182, 'RIBD2019-002', 18, 1, 2, 1, 3, 3, 41, 1, 68.48496, -147.83641, 3),
(2183, 'RIBD2019-003', 18, 1, 2, 1, 3, 3, 41, 1, 68.4999, -147.86201, 3),
(2184, 'RIBD2019-004', 18, 1, 2, 1, 3, 3, 41, 1, 68.50087, -147.85338, 3),
(2185, 'RIBD2019-005', 18, 1, 2, 1, 3, 3, 41, 1, 68.50279, -147.86511, 3),
(2186, 'RIBD2019-006', 18, 1, 2, 1, 3, 3, 41, 1, 68.50454, -147.86853, 3),
(2187, 'RIBD2019-007', 18, 1, 2, 1, 3, 3, 41, 1, 68.7085, -148.52647, 3),
(2188, 'RIBD2019-008', 18, 1, 2, 1, 3, 3, 41, 1, 68.71032, -148.52406, 3),
(2189, 'INIG2019-001', 18, 1, 2, 1, 3, 3, 41, 1, 69.99838, -153.099239, 3),
(2190, 'INIG2019-002', 18, 1, 2, 1, 3, 3, 41, 1, 69.99675, -153.121636, 3);

-- Commit transaction
COMMIT TRANSACTION;
