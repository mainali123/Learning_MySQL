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

-- Inner Join

SELECT first_name, last_name, film_id
FROM actor
         INNER JOIN film_actor USING (actor_id)
LIMIT 20;


SELECT first_name, last_name, film_id # Without using INNER JOIN
FROM actor AS ac,
     film_actor AS fa
WHERE ac.actor_id = fa.actor_id
LIMIT 20;

SELECT first_name, last_name, film_id
FROM actor AS ac
         INNER JOIN film_actor AS fa ON ac.actor_id = fa.actor_id
LIMIT 20;

-- UNION

SELECT first_name
FROM actor
UNION
SELECT first_name
FROM customer
UNION
SELECT title
FROM film;

(SELECT title, COUNT(rental_id) AS num_rented
 FROM film
          INNER JOIN inventory USING (film_id)
          INNER JOIN rental USING (inventory_id)
 GROUP BY title
 ORDER BY num_rented DESC
 LIMIT 5)
UNION
(SELECT title, COUNT(rental_id) AS num_rented
 FROM film
          JOIN inventory USING (film_id)
          JOIN rental USING (inventory_id)
 GROUP BY title
 ORDER BY num_rented ASC
 LIMIT 5);

SELECT first_name # Will show distinct values
FROM actor
WHERE actor_id = 88
UNION
SELECT first_name
FROM actor
WHERE actor_id = 169;

SELECT first_name # Will show duplicates values
FROM actor
WHERE actor_id = 88
UNION ALL
SELECT first_name
FROM actor
WHERE actor_id = 169;


(SELECT title, rental_date, return_date
 FROM film
          JOIN inventory USING (film_id)
          JOIN rental USING (inventory_id)
 WHERE film_id = 998
 ORDER BY rental_date ASC);

(SELECT title, rental_date, return_date
 FROM film
          JOIN inventory USING (film_id)
          JOIN rental USING (inventory_id)
 WHERE film_id = 998
 ORDER BY rental_date ASC)
# This won't sort in ASC order since LIMIT is missing
UNION ALL
(SELECT title, rental_date, return_date
 FROM film
          JOIN inventory USING (film_id)
          JOIN rental USING (inventory_id)
 WHERE film_id = 998
 ORDER BY rental_date ASC
 LIMIT 5);


(SELECT title, rental_date, return_date
 FROM film
          JOIN inventory USING (film_id)
          JOIN rental USING (inventory_id)
 WHERE film_id = 998)
UNION
(SELECT title, rental_date, return_date
 FROM film
          JOIN inventory USING (film_id)
          JOIN rental USING (inventory_id)
 WHERE film_id = 998)
ORDER BY rental_date DESC;

(SELECT first_name, last_name
 FROM actor
 WHERE actor_id < 5)
UNION
(SELECT first_name, last_name
 FROM actor
 WHERE actor_id > 190
 ORDER BY first_name
 LIMIT 4);

SELECT first_name, last_name
FROM actor
WHERE actor_id < 5
   OR actor_id > 190
ORDER BY first_name
LIMIT 4;


-- LEFT AND RIGHT JOINS

SELECT title, rental_date
FROM film
         LEFT JOIN inventory USING (film_id)
         LEFT JOIN rental USING (inventory_id);


SELECT email, name AS category_name, COUNT(cat.category_id) AS cnt
FROM customer AS cs
         LEFT JOIN rental USING (customer_id)
         LEFT JOIN inventory USING (inventory_id)
         LEFT JOIN film_category USING (film_id)
         LEFT JOIN category AS cat USING (category_id)
GROUP BY email, category_name
ORDER BY cnt DESC
LIMIT 5;


SELECT *
FROM customer
         LEFT JOIN rental USING (customer_id)
ORDER BY customer_id, first_name, last_name DESC;


# NESTED QUERIES

# USER VARIABLES

