-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Create amphibians & reptiles checklist
-- Author: Timm Nawrocki and Amanda Droghini, Alaska Center for Conservation Science
-- Last Updated:  2021-06-09
-- Usage: Script should be executed in a MySQL 5.6+ database.
-- Description: "Create amphibians & reptiles checklist" pushes data from an amphibians & reptiles checklist export into the web database server.
-- ---------------------------------------------------------------------------

-- Drop amphibian and reptile checklist and create new version
DROP TABLE IF EXISTS `amphibians_reptiles_checklist`;
CREATE TABLE `amphibians_reptiles_checklist` (
`name_id` int(5) NOT NULL,
`name` varchar(255) NOT NULL,
`status` varchar(30) NOT NULL,
`name_accepted` varchar(255) NOT NULL,
`family` varchar(80) NOT NULL,
`order` varchar(30) NOT NULL,
`class` varchar(10) NOT NULL
`source` varchar(255) NOT NULL,
`level` varchar(30) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Insert data into amphibians & reptiles checklist
INSERT INTO `amphibians_reptiles_checklist` (`name_id`, `name`, `status`, `name_accepted`, `family`, `order`, `class`, `source`, `level`) VALUES
(1, '<i>Anaxyrus boreas</i> ', 'accepted', '<i>Anaxyrus boreas</i> ', 'Bufonidae', 'Anura', 'Amphibia', NULL, 'species'),
(2, '<i>Boreas boreas</i> ', 'synonym', '<i>Anaxyrus boreas</i> ', 'Bufonidae', 'Anura', 'Amphibia', NULL, 'species'),
(3, '<i>Bufo boreas</i> ', 'synonym', '<i>Anaxyrus boreas</i> ', 'Bufonidae', 'Anura', 'Amphibia', NULL, 'species'),
(4, '<i>Pseudacris regilla</i> ', 'accepted', '<i>Pseudacris regilla</i> ', 'Hylidae', 'Anura', 'Amphibia', NULL, 'species'),
(5, '<i>Lithobates sylvaticus</i> ', 'accepted', '<i>Lithobates sylvaticus</i> ', 'Ranidae', 'Anura', 'Amphibia', NULL, 'species'),
(9, '<i>Rana sylvatica</i> ', 'synonym', '<i>Lithobates sylvaticus</i> ', 'Ranidae', 'Anura', 'Amphibia', NULL, 'species'),
(6, '<i>Rana aurora</i> ', 'accepted', '<i>Rana aurora</i> ', 'Ranidae', 'Anura', 'Amphibia', NULL, 'species'),
(7, '<i>Rana luteiventris</i> ', 'accepted', '<i>Rana luteiventris</i> ', 'Ranidae', 'Anura', 'Amphibia', NULL, 'species'),
(8, '<i>Rana pretiosa</i> ', 'synonym', '<i>Rana luteiventris</i> ', 'Ranidae', 'Anura', 'Amphibia', NULL, 'species'),
(10, '<i>Ambystoma gracile</i> ', 'accepted', '<i>Ambystoma gracile</i> ', 'Ambystomatidae', 'Caudata', 'Amphibia', NULL, 'species'),
(11, '<i>Ambystoma macrodactylum</i> ', 'accepted', '<i>Ambystoma macrodactylum</i> ', 'Ambystomatidae', 'Caudata', 'Amphibia', NULL, 'species'),
(12, '<i>Taricha granulosa</i> ', 'accepted', '<i>Taricha granulosa</i> ', 'Salamandridae', 'Caudata', 'Amphibia', NULL, 'species'),
(884, '<i>Caretta caretta</i> ', 'accepted', '<i>Caretta caretta</i> ', 'Chelonidae', 'Testudines', 'Reptilia', NULL, 'species'),
(885, '<i>Chelonia mydas</i> ', 'accepted', '<i>Chelonia mydas</i> ', 'Chelonidae', 'Testudines', 'Reptilia', NULL, 'species'),
(886, '<i>Lepidochelys olivacea</i> ', 'accepted', '<i>Lepidochelys olivacea</i> ', 'Chelonidae', 'Testudines', 'Reptilia', NULL, 'species'),
(887, '<i>Dermochelys coriacea</i> ', 'accepted', '<i>Dermochelys coriacea</i> ', 'Dermochelyidae', 'Testudines', 'Reptilia', NULL, 'species');

-- Commit transaction
COMMIT;
