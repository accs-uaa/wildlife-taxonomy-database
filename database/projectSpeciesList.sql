SELECT DISTINCT speciesAccepted.nameAccepted as 'nameAccepted'
FROM abundance
 JOIN speciesAdjudicated ON abundance.adjudicatedID = speciesAdjudicated.adjudicatedID
 JOIN speciesAccepted ON speciesAdjudicated.acceptedID = speciesAccepted.acceptedID
 JOIN project ON abundance.projectID = project.projectID
WHERE project.shortName = 'AIM Fortymile'
ORDER BY speciesAccepted.nameAccepted ASC;