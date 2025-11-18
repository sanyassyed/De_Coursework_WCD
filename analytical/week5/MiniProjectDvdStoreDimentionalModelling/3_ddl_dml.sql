USE DATABASE WCD_LAB;

CREATE SCHEMA IF NOT EXISTS sakila_anl;

-- DDL

-- Customer Table - Dimension
CREATE TABLE IF NOT EXISTS sakila_anl.dim_customer (
customer_id INT PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
email VARCHAR(500),
address VARCHAR(500),
address2 VARCHAR(500),
district VARCHAR(50),
city VARCHAR(50),
country VARCHAR(50),
post_code VARCHAR(10),
phone VARCHAR(20),
active BOOLEAN,
create_date TIMESTAMP
);


-- Staff Table - Dimension
CREATE TABLE IF NOT EXISTS sakila_anl.dim_staff (
staff_id int PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
email VARCHAR(500),
address VARCHAR(500),
address2 VARCHAR(500),
district VARCHAR(50),
city VARCHAR(50),
country VARCHAR(50),
post_code VARCHAR(10),
phone VARCHAR(20),
active BOOLEAN,
username VARCHAR(500),
password VARCHAR(500),
picture VARCHAR(500)
);

-- Store Table - Dimension
CREATE TABLE IF NOT EXISTS sakila_anl.dim_store (
store_id INT PRIMARY KEY,
manager_firstname VARCHAR(255),
manager_lastname VARCHAR(255),
address VARCHAR(500),
address2 VARCHAR(500),
district VARCHAR(50),
city VARCHAR(50),
country VARCHAR(50),
post_code VARCHAR(10),
phone VARCHAR(20)
);

-- Film Table - Dimension
CREATE TABLE IF NOT EXISTS sakila_anl.dim_film (
film_id INT PRIMARY KEY,
title VARCHAR(500),
description TEXT,
release_year INT,
language_name VARCHAR(20),
original_language_name VARCHAR(20),
rental_duration INT,
rental_rate NUMERIC,
length INT,
replacement_cost NUMERIC,
rating VARCHAR(100),
special_features VARCHAR(255),
category_name VARCHAR(50),
actor_firstname VARCHAR(255),
actor_lastname VARCHAR(255)
);



-- Calendar Table - Dimension
CREATE OR REPLACE TABLE sakila_anl.dim_calendar (
    date_id INT PRIMARY KEY,         -- YYYYMMDD format
    cal_dt DATE,
    day_of_wk_num INT,               -- 1=Monday … 7=Sunday
    day_of_wk_desc VARCHAR(30),      -- Monday, Tuesday, etc.
    yr_num INT,
    wk_num INT,                      -- ISO week number
    yr_wk_num INT,                   -- YYYYWW
    mnth_num INT,                    -- 1-12
    yr_mnth_num INT                  -- YYYYMM
);


-- Transaction Table - Fact
CREATE OR REPLACE TABLE sakila_anl.fact_transaction (
payment_id INT PRIMARY KEY,
trans_dt_key INT REFERENCES sakila_anl.dim_calendar(date_id),
rental_dt_key INT REFERENCES sakila_anl.dim_calendar(date_id),
return_dt_key INT REFERENCES sakila_anl.dim_calendar(date_id),
customer_id INT REFERENCES sakila_anl.dim_customer(customer_id),
staff_id INT REFERENCES sakila_anl.dim_staff(staff_id),
store_id INT REFERENCES sakila_anl.dim_store(store_id),
film_id INT REFERENCES sakila_anl.dim_film(film_id),
payment_amount NUMERIC,
is_decline BOOLEAN
);

-- DML
-- Calendar Dimension
-- Populate calendar dimension from 1990 to 2030
INSERT INTO sakila_anl.dim_calendar
SELECT 
    TO_NUMBER(TO_CHAR(d, 'YYYYMMDD')) AS date_id,
    d AS cal_dt,
    EXTRACT(DAYOFWEEK_ISO FROM d) AS day_of_wk_num,   -- ISO: 1=Mon, 7=Sun
    TRIM(TO_CHAR(d, 'Day')) AS day_of_wk_desc,        -- e.g., Monday
    EXTRACT(YEAR FROM d) AS yr_num,
    EXTRACT(WEEK FROM d) AS wk_num,
    (EXTRACT(YEAR FROM d) * 100 + EXTRACT(WEEK FROM d)) AS yr_wk_num,
    EXTRACT(MONTH FROM d) AS mnth_num,
    (EXTRACT(YEAR FROM d) * 100 + EXTRACT(MONTH FROM d)) AS yr_mnth_num
FROM (
    SELECT DATEADD(DAY, SEQ4(), DATE '1990-01-01') AS d
    FROM TABLE(GENERATOR(ROWCOUNT => 15000))   -- enough rows for ~41 years
) t
WHERE d <= DATE '2030-12-31';


-- Customer Dimension

-- Staff Dimension

-- Store Dimension

-- Film Dimension



-- Transaction Fact