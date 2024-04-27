# Show all the databases
SHOW databases;

# Use the database
use sakila;

# Show all the tables in the db
SHOW tables;

# Describe table schema
DESC actor;

# View the EER diagram (Enhanced Entity Relationship)
# Database -> Reverse Engineering -> Select the database -> Keep clicking next

#
SELECT * FROM customer LIMIT 5;

SELECT c.customer_id, 
	   SUM(p.amount)total_purchase
FROM customer c,
	 payment p,
	 staff s
WHERE c.customer_id = p.customer_id AND
      p.staff_id = s.staff_id AND
	  s.staff_id = 2
GROUP BY c.customer_id
HAVING SUM(p.amount) >= 110
ORDER BY 2 DESC;
