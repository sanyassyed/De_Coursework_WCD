# ✅ MySQL Cheat Sheet 1
## 🧮 Aggregate Functions

| Function                                                                             | Description                                                                                      |
| ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------ |
| `COUNT(*)`, `COUNT(col)`, `COUNT(DISTINCT col)`                                      | Counts rows, non-null, or unique values                                                          |
| `SUM(col)`, `AVG(col)`, `MIN(col)`, `MAX(col)`                                       | Basic aggregates                                                                                 |
| `GROUP_CONCAT(col [ORDER BY ... SEPARATOR ...])`                                     | Concatenate group values                                                                         |
| `BIT_AND(col)`, `BIT_OR(col)`, `BIT_XOR(col)`                                        | Bitwise across group                                                                             |
| `JSON_ARRAYAGG(col)`, `JSON_OBJECTAGG(key, val)`                                     | JSON aggregation ([hoststud.com][1], [datalemur.com][2], [dev.mysql.com][3], [dev.mysql.com][4]) |
| `STDDEV()`, `STDDEV_POP()`, `STDDEV_SAMP()`, `VAR_POP()`, `VAR_SAMP()`, `VARIANCE()` | Statistical aggregates                                                                           |

---

## 🪟 Window Functions

| Function                                                               | Description                                                                       |
| ---------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `ROW_NUMBER()/RANK()/DENSE_RANK()/NTILE(n)/PERCENT_RANK()/CUME_DIST()` | Ranking and distribution                                                          |
| `LAG(col, offset)/LEAD(col, offset)`                                   | Access previous/next row values                                                   |
| `SUM/AVG/MIN/MAX(...) OVER (...)`                                      | Windowed aggregates                                                               |
| `FIRST_VALUE()/LAST_VALUE()/NTH_VALUE(col, n)`                         | First, last, nth rows in window                                                   |
| `OVER (PARTITION BY ... ORDER BY ... ROWS/RANGE BETWEEN ...)`          | Window definition ([mode.com][5], [geeksforgeeks.org][6], [stackoverflow.com][7]) |

---

## 🔠 String Functions

| Function                                                               | Description                                                                                           |
| ---------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `ASCII()`, `CHAR_LENGTH()`, `LENGTH()`                                 | Byte/char length                                                                                      |
| `CONCAT()`, `CONCAT_WS()`, `REPEAT()`, `INSERT()`, `SUBSTRING_INDEX()` | String concatenation and manipulation ([techonthenet.com][8], [w3schools.com][9], [learnsql.com][10]) |
| `LOWER()/UPPER()/LCASE()/UCASE()`                                      | Case conversion                                                                                       |
| `TRIM()/LTRIM()/RTRIM()`                                               | Remove whitespace                                                                                     |
| `LEFT()/RIGHT()/MID()/SUBSTR()/SUBSTRING()`                            | Substrings                                                                                            |
| `LOCATE()/INSTR()/POSITION()`                                          | Search substring                                                                                      |
| `REPLACE()/REVERSE()/STRCMP()`                                         | Replacement, reverse, compare                                                                         |
| `LPAD()/RPAD()/SPACE()`                                                | Padding and space-string                                                                              |
| `SUBSTRING_INDEX()`                                                    | Get part before Nth delimiter                                                                         |

---

## 📅 Date & Time Functions

| Function(s)                                                                                                 | Description                              |
| ----------------------------------------------------------------------------------------------------------- | ---------------------------------------- |
| `NOW()/CURDATE()/CURTIME()/CURRENT_TIMESTAMP()/LOCALTIME()/SYSDATE()`                                       | Current timestamps ([dev.mysql.com][11]) |
| `DATE(col)`, `EXTRACT(unit FROM col)`, `YEAR()/MONTH()/DAY()/HOUR()/MINUTE()/SECOND()/QUARTER()`            | Date parts extraction                    |
| `DATE_ADD()/ADDDATE()/DATE_SUB()/SUBDATE()/ADDTIME()/SUBTIME()/TIMESTAMP()`                                 | Date arithmetic                          |
| `DATEDIFF(col1, col2)`, `TIMEDIFF(col1, col2)`, `TIME_TO_SEC()/SEC_TO_TIME()`, `PERIOD_ADD()/PERIOD_DIFF()` | Differences and conversions              |
| `DATE_FORMAT()/TIME_FORMAT()`, `STR_TO_DATE()`                                                              | Formatting and parsing                   |
| `DAYNAME()/MONTHNAME()`, `DAYOFWEEK()/DAYOFMONTH()/DAYOFYEAR()`, `WEEK()/WEEKOFYEAR()/WEEKDAY()`            | Additional date components               |
| `LAST_DAY()`, `FROM_DAYS()`, `TO_DAYS()`, `MAKEDATE()/MAKETIME()`, `MICROSECOND()`                          | Special date conversions                 |

---

## 🧮 Numeric & Mathematical Functions

| Function                                                                                       | Description                          |                         |
| ---------------------------------------------------------------------------------------------- | ------------------------------------ | ----------------------- |
| `ABS(), CEIL()/CEILING(), FLOOR(), TRUNCATE()`                                                 | Rounding                             |                         |
| `ROUND(val, n)`, `MOD(a,b)`, `POWER()/POW(), SQRT(), EXP(), LOG()/LN(), LOG2(), LOG10(), PI()` | Math operations ([w3schools.com][9]) |                         |
| `SIN(), COS(), TAN(), ASIN(), ACOS(), ATAN()/ATAN2()`                                          | Trigonometry                         |                         |
| `RAND()`, `SIGN()`, `GREATEST()/LEAST()`                                                       | Random, sign, comparative extremes   |                         |
| `DIV` (integer division), bitwise shifts `<<`, `>>`, bitwise ops \`&,                          | , ^\`                                | Integer/math operators  |

---

## 🔄 Control-Flow & Comparison

| Function/Ctrl                                                    | Description                             |
| ---------------------------------------------------------------- | --------------------------------------- |
| `IF(condition, true, false)`, `CASE WHEN ... END`, `NULLIF(a,b)` | Conditional logic                       |
| `IFNULL(a, b)`, `COALESCE(a, b, ...)`, `ISNULL(a)`               | Null handling                           |
| `GREATEST(), LEAST()`                                            | Pick extreme values ([hoststud.com][1]) |

---

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

[1]: https://hoststud.com/resources/commonly-used-mysql-functions-you-must-know.647/?utm_source=chatgpt.com "Commonly Used MySQL Functions You Must Know"
[2]: https://datalemur.com/sql-tutorial/sql-aggregate-window-functions?utm_source=chatgpt.com "SQL Aggregate Window Functions - DataLemur"
[3]: https://dev.mysql.com/doc/en/string-functions.html?utm_source=chatgpt.com "MySQL 8.4 Reference Manual :: 14.8 String Functions and Operators"
[4]: https://dev.mysql.com/doc/refman/8.4/en/aggregate-functions.html?utm_source=chatgpt.com "14.19.1 Aggregate Function Descriptions - MySQL :: Developer Zone"
[5]: https://mode.com/sql-tutorial/sql-window-functions/?utm_source=chatgpt.com "SQL Window Functions | Advanced SQL - Mode Analytics"
[6]: https://www.geeksforgeeks.org/mysql/mysql-window-functions/?utm_source=chatgpt.com "MySQL Window Functions - GeeksforGeeks"
[7]: https://stackoverflow.com/questions/64327976/partition-by-date-range-in-window-function?utm_source=chatgpt.com "Partition by Date Range in Window Function - sql - Stack Overflow"
[8]: https://www.techonthenet.com/mysql/functions/index.php?utm_source=chatgpt.com "MySQL: Functions - Listed by Category - TechOnTheNet"
[9]: https://www.w3schools.com/mysql/mysql_ref_functions.asp?utm_source=chatgpt.com "MySQL Functions - W3Schools"
[10]: https://learnsql.com/blog/mysql-date-functions/?utm_source=chatgpt.com "MySQL Date Functions: Complete Analyst's Guide | LearnSQL.com"
[11]: https://dev.mysql.com/doc/en/date-and-time-functions.html?utm_source=chatgpt.com "MySQL 8.4 Reference Manual :: 14.7 Date and Time Functions"
[12]: https://stackoverflow.com/questions/32573117/mysql-group-by-datetime-with-aggregate-function?utm_source=chatgpt.com "MySQL GROUP BY DateTime with Aggregate Function [duplicate]"
