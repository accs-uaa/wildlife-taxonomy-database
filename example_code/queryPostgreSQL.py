# Import packages
from package_DataProcessing import connect_database_postgresql
from package_DataProcessing import query_to_dataframe

# Create a connection to the AKTEMP PostgreSQL database
authentication = 'N:/ACCS_Work/Administrative/Credentials/accs-postgresql/authentication.csv'
database_connection = connect_database_postgresql(authentication)

# Query the database and return result as dataframe
query = 'SELECT * FROM point'
point_table = query_to_dataframe(database_connection, query)

# Print dataframe
print(point_table)
