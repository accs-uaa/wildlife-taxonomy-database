# Fauna of Alaska Database
Scripts to compile the Fauna of Alaska database ([https://faunaofalaska.org]()) from source data. These instructions will enable you to load a new instance or update an existing instance of the Fauna of Alaska Database into a PostgreSQL 12.4+ server. 

## Getting Started

The database was designed for PostgreSQL. Instructions are not provided for loading the database into other SQL platforms; however, advanced users can modify the replication scripts to create the database in other SQL platforms as well. The instructions included in this readme file will also enable you to construct an empty taxonomic database for management of other data.

### Prerequisites
1. PostgreSQL 12.4+
2. R 4.1.0+

Install a PostgreSQL 12.4+ server either on localhost or at a remote location that you control. See documentation from database software for installation and set up help.

### Creating the Database

To build an empty version of the database (i.e., no data loaded into it), run the **Build** scripts located in the **01_database_build** folder. Building an empty database will enable new data to be inserted into it. 

To process new data, use the R scripts in the **02_data_insertion** folder to create SQL Insert statements from source data. 

To build a replicate copy of the database, run all R scripts and SQL statements included in the repository in the numerical order associated with the folders and script names. SQL statements can be executed in a SQL interpreter configured to access your database server. The resulting vegetation database will be identical to the version available online at [https://faunaofalaska.org](https://faunaofalaska.org). 

All scripts should be run in the numeric order associated with the script names. 

## Usage

You can interact with the Fauna of Alaska Database via SQL queries in a SQL interpreter, through Python or R with PostgreSQL connection packages, or through ArcGIS Pro facilitated by Python. The database schema and data dictionary show users the structure of the database for the purpose of querying data or entering new data. 

## Credits

### Built With
* PostgreSQL 12.4
* DataGrip 2021.1.3
* R 4.1.0
* RStudio 1.4.1717

### Authors

* **Timm Nawrocki** - *Alaska Center for Conservation Science, University of Alaska Anchorage*
* **Amanda Droghini** - *Alaska Center for Conservation Science, University of Alaska Anchorage* 

### Support

The Alaska Department of Fish & Game and the University of Alaska Anchorage provided funding to support the development of the Fauna of Alaska database. Thank you for your support.

### Usage Requirements

None

### License

This repository and its contents are licensed under Creative Commons Attribution-Share Alike.
