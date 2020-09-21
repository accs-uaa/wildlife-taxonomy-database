-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Build environment tables
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-09-20
-- Usage: Script should be executed in a MySQL 5.6+.
-- Description: "Build environment tables" creates the empty tables for the environment components of the AKVEG database. WARNING: THIS SCRIPT WILL ERASE ALL DATA IN EXISTING ENVIRONMENT TABLES.
-- ---------------------------------------------------------------------------

-- Disable foreign key checks
SET foreign_key_checks = 0;

-- Drop environment tables if they exist
DROP TABLE IF EXISTS `environment`,
    `disturbance`,
    `disturbanceType`,
    `geomorphology`,
    `macrotopography`,
    `microtopography`,
    `moisture`,
    `physiography`,
    `restrictiveType`,
    `soilClass`,
    `stratification`;

-- Create constraint tables
CREATE TABLE `disturbanceType` (
    `disturbanceTypeID` int(2) NOT NULL,
    `disturbanceType` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `disturbance` (
    `disturbanceID` int(3) NOT NULL,
    `disturbanceTypeID` int(2) NOT NULL,
    `disturbance` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `drainage` (
    `drainageID` int(2) NOT NULL,
    `drainage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `geomorphology` (
    `geomorphologyID` int(3) NOT NULL,
    `geomorphology` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `macrotopography` (
    `macrotopographyID` int(3) NOT NULL,
    `macrotopography` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `microtopography` (
    `microtopographyID` int(3) NOT NULL,
    `microtopography` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `moisture` (
    `moistureID` int(3) NOT NULL,
    `moisture` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `physiography` (
    `physiographyID` int(3) NOT NULL,
    `physiography` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `restrictiveType` (
    `restrictiveTypeID` int(3) NOT NULL,
    `restrictiveType` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `soilClass` (
    `soilClassID` int(3) NOT NULL,
    `soilClass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `stratification` (
    `strataID` int(3) NOT NULL,
    `strata` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Set key values for constraints
ALTER TABLE `disturbanceType`
    ADD PRIMARY KEY (`disturbanceTypeID`),
    ADD UNIQUE KEY `disturbanceType` (`disturbanceType`);
ALTER TABLE `disturbance`
    ADD PRIMARY KEY (`disturbanceID`),
    ADD CONSTRAINT `disturbanceTypeCNST` FOREIGN KEY (`disturbanceTypeID`) REFERENCES `disturbanceType` (`disturbanceTypeID`) ON UPDATE CASCADE,
    ADD UNIQUE KEY `disturbance` (`disturbance`);
ALTER TABLE `drainage`
    ADD PRIMARY KEY (`drainageID`),
    ADD UNIQUE KEY `drainage` (`drainage`);
ALTER TABLE `geomorphology`
    ADD PRIMARY KEY (`geomorphologyID`),
    ADD UNIQUE KEY `geomorphology` (`geomorphology`);
ALTER TABLE `macrotopography`
    ADD PRIMARY KEY (`macrotopographyID`),
    ADD UNIQUE KEY `macrotopography` (`macrotopography`);
ALTER TABLE `microtopography`
    ADD PRIMARY KEY (`microtopographyID`),
    ADD UNIQUE KEY `microtopography` (`microtopography`);
ALTER TABLE `moisture`
    ADD PRIMARY KEY (`moistureID`),
    ADD UNIQUE KEY `moisture` (`moisture`);
ALTER TABLE `physiography`
    ADD PRIMARY KEY (`physiographyID`),
    ADD UNIQUE KEY `physiography` (`physiography`);
ALTER TABLE `restrictiveType`
    ADD PRIMARY KEY (`restrictiveTypeID`),
    ADD UNIQUE KEY `restrictiveType` (`restrictiveType`);
ALTER TABLE `soilClass`
    ADD PRIMARY KEY (`soilClassID`),
    ADD UNIQUE KEY `soilClass` (`soilClass`);
ALTER TABLE `stratification`
    ADD PRIMARY KEY (`strataID`),
    ADD UNIQUE KEY `strata` (`strata`);

-- Create environment table
CREATE TABLE `environment` (
    `environmentID` int(7) NOT NULL,
    `projectID` int(4) NOT NULL,
    `siteID` int(7) NOT NULL,
    `envObserveDate` date NOT NULL,
    `envObserverID` int(4) NOT NULL,
    `soilObserverID` int(4),
    `strataID` int(3),
    `physiographyID` int(3),
    `geomorphologyID` int(3),
    `macrotopographyID` int(3),
    `microtopographyID` int(3),
    `microrelief` int(6),
    `drainageID` int(3),
    `moistureID` int(3),
    `soilClassID` int(3),
    `depthWater` decimal(3,1),
    `depthMossDuff` decimal(3,1),
    `depthRestrictiveLayer` decimal(3,1),
    `restrictiveTypeID` int(3),
    `soilPH10` decimal(3,1),
    `conductivity10` decimal(3,1),
    `temperature10` decimal(3,1),
    `soilPH30` decimal(3,1),
    `conductivity30` decimal(3,1),
    `temperature30` decimal(3,1),
    `waterPH` decimal(3,1),
    `waterConductivity` decimal(3,1),
    `waterTemperature` decimal(3,1),
    `disturbanceID` int(3),
    `homogenous` tinyint(1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Set key values for environment
ALTER TABLE `environment`
    ADD PRIMARY KEY (`environmentID`),
    ADD CONSTRAINT `projectEnvCNST` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `siteEnvCNST` FOREIGN KEY (`siteID`) REFERENCES `site` (`siteID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `envObserverCNST` FOREIGN KEY (`envObserverID`) REFERENCES `personnel` (`personnelID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `soilObserverCNST` FOREIGN KEY (`soilObserverID`) REFERENCES `personnel` (`personnelID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `strataCNST` FOREIGN KEY (`strataID`) REFERENCES `stratification` (`strataID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `physiographyCNST` FOREIGN KEY (`physiographyID`) REFERENCES `physiography` (`physiographyID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `geomorphologyCNST` FOREIGN KEY (`geomorphologyID`) REFERENCES `geomorphology` (`geomorphologyID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `macrotopographyCNST` FOREIGN KEY (`macrotopographyID`) REFERENCES `macrotopography` (`macrotopographyID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `microtopographyCNST` FOREIGN KEY (`microtopographyID`) REFERENCES `microtopography` (`microtopographyID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `drainageCNST` FOREIGN KEY (`drainageID`) REFERENCES `drainage` (`drainageID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `moistureCNST` FOREIGN KEY (`moistureID`) REFERENCES `moisture` (`moistureID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `soilClassCNST` FOREIGN KEY (`soilClassID`) REFERENCES `soilClass` (`soilClassID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `restrictiveCNST` FOREIGN KEY (`restrictiveTypeID`) REFERENCES `restrictiveType` (`restrictiveTypeID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `disturbanceCNST` FOREIGN KEY (`disturbanceID`) REFERENCES `disturbance` (`disturbanceID`) ON UPDATE CASCADE;

-- Commit changes
COMMIT;

-- Enable foreign key checks
SET foreign_key_checks = 1;