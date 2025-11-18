# 🐬 MySQL Cheat Sheet 1 - CRUD

## 🔸 1. **Create**

```sql
-- Create a new table
CREATE TABLE table_name (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  age INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert a row
INSERT INTO table_name (name, age) VALUES ('Alice', 30);

-- Insert multiple rows
INSERT INTO table_name (name, age) 
VALUES ('Bob', 25), ('Charlie', 35);
```

---

## 🔸 2. **Read (SELECT)**

```sql
-- Select all rows
SELECT * FROM table_name;

-- Select specific columns
SELECT name, age FROM table_name;

-- With conditions
SELECT * FROM table_name WHERE age > 30;

-- Sort results
SELECT * FROM table_name ORDER BY age DESC;

-- Limit results
SELECT * FROM table_name LIMIT 5;

-- Aggregate functions
SELECT COUNT(*) FROM table_name;
SELECT AVG(age) FROM table_name;

-- Grouping
SELECT age, COUNT(*) FROM table_name GROUP BY age;

-- Join tables
SELECT a.name, b.salary
FROM employees a
JOIN salaries b ON a.id = b.emp_id;
```

---

## 🔸 3. **Update**

```sql
-- Update one row
UPDATE table_name 
SET age = 31 
WHERE name = 'Alice';

-- Update multiple rows
UPDATE table_name 
SET age = age + 1 
WHERE age < 30;
```

---

## 🔸 4. **Delete**

```sql
-- Delete specific rows
DELETE FROM table_name 
WHERE name = 'Bob';

-- Delete all rows (use with caution!)
DELETE FROM table_name;
```

---

## 🔸 5. **Extra Commands**

```sql
-- Drop a table
DROP TABLE table_name;

-- Rename a table
RENAME TABLE old_name TO new_name;

-- Add a column
ALTER TABLE table_name ADD COLUMN email VARCHAR(255);

-- Modify a column
ALTER TABLE table_name MODIFY age TINYINT;

-- Delete a column
ALTER TABLE table_name DROP COLUMN email;
```

---

## 🔸 6. **Safe Practices**

```sql
-- See what will be deleted/updated before running it
SELECT * FROM table_name WHERE ...;

-- Use transactions when doing batch operations
START TRANSACTION;
UPDATE ...;
DELETE ...;
COMMIT;

-- Or rollback on error
ROLLBACK;
```
