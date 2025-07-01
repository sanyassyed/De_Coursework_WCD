# ✅ MySQL Cheat Sheet 2 - REGEXP + Window Frame 

---

## 🔁 REGEXP (Regular Expressions in MySQL)

### 🔤 Basic Operators

| Symbol   | Meaning                  | Example        | Matches             | Doesn’t Match  |
| -------- | ------------------------ | -------------- | ------------------- | -------------- |
| `.`      | Any single character     | `'a.c'`        | `abc`, `a1c`, `a-c` | `ac`, `abdc`   |
| `^`      | Start of string          | `'^abc'`       | `abc`, `abcdef`     | `xabc`         |
| `$`      | End of string            | `'abc$'`       | `abc`, `xabc`       | `abcd`, `abcc` |
| `*`      | 0 or more of prev        | `'ab*c'`       | `ac`, `abc`, `abbc` | `adc`, `aabc`  |
| `+`      | 1 or more of prev        | `'ab+c'`       | `abc`, `abbc`       | `ac`, `adc`    |
| `?`      | 0 or 1 of prev           | `'ab?c'`       | `ac`, `abc`         | `abbc`, `adc`  |
| `[...]`  | Any one character set    | `'a[xyz]c'`    | `axc`, `ayc`        | `abc`, `azxc`  |
| `[^...]` | Not in character set     | `'a[^xyz]c'`   | `abc`, `amc`        | `axc`, `ayc`   |
| `[a-z]`  | Range in set             | `'a[b-d]c'`    | `abc`, `acc`        | `aec`, `afc`   |
| `\|`     | Alternation OR           | `'abc\|xyz'`   | `abc`, `xyz`        | `abz`, `xyc`   |
| `(…)`    | Grouping (non-capturing) | `'a(bc\|de)f'` | `abcf`, `adef`      | `abdef`, `af`  |
| `{n}`    | Exactly n repetitions    | `'a{3}'`       | `aaa`               | `aa`, `aaaa`   |
| `{n,}`   | n or more repetitions    | `'a{2,}'`      | `aa`, `aaaaa`       | `a`            |
| `{n,m}`  | Between n and m          | `'a{2,3}'`     | `aa`, `aaa`         | `a`, `aaaa`    |

---

### 🧱 POSIX Character Classes (Must be inside `[]`)

| POSIX Class  | Meaning      | Equivalent        | Example        | Matches       |
| ------------ | ------------ | ----------------- | -------------- | ------------- |
| `[:alnum:]`  | Alphanumeric | `[a-zA-Z0-9]`     | `[[:alnum:]]`  | `a`, `Z`, `5` |
| `[:alpha:]`  | Alphabetic   | `[a-zA-Z]`        | `[[:alpha:]]`  | `b`, `T`      |
| `[:digit:]`  | Digits       | `[0-9]`           | `[[:digit:]]`  | `0`, `9`      |
| `[:lower:]`  | Lowercase    | `[a-z]`           | `[[:lower:]]`  | `m`, `z`      |
| `[:upper:]`  | Uppercase    | `[A-Z]`           | `[[:upper:]]`  | `D`, `X`      |
| `[:space:]`  | Whitespace   | Space/tab/newline | `[[:space:]]`  | `' '`, `\t`   |
| `[:punct:]`  | Punctuation  | `. , ! ?` etc.    | `[[:punct:]]`  | `!`, `.`      |
| `[:xdigit:]` | Hex Digits   | `[0-9A-Fa-f]`     | `[[:xdigit:]]` | `F`, `a`, `3` |

> ✅ Valid: `[[:digit:]]`
> ❌ Invalid: `[:digit:]`

---

### 🔍 REGEXP Query Examples

```sql
-- 1. Match lowercase emails ending with @leetcode.com
SELECT email FROM users
WHERE email REGEXP '^[a-z]+@leetcode\\.com$';

-- 2. Match strings starting with a digit
SELECT name FROM items
WHERE name REGEXP '^[[:digit:]]';

-- 3. Match hex color codes
SELECT color FROM palette
WHERE color REGEXP '^#[[:xdigit:]]{6}$';
```

---

### ⚠️ MySQL Regex Notes

* MySQL regex is **case-insensitive** unless you use `COLLATE ..._bin` or `REGEXP_LIKE(..., ..., 'c')`.
* MySQL **doesn't support**: lookahead, lookbehind, `\d`, `\w`, etc.
* Always **escape special characters** like `.` with `\\.`.

---

## 🧮 Window Function Frame Clause

### 💡 Concept Hierarchy

```
TABLE → WINDOW → FRAME
```

### 🔠 FRAME Type Differences

| FRAME TYPE | Works On      | Considers Duplicates? | Example Clause                                      |
| ---------- | ------------- | --------------------- | --------------------------------------------------- |
| `RANGE`    | Value ranges  | ✅ Yes                 | `RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW` |
| `ROWS`     | Row positions | ❌ No                  | `ROWS BETWEEN 2 PRECEDING AND CURRENT ROW`          |

> Use `RANGE` for cumulative value comparisons, `ROWS` for row-based logic (especially for `NTH_VALUE`, `LAST_VALUE`, etc.)

---

### 📘 Syntax

```sql
[ RANGE | ROWS ] BETWEEN frame_start AND frame_end
```

#### Frame Boundaries

* `CURRENT ROW`
* `UNBOUNDED PRECEDING`
* `UNBOUNDED FOLLOWING`
* `n PRECEDING` / `n FOLLOWING`
* `INTERVAL val unit PRECEDING/FOLLOWING` (for `RANGE` only)

> `frame_start` must not come after `frame_end`.

---

### 🧪 Examples

```sql
-- 1. Total price per category, descending order
SELECT *,
  SUM(price) OVER (PARTITION BY category ORDER BY price DESC) AS total_price
FROM product;

-- 2. FIRST_VALUE(): Most expensive per category
SELECT *,
  FIRST_VALUE(product_name) OVER (
    PARTITION BY product_category ORDER BY price DESC
  ) AS most_exp_product
FROM product;

-- 3. LAST_VALUE(): Least expensive per category
SELECT *,
  LAST_VALUE(product_name) OVER (
    PARTITION BY product_category ORDER BY price DESC
    RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS least_exp_product
FROM product
WHERE product_category = 'Phone';

-- 4. Use WINDOW clause to simplify
SELECT *,
  FIRST_VALUE(product_name) OVER w AS most_exp_product,
  LAST_VALUE(product_name) OVER w AS least_exp_product
FROM product
WINDOW w AS (
  PARTITION BY product_category ORDER BY price DESC
  RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
)
WHERE product_category = 'Phone';

-- 5. NTH_VALUE(): Fifth most expensive product
SELECT *,
  NTH_VALUE(product_name, 5) OVER w AS fifth_most_exp_product
FROM product
WINDOW w AS (
  PARTITION BY product_category ORDER BY price DESC
  RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
);

-- 6. NTILE(): Group phones into 3 price segments
SELECT product_name,
  CASE buckets
    WHEN 1 THEN 'Expensive Phones'
    WHEN 2 THEN 'Mid Range Phones'
    WHEN 3 THEN 'Cheaper Phones'
  END AS phone_category
FROM (
  SELECT product_name,
         NTILE(3) OVER (ORDER BY price DESC) AS buckets
  FROM product
  WHERE product_category = 'Phone'
) x;

-- 7. CUME_DIST(): First 30% of products by price
SELECT product_name, cume_dist_percent
FROM (
  SELECT *,
    CUME_DIST() OVER (ORDER BY price DESC) AS dist,
    ROUND(CUME_DIST() OVER (ORDER BY price DESC) * 100, 2) || '%' AS cume_dist_percent
  FROM product
) x
WHERE dist <= 0.3;

-- 8. PERCENT_RANK(): Relative price ranking
SELECT product_name,
  ROUND(PERCENT_RANK() OVER (ORDER BY price) * 100, 2) || '%' AS rank_percentage
FROM product;
```

---

### 📎 Additional References

* [MySQL 8.4 Window Function Frames Documentation](https://dev.mysql.com/doc/refman/8.4/en/window-functions-frames.html)
* [Date/Time Intervals in MySQL](https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html#function_date-add)

---

