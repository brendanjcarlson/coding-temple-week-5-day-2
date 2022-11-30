-- 1. How many actors are there with the last name 'Wahlberg'?
SELECT COUNT(*)
FROM actor
WHERE last_name = 'Wahlberg';
-- A: 2


-- 2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(*)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
-- A: 5607


-- 3. What film does the store have the most of?
SELECT film_id, COUNT(*) AS stock
FROM inventory
GROUP BY film_id
ORDER BY stock DESC;
-- A: There are multiple with 8 in stock


-- 4. How many customers have the last name 'William'?
SELECT COUNT(*)
FROM customer
WHERE last_name = 'William';
-- A: 0
SELECT COUNT(*)
FROM CUSTOMER
WHERE last_name LIKE 'William%';
-- A: 2


-- 5. What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(*) AS rentals
FROM rental
GROUP BY staff_id
ORDER BY rentals DESC
-- A: 1


-- 6. How many different district names are there?
SELECT COUNT(DISTINCT district)
FROM address;
-- A: 378


-- 7. What film has the most actors in it?
SELECT film_id, COUNT(DISTINCT actor_id) AS actors
FROM film_actor
GROUP BY film_id
ORDER BY actors DESC
LIMIT 1;
-- A: ID 508, 15 actors

-- 8. From store_id 1, how many customers have a last name ending with 'es'?
SELECT COUNT(DISTINCT customer_id)
FROM customer
WHERE last_name LIKE '%es' AND store_id = 1;
-- A: 13


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--    with ids between 380 and 430? (use group by and having > 250)
SELECT COUNT(*)
FROM (
	SELECT amount, COUNT(amount) 
	FROM payment
	WHERE customer_id BETWEEN 380 AND 430
	GROUP BY amount
	HAVING COUNT(amount) > 250) AS sub
-- A: 3

-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?
SELECT rating, COUNT(rating) AS ratings
FROM film
GROUP BY rating
ORDER BY ratings DESC;
-- A: 5 categories, pg-13 most common with 223