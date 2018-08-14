# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Query Vegetation Cover by Aggregate
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Created on: 2018-07-30
# Usage: Must be executed as an ArcPy Script.
# Description: This tool queries the MySQL Alaska Vegetation Plots Database for cover by an aggregate of taxa. Cover values are aggregated so that multiple values at a single site for a single date are summed.
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

# Define the aggregate to be queried as a list of comma-separated, single-quoted entries
aggregate = arcpy.GetParameterAsText(4)

# Define the workspace folder
workspace_folder = arcpy.GetParameterAsText(5)

# Define the output feature class
output_feature = arcpy.GetParameterAsText(6)

# Select only quantitative or semi-quantitative cover methods
quantitative_cover = arcpy.GetParameterAsText(7)

# Define start date
start_date = arcpy.GetParameterAsText(8)

# Define end date
end_date = arcpy.GetParameterAsText(9)

# Define aggregate name
aggregate_name = arcpy.GetParameterAsText(10)

# Define intermediate files
temp_csv = os.path.join(workspace_folder, "database_export.csv")
temp_feature = output_feature + "_temp"

# Set up the MySQL connection
arcpy.AddMessage("Initializing database connection...")
connection = mysql.connector.connect(user = database_user, password = database_password, host = database_host, database = database_name)
cursor = connection.cursor()

# Split the aggregate string into a list and convert the list into a formatted string for the SQL query
aggregate = aggregate.split(";")
separator = ", "
aggregate_string = separator.join(aggregate)

# Set up query
vegCover_query = ("""SELECT DISTINCT abundance.siteID as 'siteID'
, site.siteCode as 'siteCode'
, project.shortName as 'project'
, methodSurvey.methodSurvey as 'methodSurvey'
, methodCover.methodCover as 'methodCover'
, vascularScope1.scopeType as 'vascularScope'
, nonvascularScope1.scopeType as 'nonvascularScope'
, lichenScope1.scopeType as 'lichenScope'
, abundance.vegObserveDate as 'date'
, personnel1.name as 'vegObserver1'
, personnel2.name as 'vegObserver2'
, datum.datum as 'datum'
, site.latitude as 'latitude'
, site.longitude as 'longitude'
, coverAggregate.cover as 'cover'
FROM abundance
 JOIN site ON abundance.siteID = site.siteID
 JOIN method ON site.methodID = method.methodID
 JOIN methodSurvey ON method.methodSurveyID = methodSurvey.methodSurveyID
 JOIN methodCover ON method.methodCoverID = methodCover.methodCoverID
 JOIN project ON abundance.projectID = project.projectID 
 JOIN speciesAdjudicated ON abundance.adjudicatedID = speciesAdjudicated.adjudicatedID
 JOIN speciesAccepted ON speciesAdjudicated.acceptedID = speciesAccepted.acceptedID
 JOIN datum ON site.datumID = datum.datumID JOIN personnel personnel1 ON abundance.vegObserver1ID = personnel1.personnelID
 LEFT JOIN personnel personnel2 ON abundance.vegObserver2ID = personnel2.personnelID
 JOIN methodScope ON project.scopeID = methodScope.scopeID
 JOIN scopeType vascularScope1 ON methodScope.vascularScopeID = vascularScope1.scopeTypeID
 JOIN scopeType nonvascularScope1 ON methodScope.nonvascularScopeID = nonvascularScope1.scopeTypeID
 JOIN scopeType lichenScope1 ON methodScope.lichenScopeID = lichenScope1.scopeTypeID 
 JOIN (
    SELECT abundance.siteID as 'siteID'
    , SUM(abundance.cover) as 'cover'
    FROM abundance
      JOIN speciesAdjudicated ON abundance.adjudicatedID = speciesAdjudicated.adjudicatedID
      JOIN speciesAccepted ON speciesAdjudicated.acceptedID = speciesAccepted.acceptedID
      JOIN hierarchy ON speciesAccepted.hierarchyID = hierarchy.hierarchyID
	WHERE speciesAccepted.nameAccepted IN (""" + aggregate_string + """)
	GROUP BY abundance.siteID
 ) coverAggregate ON coverAggregate.siteID = abundance.siteID
WHERE abundance.vegObserveDate BETWEEN %s AND %s""")

# Modify query based on quantitative input. If selected, then the query will only return sites where the cover method was quantitative or semi-quantitative, not classified.
if quantitative_cover == "True":
    vegCover_query = vegCover_query + (""" AND methodCover.methodCover IN ('Quantitative', 'Semi-Quantitative')""")

# Complete the query
vegCover_query = vegCover_query + (""" ORDER BY abundance.siteID ASC""")

# Execute query and fetch results
arcpy.AddMessage("Pushing query results to output...")
cursor.execute(vegCover_query, (start_date, end_date))
result = cursor.fetchall()

# Create column names as a list
column_names = [column[0] for column in cursor.description]

# Write column names and results to temporary csv file
csv_output = open(temp_csv, 'w')
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
arcpy.management.XYTableToPoint(temp_csv, temp_feature, "longitude", "latitude", "", geographic)
arcpy.Project_management(temp_feature, output_feature, projected)
aggregate_name = "'" + aggregate_name + "'"
arcpy.AddField_management(output_feature, "nameAccepted", "TEXT")
arcpy.CalculateField_management(output_feature, "nameAccepted", aggregate_name, "PYTHON3")

# Add XY Coordinates to feature class in the NAD_1983_Alaska_Albers projection
arcpy.AddXY_management(output_feature)

# Delete intermediate files
arcpy.Delete_management(temp_feature)
if os.path.exists(temp_csv):
    os.remove(temp_csv)