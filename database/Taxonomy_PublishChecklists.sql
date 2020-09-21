-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Publish taxonomy checklists
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated: 2020-09-20
-- Usage: Script should be executed in a MySQL 5.6+.
-- Description: "Publish taxonomy checklists" creates aggregate tables of the vascular plant, bryophyte, lichen, and comprehensive taxonomic checklists to be viewed through web applications on the Flora of Alaska and AKVEG domains.
-- ---------------------------------------------------------------------------

-- -- Drop taxonomy tables if they exist
DROP TABLE IF EXISTS `viewVascularChecklist`,
    `viewBryophyteChecklist`,
    `viewLichenChecklist`,
    `viewComprehensiveChecklist`;

-- Create vascular plant checklist
CREATE TABLE `viewVascularChecklist` AS
    SELECT taxonAdjudicated.adjudicatedID as 'ID'
         , CONCAT('<i>', taxonAdjudicated.nameAdjudicated, '</i> ', authorAdjudicated.author) as 'name'
         , taxonStatus.taxonStatus as 'status'
         , CONCAT('<i>', taxonAccepted.nameAccepted, '</i> ', authorAccepted.author) as 'nameAccepted'
         , family.family as 'family'
         , taxonAccepted.linkSource as 'source'
         , taxonLevel.level as 'level'
         , category.category as 'category'
         , habit.habit as 'habit'
    FROM taxonAdjudicated
        JOIN author authorAdjudicated ON taxonAdjudicated.authAdjudicatedID = authorAdjudicated.authorID
        JOIN taxonAccepted ON taxonAdjudicated.acceptedID = taxonAccepted.acceptedID
        JOIN author authorAccepted ON taxonAccepted.authAcceptedID = authorAccepted.authorID
        JOIN taxonStatus ON taxonAdjudicated.statusAdjudicatedID = taxonStatus.taxonStatusID
        JOIN taxonLevel ON taxonAccepted.levelID = taxonLevel.levelID
        JOIN hierarchy ON taxonAccepted.hierarchyID = hierarchy.hierarchyID
        JOIN family ON hierarchy.familyID = family.familyID
        JOIN category ON hierarchy.categoryID = category.categoryID
        JOIN habit ON taxonAccepted.habitID = habit.habitID
    WHERE taxonAccepted.levelID != 6 AND category.category IN ('Eudicot', 'Fern', 'Gymnosperm', 'Horsetail', 'Lycophyte', 'Monocot');

-- Create bryophyte checklist
CREATE TABLE `viewBryophyteChecklist` AS
    SELECT taxonAdjudicated.adjudicatedID as 'ID'
         , CONCAT('<i>', taxonAdjudicated.nameAdjudicated, '</i> ', authorAdjudicated.author) as 'name'
         , taxonStatus.taxonStatus as 'status'
         , CONCAT('<i>', taxonAccepted.nameAccepted, '</i> ', authorAccepted.author) as 'nameAccepted'
         , family.family as 'family'
         , taxonAccepted.linkSource as 'source'
         , taxonLevel.level as 'level'
         , category.category as 'category'
         , habit.habit as 'habit'
    FROM taxonAdjudicated
        JOIN author authorAdjudicated ON taxonAdjudicated.authAdjudicatedID = authorAdjudicated.authorID
        JOIN taxonAccepted ON taxonAdjudicated.acceptedID = taxonAccepted.acceptedID
        JOIN author authorAccepted ON taxonAccepted.authAcceptedID = authorAccepted.authorID
        JOIN taxonStatus ON taxonAdjudicated.statusAdjudicatedID = taxonStatus.taxonStatusID
        JOIN taxonLevel ON taxonAccepted.levelID = taxonLevel.levelID
        JOIN hierarchy ON taxonAccepted.hierarchyID = hierarchy.hierarchyID
        JOIN family ON hierarchy.familyID = family.familyID
        JOIN category ON hierarchy.categoryID = category.categoryID
        JOIN habit ON taxonAccepted.habitID = habit.habitID
    WHERE taxonAccepted.levelID != 6 AND category.category IN ('Hornwort', 'Liverwort', 'Moss');

-- Create lichen checklist
CREATE TABLE `viewLichenChecklist` AS
    SELECT taxonAdjudicated.adjudicatedID as 'ID'
         , CONCAT('<i>', taxonAdjudicated.nameAdjudicated, '</i> ', authorAdjudicated.author) as 'name'
         , taxonStatus.taxonStatus as 'status'
         , CONCAT('<i>', taxonAccepted.nameAccepted, '</i> ', authorAccepted.author) as 'nameAccepted'
         , family.family as 'family'
         , taxonAccepted.linkSource as 'source'
         , taxonLevel.level as 'level'
         , category.category as 'category'
         , habit.habit as 'habit'
    FROM taxonAdjudicated
        JOIN author authorAdjudicated ON taxonAdjudicated.authAdjudicatedID = authorAdjudicated.authorID
        JOIN taxonAccepted ON taxonAdjudicated.acceptedID = taxonAccepted.acceptedID
        JOIN author authorAccepted ON taxonAccepted.authAcceptedID = authorAccepted.authorID
        JOIN taxonStatus ON taxonAdjudicated.statusAdjudicatedID = taxonStatus.taxonStatusID
        JOIN taxonLevel ON taxonAccepted.levelID = taxonLevel.levelID
        JOIN hierarchy ON taxonAccepted.hierarchyID = hierarchy.hierarchyID
        JOIN family ON hierarchy.familyID = family.familyID
        JOIN category ON hierarchy.categoryID = category.categoryID
        JOIN habit ON taxonAccepted.habitID = habit.habitID
    WHERE taxonAccepted.levelID != 6 AND category.category = 'Lichen';

-- Create comprehensive checklist
CREATE TABLE `viewComprehensiveChecklist` AS
    SELECT taxonAdjudicated.adjudicatedID as 'ID'
         , CONCAT('<i>', taxonAdjudicated.nameAdjudicated, '</i> ', authorAdjudicated.author) as 'name'
         , taxonStatus.taxonStatus as 'status'
         , CONCAT('<i>', taxonAccepted.nameAccepted, '</i> ', authorAccepted.author) as 'nameAccepted'
         , family.family as 'family'
         , taxonAccepted.linkSource as 'source'
         , taxonLevel.level as 'level'
         , category.category as 'category'
         , habit.habit as 'habit'
    FROM taxonAdjudicated
        JOIN author authorAdjudicated ON taxonAdjudicated.authAdjudicatedID = authorAdjudicated.authorID
        JOIN taxonAccepted ON taxonAdjudicated.acceptedID = taxonAccepted.acceptedID
        JOIN author authorAccepted ON taxonAccepted.authAcceptedID = authorAccepted.authorID
        JOIN taxonStatus ON taxonAdjudicated.statusAdjudicatedID = taxonStatus.taxonStatusID
        JOIN taxonLevel ON taxonAccepted.levelID = taxonLevel.levelID
        JOIN hierarchy ON taxonAccepted.hierarchyID = hierarchy.hierarchyID
        JOIN family ON hierarchy.familyID = family.familyID
        JOIN category ON hierarchy.categoryID = category.categoryID
        JOIN habit ON taxonAccepted.habitID = habit.habitID
    WHERE taxonAccepted.levelID != 6;