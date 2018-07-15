# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# Vegetation Cover Sites
# Author: Timm Nawrocki, Alaska Center for Conservation Science
# Created on: 2018-06-19
# Usage: Must be executed as an ArcPy Script.
# Description: "Vegetation Cover Sites" queries all sites with associated vegetation cover data and returns the results as a csv and a feature class in a file geodatabase.
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

# Define the workspace folder
workspace_folder = arcpy.GetParameterAsText(4)

# Define the output feature class
output_feature = arcpy.GetParameterAsText(5)

# Define query type for vascular plants, non-vascular plants, or lichens.
type = arcpy.GetParameterAsText(6)

# Select only quantitative or semi-quantitative cover methods
quantitative_cover = arcpy.GetParameterAsText(7)

# Define start date
start_date = arcpy.GetParameterAsText(8)

# Define end date
end_date = arcpy.GetParameterAsText(9)

# Define intermediate files
temp_csv = os.path.join(workspace_folder, "database_export.csv")
temp_feature = output_feature + "_temp"

# Set up the MySQL connection
arcpy.AddMessage("Initializing database connection...")
connection = mysql.connector.connect(user = database_user, password = database_password, host = database_host, database = database_name)
cursor = connection.cursor()

# Set up query
coverSites_query = ("""SELECT DISTINCT abundance.siteID as 'siteID', abundance.vegObserveDate as 'date', site.siteCode as 'siteCode', project.shortName as 'initialProject', project.name as 'initialProjectTitle', methodSurvey.methodSurvey as 'methodSurvey', methodCover.methodCover as 'methodCover', plotDimensions.plotDimensions as 'plotDimensions', vascularScope1.scopeType as 'vascularScope', nonvascularScope1.scopeType as 'nonvascularScope', lichenScope1.scopeType as 'lichenScope', datum.datum as 'datum', site.latitude as 'latitude', site.longitude as 'longitude' FROM abundance JOIN site ON abundance.siteID = site.siteID JOIN project on site.projectID = project.projectID JOIN method on site.methodID = method.methodID JOIN methodSurvey ON method.methodSurveyID = methodSurvey.methodSurveyID JOIN methodCover ON method.methodCoverID = methodCover.methodCoverID JOIN datum ON site.datumID = datum.datumID JOIN plotDimensions ON site.plotDimensionsID = plotDimensions.plotDimensionsID JOIN methodScope ON project.scopeID = methodScope.scopeID JOIN scopeType vascularScope1 ON methodScope.vascularScopeID = vascularScope1.scopeTypeID JOIN scopeType nonvascularScope1 ON methodScope.nonvascularScopeID = nonvascularScope1.scopeTypeID JOIN scopeType lichenScope1 ON methodScope.lichenScopeID = lichenScope1.scopeTypeID WHERE abundance.vegObserveDate BETWEEN %s AND %s""")

# Modify query based on type input. Queries for vascular plants only return sites where the scope was exhaustive. Queries for non-vascular plants and lichens return sites where the scope was exhaustive or high cover species.
if type == "vascular":
    coverSites_query = coverSites_query + (""" AND vascularScope1.scopeType = 'exhaustive'""")
elif type == "non-vascular":
    coverSites_query = coverSites_query + (""" AND nonvascularScope1.scopeType IN ('exhaustive', 'high cover species')""")
elif type == "lichen":
    coverSites_query = coverSites_query + (""" AND lichenScope1.scopeType IN ('exhaustive', 'high cover species')""")
else:
    arcpy.AddError("The input type that was not recognized. The input type must be 'vascular', 'non-vascular', or 'lichen'.")

# Modify query based on quantitative input. If selected, then the query will only return sites where the cover method was quantitative or semi-quantitative, not classified.
if quantitative_cover == "True":
    coverSites_query = coverSites_query + (""" AND methodCover.methodCover IN ('Quantitative', 'Semi-Quantitative')""")

# Complete the query
coverSites_query = coverSites_query + (""" ORDER BY abundance.siteID ASC""")

# Execute query and fetch results
arcpy.AddMessage("Pushing query results to output...")
cursor.execute(coverSites_query, (start_date, end_date))
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

# Add XY Coordinates to feature class in the NAD_1983_Alaska_Albers projection
arcpy.AddXY_management(output_feature)

# Delete intermediate files
arcpy.Delete_management(temp_feature)
if os.path.exists(temp_csv):
    os.remove(temp_csv)