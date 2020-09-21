-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Build metadata tables
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-09-21
-- Usage: Script should be executed in a MySQL 5.6+.
-- Description: "Build metadata tables" creates the empty tables for the metadata components of the AKVEG database, including the schema and data dictionary. WARNING: THIS SCRIPT WILL ERASE ALL DATA IN EXISTING ENVIRONMENT TABLES.
-- ---------------------------------------------------------------------------

-- Disable foreign key checks
SET foreign_key_checks = 0;

-- Drop metadata tables if they exist
DROP TABLE IF EXISTS `completion`,
    `schemaCategory`,
    `schemaTable`,
    `schemaType`,
    `personnel`,
    `schema`,
    `dictionary`;

-- Create constraint tables
CREATE TABLE `completion` (
    `completionID` int(1) NOT NULL,
    `completion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `schemaCategory` (
    `schemaCategoryID` int(3) NOT NULL,
    `schemaCategory` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `schemaTable` (
    `schemaTableID` int(3) NOT NULL,
    `schemaTable` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `schemaType` (
    `schemaTypeID` int(3) NOT NULL,
    `schemaType` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `personnel` (
    `personnelID` int(4) NOT NULL,
    `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Set key values for constraints
ALTER TABLE `completion`
    ADD PRIMARY KEY (`completionID`),
    ADD UNIQUE KEY `completion` (`completion`);
ALTER TABLE `schemaCategory`
    ADD PRIMARY KEY (`schemaCategoryID`),
    ADD UNIQUE KEY `schemaCategory` (`schemaCategory`);
ALTER TABLE `schemaTable`
    ADD PRIMARY KEY (`schemaTableID`),
    ADD UNIQUE KEY `schemaTable` (`schemaTable`);
ALTER TABLE `schemaType`
    ADD PRIMARY KEY (`schemaTypeID`),
    ADD UNIQUE KEY `schemaType` (`schemaType`);
ALTER TABLE `personnel`
    ADD PRIMARY KEY (`personnelID`),
    ADD UNIQUE KEY `personnel` (`name`);

-- Create schema table
CREATE TABLE `schema` (
    `schemaID` int(4) NOT NULL,
    `schemaCategoryID` int(3) NOT NULL,
    `schemaTableID` int(3) NOT NULL,
    `field` varchar(50) NOT NULL,
    `schemaTypeID` int(3) NOT NULL,
    `length` int(3),
    `unique` tinyint(1) NOT NULL,
    `key` tinyint(1) NOT NULL,
    `required` tinyint(1) NOT NULL,
    `linkTable` int(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Set key values for environment
ALTER TABLE `schema`
    ADD PRIMARY KEY (`schemaID`),
    ADD CONSTRAINT `schemaCategoryCNST` FOREIGN KEY (`schemaCategoryID`) REFERENCES `schemaCategory` (`schemaCategoryID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `schemaTableCNST` FOREIGN KEY (`schemaTableID`) REFERENCES `schemaTable` (`schemaTableID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `schemaTypeCNST` FOREIGN KEY (`schemaTypeID`) REFERENCES `schemaType` (`schemaTypeID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `linkTableCNST` FOREIGN KEY (`linkTable`) REFERENCES `schemaTable` (`schemaTableID`) ON UPDATE CASCADE;

-- Create dictionary table
CREATE TABLE `dictionary` (
    `dictionaryID` int(6) NOT NULL,
    `dictionaryCategoryID` int(3) NOT NULL,
    `dictionaryFieldID` int(4) NOT NULL,
    `attributeID` int(5) NOT NULL,
    `attribute` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Set key values for dictionary
ALTER TABLE `dictionary`
    ADD PRIMARY KEY (`dictionaryID`),
    ADD CONSTRAINT `dictionaryCategoryCNST` FOREIGN KEY (`dictionaryCategoryID`) REFERENCES `schemaCategory` (`schemaCategoryID`) ON UPDATE CASCADE,
    ADD CONSTRAINT `dictionaryFieldCNST` FOREIGN KEY (`dictionaryFieldID`) REFERENCES `schema` (`schemaID`) ON UPDATE CASCADE;

-- Commit changes
COMMIT;

-- Enable foreign key checks
SET foreign_key_checks = 1;