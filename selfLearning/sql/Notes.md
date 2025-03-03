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
* (Video)[https://www.youtube.com/watch?v=zAmJPdZu8Rg]
* (Blog)[https://techtfq.com/blog/sql-window-function-sql-queries-tutorial-part-2]
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
    * NTILE()
    * CUME_DIST()


## Frame:
* (My SQL Documentation)[https://dev.mysql.com/doc/refman/8.4/en/window-functions-frames.html]
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
