# 🐬 MySQL Cheat Sheet 4 – Explore Database & Tables

Useful for **filtering, searching, or dynamically exploring databases and tables**

## 1️⃣ Show Databases

```sql
SHOW DATABASES;
```

* Lists all databases available in the MySQL server.

---

## 2️⃣ Use a Database

```sql
USE database_name;
```

* Sets the current database for your session.
* After this, you can run queries without specifying the database name.

---

## 3️⃣ Show Schemas (alias for databases)

```sql
SHOW SCHEMAS;
```

* In MySQL, **schema = database**, so this is equivalent to `SHOW DATABASES;`.

---

## 4️⃣ Show Tables in Current Database

```sql
SHOW TABLES;
```

* Lists all tables in the currently selected database.

```sql
SHOW TABLES FROM database_name;
```

* Lists tables from a specific database without switching the session.

---

## 5️⃣ Describe Table Structure

```sql
DESCRIBE table_name;
-- or
EXPLAIN table_name;
```

* Shows column names, data types, and other metadata of a table.

---

## 6️⃣ Show Columns in a Table

```sql
SHOW COLUMNS FROM table_name;
```

* Displays column details: name, type, nullability, key info, default value, extra info.

---

## 7️⃣ Show Create Table

```sql
SHOW CREATE TABLE table_name;
```

* Shows the full `CREATE TABLE` statement that defines the table, including indexes, constraints, and table options.

---

## 8️⃣ Query Information Schema (Advanced)

```sql
-- List all tables in a database
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'database_name';

-- List all columns in a table
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_schema = 'database_name' AND table_name = 'table_name';
```

---

