# Mini Project - WALMART - ETL and Data Loads
* Project Description - [here](./project_description.pdf)
* Data - [here](./data/)

## Tools
* DBeaver - To create and load; database, schemas and tables as `Snowflake` has a limit on the sql query script
* Snowflake - Where the actual database resides

## DW Structure
* Datawarehouse - `COMPUTE_WH`
* Database - `WALMART_DB`
* Landing Schema / Raw Schema / Bronze - `LAND`
* Enterprise Schema / Staging / Silver - `ENTERPRISE`


## DBeaver Connection 
* Create the DB `WALMART_DB` on `Snowflake` [code](./scripts/snowflake_setup_and_eda.sql)
* Refer to [Week 5 -DVD Store Mini project](../../week5/MiniProjectDvdStoreDimentionalModelling/README.md#step-0-create-oltp-database-on-snowflake-using-dbeaver)


## Data Modelling 
* Conceptual Model
    * Identify the business process - done [here](./docs/Data%20Model%20of%20Walmart.xlsx) `OS datasets` sheet
    * Identify the grain
* Logical Model
    * Star Schema - done [here](./docs/Data%20Model%20of%20Walmart.xlsx) `data model` sheet
    * Choose the dimensions - calendar_dim, product_dim, store_dim
    * Choose the measures - daily_fact, weekly_fact
* Physical Model
    * Load data from OLTP source into `LAND` 
        * Create tables in the `LAND` schema [script](./scripts/load_into_landing.sql)
        * Load data into each table from [here](./docs/) by left clicking on the table in DBeaver and selecting `Import Data` option
    * DDL [script](./scripts/ddl.sql)
    * DML [script](./scripts/dml.sql)

## Data Loading
* Incremental Load - `Initial Load` & `Delta Load`
* calendar_dim - Type 0
* product_dim - Type 2
* store_dim - Type 2

## Reference
* Week 6 - Lecture 2 & Lab