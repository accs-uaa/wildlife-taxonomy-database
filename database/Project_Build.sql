-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Build project tables
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-09-21
-- Usage: Script should be executed in a MySQL 5.6+.
-- Description: "Build project tables" creates the empty tables for the vegetation survey and monitoring projects components of the AKVEG database. WARNING: THIS SCRIPT WILL ERASE ALL DATA IN EXISTING ENVIRONMENT TABLES.
-- ---------------------------------------------------------------------------

-- Disable foreign key checks
SET foreign_key_checks = 0;

-- Drop project tables if they exist
DROP TABLE IF EXISTS `organizationType`,
    `organization`,
    `project`,
    `projectStatus`;

-- Create organization type table
CREATE TABLE `organizationType` (
    `orgTypeID` int(2) NOT NULL,
    `orgType` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Set key values for organization type
ALTER TABLE `organizationType`
    ADD PRIMARY KEY (`orgTypeID`),
    ADD UNIQUE KEY `orgType` (`orgType`);

-- Create organization table
CREATE TABLE `organization` (
    `organizationID` int(3) NOT NULL,
    `organization` varchar(250) NOT NULL,
    `organizationAbbr` varchar(20) NOT NULL,
    `orgTypeID` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Set key values for organization
ALTER TABLE `organization`
    ADD PRIMARY KEY (`organizationID`),
    ADD UNIQUE KEY `organization` (`organization`),
    ADD UNIQUE KEY `organizationAbbr` (`organizationAbbr`),
    ADD CONSTRAINT `orgTypeCNST` FOREIGN KEY (`orgTypeID`) REFERENCES `organizationType` (`orgTypeID`) ON UPDATE CASCADE;

-- Create projects table
CREATE TABLE `project` (
    `projectID` int(3) NOT NULL,
    `originatorID` int(3) NOT NULL,
    `funderID` int(3) NOT NULL,
    `managerID` int(4) NOT NULL,
    `projectName` varchar(250) NOT NULL,
    `projectNameAbbr` varchar(20) NOT NULL,
    `yearStart` year NOT NULL,
    `yearEnd` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Set key values for projects
ALTER TABLE `project`
    ADD PRIMARY KEY (`projectID`),
    ADD CONSTRAINT `originatorCNST` FOREIGN KEY (`originatorID`) REFERENCES `organization` (`organizationID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `funderCNST` FOREIGN KEY (`funderID`) REFERENCES `organization` (`organizationID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `managerCNST` FOREIGN KEY (`managerID`) REFERENCES `personnel` (`personnelID`) ON UPDATE CASCADE;

-- Create project status table
CREATE TABLE `projectStatus` (
    `projectStatusID` int(3) NOT NULL,
    `projectID` int(3) NOT NULL,
    `projectModified` date NOT NULL,
    `siteModified` date NOT NULL,
    `abundanceModified` date NOT NULL,
    `environmentModified` date NOT NULL,
    `modifiedByID` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Set key values for project status
ALTER TABLE `projectStatus`
    ADD PRIMARY KEY (`projectStatusID`),
    ADD CONSTRAINT `projectCNST` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `modifiedCNST` FOREIGN KEY (`modifiedByID`) REFERENCES `personnel` (`personnelID`) ON UPDATE CASCADE;

-- Commit changes
COMMIT;

-- Enable foreign key checks
SET foreign_key_checks = 1;