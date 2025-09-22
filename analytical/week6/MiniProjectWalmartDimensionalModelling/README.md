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
    * Choose the dimensions - dim_calendar, dim_product, dim_store
    * Choose the measures - fact_daily_sales, fact_weekly_sales
* Physical Model
    * Load data from OLTP source into `LAND` 
        * Create tables in the `LAND` schema [script](./scripts/1_load_into_landing.sql)
        * Load data into each table from [here](./docs/) by left clicking on the table in DBeaver and selecting `Import Data` option
    * DDL [script](./scripts/2_ddl.sql) to **CREATE** the following tables
        * dim_calendar
        * dim_store
        * dim_product
        * fact_daily_sales
        * fact_weekly_sales
    * DML [script](./scripts/3_dml.sql) to **LOAD** the following tables ising the **Incremental Load** DATA LOADING Methodology
        * dim_calendar 
            * `Initial Load` - INSERT - Type 0 SCD
        * dim_store - Type 2
            * `Initial Load` & `Delta Load` - Same script for INSERT & UPDATE - Type 2 SCD
        * dim_product - Type 2
            * `Initial Load` & `Delta Load` - Same script for INSERT & UPDATE - Type 2 SCD

## Update and Test
* Done [here](./scripts/4_setup_and_eda_updates.sql)

## Todo:
Add foreign key in the ddl

## Reference
* Week 6 - Lecture 2 & Lab