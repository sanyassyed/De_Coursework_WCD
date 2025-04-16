-- EDA
USE superstore;

SHOW TABLES;

-- Dimention table Who?
SELECT * 
FROM customers
LIMIT 5;

-- Dimention table What?
SELECT *
FROM products
LIMIT 5;

-- Fact table How Much? 
SELECT * 
FROM orders
LIMIT 5;

-- Get the top 10 customer ids who have the most purchase. Get their customer id and sum of the customer sales (you can use different column name) from the database.
-- Option 1
SELECT CustomerID,
       SUM(Sales) TotalCustomerSales
FROM orders
GROUP BY CustomerID
ORDER BY 2 DESC
LIMIT 10;

-- Option2
WITH cte 
AS
(
SELECT CustomerID,
       Sum(Sales) TotalCustomerSales,
       RANK() OVER (ORDER BY Sum(Sales) DESC) rnk
FROM orders
GROUP BY CustomerID
)
SELECT CustomerID,
       TotalCustomerSales
FROM cte
WHERE rnk <= 10;



SELECT CustomerID,
       Sum(Sales) TotalCustomerSales,
       RANK() OVER (ORDER BY Sum(Sales) DESC) rnk
FROM orders
GROUP BY CustomerID;