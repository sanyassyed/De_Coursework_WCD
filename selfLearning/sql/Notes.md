# SQL Topics
Find here the important concepts in SQLl
## Stored Procedures
* [Video](https://youtu.be/OT1RErkfLNQ?t=8943)
* [Code](https://github.com/AlexTheAnalyst/MySQL-YouTube-Series/blob/main/Advanced%20-%20Stored%20Procedures.sql)
* Syntax:
```sql
-- select the database to use
USE `parks_and_recreation`;
DROP procedure IF EXISTS `large_salaries3`;
-- it automatically adds the dilimiter for us
DELIMITER $$
CREATE PROCEDURE large_salaries3(employee_id_param INT)
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 60000
    AND employee_id_param = employee_id;
END $$

DELIMITER ;

-- calling the procedure
CALL large_salaries3(1);
```
## Window Functions
* Used to compute running totals
* [Video](https://www.youtube.com/watch?v=zAmJPdZu8Rg)
* [Blog](https://techtfq.com/blog/sql-window-function-sql-queries-tutorial-part-2)
* Syntax:
```sql
```
* Functions that use frame:
    * SUM()
    * AVG()
    * COUNT()
    * FIRST_VALUE()
    * LAST_VALUE()
    * NTH_VALUE()
* Functions that ignore a frame:
    * LAG()
    * LEAD()
    * RANK()
    * DENSE_RANK()
    * ROW_NUMBER()
    * PERCENT_RANK()
    * NTILE() :- partition data and put into buckets or groups of equal size
    * CUME_DIST() :- cummulative distribution eg: fetch all products which are constituting the first 30% of data based on price
* Others:
    * `::` Casting to datatype eg: price::int
    * `||` Concatenate eg: price||'%'
    * IF(conditon, if_value, else_value)
    * IFNULL(col, alternate_value)
* [String Functions](https://github.com/AlexTheAnalyst/MySQL-YouTube-Series/blob/main/Intermediate%20-%20String%20Functions.sql)
    * LENGTH()
    * UPPER()
    * LOWER()
    * TRIM()
    * LTRIM()
    * RTRIM()
    * LEFT(str, val) Eg: LEFT('Hello', 2) 'He':- select val characters from LEFT
    * RIGHT(str, val) Eg: RIGHT('Hello', 2) 'lo'
    * SUBSTRING(str, start_position, total_characters) Eg: SUBSTRING('Hello', 2, 3) 'ell', SUBSTRING('Hello', 2) 'ello'
    * REPLACE(string, character_to_replace, character_to_replace_with)
    * LOCATE(string_to_locate, string)
    * CONCAT(string1, string2, string3)


## Frame:
* [My SQL Documentation](https://dev.mysql.com/doc/refman/8.4/en/window-functions-frames.html)
* It is a subset of a window i.e. TABLE -> WINDOW -> FRAME
* Range : Takes into account duplicate values (range) into account. The frame is defined by rows within a value range. Offsets are differences in row values from the current row value.  
    * Eg: `RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING`
* Rows: Take into account only the rows hence ignoring duplicate values that might be available in another row belonging to the same range. The frame is defined by beginning and ending row positions. Offsets are differences in row numbers from the current row number.
    * Eg: `ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING`
* Difference between rows and range is more visible when using funtions like LAST_VALUE(), NTH_VALUE() etc.
* Default Value: `RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`
* Syntax: 
    * [ RANGE | ROWS ] BETWEEN `frame_start` AND `frame_end`
    * `frame_start` or `frame_end` can have the values:
        * `CURRENT ROW`
        * `UNBOUNDED PRECEDING`
        * `UNBOUNDED FOLLOWING`
        * `expr PRECEDING`
            * Eg: 2 PRECEDING
            * Eg: INTERVAL 2 DAY PRECEDING
        * `expr FOLLOWING` 
            * Eg: 2 FOLLOWING
            * Eg: INTERVAL '2:30' MINUTE_SECOND FOLLOWING
    * With BETWEEN syntax, frame_start must not occur later than frame_end.
    * The permitted `frame_start` and `frame_end` values have these meanings:
        * `CURRENT ROW`: For ROWS, the bound is the current row. For RANGE, the bound is the peers of the current row.
        * `UNBOUNDED PRECEDING`: The bound is the first partition row.
        * `UNBOUNDED FOLLOWING`: The bound is the last partition row.
        * `expr PRECEDING`: 
            * For ROWS, the bound is expr rows before the current row.
            * For RANGE, the bound is the rows with values equal to the current row value minus expr; if the current row value is NULL, the bound is the peers of the row.
            * `expr` can be 
                * a ? parameter marker (for use in a prepared statement)
                * a nonnegative numeric literal or 
                * a temporal interval of the form `INTERVAL val unit`
                * For INTERVAL expressions, val specifies nonnegative interval value, and unit is a keyword indicating the units in which the value should be interpreted.
                * For details about the permitted units specifiers, see the description of the DATE_ADD() function in Section 14.7, “Date and Time Functions”.
        * RANGE on a numeric or temporal expr requires ORDER BY on a numeric or temporal expression, respectively.

## Examples:
```sql
-- Window function over, partition and order
  SUM() OVER (PARTITION BY category ORDER BY price DESC) window_col

-- FIRST_VALUE 
-- Write query to display the most expensive product under each category (corresponding to each record)
select *,
first_value(product_name) over(partition by product_category order by price desc) as most_exp_product
from product;

-- LAST_VALUE 
-- Write query to display the least expensive product under each category (corresponding to each record)
select *,
first_value(product_name) 
    over(partition by product_category order by price desc) 
    as most_exp_product,
last_value(product_name) 
    over(partition by product_category order by price desc
        range between unbounded preceding and unbounded following) 
    as least_exp_product    
from product
WHERE product_category ='Phone';

-- Alternate way to write SQL query using Window functions
select *,
first_value(product_name) over w as most_exp_product,
last_value(product_name) over w as least_exp_product    
from product
WHERE product_category ='Phone'
window w as (partition by product_category order by price desc
            range between unbounded preceding and unbounded following);
            
       
-- NTH_VALUE 
-- Write query to display the Second most expensive product under each category.
select *,
first_value(product_name) over w as most_exp_product,
last_value(product_name) over w as least_exp_product,
nth_value(product_name, 5) over w as fifth_most_exp_product
from product
window w as (partition by product_category order by price desc
            range between unbounded preceding and unbounded following);

-- NTILE
-- Write a query to segregate all the expensive phones, mid range phones and the cheaper phones.
select x.product_name, 
case when x.buckets = 1 then 'Expensive Phones'
     when x.buckets = 2 then 'Mid Range Phones'
     when x.buckets = 3 then 'Cheaper Phones' END as Phone_Category
from (
    select *,
    ntile(3) over (order by price desc) as buckets
    from product
    where product_category = 'Phone') x;

-- CUME_DIST (cumulative distribution) ; 
/*  Formula = Current Row no (or Row No with value same as current row) / Total no of rows */

-- Query to fetch all products which are constituting the first 30% 
-- of the data in products table based on price.
select product_name, cume_dist_percetage
from (
    select *,
    cume_dist() over (order by price desc) as cume_distribution,
    round(cume_dist() over (order by price desc)::numeric * 100,2)||'%' as cume_dist_percetage
    from product) x
where x.cume_distribution <= 0.3;

-- PERCENT_RANK (relative rank of the current row / Percentage Ranking)
/* Formula = Current Row No - 1 / Total no of rows - 1 */

-- Query to identify how much percentage more expensive is "Galaxy Z Fold 3" when compared to all products.
select product_name, per
from (
    select *,
    percent_rank() over(order by price) ,
    round(percent_rank() over(order by price)::numeric * 100, 2) as per
    from product) x
where x.product_name='Galaxy Z Fold 3';

```

## Tips & Tricks
* Always use a function to return NULL. 
```sql
-- Eg:
-- MAX(salary) will return null if no salary available but if you use  
SELECT MAX(salary)
FROM Employee; 

-- This will return empty set when no max salary is available
SELECT salary 
FROM Employee
ORDER BY salary DESC
LIMIT 1;
```