# 🐬 MySQL Cheat Sheet 2 - Functions

---

## 🧮 Aggregate Functions

| Function                                       | Description                                 | Sample Input / Output                                            |
| ---------------------------------------------- | ------------------------------------------- | ---------------------------------------------------------------- |
| `COUNT(*)`                                     | Counts all rows                             | `COUNT(*)` on 5 rows → `5`                                       |
| `COUNT(col)`                                   | Counts non-null values in a column          | `COUNT(col)` on `[1, NULL, 2]` → `2`                             |
| `COUNT(DISTINCT col)`                          | Counts unique non-null values               | `COUNT(DISTINCT col)` on `[1, 2, 2, 3]` → `3`                    |
| `SUM(col)`                                     | Sums all non-null values                    | `SUM(price)` on `[1, 2, 3]` → `6`                                |
| `AVG(col)`                                     | Calculates average of values                | `AVG(price)` on `[1, 2, 3]` → `2`                                |
| `MIN(col)`                                     | Finds the minimum value                     | `MIN(price)` on `[1, 2, 3]` → `1`                                |
| `MAX(col)`                                     | Finds the maximum value                     | `MAX(price)` on `[1, 2, 3]` → `3`                                |
| `GROUP_CONCAT(col ORDER BY ... SEPARATOR ...)` | Concatenates values into a string           | `GROUP_CONCAT(name ORDER BY id SEPARATOR ', ')` → `"John, Paul"` |
| `BIT_AND(col)`                                 | Bitwise AND of all values                   | `BIT_AND([5, 7])` → `5`                                          |
| `BIT_OR(col)`                                  | Bitwise OR of all values                    | `BIT_OR([5, 7])` → `7`                                           |
| `BIT_XOR(col)`                                 | Bitwise XOR of all values                   | `BIT_XOR([5, 7])` → `2` (Return True if both are opposite)       |
| `JSON_ARRAYAGG(col)`                           | Aggregates values into a JSON array         | `JSON_ARRAYAGG(id)` → `[1, 2, 3]`                                |
| `JSON_OBJECTAGG(key, val)`                     | Aggregates key-value pairs into JSON object | `JSON_OBJECTAGG(name, age)` → `{"John": 25, "Paul": 30}`         |
| `STDDEV(col)`                                  | Sample standard deviation                   | `STDDEV([1, 2, 3])` → `0.8165`                                   |
| `STDDEV_POP(col)`                              | Population standard deviation               | `STDDEV_POP([1, 2, 3])` → `0.8165`                               |
| `STDDEV_SAMP(col)`                             | Sample standard deviation                   | `STDDEV_SAMP([1, 2, 3])` → `1`                                   |
| `VAR_POP(col)`                                 | Population variance                         | `VAR_POP([1, 2, 3])` → `0.6667`                                  |
| `VAR_SAMP(col)`                                | Sample variance                             | `VAR_SAMP([1, 2, 3])` → `1`                                      |
| `VARIANCE(col)`                                | Alias for `VAR_POP()` or `VAR_SAMP()`       | `VARIANCE([1, 2, 3])` → `0.6667` (depends on SQL dialect)        |

---


## 🪟 Window Functions

| Function                                                      | Description                    | Sample Input / Output                             |
| ------------------------------------------------------------- | ------------------------------ | ------------------------------------------------- |
| `ROW_NUMBER()`                                                | Row number per partition/order | `[1, 2, 3]` for `[10, 20, 30]`                    |
| `RANK()`                                                      | Rank with gaps                 | Ranks with skipped values for ties                |
| `DENSE_RANK()`                                                | Rank without gaps              | Ranks without skipped values for ties             |
| `NTILE(n)`                                                    | Divide rows into n buckets     | Puts rows into equal groups                       |
| `PERCENT_RANK()`                                              | Percent rank of current row    | `[0.0, 0.5, 1.0]` for 3 rows                      |
| `CUME_DIST()`                                                 | Cumulative distribution        | Running total percentage                          |
| `LAG(col, offset)`                                            | Previous row’s value           | `LAG(price, 1)`                                   |
| `LEAD(col, offset)`                                           | Next row’s value               | `LEAD(price, 1)`                                  |
| `SUM(...) OVER (...)`                                         | Running/partitioned sum        | `SUM(price) OVER (PARTITION BY category)`         |
| `AVG(...) OVER (...)`                                         | Running/partitioned average    |                                                   |
| `MIN(...) OVER (...)`                                         | Running/partitioned minimum    |                                                   |
| `MAX(...) OVER (...)`                                         | Running/partitioned maximum    |                                                   |
| `FIRST_VALUE(col)`                                            | First value in window          | `FIRST_VALUE(price) OVER (PARTITION BY category)` |
| `LAST_VALUE(col)`                                             | Last value in window           |                                                   |
| `NTH_VALUE(col, n)`                                           | Nth value in window            |                                                   |
| `OVER (PARTITION BY ... ORDER BY ... ROWS/RANGE BETWEEN ...)` | Define the window              | Defines rows for frame-based aggregations         |

---

Here’s the corrected and fully aligned version of your **MySQL String Functions** table with consistent format, fixed examples, and added missing ones:

---

## 🔠 String Functions (MySQL)

| **Function**                         | **Description**                        | **Sample Input / Output**                            |
| ------------------------------------ | -------------------------------------- | ---------------------------------------------------- |
| `ASCII(str)`                         | ASCII value of first character         | `ASCII('A')` → `65`                                  |
| `CHAR_LENGTH(str)`                   | Number of characters                   | `CHAR_LENGTH('hello')` → `5`                         |
| `LENGTH(str)`                        | Number of bytes                        | `LENGTH('hello')` → `5`                              |
| `CONCAT(a, b)`                       | Combine strings                        | `CONCAT('Hello', 'World')` → `'HelloWorld'`          |
| `CONCAT_WS(sep, ...)`                | Combine with separator (ignores NULLs) | `CONCAT_WS(' ', 'Hello', 'World')` → `'Hello World'` |
| `REPEAT(str, n)`                     | Repeat string                          | `REPEAT('Hi', 3)` → `'HiHiHi'`                       |
| `INSERT(str, pos, len, new)`         | Replace part of string                 | `INSERT('abcdef', 2, 3, 'X')` → `'aXef'`             |
| `SUBSTRING_INDEX(str, delim, count)` | Extract before/after Nth delimiter     | `SUBSTRING_INDEX('a,b,c,d', ',', 2)` → `'a,b'`       |
| `LOWER(str)` / `LCASE(str)`          | Convert to lowercase                   | `LOWER('HELLO')` → `'hello'`                         |
| `UPPER(str)` / `UCASE(str)`          | Convert to uppercase                   | `UPPER('hello')` → `'HELLO'`                         |
| `TRIM(str)`                          | Remove leading/trailing spaces         | `TRIM(' hello ')` → `'hello'`                        |
| `LTRIM(str)`                         | Remove leading spaces                  | `LTRIM(' hello ')` → `'hello '`                      |
| `RTRIM(str)`                         | Remove trailing spaces                 | `RTRIM(' hello ')` → `' hello'`                      |
| `LEFT(str, n)`                       | Leftmost n characters                  | `LEFT('hello', 2)` → `'he'`                          |
| `RIGHT(str, n)`                      | Rightmost n characters                 | `RIGHT('hello', 2)` → `'lo'`                         |
| `MID(str, start, len)`               | Substring from middle                  | `MID('hello', 2, 3)` → `'ell'`                       |
| `SUBSTR(str, pos, len)`              | Substring                              | `SUBSTR('hello', 2, 3)` → `'ell'`                    |
| `SUBSTRING(str, pos, len)`           | Substring                              | `SUBSTRING('hello', 2, 3)` → `'ell'`                 |
| `LOCATE(substr, str)`                | Position of `substr` in `str`          | `LOCATE('e', 'hello')` → `2`                         |
| `INSTR(str, substr)`                 | Position of `substr` in `str`          | `INSTR('hello', 'e')` → `2`                          |
| `POSITION(substr IN str)`            | Same as `LOCATE()`                     | `POSITION('e' IN 'hello')` → `2`                     |
| `REPLACE(str, from, to)`             | Replace substring                      | `REPLACE('hello', 'l', 'x')` → `'hexxo'`             |
| `REVERSE(str)`                       | Reverse string                         | `REVERSE('abc')` → `'cba'`                           |
| `STRCMP(a, b)`                       | Compare strings                        | `STRCMP('abc', 'abd')` → `-1`                        |
| `LPAD(str, len, pad)`                | Left pad to length with `pad`          | `LPAD('hello', 10, '*')` → `'*****hello'`            |
| `RPAD(str, len, pad)`                | Right pad to length with `pad`         | `RPAD('hello', 10, '*')` → `'hello*****'`            |
| `SPACE(n)`                           | Return `n` spaces                      | `SPACE(3)` → `'   '` (3 spaces)                      |


---

## 📅 Date & Time Functions

| **Function**                            | **Description**            | **Sample Input / Output**                                       |
| ----------------------------------------| ---------------------------| ----------------------------------------------------            |
| `NOW()`                                 | Current date and time      | `NOW()` → `'2025-07-02 12:00:00'`                               |
| `CURDATE()`                             | Current date               | `CURDATE()` → `'2025-07-02'`                                    |
| `CURTIME()`                             | Current time               | `CURTIME()` → `'12:00:00'`                                      |
| `CURRENT_TIMESTAMP()`                   | Same as `NOW()`            | `CURRENT_TIMESTAMP()` → `'2025-07-02 12:00:00'`                 |
| `LOCALTIME()`                           | Local time                 | `LOCALTIME()` → `'2025-07-02 12:00:00'`                         |
| `SYSDATE()`                             | System date                | `SYSDATE()` → `'2025-07-02 12:00:00'`                           |
| `DATE('2025-07-02 12:00:00')`           | Extract date from datetime | `DATE('2025-07-02 12:00:00')` → `'2025-07-02'`                  |
| `EXTRACT(part FROM '2025-07-02')`       | Extract part* of date      | `EXTRACT(YEAR FROM '2025-07-02')` → `2025`                      |
| `YEAR('2025-07-02')`                    | Extract year               | `YEAR('2025-07-02')` → `2025`                                   |
| `MONTH('2025-07-02')`                   | Extract month              | `MONTH('2025-07-02')` → `7`                                     |
| `DAY('2025-07-02')`                     | Extract day                | `DAY('2025-07-02')` → `2`                                       |
| `HOUR('12:34:56')`                      | Extract hour               | `HOUR('12:34:56')` → `12`                                       |
| `MINUTE('12:34:56')`                    | Extract minute             | `MINUTE('12:34:56')` → `34`                                     |
| `SECOND('12:34:56')`                    | Extract second             | `SECOND('12:34:56')` → `56`                                     |
| `QUARTER('2025-07-02')`                 | Extract quarter            | `QUARTER('2025-07-02')` → `3`                                   |
| `DATE_ADD('2025-07-02', INTERVAL 1 DAY)`| Add interval               | `DATE_ADD('2025-07-02', INTERVAL 1 DAY)` → `'2025-07-03'`       |
| `ADDDATE('2025-07-02', INTERVAL 5 DAY)` | Add days                   | `ADDDATE('2025-07-02', INTERVAL 5 DAY)` → `'2025-07-07'`        |
| `DATE_SUB('2025-07-02', INTERVAL 1 DAY)`| Subtract days              | `DATE_SUB('2025-07-02', INTERVAL 1 DAY)` → `'2025-07-01'`       |
| `SUBDATE('2025-07-02', INTERVAL 2 DAY)` | Subtract days              | `SUBDATE('2025-07-02', INTERVAL 2 DAY)` → `'2025-06-30'`        |
| `ADDTIME('12:00:00', '01:30:00')`       | Add time                   | `ADDTIME('12:00:00', '01:30:00')` → `'13:30:00'`                |
| `SUBTIME('12:00:00', '01:30:00')`       | Subtract time              | `SUBTIME('12:00:00', '01:30:00')` → `'10:30:00'`                |
| `TIMESTAMP('2025-07-02', '12:00:00')`   | Combine date & time        | `TIMESTAMP('2025-07-02', '12:00:00')` → `'2025-07-02 12:00:00'` |
| `DATEDIFF('2025-07-02', '2025-07-01')`  | Days between dates         | `DATEDIFF('2025-07-02', '2025-07-01')` → `1`                    |
| `TIMEDIFF('12:01:00', '12:00:00')`      | Time between times         | `TIMEDIFF('12:01:00', '12:00:00')` → `'00:01:00'`               |
| `TIME_TO_SEC('00:01:00')`               | Time to seconds            | `TIME_TO_SEC('00:01:00')` → `60`                                |
| `SEC_TO_TIME(60)`                       | Seconds to time            | `SEC_TO_TIME(60)` → `'00:01:00'`                                |
| `PERIOD_ADD(202507, 2)`                 | Add months to period       | `PERIOD_ADD(202507, 2)` → `202509`                              |
| `PERIOD_DIFF(202507, 202501)`           | Difference in months       | `PERIOD_DIFF(202507, 202501)` → `6`                             |
| `DATE_FORMAT('2025-07-02', '%Y-%m-%d')` | Format date                | `DATE_FORMAT('2025-07-02', '%Y-%m-%d')` → `'2025-07-02'`        |
| `TIME_FORMAT('12:00:00', '%H:%i')`      | Format time                | `TIME_FORMAT('12:00:00', '%H:%i')` → `'12:00'`                  |
| `STR_TO_DATE('2025-07-02', '%Y-%m-%d')` | Parse string to date       | `STR_TO_DATE('2025-07-02', '%Y-%m-%d')` → `2025-07-02` (DATE)   |
| `DAYNAME('2025-07-02')`                 | Name of day                | `DAYNAME('2025-07-02')` → `'Wednesday'`                         |
| `MONTHNAME('2025-07-02')`               | Name of month              | `MONTHNAME('2025-07-02')` → `'July'`                            |
| `DAYOFWEEK('2025-07-02')`               | Day index (1=Sunday)       | `DAYOFWEEK('2025-07-02')` → `4`                                 |
| `DAYOFMONTH('2025-07-02')`              | Day of month               | `DAYOFMONTH('2025-07-02')` → `2`                                |
| `DAYOFYEAR('2025-07-02')`               | Day of year                | `DAYOFYEAR('2025-07-02')` → `183`                               |
| `WEEK('2025-07-02')`                    | Week of year               | `WEEK('2025-07-02')` → `27`                                     |
| `WEEKOFYEAR('2025-07-02')`              | ISO week                   | `WEEKOFYEAR('2025-07-02')` → `27`                               |
| `WEEKDAY('2025-07-02')`                 | Weekday (0=Monday)         | `WEEKDAY('2025-07-02')` → `1`                                   |
| `LAST_DAY('2025-07-02')`                | Last day of month          | `LAST_DAY('2025-07-02')` → `'2025-07-31'`                       |
| `FROM_DAYS(738939)`                     | Convert day number to date | `FROM_DAYS(738939)` → `'2025-07-02'`                            |
| `TO_DAYS('2025-07-02')`                 | Convert date to day number | `TO_DAYS('2025-07-02')` → `738939`                              |
| `MAKEDATE(2025, 183)`                   | Create date                | `MAKEDATE(2025, 183)` → `'2025-07-02'`                          |
| `MAKETIME(12, 0, 0)`                    | Create time                | `MAKETIME(12, 0, 0)` → `'12:00:00'`                             |
| `MICROSECOND('12:00:00.123456')`        | Extract microseconds       | `MICROSECOND('12:00:00.123456')` → `123456`                     |

* EXTRACT() `part` options:
    * MICROSECOND
    * SECOND
    * MINUTE
    * HOUR
    * DAY
    * WEEK
    * MONTH
    * QUARTER
    * YEAR
    * SECOND_MICROSECOND
    * MINUTE_MICROSECOND
    * MINUTE_SECOND
    * HOUR_MICROSECOND
    * HOUR_SECOND
    * HOUR_MINUTE
    * DAY_MICROSECOND
    * DAY_SECOND
    * DAY_MINUTE
    * DAY_HOUR
    * YEAR_MONTH

* DATE_FORMAT parameter Values [here](https://www.w3schools.com/sql/func_mysql_date_format.asp)

---

## Other Functions & Operators


| **Function / Operator**                   | **Description**                           | **Syntax**                                         | **Example**                                        | **Result / Explanation**                                   |
| ----------------------------------------- | ----------------------------------------- | -------------------------------------------------- | -------------------------------------------------- | ---------------------------------------------------------- |
| `CAST()`                                  | Convert value to another data type        | `CAST(expr AS datatype)`                           | `CAST(price AS UNSIGNED)`                          | Converts `price` to unsigned integer                       |
| `CONCAT()`                                | Concatenate two or more strings           | `CONCAT(str1, str2, ...)`                          | `CONCAT(price, '%')`                               | Returns string like `100%`                                 |
| `IF()`                                    | Conditional logic                         | `IF(condition, true_value, false_value)`           | `IF(price > 100, 'High', 'Low')`                   | Returns `'High'` if condition true, else `'Low'`           |
| `IFNULL()`                                | Returns alternate if expression is NULL   | `IFNULL(expr, alt_value)`                          | `IFNULL(discount, 0)`                              | Returns `0` if `discount` is NULL; else returns `discount` |
| `NULLIF()`                                | Returns NULL if two expressions are equal | `NULLIF(expr1, expr2)`                             | `NULLIF(price, 0)`                                 | Returns NULL if `price` is 0; otherwise returns `price`    |
| `COALESCE()`                              | Returns first non-NULL expression         | `COALESCE(expr1, expr2, ..., exprN)`               | `COALESCE(NULL, discount, 0)`                      | Returns `discount` if not NULL; else `0`                   |
| `CASE ... WHEN ... THEN ... ELSE ... END` | Conditional multi-branch logic            | `CASE WHEN condition THEN result ELSE default END` | `CASE WHEN price > 100 THEN 'High' ELSE 'Low' END` | Returns `'High'` or `'Low'` based on condition             |

---


### 🧠 Usage in LeetCode Hard Problems

* **Top N per group**: `ROW_NUMBER() + PARTITION BY`, `RANK()`-based filters
* **Cumulative sums/events**: `SUM() OVER (ORDER BY ...)`, `LAG()`
* **Time-series gaps**: `LAG()` + `DATEDIFF()`
* **First/last per group**: `FIRST_VALUE()`, `ROW_NUMBER()` with filtering
* **Complex grouping**: `GROUP_CONCAT()`, `JSON_ARRAYAGG()`, `VAR_*()` for stats

---

[01]: https://hoststud.com/resources/commonly-used-mysql-functions-you-must-know.647/?utm_source=chatgpt.com "Commonly Used MySQL Functions You Must Know"
[02]: https://datalemur.com/sql-tutorial/sql-aggregate-window-functions?utm_source=chatgpt.com "SQL Aggregate Window Functions - DataLemur"
[03]: https://dev.mysql.com/doc/en/string-functions.html?utm_source=chatgpt.com "MySQL 8.4 Reference Manual :: 14.8 String Functions and Operators"
[04]: https://dev.mysql.com/doc/refman/8.4/en/aggregate-functions.html?utm_source=chatgpt.com "14.19.1 Aggregate Function Descriptions - MySQL :: Developer Zone"
[05]: https://mode.com/sql-tutorial/sql-window-functions/?utm_source=chatgpt.com "SQL Window Functions | Advanced SQL - Mode Analytics"
[06]: https://www.geeksforgeeks.org/mysql/mysql-window-functions/?utm_source=chatgpt.com "MySQL Window Functions - GeeksforGeeks"
[07]: https://stackoverflow.com/questions/64327976/partition-by-date-range-in-window-function?utm_source=chatgpt.com "Partition by Date Range in Window Function - sql - Stack Overflow"
[08]: https://www.techonthenet.com/mysql/functions/index.php?utm_source=chatgpt.com "MySQL: Functions - Listed by Category - TechOnTheNet"
[09]: https://www.w3schools.com/mysql/mysql_ref_functions.asp?utm_source=chatgpt.com "MySQL Functions - W3Schools"
[10]: https://learnsql.com/blog/mysql-date-functions/?utm_source=chatgpt.com "MySQL Date Functions: Complete Analyst's Guide | LearnSQL.com"
[11]: https://dev.mysql.com/doc/en/date-and-time-functions.html?utm_source=chatgpt.com "MySQL 8.4 Reference Manual :: 14.7 Date and Time Functions"
[12]: https://stackoverflow.com/questions/32573117/mysql-group-by-datetime-with-aggregate-function?utm_source=chatgpt.com "MySQL GROUP BY DateTime with Aggregate Function [duplicate]"
