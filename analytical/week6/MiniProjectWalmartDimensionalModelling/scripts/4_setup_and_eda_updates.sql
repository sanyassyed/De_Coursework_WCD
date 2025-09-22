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

----------------------------
-- TEST SETUP
-----------------------------
-- Update the original dataset with the following scripts.
-- We are simulating data change in the following source tables
-- Sales - Adding 3 sale trnasactions
-- Inventory - Adding 5 inventory updates
-- Product - Updating two products and inserting one new product

-- Inserting new records in LAND.sales
INSERT INTO LAND.sales
VALUES
(302836,540260,3220,'2012-12-31',18,37.80,3.58,129.42,0.01,300.72,-150.37,5.47),
(312076,399912,3220,'2013-01-01',7,29.00,145.45,3773.59,0.02,3486.71,731.32,17.85),
(337584,135665,1104,'2013-01-02',18,11.00,41.32,447.09,0.09,365.40,89.03,8.66);

-- Inserting new records in LAND.inventory
INSERT INTO LAND.inventory
VALUES
('2012-12-31',1103,540260,26.46,75.60,1,0.00,'FALSE','2012-12-31'),
('2012-12-31',1103,904715,27.09,21.07,0,1.00,'FALSE','2012-12-31'),
('2013-01-01',1104,135665,11.00,14.30,1,0.00,'FALSE','2012-12-31'),
('2013-01-01',1104,200147,6.72,5.88,0,0.00,'TRUE','2012-12-31'),
('2013-01-02',1104,399912,7.83,46.98,1,1.00,'TRUE','2012-12-31');

-- Update & Insert in table LAND.product
UPDATE LAND.PRODUCT SET PROD_NAME='CHANGE-1' WHERE PROD_KEY=657768;
UPDATE LAND.PRODUCT SET PROD_NAME='CHANGE-2' WHERE PROD_KEY=293693;
INSERT INTO LAND.PRODUCT VALUES (999999,'ADD-1',2.22, 88.88, 'brand-999', 1, 'active', 4, 'category-4', 1, 'subcategory-1');

-- RUN THE codes in dml.sql script
-- MERGE INTO
SELECT * FROM LAND.PRODUCT WHERE PROD_KEY =  999999;

----------------------------
-- TEST
-----------------------------
-- Before Insert
-- Total records in ENTERPRISE.fact_daily_sales : 
SELECT COUNT(*) FROM ENTERPRISE.fact_daily_sales; --1192296
-- Total records in ENTERPRISE.weekly_daily_sales : 
SELECT COUNT(*) FROM ENTERPRISE.fact_weekly_sales; --1172364
-- Total unique products in ENTERPRISE.fact_daily_sales, dim_product & fact_weekly_sales :
SELECT COUNT(DISTINCT PROD_NATURAL_KEY) FROM ENTERPRISE.dim_product; --1215
SELECT COUNT(DISTINCT PROD_SK) FROM ENTERPRISE.fact_daily_sales; --1212
SELECT COUNT(DISTINCT PROD_SK) FROM ENTERPRISE.fact_weekly_sales; --1212
-- Total unique products in ENTERPRISE.fact_weekly_sales :
-- Total unique products in ENTERPRISE.dim_product :
SELECT min(date_sk), MAX(date_sk) FROM ENTERPRISE.fact_daily_sales; --20090101 20121230
SELECT * FROM ENTERPRISE.dim_product WHERE PROD_NATURAL_KEY=657768; --1 records

-- After Insert
-- Total records in ENTERPRISE.fact_daily_sales : 
SELECT COUNT(*) FROM ENTERPRISE.fact_daily_sales; --1192304
-- Total records in ENTERPRISE.weekly_daily_sales : 
SELECT COUNT(*) FROM ENTERPRISE.fact_weekly_sales; --1172371
-- Total unique products in ENTERPRISE.fact_daily_sales :
-- Total unique products in ENTERPRISE.fact_weekly_sales :
-- Total unique products in ENTERPRISE.dim_product :
SELECT COUNT(DISTINCT PROD_NATURAL_KEY) FROM ENTERPRISE.dim_product; --1216
SELECT COUNT(DISTINCT PROD_SK) FROM ENTERPRISE.fact_daily_sales; --1212
SELECT COUNT(DISTINCT PROD_SK) FROM ENTERPRISE.fact_weekly_sales; --1212

SELECT min(date_sk), MAX(date_sk) FROM ENTERPRISE.fact_daily_sales; --20090101 20130102
SELECT * FROM ENTERPRISE.dim_product WHERE PROD_NATURAL_KEY=657768; --2 records


