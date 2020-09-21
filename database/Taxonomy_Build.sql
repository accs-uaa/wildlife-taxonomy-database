-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Build taxonomy tables
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-09-20
-- Usage: Script should be executed in a MySQL 5.6+.
-- Description: "Build taxonomy tables" creates the empty tables for the taxonomy components of the AKVEG database. WARNING: THIS SCRIPT WILL ERASE ALL DATA IN EXISTING TAXONOMY TABLES.
-- ---------------------------------------------------------------------------

-- Disable foreign key checks
SET foreign_key_checks = 0;

-- Drop taxonomy tables if they exist
DROP TABLE IF EXISTS `taxonAdjudicated`,
    `taxonAccepted`,
    `hierarchy`,
    `author`,
    `category`,
    `family`,
    `habit`,
    `taxonStatus`,
    `taxonLevel`,
    `taxonSource`;

-- Create constraint tables
CREATE TABLE `author` (
    `authorID` int(5) NOT NULL,
    `author` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `category` (
    `categoryID` int(2) NOT NULL,
    `category` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `family` (
    `familyID` int(4) NOT NULL,
    `family` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `habit` (
    `habitID` int(2) NOT NULL,
    `habit` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `taxonStatus` (
    `taxonStatusID` int(2) NOT NULL,
    `taxonStatus` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `taxonLevel` (
    `levelID` int(2) NOT NULL,
    `level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `taxonSource` (
    `taxonSourceID` int(3) NOT NULL,
    `taxonSource` varchar(50) NOT NULL,
    `citation` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Set key values for constraints
ALTER TABLE `author`
    ADD PRIMARY KEY (`authorID`),
    ADD UNIQUE KEY `author` (`author`);
ALTER TABLE `category`
    ADD PRIMARY KEY (`categoryID`),
    ADD UNIQUE KEY `category` (`category`);
ALTER TABLE `family`
    ADD PRIMARY KEY (`familyID`),
    ADD UNIQUE KEY `family` (`family`);
ALTER TABLE `habit`
    ADD PRIMARY KEY (`habitID`),
    ADD UNIQUE KEY `habit` (`habit`);
ALTER TABLE `taxonStatus`
    ADD PRIMARY KEY (`taxonStatusID`),
    ADD UNIQUE KEY `taxonStatus` (`taxonStatus`);
ALTER TABLE `taxonLevel`
    ADD PRIMARY KEY (`levelID`),
    ADD UNIQUE KEY `level` (`level`);
ALTER TABLE `taxonSource`
    ADD PRIMARY KEY (`taxonSourceID`),
    ADD UNIQUE KEY `taxonSource` (`taxonSource`);

-- Create hierarchy table
CREATE TABLE `hierarchy` (
    `hierarchyID` int(4) NOT NULL,
    `genusAccepted` varchar(50) NOT NULL,
    `familyID` int(3) NOT NULL,
    `categoryID` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Set key values for hierarchy
ALTER TABLE `hierarchy`
    ADD PRIMARY KEY (`hierarchyID`),
    ADD UNIQUE KEY `hierarchy` (`genusAccepted`),
    ADD CONSTRAINT `familyCNST` FOREIGN KEY (`familyID`) REFERENCES `family` (`familyID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `categoryCNST` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`) ON UPDATE CASCADE;

-- Create accepted taxa table
CREATE TABLE `taxonAccepted` (
    `acceptedID` int(5) NOT NULL,
    `nameAccepted` varchar(120) NOT NULL,
    `authAcceptedID` int(5) NOT NULL,
    `hierarchyID` int(4) NOT NULL,
    `taxonSourceID` int(3) NOT NULL,
    `linkSource` varchar(255) NOT NULL,
    `levelID` int(2) NOT NULL,
    `habitID` int(2) NOT NULL,
    `native` tinyint(1) NOT NULL,
    `non_native` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Set key values for accepted taxa
ALTER TABLE `taxonAccepted`
    ADD PRIMARY KEY (`acceptedID`),
    ADD CONSTRAINT `authAcceptedCNST` FOREIGN KEY (`authAcceptedID`) REFERENCES `author` (`authorID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `hierarchyCNST` FOREIGN KEY (`hierarchyID`) REFERENCES `hierarchy` (`hierarchyID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `taxonSourceCNST` FOREIGN KEY (`taxonSourceID`) REFERENCES `taxonSource` (`taxonSourceID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `levelCNST` FOREIGN KEY (`levelID`) REFERENCES `taxonLevel` (`levelID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `habitCNST` FOREIGN KEY (`habitID`) REFERENCES `habit` (`habitID`) ON UPDATE CASCADE;

-- Create adjudicated taxa table
CREATE TABLE `taxonAdjudicated` (
    `adjudicatedID` int(5) NOT NULL,
    `nameAdjudicated` varchar(120) NOT NULL,
    `authAdjudicatedID` int(5) NOT NULL,
    `statusAdjudicatedID` int(2) NOT NULL,
    `acceptedID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Set key values for adjudicated taxa table
ALTER TABLE `taxonAdjudicated`
    ADD PRIMARY KEY (`adjudicatedID`),
    ADD CONSTRAINT `authAdjudicatedCNST` FOREIGN KEY (`authAdjudicatedID`) REFERENCES `author` (`authorID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `acceptedCNST` FOREIGN KEY (`acceptedID`) REFERENCES `taxonAccepted` (`acceptedID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `statusAdjudicatedCNST` FOREIGN KEY (`statusAdjudicatedID`) REFERENCES `taxonStatus` (`taxonStatusID`) ON UPDATE CASCADE;

-- Commit changes
COMMIT;

-- Enable foreign key checks
SET foreign_key_checks = 1;