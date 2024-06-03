USE sakila;


# ALIASES

-- Column Aliases
SELECT first_name AS 'First Name', last_name AS 'Last Name'
FROM actor
LIMIT 5;

SELECT CONCAT(first_name, ' ', last_name, ' played in ', title) AS movie
FROM actor
         INNER JOIN film_actor USING (actor_id)
         INNER JOIN film USING (film_id)
ORDER BY movie
LIMIT 20;


SELECT first_name AS name
FROM actor
ORDER BY name;

-- Table Aliases

SELECT ac.actor_id, ac.first_name, ac.last_name, fl.title
FROM actor AS ac
         INNER JOIN film_actor AS fla using (actor_id)
         INNER JOIN film AS fl using (film_id)
WHERE fl.title = 'AFFAIR PREJUDICE';


SELECT *
FROM film
WHERE title = title;

SELECT m1.film_id, m1.title
FROM film AS m1,
     film as m2
WHERE m1.title = m2.title;

SELECT m1.film_id, m1.title
FROM film AS m1,
     film as m2
WHERE m1.title = m2.title
  AND m1.film_id != m2.film_id;


# AGGREGATING DATA

-- Distinct Clause

SELECT DISTINCT first_name
FROM sakila.actor;

SELECT distinct first_name
FROM sakila.actor
         INNER JOIN sakila.film_actor USING (actor_id);

-- Group By Clause

SELECT first_name
FROM sakila.actor
WHERE first_name IN ('GENE', 'MERYL');


SELECT CONCAT(ac.first_name, ' ', ac.last_name) AS full_name
FROM actor AS ac
         INNER JOIN film_actor AS fla USING (actor_id)
         INNER JOIN film AS fl USING (film_id)
GROUP BY full_name;

SELECT first_name, last_name, count(film_id) AS no_films
FROM actor
         INNER JOIN film_actor USING (actor_id)
GROUP BY first_name, last_name
ORDER BY no_films DESC
LIMIT 20;


SELECT title, name AS category_name, COUNT(*) AS cnt
FROM film
         INNER JOIN film_actor USING (film_id)
         INNER JOIN film_category USING (film_id)
         INNER JOIN category USING (category_id)
GROUP BY film_id, category_id
ORDER BY cnt DESC
LIMIT 5;


SELECT email, name AS category_name, COUNT(category_id) AS cnt
FROM customer AS cs
         INNER JOIN rental USING (customer_id)
         INNER JOIN inventory USING (inventory_id)
         INNER JOIN film_category USING (film_id)
         INNER JOIN category AS cat USING (category_id)
GROUP BY 1, 2
ORDER BY 3
        DESC
LIMIT 5;


SELECT COUNT(*)
FROM actor
GROUP BY first_name, last_name;

SELECT a1.actor_id, a1.first_name, a1.last_name
FROM actor AS a1,
     actor AS a2
WHERE a1.first_name = a2.first_name
  AND a1.last_name = a2.last_name
  AND a1.actor_id != a2.actor_id;


-- Having Clause
SELECT first_name, last_name, COUNT(film_id) AS count
FROM actor
         INNER JOIN film_actor USING (actor_id)
GROUP BY first_name, last_name
HAVING count >= 40
ORDER BY count DESC;

SELECT title, COUNT(rental_id) AS no_of_times_watched
FROM film
         INNER JOIN inventory USING (film_id)
         INNER JOIN rental USING (inventory_id)
GROUP BY title
HAVING no_of_times_watched > 30
ORDER BY no_of_times_watched DESC;

# ADVANCED JOINS

# NESTED QUERIES

# USER VARIABLES

