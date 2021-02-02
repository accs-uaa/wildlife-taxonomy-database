# Import required libraries
library(RPostgres)
library(tibble)

# Import database connection function
connection_script = 'C:/Users/timmn/Documents/Repositories/AKTEMP/package_DataProcessing/connectDatabasePostgreSQL.R'
source(connection_script)

# Create a connection to the AKTEMP PostgreSQL database
authentication = 'N:/ACCS_Work/Administrative/Credentials/accs-postgresql/authentication.csv'
database_connection = connect_database_postgresql(authentication)

# Query the database and return result as tibble
query = 'SELECT * FROM point'
point_table = as_tibble(dbGetQuery(database_connection, query))

# View data frame
view(point_table)