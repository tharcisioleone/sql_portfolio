/* Author: Tharcisio Leone */
/* Database: dvdrental */



		/********** 1. BASIC COMMANDS **********/

-- Finding all the (different) rental rates aplied by the video rental store
SELECT DISTINCT rental_rate FROM film;

-- Finding the first three customers that have executed the payments
SELECT customer_id, payment_date FROM payment
ORDER BY payment_date ASC
LIMIT 3

-- Finding the three longest films available in the video rental store
SELECT title, length FROM film
ORDER BY length DESC
LIMIT 3

-- Finding the first five films that have been returned to the movie store
SELECT * FROM rental
ORDER BY return_date ASC
LIMIT 5

-- Finding when the customer number 24 returned the last four movies
SELECT * FROM rental
WHERE customer_id=24
ORDER BY return_date DESC
LIMIT 4

-- Finding how many movies the customer 224 has rented
SELECT count(*) FROM rental
WHERE customer_id=224

-- Finding how many movies have a renter rate higher than USD 3
SELECT count(*) FROM film
WHERE rental_rate > 3

-- Finding how many movies start the title with the letter 'S'
SELECT count(*) FROM film
WHERE title LIKE 'S%'

-- Finding the number of movies that have 'der' in the title
SELECT count(*) FROM film
WHERE title LIKE '%der%'
-- Showing the titles
SELECT title FROM film
WHERE title LIKE '%der%'

-- Finding how many movies have a rating of 'PG' or 'PG-13' AND a rental rate higher than USD 4
SELECT count(*) FROM film
WHERE rating IN ('PG','PG-13') AND rental_rate > 4

-- Finding how many movies have 'at' in the title AND a rental rate higher than USD 4
SELECT count(*) FROM film
WHERE title LIKE '%at%' AND rental_rate > 4

-- Finding what staff has processed the highest amount of payments
SELECT staff_id, SUM(amount)
FROM payment
GROUP BY staff_id
ORDER BY sum DESC

-- Finding in what district live the most of the customers
SELECT district, COUNT(*)
FROM address
GROUP BY district
ORDER BY COUNT(*) DESC

-- Finding what customers have rented the higher number of movies
SELECT customer_id, COUNT(*)
FROM rental
GROUP BY customer_id
ORDER BY 2 DESC

-- Finding the days in which the most of payments were received
SELECT DATE(payment_date), COUNT(*)
FROM payment
GROUP BY DATE(payment_date)
ORDER BY 2 DESC

-- Finding the days in which the staff members received the highest number of payments
SELECT DATE(payment_date), staff_id, COUNT(*)
FROM payment
GROUP BY DATE(payment_date), staff_id
ORDER BY 3 DESC

-- Finding the districts in which more than eight customers live
SELECT district, COUNT(*) FROM address
GROUP BY district
HAVING COUNT(*) > 8
ORDER BY 2 DESC


		/********** 2. JOINS **********/
		
-- Finding the total number of payments
SELECT COUNT(*)
FROM payment p
INNER JOIN customer c
ON c.customer_id = p.customer_id

-- Finding the cities of the customer that start with the letter 'A'
SELECT city, country
FROM country
FULL OUTER JOIN city
ON city.country_id = country.country_id
WHERE country LIKE 'A%'

-- Finding what customers have spent the highest sum with movies
SELECT first_name, last_name, SUM(amount)
FROM payment p
LEFT JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY first_name, last_name
ORDER BY 3 DESC

-- Finding the number of movies from which the category starts with the letter 'A'
SELECT COUNT(*), name as kategorie
FROM film f
LEFT JOIN film_category fc
ON f.film_id = fc.film_id
LEFT JOIN category c
ON fc.category_id = c.category_id
WHERE name LIKE 'A%'
GROUP BY kategorie

-- Finding the full name and address of the customer
SELECT cu.customer_id,
cu.first_name,
cu.last_name,
ad.address,
ci.city,
country
FROM customer cu
LEFT JOIN address ad ON cu.address_id = ad.address_id
LEFT JOIN city ci ON ci.city_id = ad.city_id
LEFT JOIN country co ON ci.country_id = co.country_id



		/********** 3. UNIONS **********/

-- Combining first and last name of actors and customers
SELECT first_name, last_name FROM actor
UNION
SELECT first_name, last_name FROM customer

-- Finding customer's names that start with 'An' and end with 'a' AND have the same name as an actor.
SELECT first_name FROM customer
WHERE first_name LIKE 'An%a'
INTERSECT 
SELECT first_name FROM actor
WHERE first_name LIKE 'An%a'



		/********** 4. STRING FUNCTIONS **********/

-- Creating a new variable reporting first and last names together
SELECT
first_name, last_name,
first_name || ' ' || last_name AS Complete_Name -- Including space
FROM customer

-- Finding the position in which the letter 'a' is found in the first name of customers
SELECT
SUBSTRING(first_name, POSITION('a' in first_name), 1),
first_name,
POSITION('a' in first_name)
FROM customer

-- Counting the number of letters in the first name of customers
SELECT
length(first_name),
first_name
FROM customer



		/********** 5. TIME FUNCTIONS **********/

-- Extracting the months from the dates of payments
SELECT
extract(month from payment_date) as dow,
SUM(amount)
FROM payment
GROUP BY dow
ORDER BY dow DESC

-- Adding months and days in the date of payment
SELECT
payment_date + '3 month',
payment_date,
DATE(payment_date) + 3
FROM payment



		/********** 6. VIEWS **********/

-- Creating Views: A virtual table based on the result-set of an SQL statement.
CREATE VIEW customer_info AS
SELECT customer_id, first_name, last_name, address, city
FROM customer cu
LEFT JOIN address ad ON cu.address_id = ad.address_id
LEFT JOIN city ci ON ci.city_id = ad.city_id

-- Showing the results salved in view
SELECT * FROM customer_info

-- Replacing the created view
CREATE OR REPLACE VIEW public.customer_info
AS
SELECT cu.customer_id,
cu.first_name,
cu.last_name,
ad.address,
ci.city,
country
FROM customer cu
LEFT JOIN address ad ON cu.address_id = ad.address_id
LEFT JOIN city ci ON ci.city_id = ad.city_id
LEFT JOIN country co ON ci.country_id = co.country_id

-- Using the view to find from what countries come the most of the customers
SELECT COUNT(*), country FROM customer_info
GROUP BY country
ORDER BY 1 DESC

-- Deleting the view
DROP VIEW IF EXISTS view_customer_info -- If exists to avoid error if the view does not exist more.



		/********** 7. CONDITIONAL STATEMENTS **********/

-- Finding the number of movies that have a duration of at least 90 minutes and more than 90 minutes
SELECT
CASE WHEN length >= 90
THEN 'long'
ELSE 'short'
END as duration,
COUNT(*) as Total
FROM film
GROUP BY duration
