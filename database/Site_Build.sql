-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Build site tables
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-09-21
-- Usage: Script should be executed in a MySQL 5.6+.
-- Description: "Build project tables" creates the empty tables for the site components of the AKVEG database. WARNING: THIS SCRIPT WILL ERASE ALL DATA IN EXISTING ENVIRONMENT TABLES.
-- ---------------------------------------------------------------------------

-- Disable foreign key checks
SET foreign_key_checks = 0;

-- Drop project tables if they exist
DROP TABLE IF EXISTS `coverType`,
    `coverMethod`,
    `datum`,
    `plotDimensions`,
    `scope`,
    `site`;

-- Create constraint tables
CREATE TABLE `coverType` (
    `coverTypeID` int(2) NOT NULL,
    `coverType` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `coverMethod` (
    `coverMethodID` int(2) NOT NULL,
    `coverMethod` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `datum` (
    `datumID` int(2) NOT NULL,
    `datum` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `plotDimensions` (
    `plotDimensionsID` int(2) NOT NULL,
    `plotDimensions` varchar(50) NOT NULL,
    `area` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `scope` (
    `scopeID` int(2) NOT NULL,
    `scope` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Set key values for constraints
ALTER TABLE `coverType`
    ADD PRIMARY KEY (`coverTypeID`),
    ADD UNIQUE KEY `coverType` (`coverType`);
ALTER TABLE `coverMethod`
    ADD PRIMARY KEY (`coverMethodID`),
    ADD UNIQUE KEY `coverMethod` (`coverMethod`);
ALTER TABLE `datum`
    ADD PRIMARY KEY (`datumID`),
    ADD UNIQUE KEY `datum` (`datum`);
ALTER TABLE `plotDimensions`
    ADD PRIMARY KEY (`plotDimensionsID`),
    ADD UNIQUE KEY `plotDimensions` (`plotDimensions`);
ALTER TABLE `scope`
    ADD PRIMARY KEY (`scopeID`),
    ADD UNIQUE KEY `scope` (`scope`);

-- Create site table
CREATE TABLE `site` (
    `siteID` int(7) NOT NULL,
    `siteCode` varchar(50) NOT NULL,
    `projectID` int(3) NOT NULL,
    `coverTypeID` int(2) NOT NULL,
    `coverMethodID` int(2) NOT NULL,
    `latitude` decimal(12,9) NOT NULL,
    `longitude` decimal(12,9) NOT NULL,
    `error` decimal(3,1) NOT NULL,
    `datumID` int(1) NOT NULL,
    `plotDimensionsID` int(3) NOT NULL,
    `scopeVascularID` int(2) NOT NULL,
    `scopeBryophyteID` int(2) NOT NULL,
    `scopeLichenID` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Set key values for site
ALTER TABLE `site`
    ADD PRIMARY KEY (`siteID`),
    ADD UNIQUE KEY `siteCode` (`siteCode`),
    ADD CONSTRAINT `siteProjectCNST` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `coverTypeCNST` FOREIGN KEY (`coverTypeID`) REFERENCES `coverType` (`coverTypeID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `coverMethodCNST` FOREIGN KEY (`coverMethodID`) REFERENCES `coverMethod` (`coverMethodID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `datumCNST` FOREIGN KEY (`datumID`) REFERENCES `datum` (`datumID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `plotDimensionsCNST` FOREIGN KEY (`plotDimensionsID`) REFERENCES `plotDimensions` (`plotDimensionsID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `scopeVascularCNST` FOREIGN KEY (`scopeVascularID`) REFERENCES `scope` (`scopeID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `scopeBryophyteCNST` FOREIGN KEY (`scopeBryophyteID`) REFERENCES `scope` (`scopeID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `scopeLichenCNST` FOREIGN KEY (`scopeLichenID`) REFERENCES `scope` (`scopeID`) ON UPDATE CASCADE;

-- Commit changes
COMMIT;

-- Enable foreign key checks
SET foreign_key_checks = 1;