# Alaska Vegetation Plots Database
Alaska Vegetation Plots Database and associated python-based ArcGIS toolbox for data tools and database interaction.

## Getting Started

These instructions will enable you to load a new instance or updated instance of the Alaska Vegetation Plots (VegPlots) Database into a MySQL Server. The database was designed for MySQL but can be loaded into PostgreSQL using the pgloader tool. Instructions are not provided for loading the database into PostgreSQL. These instructions will also enable you to run the Vegetation Database Tools toolbox in ArcGIS Pro. The toolbox is not compatible with ArcGIS Desktop. The ArcGIS python environment must be set up with python libraries that are not included in the ArcGIS python installation by default.

### Prerequisites
1. MySQL 5.6 or 5.7
2. ArcGIS Pro 2.1.3 or higher
3. Python 3.5.3 or higher
4. mysql-connector 2.0.4 or higher
Recommended: phpMyAdmin or MySQL Workbench

If using PostgreSQL:
Required: PostgreSQL 10.3+ and pgloader 3.1+
Recommended: pgAdmin 4

### Installing Database

Install a MySQL (or PostgreSQL) server either on localhost or at a remote location accessible to you. Install optional tools. See documentation from database software for installation and set up help.

Place the vegplots.sql file in the MySQL bin folder temporarily. You can remove or delete after the database has been created.
In the MySQL Command Line Client (not MySQL Shell), execute the commands in createDatabase.sql. The database will automatically load from the vegplots.sql file when you run createDatabase.sql. The resulting vegetation database is identical to the version available online at [https://vegplots.uaa.alaska.edu](https://vegplots.uaa.alaska.edu).

### Installing Toolbox
1. In ArcGIS Pro, select the python management option. Using the conda install option, install the most recent version of mysql-connector.
2. Download or clone this repository and unzip it to a folder on a drive accessible to your computer. Local drives may perform better than network drives. The structure and names of files and folders within the repository should not be altered.
3. In ArcGIS Pro, open the catalog tab, right click the toolbox folder, select "add toolbox", and navigate to the location of the downloaded/unzipped toolbox.
4. In order to query vegetation data, the mysql server must first be set up and an instance of the Alaska VegPlots Database created.

## Usage

### SQL Database
The Alaska VegPlots Database can be interacted with via sql commands or scripts or tools such as phpMyAdmin or MySQL Workbench. The changes made to an instance of the database will not affect the database source on github or the online database available at [https://vegplots.uaa.alaska.edu](https://vegplots.uaa.alaska.edu). Data interactions with the database can be scripted in python and/or R using the appropriate libraries developed for mysql connections. This prevents the need to run queries separately from analysis scripts or export csv files that must be read into data frames in the scripts.

### Database Tools
The Vegplots Database Tools toolbox contains script tools that allow interaction with the mysql database in ArcGIS Pro.

#### Calculate Total Vascular Cover:
"Calculate Total Vascular Cover" queries an instance of the MySQL Alaska Vegetation Plots Database to calculate the total vascular cover per site for all sites that were surveyed exhaustively for vascular plants and returns the results as a csv and a feature class in a file geodatabase.
* *Database User*: Enter the name of the database user with access to the vegplots database.
* *Database Password*: Enter the password for the database user with access to the vegplots database.
* *Database Host*: Leave as 'localhost' if the MySQL Server is running on your local machine or change to the server host location. Otherwise enter the server location for the database to be queried.
* *Database Name*: Leave as 'vegplots' to use the default database name or change to match a custom name for the database.
* *Output csv*: Define a csv file to be created by the tool to store the query output.
* *Output Feature Class*: Define a feature class to be created by the tool to store the query output. The feature class must be in a file geodatabase and will be projected to Alaska Albers Equal Area Conic.

#### Query Taxon Cover:
"Query Taxon Cover" queries the MySQL Alaska Vegetation Plots Database for cover by a taxon. Cover values are aggregated so that multiple values at a single site for a single date are summed.
* *Database User*: Enter the name of the database user with access to the vegplots database.
* *Database Password*: Enter the password for the database user with access to the vegplots database.
* *Database Host*: Leave as 'localhost' if the MySQL Server is running on your local machine or change to the server host location. Otherwise enter the server location for the database to be queried.
* *Database Name*: Leave as 'vegplots' to use the default database name or change to match a custom name for the database.
* *Taxon*: Enter the name of an accepted taxon according to the new Flora of Alaska accessible at [https://floraofalaska.org/comprehensive-checklist/](https://floraofalaska.org/comprehensive-checklist/).
* *Workspace Folder*: Select a folder to which the tool can write temporary files.
* *Output Feature Class*: Enter a geodatabase feature class to store the output.
* *Quantitative Cover*: Selecting 'True' will limit the queried sites to those where the method was quantitative or semi-quantitative visual estimate. Selecting 'False' will include classified cover values, such as Braun-Blanquet.
* *Start Date*: Enter the earliest date to be included in the results.
* *End Date*: Enter the latest date to be included in the results.

#### Query Aggregate Cover:
"Query Aggregate Cover" queries the MySQL Alaska Vegetation Plots Database for cover by an aggregate of taxa. Cover values are aggregated so that multiple values at a single site for a single date are summed.
* *Database User*: Enter the name of the database user with access to the vegplots database.
* *Database Password*: Enter the password for the database user with access to the vegplots database.
* *Database Host*: Leave as 'localhost' if the MySQL Server is running on your local machine or change to the server host location. Otherwise enter the server location for the database to be queried.
* *Database Name*: Leave as 'vegplots' to use the default database name or change to match a custom name for the database.
* *Aggregate*: Enter the names of accepted taxa at the lowest level with each taxon in its own field. Names should be limited to accepted names in the new Flora of Alaska accessible at [https://floraofalaska.org/comprehensive-checklist/](https://floraofalaska.org/comprehensive-checklist/).
* *Workspace Folder*: Select a folder to which the tool can write temporary files.
* *Output Feature Class*: Enter a geodatabase feature class to store the output.
* *Quantitative Cover*: Selecting 'True' will limit the queried sites to those where the method was quantitative or semi-quantitative visual estimate. Selecting 'False' will include classified cover values, such as Braun-Blanquet.
* *Start Date*: Enter the earliest date to be included in the results.
* *End Date*: Enter the latest date to be included in the results.
* *Aggregate Name*: Enter a name for the aggregate.

#### Vegetation Cover Sites:
"Vegetation Cover Sites" queries all sites with associated vegetation cover data and returns the results as a feature class in a file geodatabase.
* *Database User*: Enter the name of the database user with access to the vegplots database.
* *Database Password*: Enter the password for the database user with access to the vegplots database.
* *Database Host*: Leave as 'localhost' if the MySQL Server is running on your local machine or change to the server host location. Otherwise enter the server location for the database to be queried.
* *Database Name*: Leave as 'vegplots' to use the default database name or change to match a custom name for the database.
* *Workspace Folder*: Select a folder to which the tool can write temporary files.
* *Output Feature Class*: Enter a geodatabase feature class to store the output.
* *Type*: Define target life group of survey sites.
* *Quantitative Cover*: Selecting 'True' will limit the queried sites to those where the method was quantitative or semi-quantitative visual estimate. Selecting 'False' will include classified cover values, such as Braun-Blanquet.
* *Start Date*: Enter the earliest date to be included in the results.
* *End Date*: Enter the latest date to be included in the results.

## Credits

### Built With
* MySQL 5.6
* phpMyAdmin 4.7.7
* MySQL Workbench 6.3 CE
* ArcGIS Pro 2.0
* Notepad ++
* mysql-connecter 2.0.4

### Authors

* **Timm Nawrocki** - *Alaska Center for Conservation Science, University of Alaska Anchorage*

### Usage Requirements

None

### License

This project is private and can be used by Alaska Center for Conservation Science and collaborators.
