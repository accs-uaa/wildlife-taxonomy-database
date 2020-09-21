-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Build vegetation tables
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-09-21
-- Usage: Script should be executed in a MySQL 5.6+.
-- Description: "Build vegetation tables" creates the empty tables for the vegetation components of the AKVEG database. WARNING: THIS SCRIPT WILL ERASE ALL DATA IN EXISTING ENVIRONMENT TABLES.
-- ---------------------------------------------------------------------------

-- Disable foreign key checks
SET foreign_key_checks = 0;

-- Drop project tables if they exist
DROP TABLE IF EXISTS `coverTotal`,
    `coverTop`;

-- Create total cover table
CREATE TABLE `coverTotal` (
    `coverTotalID` int(9) NOT NULL,
    `siteID` int(7) NOT NULL,
    `projectID` int(3) NOT NULL,
    `vegObserveDate` date NOT NULL,
    `vegObserverID` int(4) NOT NULL,
    `vegRecorderID` int(4) NOT NULL,
    `nameOriginal` varchar(120) NOT NULL,
    `adjudicatedID` int(5) NOT NULL,
    `coverTotal` decimal(6,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Set key values for total cover
ALTER TABLE `coverTotal`
    ADD PRIMARY KEY (`coverTotalID`),
    ADD CONSTRAINT `siteTotalCNST` FOREIGN KEY (`siteID`) REFERENCES `site` (`siteID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `projectTotalCNST` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `observerTotalCNST` FOREIGN KEY (`vegObserverID`) REFERENCES `personnel` (`personnelID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `recorderTotalCNST` FOREIGN KEY (`vegRecorderID`) REFERENCES `personnel` (`personnelID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `adjudicatedTotalCNST` FOREIGN KEY (`adjudicatedID`) REFERENCES `taxonAdjudicated` (`adjudicatedID`) ON UPDATE CASCADE;

-- Create top cover table
CREATE TABLE `coverTop` (
    `coverTopID` int(9) NOT NULL,
    `siteID` int(7) NOT NULL,
    `projectID` int(3) NOT NULL,
    `vegObserveDate` date NOT NULL,
    `vegObserverID` int(4) NOT NULL,
    `vegRecorderID` int(4) NOT NULL,
    `nameOriginal` varchar(120) NOT NULL,
    `adjudicatedID` int(5) NOT NULL,
    `coverTop` decimal(6,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Set key values for top cover
ALTER TABLE `coverTop`
    ADD PRIMARY KEY (`coverTopID`),
    ADD CONSTRAINT `siteTopCNST` FOREIGN KEY (`siteID`) REFERENCES `site` (`siteID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `projectTopCNST` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `observerTopCNST` FOREIGN KEY (`vegObserverID`) REFERENCES `personnel` (`personnelID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `recorderTopCNST` FOREIGN KEY (`vegRecorderID`) REFERENCES `personnel` (`personnelID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `adjudicatedTopCNST` FOREIGN KEY (`adjudicatedID`) REFERENCES `taxonAdjudicated` (`adjudicatedID`) ON UPDATE CASCADE;

-- Commit changes
COMMIT;

-- Enable foreign key checks
SET foreign_key_checks = 1;