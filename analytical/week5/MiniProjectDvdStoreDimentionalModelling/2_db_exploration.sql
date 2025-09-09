-- Switch to the working database and schema
USE DATABASE WCD_LAB;
USE SCHEMA SAKILA;

-- COUNT TOTAL Payment Records
SELECT COUNT(*)
FROM PAYMENT; --15867

-- Preview the Payment table: show first 5 records ordered by customer and rental
SELECT * 
FROM PAYMENT
ORDER BY CUSTOMER_ID,
         RENTAL_ID
LIMIT 5;

-- Count number of payment records for each (payment_id, customer_id, rental_id) combination
SELECT PAYMENT_ID,
       CUSTOMER_ID,
       RENTAL_ID,
       COUNT(AMOUNT) total_records
FROM Payment
GROUP BY 1, 2, 3; -- 15867 (so each payment record has unique (customer & rental_id))

SELECT COUNT(DISTINCT payment_id, customer_id, rental_id)
FROM payment; --15867

-- Total number of distinct payments
SELECT COUNT(DISTINCT Payment_id) total_payments
FROM Payment; -- 15867

-- Total number of distinct rentals that have payments
SELECT COUNT(DISTINCT Rental_id) total_rentals
FROM Payment; -- 15862

-- Total number of distinct rentals in the rental table (should be higher than in payment)
SELECT COUNT(DISTINCT Rental_id)
FROM Rental; -- 16044

-- Find any payment records that are not linked to a rental (invalid data)
SELECT *
FROM Payment
WHERE rental_id IS NULL; -- 5

-- Join payments with rentals to compare dates and keys
SELECT p.payment_id,
       r.rental_id,
       p.payment_date,
       r.rental_date
FROM payment p,
     rental r
WHERE p.rental_id = r.rental_id;

-- Count how many payments match rentals and also have the same payment_date = rental_date
SELECT COUNT(*)
FROM payment p,
     rental r
WHERE p.rental_id = r.rental_id AND p.payment_date = r.rental_date; -- 15862

-- Count of all rentals that have at least one matching payment
SELECT COUNT(*)
FROM payment p,
     rental r
WHERE p.rental_id = r.rental_id; -- 15862

-- Total number of rentals (should be more than those with payments)
SELECT COUNT(DISTINCT rental_id)
FROM rental r ; -- 16044

-- Find rentals that do not have a payment record (left join with NULL on payment side)
SELECT *
FROM rental r LEFT JOIN
     payment p ON r.rental_id = p.rental_id
WHERE p.rental_id IS NULL; -- 182
-- These rentals have NULL return dates (still out with customers)

-- Count rentals that have not yet been returned
SELECT COUNT(*)
FROM rental 
WHERE return_date IS NULL; --183

-- Rentals that have a payment record but no return date (active + paid)
SELECT *
FROM rental r LEFT JOIN
     payment p ON r.rental_id = p.rental_id
WHERE p.rental_id IS NOT NULL AND return_date IS NULL; -- 1

-- Same as above but written using an inner join
SELECT *
FROM payment p,
     rental r
WHERE p.rental_id = r.rental_id AND return_date IS NULL; --1

-- Preview all rental records
SELECT * 
FROM RENTAL;

-- Check for duplicate rentals by same inventory_id and customer_id
SELECT inventory_id,
       customer_id,
       COUNT(*)
FROM rental
GROUP BY 1, 2
HAVING COUNT(*) > 1; --0 (no duplicates)

-- Preview films table
SELECT * 
FROM Film
LIMIT 5;

-- Join to show film titles, payment amount, and rental rate
SELECT f.title,
       p.amount,
       f.rental_rate
FROM Payment p,
     rental r,
     inventory i, 
     film f
WHERE p.rental_id = r.rental_id AND
      r.inventory_id = i.inventory_id AND
      i.film_id = f.film_id;

-- Fact Table construction: combines payments, rentals, and inventory into a star schema fact
SELECT p.payment_id,
       p.customer_id,
       p.staff_id,
       i.film_id,
       r.rental_date rental_date_id,
       r.return_date return_date_id,
       p.payment_date payment_date_id,
       i.store_id,
       p.amount
FROM payment p 
     LEFT JOIN 
     rental r ON p.rental_id = r.rental_id
     LEFT JOIN 
     inventory i ON r.inventory_id = i.inventory_id;

-- Dimension Tables to complement the fact:

-- 1. Dimension Calendar (not shown, but usually built from dates)
-- 2. Dimension Customer: customer demographics and contact info
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       c.email,
       a.address,
       a.district,
       a.postal_code,
       a.phone,
       ci.city,
       co.country
FROM Customer c 
     LEFT JOIN 
     Address a ON c.address_id = a.address_id
     LEFT JOIN 
     City ci ON a.city_id = ci.city_id
     LEFT JOIN 
     Country co ON ci.country_id = co.country_id;

-- 3. Dimension Staff (not written, would include staff details)
-- 4. Dimension Film (not written, would include film metadata)
-- 5. Dimension Store (not written, would include store info)

-- Final look at the rental table
SELECT * 
FROM rental;


