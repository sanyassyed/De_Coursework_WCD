--------------------
-- Create Database
--------------------
CREATE DATABASE IF NOT EXISTS WALMART_DB;
USE DATABASE WALMART_DB;
-- DROP DATABASE WALMART_DB;

--------------------
-- Create Schemas
--------------------

USE DATABASE WALMART_DB;

SHOW SCHEMAS;

-- DROP SCHEMA IF EXISTS ENTERPRISE;

CREATE SCHEMA IF NOT EXISTS ENTERPRISE;

USE SCHEMA ENTERPRISE;

SELECT *
FROM LAND.CALENDAR
LIMIT 5;

---------------------------
-- dim_calendar
---------------------------
-- DROP TABLE IF EXISTS ENTERPRISE.dim_calendar;
CREATE TABLE IF NOT EXISTS ENTERPRISE.dim_calendar
(	date_sk int PRIMARY KEY,
	cal_dt	date NOT NULL,
	cal_type_name	varchar(20) default 'Fiscal',
	day_of_wk_num 	integer,
    day_of_wk_desc varchar(10),
	yr_num	integer,
	wk_num	integer,
	yr_wk_num	 integer,
	month_num	integer,
	yr_month_num	integer,
	qtr_num	integer,
	yr_qtr_num	integer,
	update_time	timestamp default CURRENT_TIMESTAMP()
);
DESCRIBE TABLE ENTERPRISE.dim_calendar;

---------------------------
-- dim_store
---------------------------
SELECT * FROM LAND.dim_store
LIMIT 10;
-- DROP TABLE ENTERPRISE.dim_store;

CREATE TABLE IF NOT EXISTS ENTERPRISE.dim_store
(   store_sk INTEGER AUTOINCREMENT PRIMARY KEY,
	store_natural_key	INTEGER,
	store_name	varchar(150),
	addr	varchar(500),
	city	varchar(50),
	region varchar(100),
	cntry_cd	varchar(30),
	cntry_nm	varchar(150),
	postal_zip_cd	varchar(10),
	prov_name	varchar(30),
	prov_code	varchar(30),
	market_key	integer,
	market_name	varchar(150),
	submarket_key	integer,
	submarket_name	varchar(150),
	latitude	NUMERIC(19, 6),
	longitude	NUMERIC(19, 6),
	tlog_active_flg boolean,
	start_dt date,
	end_dt date,
	update_time	timestamp default CURRENT_TIMESTAMP()
);

---------------------------
-- dim_product
---------------------------
-- DROP TABLE ENTERPRISE.dim_product;
CREATE TABLE IF NOT EXISTS ENTERPRISE.dim_product
(
    prod_sk INTEGER AUTOINCREMENT PRIMARY KEY,
    prod_natural_key INTEGER,
    prod_name	varchar(150),
	vol	numeric(19,3),
	wgt	numeric(19,3),
	brand_name	varchar,
	status_code	varchar(30),
	status_code_name 	varchar(30),
	category_key	integer,
	category_name	varchar(150),
	subcategory_key	integer,
	subcategory_name	varchar(150),
	start_dt date,
	end_dt date,	
	tlog_active_flg	boolean,
	update_time timestamp default CURRENT_TIMESTAMP()
);

---------------------------
-- fact_daily_sales
---------------------------
-- DROP TABLE IF EXISTS ENTERPRISE.fact_daily_sales;

CREATE TABLE ENTERPRISE.fact_daily_sales
(
daily_sale_sk INTEGER AUTOINCREMENT PRIMARY KEY,
DATE_SK	integer,
STORE_SK	integer,
PROD_SK	integer,
SALES_QTY	number(38,2),
SALES_PRICE	number(38,2),
SALES_AMT	number(38,2),
DISCOUNT	number(38,2),
SALES_COST	number(38,2),
SALES_MGRN	number(38,2),
SHIP_COST number(38, 2),
STOCK_ON_HAND_QTY	number(38,2),
STOCK_ON_ORDER_QTY	number(38,2),
OUT_OF_STOCK_FLG	boolean,
IN_STOCK_FLG	boolean,
Low_STOCK_FLG	boolean,
UPDATE_TIME	timestamp default CURRENT_TIMESTAMP()
);

---------------------------
-- fact_weekly_sales
---------------------------
-- DROP TABLE IF EXISTS ENTERPRISE.fact_weekly_sales;

CREATE OR REPLACE TABLE ENTERPRISE.fact_weekly_sales
(	
weekly_sale_sk INTEGER AUTOINCREMENT PRIMARY KEY,
YR_NUM	integer,
WK_NUM	integer,
STORE_sk integer,
PROD_sk	integer,
WK_SALES_QTY	number(38,2),
AVG_SALES_PRICE	number(38,2),
WK_SALES_AMT	number(38,2),
WK_DISCOUNT	number(38,2),
WK_SALES_COST	number(38,2),
WK_SALES_MGRN	number(38,2),
WK_SHIP_COST number(38, 0),
EOP_STOCK_ON_HAND_QTY	number(38,2),
EOP_STOCK_ON_ORDER_QTY	number(38,2),
OUT_OF_STOCK_TIMES	integer,
IN_STOCK_TIMES	integer,
Low_STOCK_TIMES	integer,
UPDATE_TIME	timestamp default CURRENT_TIMESTAMP()
);

SELECT * FROM LAND.sales LIMIT 5;