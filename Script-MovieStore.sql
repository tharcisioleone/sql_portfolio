/* Author: Tharcisio Leone */
/* Database: dvdrental */

CREATE DATABASE dvdrental
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'German_Germany.1252'
    LC_CTYPE = 'German_Germany.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

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



