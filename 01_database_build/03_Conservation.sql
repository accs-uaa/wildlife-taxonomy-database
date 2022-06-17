-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Build conservation tables
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Adapted for wildlife data by Amanda Droghini, Alaska Center for Conservation Science
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Build conservation tables" creates the empty tables for the conservation components of the AKWILD database.
-- WARNING: THIS SCRIPT WILL ERASE ALL DATA IN EXISTING CONSERVATION TABLES.
-- ---------------------------------------------------------------------------

-- Initialize transaction
START TRANSACTION;

-- Drop taxonomy tables if they exist
DROP TABLE IF EXISTS
    status_usfws_bcc,
    status_usfws_esa,
    status_pif_wl
CASCADE;

-- Create constraint tables
CREATE TABLE status_usfws_bcc (
    usfws_bcc_id smallint PRIMARY KEY,
    name_listed varchar(120) UNIQUE NOT NULL,
    accepted_id integer NOT NULL REFERENCES taxon_accepted
);
-- Commit transaction
COMMIT TRANSACTION;
