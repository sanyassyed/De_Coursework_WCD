--------------------
-- Create Walmart DB
--------------------
CREATE DATABASE IF NOT EXISTS WALMART_DB;
USE DATABASE WALMART_DB;
-- DROP DATABASE WALMART_DB;

-----------------------
-- DATA LOAD CHECK & EDA
------------------------
SELECT COUNT(*) total_records
FROM LAND.calendar; -- 10598

SELECT COUNT(*) total_records
FROM LAND.product; -- 1215

SELECT COUNT(*) total_records
FROM LAND.store; -- 151

SELECT COUNT(*) total_records
FROM LAND.inventory; -- 1192296

SELECT COUNT(*) total_records
FROM LAND.sales; -- 1062368



