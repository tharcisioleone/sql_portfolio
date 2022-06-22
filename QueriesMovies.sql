/* Author: Tharcisio Leone */
/* Database: dvdrental */

-- Finding all the movies with a replacement cost higher than the average value
SELECT title, replacement_cost FROM film
WHERE replacement_cost >
(SELECT ROUND(AVG(replacement_cost),2) FROM film)
ORDER BY replacement_cost

-- Finding all titles that have been rentered in year 2006
SELECT title FROM film
WHERE film_id IN
(SELECT film_id FROM inventory i
INNER JOIN rental r
ON i.inventory_id = r.inventory_id
WHERE DATE(rental_date) BETWEEN '2006-01-01' AND '2007-01-01')

-- Finding all the customers that have paid in the month of May
SELECT first_name, last_name
FROM customer c
WHERE EXISTS
(SELECT * FROM payment p
WHERE c.customer_id = p.customer_id
AND EXTRACT (month from payment_date)=5)

-- Finding all the movies with the same time duration but with different replacement costs
SELECT f1.title as t1, f2.title as t2, f1.length as l1,
f2.length as l2, f1.replacement_cost rp1,
f2.replacement_cost as rc2
FROM film f1
INNER JOIN film f2
ON f1.length = f2.length AND
f1.replacement_cost != f2.replacement_cost