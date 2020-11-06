-- -*- coding: utf-8 -*-
-- ---------------------------------------------------------------------------
-- Query Cover
-- Author: Timm Nawrocki, Alaska Center for Conservation Science
-- Last Updated:  2020-11-05
-- Usage: Script should be executed in a PostgreSQL 12 database.
-- Description: "Query cover" queries the cover data.
-- ---------------------------------------------------------------------------

-- Compile cover data
SELECT cover.coverID as coverID
     , project.projectNameAbbr as project
     , site.siteCode as siteCode
     , cover.vegObserveDate as vegObserveDate
     , vegObserver.personnel as vegObserver
     , vegRecorder.personnel as vegRecorder
     , coverType.coverType as coverType
     , taxonAccepted.nameAccepted as nameAccepted
     , cover.cover as cover
FROM cover
    LEFT JOIN project ON cover.projectID = project.projectID
    LEFT JOIN site ON cover.siteID = site.siteID
    LEFT JOIN personnel vegObserver ON cover.vegObserverID = vegObserver.personnelID
    LEFT JOIN personnel vegRecorder ON cover.vegRecorderID = vegRecorder.personnelID
    LEFT JOIN coverType ON cover.coverTypeID = coverType.covertypeID
    LEFT JOIN taxonAdjudicated ON cover.adjudicatedID = taxonAdjudicated.adjudicatedID
    LEFT JOIN taxonAccepted ON taxonAdjudicated.acceptedID = taxonAccepted.acceptedID
ORDER BY coverID ASC;