-- SET MAX_DATE = (SELECT MAX(CAL_DT) FROM LAND.CALENDAR);
-- SET MIN_DATE = (SELECT MIN(CAL_DT) FROM LAND.CALENDAR);
-- SELECT $MAX_DATE;

----------------------------------------------------------
-- INITIAL LOAD ONLY
----------------------------------------------------------
--------------------------------------------------------
-- dim_calendar TYPE 0 ***ONLY RUN ONCE AND FORGET******
---------------------------------------------------------
SELECT MAX(CAL_DT) max_date,
       MIN(CAL_DT) min_date
FROM LAND.CALENDAR;

INSERT INTO ENTERPRISE.dim_calendar
(   date_sk,
    cal_dt,
	day_of_wk_num,
    day_of_wk_desc,
	yr_num,
	wk_num,
	yr_wk_num,
	month_num,
	yr_month_num,
	qtr_num,
	yr_qtr_num
)
SELECT 
    TO_NUMBER(TO_CHAR(d, 'YYYYMMDD')) AS date_sk,
    d AS cal_dt,
    EXTRACT(DAYOFWEEK_ISO FROM d) AS day_of_wk_num,   -- ISO: 1=Mon, 7=Sun
    TRIM(TO_CHAR(d, 'Day')) AS day_of_wk_desc,        -- e.g., Monday
    EXTRACT(YEAR FROM d) AS yr_num,
    EXTRACT(WEEK FROM d) AS wk_num,
    (EXTRACT(YEAR FROM d) * 100 + EXTRACT(WEEK FROM d)) AS yr_wk_num,
    EXTRACT(MONTH FROM d) AS month_num,
    (EXTRACT(YEAR FROM d) * 100 + EXTRACT(MONTH FROM d)) AS yr_month_num,
    (EXTRACT(QUARTER FROM d)) AS qtr_num,
    (EXTRACT(YEAR FROM d) * 10 + EXTRACT(QUARTER FROM d)) AS yr_qtr_num
FROM (
    SELECT DATEADD(DAY, SEQ4(), DATE '1990-01-01') AS d
    FROM TABLE(GENERATOR(ROWCOUNT => 15000))   -- enough rows for ~41 years
) t
WHERE d <= DATE '2030-12-31';

-- EDA
SELECT *
FROM ENTERPRISE.dim_calendar
LIMIT 10;

------------------------------------------------
-- INITIAL LOAD & DELTA LOAD CODES
------------------------------------------------
-- dim_store TYPE 2
---------------------------
SELECT *
FROM LAND.store
LIMIT 5;

-- INSERT

MERGE INTO ENTERPRISE.dim_store t1
USING LAND.store t2
ON t1.store_natural_key = t2.store_key
    AND t1.store_name = t2.store_desc
    AND t1.addr = t2.addr
    AND t1.city = t2.city
    AND t1.cntry_cd = t2.cntry_cd
    AND t1.cntry_nm = t2.cntry_nm
    AND t1.prov_name = t2.prov_state_desc
    AND t1.prov_code = t2.prov_state_cd
    AND t1.market_key=t2.market_key
    AND t1.market_name=t2.market_name
    AND t1.submarket_key=t2.submarket_key
    AND t1.submarket_name=t2.submarket_name
    AND t1.latitude=t2.latitude
    AND t1.longitude=t2.longitude
WHEN NOT MATCHED
THEN INSERT (
    store_natural_key,
	store_name,
	addr,
	city,
	region,
	cntry_cd,
	cntry_nm,
	postal_zip_cd,
	prov_name,
	prov_code,
	market_key,
	market_name,
	submarket_key,
	submarket_name,
	latitude,
	longitude,
	tlog_active_flg,
	start_dt,
	end_dt)
VALUES
(
	t2.store_key,
	t2.store_desc,
	t2.addr,
	t2.city,
	t2.region,
	t2.cntry_cd,
	t2.cntry_nm,
	t2.postal_zip_cd,
	t2.prov_state_desc,
	t2.prov_state_cd,
	t2.market_key,
	t2.market_name,
	t2.submarket_key,
	t2.submarket_name,
	t2.latitude,
	t2.longitude,
	TRUE,
	current_date(),
	NULL
);

-- UPDATE

MERGE INTO ENTERPRISE.dim_store t1
USING LAND.store t2
ON t1.store_natural_key = t2.store_key
WHEN MATCHED
AND (t1.store_name != t2.store_desc
    OR t1.addr != t2.addr
    OR t1.city != t2.city
    OR t1.cntry_cd != t2.cntry_cd
    OR t1.cntry_nm != t2.cntry_nm
    OR t1.prov_name != t2.prov_state_desc
    OR t1.prov_code != t2.prov_state_cd
    OR t1.market_key!=t2.market_key
    OR t1.market_name!=t2.market_name
    OR t1.submarket_key!=t2.submarket_key
    OR t1.submarket_name!=t2.submarket_name
    OR t1.latitude!=t2.latitude
    OR t1.longitude!=t2.longitude    
)
THEN UPDATE SET end_dt = CURRENT_DATE(),
                tlog_active_flg=FALSE;
                

-- EDA
SELECT COUNT(*) FROM LAND.store;
SELECT COUNT(*) FROM ENTERPRISE.store;
SELECT * FROM ENTERPRISE.store LIMIT 5;


----------------------------------------
-- dim_product TYPE 2
----------------------------------------
SELECT COUNT(*) FROM LAND.product;

-- INSERT 
MERGE INTO ENTERPRISE.dim_product t1
USING LAND.product t2
ON t1.prod_natural_key = t2.prod_key
    AND t1.prod_name = t2.prod_name
    AND t1. vol = t2.vol
    AND t1.wgt = t2.wgt
    AND t1.brand_name = t2.brand_name
    AND t1.status_code=t2.status_code
    AND t1.status_code_name=t2.status_code_name
    AND t1.category_key=t2.category_key
    AND t1.category_name=t2.category_name
    AND t1.subcategory_key=t2.subcategory_key
    AND t1.subcategory_name=t2.subcategory_name   
WHEN NOT MATCHED
THEN INSERT (
    prod_natural_key,
    prod_name,
    vol,
    wgt,
    brand_name,
    status_code,
    status_code_name,
    category_key,
    category_name,
    subcategory_key,
    subcategory_name,
    tlog_active_flg,
    start_dt,
    end_dt)
VALUES
(
    t2.prod_key,
    t2.prod_name,
    t2.vol,
    t2.wgt,
    t2.brand_name,
    t2.status_code,
    t2.status_code_name,
    t2.category_key,
    t2.category_name,
    t2.subcategory_key,
    t2.subcategory_name,
    TRUE,
    CURRENT_DATE(),
    NULL
);

-- UPDATE
MERGE INTO ENTERPRISE.dim_product t1
USING LAND.product t2
ON t1.prod_natural_key = t2.prod_key
WHEN MATCHED 
AND (
    t1.prod_name!=t2.prod_name 
    OR t1.vol!=t2.vol 
    OR t1.wgt!=t2.wgt
    OR t1.brand_name!=t2.brand_name
    OR t1.status_code!=t2.status_code
    OR t1.status_code_name!=t2.status_code_name
    OR t1.category_key!=t2.category_key
    OR t1.category_name!=t2.category_name
    OR t1.subcategory_key!=t2.subcategory_key
    OR t1.subcategory_name!=t2.subcategory_name
)
THEN UPDATE SET t1.end_dt = CURRENT_TIMESTAMP(),
                t1.tlog_active_flg = FALSE;


----------------------------------------
-- fact_daily_sales SURROGATE KEY
----------------------------------------
-- Preparing code for incremental load
-- Step 1
-- First extract the max date from the fact_daily_sales table 
SET LAST_DATE = (SELECT MAX(date_sk) FROM ENTERPRISE.fact_daily_sales);
SELECT $LAST_DATE;
-- Step 2
-- Remove incomplete record of the last day from the ENTERPRISE.fact_daily_sales table
-- use the variable to filter the raw data records. But in order avoid possibility of imcomplete records of the latest date,
-- we need to delete the original latest date in the fact table walmart_anl.sales_inv_store_dy and append the new records from that date.

DELETE FROM ENTERPRISE.fact_daily_sales 
WHERE date_sk = $LAST_DATE;

-- DELETE FROM ENTERPRISE.fact_weekly_sales 
-- WHERE yr_num = EXTRACT(YEAR FROM TO_DATE($LAST_DATE::TEXT, 'YYYYMMDD')) 
--     AND wk_num = EXTRACT(WEEK FROM DATE($LAST_DATE::TEXT, 'YYYYMMDD'));


-- Step 3
-- Extract data from LAND.sales table and load into a transient table

SELECT * FROM LAND.sales LIMIT 5;
SELECT * FROM ENTERPRISE.dim_calendar LIMIT 5;

CREATE OR REPLACE TRANSIENT TABLE ENTERPRISE.sales_stg
AS
SELECT COALESCE(c.date_sk, -1) AS date_sk,
       COALESCE(s.store_sk, -1) AS store_sk,
       COALESCE(p.prod_sk, -1) AS prod_sk,
       SUM(sales_qty) AS sales_qty,
       AVG(sales_price) AS sales_price,
       SUM(sales_amt) AS sales_amount,
       AVG(discount) AS discount,
       SUM(sales_cost) AS sales_cost,
       SUM(sales_mgrn) AS sales_margin,
       AVG(ship_cost) AS ship_cost
FROM LAND.sales sl
LEFT JOIN ENTERPRISE.dim_store s ON sl.store_key = s.store_natural_key
LEFT JOIN ENTERPRISE.dim_product p ON sl.prod_key = p.prod_natural_key
LEFT JOIN ENTERPRISE.dim_calendar c ON sl.trans_dt = c.cal_dt
WHERE trans_dt >= NVL(DATE($LAST_DATE::TEXT, 'YYYYMMDD'), '1900-01-01')
GROUP BY c.date_sk, 
         s.store_sk,
         p.prod_sk
ORDER BY c.date_sk,
         s.store_sk,
         p.prod_sk;

SELECT * FROM ENTERPRISE.sales_stg WHERE SALES_QTY = 33.60 LIMIT 5;
SELECT * FROM LAND.sales WHERE SALES_QTY = 33.60 LIMIT 5;

-- Step 4
-- Extract data from LAND.inventory table and load into a transient table  
SELECT * FROM LAND.inventory LIMIT 5;

CREATE OR REPLACE TRANSIENT TABLE ENTERPRISE.inventory_stg
AS
SELECT COALESCE(c.date_sk, -1) AS date_sk,
       COALESCE(s.store_sk, -1) AS store_sk,
       COALESCE(p.prod_sk, -1) AS prod_sk,
       inventory_on_hand_qty,
       inventory_on_order_qty,
       out_of_stock_flg
FROM LAND.inventory i
LEFT JOIN ENTERPRISE.dim_store s ON i.store_key = s.store_natural_key
LEFT JOIN ENTERPRISE.dim_product p ON i.prod_key = p.prod_natural_key
LEFT JOIN ENTERPRISE.dim_calendar c ON i.cal_dt = c.cal_dt
WHERE i.cal_dt >= NVL(DATE($LAST_DATE::TEXT, 'YYYYMMDD'), '1900-01-01');

-- Step 5
-- Join the above two table and load data into ENTERPRISE.fact_daily_sales
-- Use OUTER JOIN to capture both sales and inventory data
-- Handles all cases: a)Sales but no inventory b)Inventory but no sales

INSERT INTO ENTERPRISE.fact_daily_sales
(
DATE_SK,
STORE_SK,
PROD_SK,
SALES_QTY,
SALES_PRICE,
SALES_AMT,
DISCOUNT,
SALES_COST,
SALES_MGRN,
SHIP_COST,
STOCK_ON_HAND_QTY,
STOCK_ON_ORDER_QTY,
OUT_OF_STOCK_FLG,
IN_STOCK_FLG,
Low_STOCK_FLG
)
SELECT COALESCE(s.date_sk, i.date_sk),
       COALESCE(s.store_sk, i.store_sk),
       COALESCE(s.prod_sk, i.prod_sk),
       NVL(s.sales_qty, 0),
       NVL(s.sales_price, 0),
       NVL(s.sales_amount, 0),
       NVL(s.discount, 0),
       NVL(s.sales_cost, 0),
       NVL(s.sales_margin, 0),
       NVL(s.ship_cost, 0),
       NVL(i.inventory_on_hand_qty, 0) AS stock_on_hand_qty,
       NVL(i.inventory_on_order_qty, 0) AS stock_on_order_qty,
       IFF(i.out_of_stock_flg = True, False, True) in_stock_flg,
       IFF(i.out_of_stock_flg = True, True, False) out_of_stock_flg,
       IFF(s.sales_qty > i.inventory_on_hand_qty, True, False) low_stock_flg
FROM ENTERPRISE.sales_stg s 
FULL OUTER JOIN ENTERPRISE.inventory_stg i
USING (date_sk, store_sk, prod_sk);


----------------------------------------
-- fact_weekly_sales **CREATE A NWE ONE EVERY TIME
----------------------------------------
-- Use the ENTERPRISE.fact_daily_sales and join to ENTERPRISE.dim_calendar table to get weekly sales
-- Use Inner Join as it ensures bad dates don’t sneak in
TRUNCATE TABLE IF EXISTS ENTERPRISE.fact_weekly_sales;

INSERT INTO ENTERPRISE.fact_weekly_sales
(
YR_NUM,
WK_NUM,
STORE_SK,
PROD_SK,
WK_SALES_QTY,
AVG_SALES_PRICE,
WK_SALES_AMT,
WK_DISCOUNT	,
WK_SALES_COST,
WK_SALES_MGRN,
WK_SHIP_COST,
EOP_STOCK_ON_HAND_QTY,
EOP_STOCK_ON_ORDER_QTY,
IN_STOCK_TIMES,
OUT_OF_STOCK_TIMES,
Low_STOCK_TIMES
)
SELECT c.yr_num AS yr_num,
       c.wk_num AS wk_num,
       store_sk,
       prod_sk,
       SUM(sales_qty) AS sales_qty,
       IFF(SUM(sales_qty) = 0, 0, SUM(sales_amt) / SUM(sales_qty)) AS sales_price, --avg sale price
       SUM(sales_amt) AS sales_amount,
       IFF(SUM(sales_qty) = 0, 0, SUM(discount) / SUM(sales_qty)) AS discount, --avg discount
       SUM(sales_cost) AS sales_cost,
       SUM(sales_mgrn) AS sales_margin,
       AVG(ship_cost) AS ship_cost,
       MAX(IFF(c.DAY_OF_WK_NUM = 6, stock_on_hand_qty, 0)) AS eop_stock_on_hand_qty, --MAX picks that one non-NULL value (50 in the example). It’s more efficient than filtering with a subquery.
       MAX(IFF(c.DAY_OF_WK_NUM = 6, stock_on_order_qty, 0)) AS eop_stock_on_order_qty,
       SUM(CASE WHEN in_stock_flg THEN 1 ELSE 0 END) AS in_stock_times,
       SUM(CASE WHEN out_of_stock_flg THEN 1 ELSE 0 END) out_of_stock_times,
       SUM(IFF(low_stock_flg = True, 1, 0)) low_stock_times
FROM ENTERPRISE.fact_daily_sales s
INNER JOIN ENTERPRISE.dim_calendar c
USING (date_sk)
GROUP BY c.yr_num,
         c.wk_num,
         store_sk,
         prod_sk
ORDER BY c.yr_num,
         c.wk_num,
         store_sk,
         prod_sk;         