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
-- it automatically adds the delimiter for us
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

## Aggregate Functions
All aggregate functions can be used with GROUP BY to perform calculations per group, or without it for entire-table aggregations

| **Function Name**  | **Syntax**                   | **Description**                                                                                                            |
| ------------------ | ---------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `COUNT()`          | `COUNT(column_name)`         | Returns the number of non-NULL values in a column.                                                                         |
|                    | `COUNT(*)`                   | Returns the total number of rows, including rows with NULLs.                                                               |
| `SUM()`            | `SUM(column_name)`           | Returns the total sum of a numeric column.                                                                                 |
| `AVG()`            | `AVG(column_name)`           | Returns the average value of a numeric column.                                                                             |
| `MIN()`            | `MIN(column_name)`           | Returns the minimum value in a column.                                                                                     |
| `MAX()`            | `MAX(column_name)`           | Returns the maximum value in a column.                                                                                     |
| `GROUP_CONCAT()`   | `GROUP_CONCAT(column_name)`  | Concatenates non-NULL values from a group into a single string.                                                            |
| `STDDEV()`         | `STDDEV(column_name)`        | Returns the sample standard deviation of a numeric column.                                                                 |
| `STDDEV_POP()`     | `STDDEV_POP(column_name)`    | Returns the population standard deviation.                                                                                 |
| `STDDEV_SAMP()`    | `STDDEV_SAMP(column_name)`   | Returns the sample standard deviation (same as `STDDEV()`).                                                                |
| `VAR_POP()`        | `VAR_POP(column_name)`       | Returns the population variance.                                                                                           |
| `VAR_SAMP()`       | `VAR_SAMP(column_name)`      | Returns the sample variance.                                                                                               |
| `VARIANCE()`       | `VARIANCE(column_name)`      | Alias for `VAR_SAMP()`. Returns the sample variance.                                                                       |
| `BIT_AND()`        | `BIT_AND(column_name)`       | Returns bitwise AND (1 if both values are 1; else 0) of all bits in the column (non-NULL values only).                     |
| `BIT_OR()`         | `BIT_OR(column_name)`        | Returns bitwise OR (1 if either of the values is 1; else 0) of all bits in the column.                                     |
| `BIT_XOR()`        | `BIT_XOR(column_name)`       | Returns bitwise XOR (the two values are different) of all bits in the column.                                              |
| `JSON_ARRAYAGG()`  | `JSON_ARRAYAGG(column_name)` | Returns a JSON array of values from a group.                                                                               |
| `JSON_OBJECTAGG()` | `JSON_OBJECTAGG(k, v)`       | Returns a JSON object aggregated from key-value pairs in a group.                                                          |
| `ANY_VALUE()`      | `ANY_VALUE(column_name)`     | Returns any value from the group (used when a deterministic value is not needed).                                          |

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
* Date Functions
    * SUBDATE(CURRDATE(), INTERVAL 1 DAY)
    * DATEDIFF(date1, date2)
    * DATE_FORMAT(date1, "%Y%m") = 202002 NOTE: %Y - 2020; %y 20; %M January %m 01 %D 31 %d 31st More info [here](https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html#function_date-format) 
    * MONTH(date1) = 2
    * YEAR(date1) = 2020
    * DAY(date1) = 31
    * EXTRACT(YEAR FROM date1) = 2020
    * EXTRACT(YEAR_MONTH FROM date1) = 202001
    * EXTRACT(DAY_MINUTE FROM '2019-07-02 01:02:03') Result: 20102 (DAY: 02 HOUR: 01 MINUTE: 02)
    * EXTRACT(MICROSECOND FROM '2003-01-02 10:30:00.000123') Result: 123
* Grouping:
    * GROUP_CONCAT(DISTINCT test_score ORDER BY test_score DESC SEPARATOR ' ') [More info](https://dev.mysql.com/doc/refman/8.4/en/aggregate-functions.html#function_group-concat)

## REGEXP
* `+` : 1 or more
* `?` : 0 or 1
* `*` : 0 or more

### 🔤 MySQL REGEXP Character Table

| Regex Pattern | Meaning                           | Example          | Matches             | Doesn’t Match  | 
| ------------- | --------------------------------- | ---------------- | ------------------- | -------------- | 
| `.`           | Any single character              | `'a.c'`          | `abc`, `a1c`, `a-c` | `ac`, `abdc`   |
| `^`           | Start of string                   | `'^abc'`         | `abc`, `abcdef`     | `xabc`, `aabc` | 
| `$`           | End of string                     | `'abc$'`         | `abc`, `xabc`       | `abcd`, `abcc` |  
| `*`           | 0 or more of the preceding        | `'ab*c'`         | `ac`, `abc`, `abbc` | `adc`, `aabc`  | 
| `+`           | 1 or more of the preceding        | `'ab+c'`         | `abc`, `abbc`       | `ac`, `adc`    |  
| `?`           | 0 or 1 of the preceding           | `'ab?c'`         | `ac`, `abc`         | `abbc`, `adc`  |  
| `[...]`       | Any one character in set          | `'a[xyz]c'`      | `axc`, `ayc`        | `abc`, `azxc`  |  
| `[^...]`      | Any one character **not** in set  | `'a[^xyz]c'`     | `abc`, `amc`        | `axc`, `ayc`   |  
| `[a-z]`       | Character range                   | `'a[b-d]c'`      | `abc`, `acc`        | `aec`, `afc`   |  
| `\|`          | Alternation (OR)- Or Match        | `'abc\|xyz'`     | `abc`, `xyz`        | `abz`, `xyc`   |
| `(...)`       | Grouping (Not capturing in MySQL) | `'a(bc\|de)f'`   | `abcf`, `adef`      | `abdef`, `af`  | 
| `{n}`         | Exactly n repetitions             | `'a{3}'`         | `aaa`               | `aa`, `aaaa`   |
| `{n,}`        | n or more repetitions             | `'a{2,}'`        | `aa`, `aaaaa`       | `a`            | 
| `{n,m}`       | Between n and m repetitions       | `'a{2,3}'`       | `aa`, `aaa`         | `a`, `aaaa`    | 

---

### 🧱 POSIX Character Classes (In Square Brackets)

| POSIX Class  | Meaning      | Equivalent          | Example        | Matches       |
| ------------ | ------------ | ------------------- | -------------- | ------------- |
| `[:alnum:]`  | Alphanumeric | `[a-zA-Z0-9]`       | `[[:alnum:]]`  | `a`, `Z`, `5` |
| `[:alpha:]`  | Alphabetic   | `[a-zA-Z]`          | `[[:alpha:]]`  | `b`, `T`      |
| `[:digit:]`  | Digits       | `[0-9]`             | `[[:digit:]]`  | `0`, `9`      |
| `[:lower:]`  | Lowercase    | `[a-z]`             | `[[:lower:]]`  | `m`, `z`      |
| `[:upper:]`  | Uppercase    | `[A-Z]`             | `[[:upper:]]`  | `D`, `X`      |
| `[:space:]`  | Whitespace   | space, tab, newline | `[[:space:]]`  | `' '`, `\t`   |
| `[:punct:]`  | Punctuation  | `. , ! ? etc.`      | `[[:punct:]]`  | `!`, `.`      |
| `[:xdigit:]` | Hex digits   | `[0-9A-Fa-f]`       | `[[:xdigit:]]` | `F`, `a`, `3` |

🔹 POSIX classes **must be placed inside square brackets**:
✅ `[[:digit:]]` → valid
❌ `[:digit:]` → invalid

---

### 🔍 MySQL Regex Examples

```sql
-- Match lowercase email names ending in @leetcode.com
SELECT email FROM users
WHERE email REGEXP '^[a-z]+@leetcode\\.com$';

-- Match any string that starts with a digit
SELECT name FROM items
WHERE name REGEXP '^[[:digit:]]';

-- Match hex colors like #FFAA00
SELECT color FROM palette
WHERE color REGEXP '^#[[:xdigit:]]{6}$';
```

---

### ⚠️ Important Notes

* MySQL regex is **case-insensitive by default** unless you use `COLLATE ..._bin` or `REGEXP_LIKE(..., ..., 'c')` in MySQL 8+.
* MySQL regex does **not support lookahead/lookbehind**, `\d`, `\w`, etc. (unlike PCRE).
* Always escape special characters like `.` with `\\.` in MySQL queries.

---


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
* When doing join to filter the joining table before the join give the `WHERE condition` in the `ON clause`.

* `Unique Key` is the same as `Primary Key` except unique key values can be NULL

* 

## REGULAR expression
* [Source](https://www.geeksforgeeks.org/mysql-regular-expressions-regexp/)

## Unlocked Leetcode 
* [Source](https://leetcode.ca/all/problems.html)

## DATA Modelling
### Dimention Table - `5 W's`
* `Who` - Customer Table
* `Where` - Address Table
* `When` - Date Table
* `What` - Product Table
* `Why` -  Reason Table or Promotion Table
    * This table captures the motivation or reason behind a particular business event or transaction
    * Why did the customer make a purchase? → Promotion table (tracks discounts, campaigns, offers)
    * Why was an order returned? → Return Reason table
    * Why was a transaction flagged? → Fraud Reason table
* Dimension tables gives context to the measures (KPI's)in the fact table
* Are usually text or words  with the exception of ids and dates (which are usually finite numbers i.e you cannot do math with it)
* In Pivot table only Dimension table fields go into row, columns & filters
### Fact Table - `1 H`
* `How` (How Much) - Sales Table or Orders Table
* Has Measures (KPI's) Eg: Profit, Expenses, Sales etc
* Are usually numbers which can be infinite and mathematical operations can be performed on them
* Fact table fields go into Values

## JOINS
* Inner Join - returns only matching rows from both tables
    * Table1 `JOIN` Table2 `ON` Table1.key = Table2.key or 
    * Table1 `INNER JOIN` Table2 `ON` Table 1.key = Table2.key
* Left Join - returns all rows from Table1 and matching rows from Table2, NULL if no match. 'OUTER' is optional
    * Table1 `LEFT JOIN` Table2 `ON` Table 1.key = Table2.key
    * Table1 `LEFT OUTER JOIN` Table2 `ON` Table 1.key = Table2.key
* Right Join - returns all rows from Table2 and matching rows from Table1, NULL if no match. 'OUTER' is optional
    * Table1 `RIGHT JOIN` Table2 `ON` Table 1.key = Table2.key
    * Table1 `RIGHT OUTER JOIN` Table2 `ON` Table 1.key = Table2.key
* Left Anti Join - Finding unmatched rows (exclusively in Table1 but not in Table2)
    * Table1 `LEFT JOIN` Table2 `ON` Table1.key = Table2.key `WHERE` Table2.key = NULL
* Right Anti Join - Finding unmatched rows (exclusively in Table2 but not in Table1)
    * Table1 `RIGHT JOIN` Table2 `ON` Table 1.key = Table2.key `WHERE` Table1.key = NULL