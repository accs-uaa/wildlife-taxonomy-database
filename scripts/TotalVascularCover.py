# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Calculate Total Vascular Cover
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Created on: 2018-06-19
# Usage: Must be executed as an ArcPy Script.
# Description: "Calculate Total Vascular Cover" queries an instance of the MySQL Alaska Vegetation Plots Database to calculate the total vascular cover per site for all sites that were surveyed exhaustively for vascular plants and returns the results as a csv and a feature class in a file geodatabase.
# ---------------------------------------------------------------------------

# Import modules
import os
import arcpy
import csv
import mysql.connector
	
# Set overwrite option
arcpy.env.overwriteOutput = True

# Setup database credentials for query
database_user = arcpy.GetParameterAsText(0)
database_password = arcpy.GetParameterAsText(1)
database_host = arcpy.GetParameterAsText(2)
database_name = arcpy.GetParameterAsText(3)

# Define the output csv
output_csv = arcpy.GetParameterAsText(4)

# Define the output feature class
output_feature = arcpy.GetParameterAsText(5)

# Define intermediate files
temp_feature = output_feature + "_temp"

# Set up the MySQL connection
arcpy.AddMessage("Initializing database connection...")
connection = mysql.connector.connect(user = database_user, password = database_password, host = database_host, database = database_name)
cursor = connection.cursor()

# Set up query
totalVascularCover_query = ("""SELECT DISTINCT site.siteID as 'ID'
, site.siteCode as 'siteCode'
, project.shortName as 'project'
, project.name as 'projectTitle'
, methodSurvey.methodSurvey as 'methodSurvey'
, methodCover.methodCover as 'methodCover'
, vascularScope1.scopeType as 'vascularScope'
, nonvascularScope1.scopeType as 'nonvascularScope'
, lichenScope1.scopeType as 'lichenScope'
, plotDimensions.plotDimensions as 'plotDimensions'
, datum.datum as 'datum'
, site.latitude as 'latitude'
, site.longitude as 'longitude'
, abundance.vegObserveDate as 'date'
, personnel1.name as 'vegObserver1'
, personnel2.name as 'vegObserver2'
, coverTotal.coverTotalVascular as 'coverTotalVascular'
FROM abundance
 JOIN site ON abundance.siteID = site.siteID
 JOIN method ON site.methodID = method.methodID
 JOIN methodSurvey ON method.methodSurveyID = methodSurvey.methodSurveyID
 JOIN methodCover ON method.methodCoverID = methodCover.methodCoverID
 JOIN project ON abundance.projectID = project.projectID
 JOIN datum ON site.datumID = datum.datumID
 JOIN plotDimensions ON site.plotDimensionsID = plotDimensions.plotDimensionsID
 JOIN personnel personnel1 ON abundance.vegObserver1ID = personnel1.personnelID
 LEFT JOIN personnel personnel2 ON abundance.vegObserver2ID = personnel2.personnelID
 JOIN methodScope ON project.scopeID = methodScope.scopeID
 JOIN scopeType vascularScope1 ON methodScope.vascularScopeID = vascularScope1.scopeTypeID
 JOIN scopeType nonvascularScope1 ON methodScope.nonvascularScopeID = nonvascularScope1.scopeTypeID
 JOIN scopeType lichenScope1 ON methodScope.lichenScopeID = lichenScope1.scopeTypeID
 JOIN (
    SELECT abundance.siteID as 'siteID'
    , SUM(abundance.cover) as 'coverTotalVascular'
    FROM abundance
      JOIN speciesAdjudicated ON abundance.adjudicatedID = speciesAdjudicated.adjudicatedID
      JOIN speciesAccepted ON speciesAdjudicated.acceptedID = speciesAccepted.acceptedID
      JOIN hierarchy ON speciesAccepted.hierarchyID = hierarchy.hierarchyID
    WHERE hierarchy.vascular = 1
    GROUP BY abundance.siteID
 ) coverTotal ON coverTotal.siteID = site.siteID
WHERE methodScope.vascularScopeID = 1
ORDER BY site.siteID ASC""")

# Execute query and fetch results
arcpy.AddMessage("Pushing query results to output...")
cursor.execute(totalVascularCover_query)
result = cursor.fetchall()

# Create column names as a list
column_names = [column[0] for column in cursor.description]

# Write column names and results to temporary csv file
csv_output = open(output_csv, 'w')
csv_writer = csv.writer(csv_output, lineterminator = '\n')
csv_writer.writerow(column_names)
csv_writer.writerows(result)
csv_output.close()

# Close MySQL connection
cursor.close()
connection.close()
	
# Set the spatial references (4269 is GCS_North_American_1983; 3338 is NAD_1983_Alaska_Albers)
geographic = arcpy.SpatialReference(4269)
projected = arcpy.SpatialReference(3338)

# Convert csv data to feature class
arcpy.management.XYTableToPoint(output_csv, temp_feature, "longitude", "latitude", "", geographic)
arcpy.Project_management(temp_feature, output_feature, projected)

# Delete intermediate files
arcpy.Delete_management(temp_feature)