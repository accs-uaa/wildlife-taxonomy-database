# vegetation-plots-database
SQL code for the ACCS vegetation plots MySQL database.

## Getting Started

These instructions will enable you to run a static local copy of the ACCS vegetation plots database. The database was designed for MySQL but will likely run in PostgreSQL as well (not tested).

### Prerequisites
Required: MySQL 5.6 or 5.7 (or PostgreSQL version unknown)
Recommended: phpMyAdmin or MySQL Workbench

### Installing

Install a local MySQL (or PostgreSQL) server. Install optional tools locally. See documentation from source.

Place the vegplots.sql file in the MySQL bin folder temporarily. You can remove or delete after the database has been created.
In MySQL command prompt or a SQL command window, create the database according to the SQL commands in createDatabase.sql. The database will automatically load from the vegplots.sql file when you run createDatabase.sql.

## Usage

### SQL Queries
Once the database has generated, you can use the SQL commands in the additional SQL files to run queries for database views.

## Credits

### Built With
* MySQL 5.6
* phpMyAdmin 4.7.7
* MySQL Workbench 6.3 CE

### Authors

* **Timm Nawrocki** - *Alaska Center for Conservation Science, University of Alaska Anchorage*

### Usage Requirements

None

### License

This project is private and can be used by Alaska Center for Conservation Science and collaborators.
