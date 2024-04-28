# Udemy SQL Course Assesment
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
# Q1
# 1. Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.
# The answer should be customers 187 and 148.
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

# Q2 How many films begin with the letter J?
# The answer should be 20.
SELECT COUNT(*)
FROM film
WHERE title LIKE 'J%';

#Q3 What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?
SELECT CONCAT(first_name,' ', last_name) name 
FROM customer
WHERE first_name LIKE 'E%' AND
      address_id < 500
ORDER BY customer_id DESC
LIMIT 1;

# Question source https://dev.mysql.com/doc/sakila/en/sakila-usage.html
# Find Overdue dvd's
SELECT DISTINCT rental_id
FROM rental r INNER JOIN inventory i ON r.inventory_id = i.inventory_id
     INNER JOIN film f ON i.film_id = f.film_id
WHERE r. return_date IS NULL OR
      r.return_date > date_add(r.rental_date, INTERVAL f.rental_duration DAY);
      
SELECT *
FROM film
LIMIT 5;
