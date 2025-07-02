# ✅ MySQL Cheat Sheet 1

## 🧮 Aggregate Functions

| Function                                                                             | Description                                                       | Sample Input / Output                                                                                     |
| ------------------------------------------------------------------------------------ | ----------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `COUNT(*)`, `COUNT(col)`, `COUNT(DISTINCT col)`                                      | Counts rows, non-null values, or unique values                    | `COUNT(*)` on 5 rows → `5`, `COUNT(DISTINCT col)` on unique values → `3`                                  |
| `SUM(col)`, `AVG(col)`, `MIN(col)`, `MAX(col)`                                       | Basic aggregates: sum, average, min, max                          | `SUM(price)` on [1, 2, 3] → `6`, `AVG(price)` → `2`                                                      |
| `GROUP_CONCAT(col [ORDER BY ... SEPARATOR ...])`                                     | Concatenate group values into a single string                     | `GROUP_CONCAT(name ORDER BY id SEPARATOR ', ')` → `"John, Paul"`                                          |
| `BIT_AND(col)`, `BIT_OR(col)`, `BIT_XOR(col)`                                        | Bitwise operations across a group of values                       | `BIT_AND([5, 7])` → `5`, `BIT_OR([5, 7])` → `7` `BIT_XOR([5, 7])` → `2` (Return True if both are oppsite) |
| `JSON_ARRAYAGG(col)`, `JSON_OBJECTAGG(key, val)`                                     | Aggregation of JSON arrays/objects                                | `JSON_ARRAYAGG(id)` → `[1, 2, 3]`, `JSON_OBJECTAGG(name, age)` → `{"John": 25, "Paul": 30}`              |
| `STDDEV()`, `STDDEV_POP()`, `STDDEV_SAMP()`, `VAR_POP()`, `VAR_SAMP()`, `VARIANCE()` | Statistical aggregates, standard deviation, variance              | `STDDEV([1, 2, 3])` → `0.8165`, `VARIANCE([1, 2, 3])` → `0.6667`           |

---

## 🪟 Window Functions

| Function                                                               | Description                                                       | Sample Input / Output                                                         |
| ---------------------------------------------------------------------- | ----------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| `ROW_NUMBER()/RANK()/DENSE_RANK()/NTILE(n)/PERCENT_RANK()/CUME_DIST()` | Ranking and distribution across rows                              | `ROW_NUMBER()` on [10, 20, 30] → `[1, 2, 3]`                                  |
| `LAG(col, offset)/LEAD(col, offset)`                                   | Access previous/next row values                                   | `LAG(price, 1)` → previous value of `price`                                   |
| `SUM/AVG/MIN/MAX(...) OVER (...)`                                      | Aggregated values over a window                                   | `SUM(price) OVER (PARTITION BY category)` → `total_per_category`              |
| `FIRST_VALUE()/LAST_VALUE()/NTH_VALUE(col, n)`                         | First, last, nth rows in the window                               | `FIRST_VALUE(price) OVER (PARTITION BY category)` → `first price of category` |
| `OVER (PARTITION BY ... ORDER BY ... ROWS/RANGE BETWEEN ...)`          | Window definition and partitioning                                | `SUM(price) OVER (PARTITION BY category ORDER BY date)`                       |

---

## 🔠 String Functions

| Function                                                               | Description                                                       | Sample Input / Output                                          |
| ---------------------------------------------------------------------- | ----------------------------------------------------------------- | -------------------------------------------------------------- |
| `ASCII()`, `CHAR_LENGTH()`, `LENGTH()`                                 | Byte/char length of a string                                      | `LENGTH('hello')` → `5`, `ASCII('A')` → `65`                   |
| `CONCAT()`, `CONCAT_WS()`, `REPEAT()`, `INSERT()`, `SUBSTRING_INDEX()` | String concatenation and manipulation                             | `CONCAT('Hello', ' ', 'World')` → `'Hello World'`              |
| `LOWER()/UPPER()/LCASE()/UCASE()`                                      | Convert case of characters                                        | `UPPER('hello')` → `'HELLO'`                                   |
| `TRIM()/LTRIM()/RTRIM()`                                               | Remove leading/trailing spaces                                    | `TRIM(' hello ')` → `'hello'`                                  |
| `LEFT()/RIGHT()/MID()/SUBSTR()/SUBSTRING()`                            | Extract substring from the start, middle, or end of a string      | `LEFT('hello', 2)` → `'he'`, `MID('hello', 2, 3)` → `'ell'`    |
| `LOCATE()/INSTR()/POSITION()`                                          | Search for a substring within a string                            | `LOCATE('e', 'hello')` → `2`                                   |
| `REPLACE()/REVERSE()/STRCMP()`                                         | Replace substring, reverse string, compare strings                | `REPLACE('hello', 'l', 'x')` → `'hexxo'`                       |
| `LPAD()/RPAD()/SPACE()`                                                | Add padding to strings                                            | `LPAD('hello', 10, '*')` → `'*****hello'`                      |
| `SUBSTRING_INDEX()`                                                    | Extract part of string before the Nth delimiter                    | `SUBSTRING_INDEX('a,b,c,d', ',', 2)` → `'a,b'`                |

---

## 📅 Date & Time Functions

| Function(s)                                                                                                 | Description                              | Sample Input / Output                                           |
| ----------------------------------------------------------------------------------------------------------- | ---------------------------------------- | --------------------------------------------------------------- |
| `NOW()/CURDATE()/CURTIME()/CURRENT_TIMESTAMP()/LOCALTIME()/SYSDATE()`                                       | Return current date and time             | `NOW()` → `'2025-07-02 12:00:00'`                               |
| `DATE(col)`, `EXTRACT(unit FROM col)`, `YEAR()/MONTH()/DAY()/HOUR()/MINUTE()/SECOND()/QUARTER()`            | Extract specific parts of a date         | `YEAR('2025-07-02')` → `2025`                                   |
| `DATE_ADD()/ADDDATE()/DATE_SUB()/SUBDATE()/ADDTIME()/SUBTIME()/TIMESTAMP()`                                 | Date arithmetic                          | `DATE_ADD('2025-07-02', INTERVAL 1 DAY)` → `'2025-07-03'`      |
| `DATEDIFF(col1, col2)`, `TIMEDIFF(col1, col2)`, `TIME_TO_SEC()/SEC_TO_TIME()`, `PERIOD_ADD()/PERIOD_DIFF()` | Calculate date/time differences          | `DATEDIFF('2025-07-02', '2025-07-01')` → `1`                    |
| `DATE_FORMAT()/TIME_FORMAT()`, `STR_TO_DATE()`                                                              | Format/parse dates/times                 | `DATE_FORMAT('2025-07-02', '%Y-%m-%d')` → `'2025-07-02'`        |
| `DAYNAME()/MONTHNAME()`, `DAYOFWEEK()/DAYOFMONTH()/DAYOFYEAR()`, `WEEK()/WEEKOFYEAR()/WEEKDAY()`            | Extract additional date components       | `DAYNAME('2025-07-02')` → `'Wednesday'`                         |
| `LAST_DAY()`, `FROM_DAYS()`, `TO_DAYS()`, `MAKEDATE()/MAKETIME()`, `MICROSECOND()`                          | Special date functions                   | `LAST_DAY('2025-07-02')` → `'2025-07-31'`                       |

---

## 🧮 Numeric & Mathematical Functions

| Function                                                                                       | Description                          | Sample Input / Output                                           |
| ---------------------------------------------------------------------------------------------- | ------------------------------------ | --------------------------------------------------------------- |
| `ABS(), CEIL()/CEILING(), FLOOR(), TRUNCATE()`                                                 | Rounding and absolute value          | `ABS(-5)` → `5`, `CEIL(2.3)` → `3`                              |
| `ROUND(val, n)`, `MOD(a,b)`, `POWER()/POW(), SQRT(), EXP(), LOG()/LN(), LOG2(), LOG10(), PI()` | Mathematical operations               | `ROUND(2.345, 2)` → `2.35`, `SQRT(16)` → `4`                   |
| `SIN(), COS(), TAN(), ASIN(), ACOS(), ATAN()/ATAN2()`                                          | Trigonometric functions              | `SIN(PI()/2)` → `1`                                             |
| `RAND()`, `SIGN()`, `GREATEST()/LEAST()`                                                       | Random, sign, extreme comparisons    | `RAND()` → `0.5678`, `GREATEST(1, 5, 3)` → `5`                  |
| `DIV` (integer division), bitwise shifts `<<`, `>>`, bitwise ops \`&,                          | , ^\`                                | `5 DIV 2` → `2`, `5 << 1` → `10`                                |

---

## 🔄 Control-Flow & Comparison

| Function/Ctrl                                                    | Description                             | Sample Input / Output                                       |
| ---------------------------------------------------------------- | --------------------------------------- | ----------------------------------------------------------- |
| `IF(condition, true, false)`, `CASE WHEN ... END`, `NULLIF(a,b)` | Conditional logic                       | `IF(1 > 2, 'yes', 'no')` → `'no'`                           |
| `IFNULL(a, b)`, `COALESCE(a, b, ...)`, `ISNULL(a)`               | Null handling                           | `IFNULL(NULL, 'default')` → `'default'`                     |
| `GREATEST(), LEAST()`                                            | Return extreme values                   | `GREATEST(1, 2)`   → `2`                                    |



## 🔁 Conversion, Type & Binary

| Function                                          | Description                                                             |
| ------------------------------------------------- | ----------------------------------------------------------------------- |
| `CAST(expr AS type)`, `CONVERT(expr, type)`       | Type casting                                                            |
| `BINARY`, `BIN(N)`, `CONV(N, from_base, to_base)` | Binary/string conversions ([stackoverflow.com][12], [w3schools.com][9]) |
| `CHAR(), ASCII()`                                 | Char-code conversions                                                   |

---

## ⚙️ Session, Meta, Miscellaneous

| Function                                                                                                          | Description                    |
| ----------------------------------------------------------------------------------------------------------------- | ------------------------------ |
| `CONNECTION_ID(), LAST_INSERT_ID(), VERSION(), DATABASE(), CURRENT_USER(), SESSION_USER(), SYSTEM_USER(), USER()` | Session & metadata             |
| `CAST`, `CONVERT_TZ()`, `COMPRESS()/UNCOMPRESS()`, encryption `MD5(), PASSWORD()`                                 | Utility, security, compression |

---

### 🧠 Usage in LeetCode Hard Problems

* **Top N per group**: `ROW_NUMBER() + PARTITION BY`, `RANK()`-based filters
* **Cumulative sums/events**: `SUM() OVER (ORDER BY ...)`, `LAG()`
* **Time-series gaps**: `LAG()` + `DATEDIFF()`
* **First/last per group**: `FIRST_VALUE()`, `ROW_NUMBER()` with filtering
* **Complex grouping**: `GROUP_CONCAT()`, `JSON_ARRAYAGG()`, `VAR_*()` for stats

---

Let me know if you'd like specific examples of these functions in action—especially in a LeetCode context—or a downloadable/spreadsheet-ready version of this cheat sheet!

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
