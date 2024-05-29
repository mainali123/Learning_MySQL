# USING DATABASE
use sakila;

# DISPLAY SELECTED DATABASE
SELECT database();

# SHOW TABLES OF THE DATABASE
SHOW TABLES;

# SHOW COLUMNS OF THE TABLE ACTOR
SHOW columns from actor;

# DESCRIBE THE TABLE ACTOR
DESC actor;

# DESCRIBE THE TABLE CITY
DESC city;

-- SELECT CLAUSE --

# SHOW ALL THE COLUMNS ALONG WITH VALUES OF LANGUAGE TABLE
SELECT *
FROM language;

# SHOW ALL THE COLUMNS ALONG WITH VALUES OF CITY TABLE
SELECT *
FROM city;

# SHOW ALL THE VALUES OF CITY COLUMN FROM TABLE CITY
SELECT city
FROM city;

# SHOW ALL THE VALUES OF CITY_ID AND CITY COLUMN FROM CITY TABLE
SELECT city_id, city
FROM city;

# SHOW ALL THE COLUMNS ALONG WITH VALUES FORM THE SAKILA DATABASE LANGUAGE COLUMN
# CAN BE USED WITHOUT USING THE `USE (DATABASE)` DATABASE
SELECT name
FROM sakila.language;

-- WHERE CLAUSE --

# SELECTING ALL THE LANGUAGES OF sakila DATABASE WITH THE name 'English'
SELECT *
FROM sakila.language
WHERE name = 'English';

# Selecting the firstname of the actor with the actor_id of 4
SELECT first_name
FROM actor
WHERE actor_id = 4;

# Selecting the city from the city table where country_id is 15
SELECT city
FROM city
WHERE country_id = 15;

# All city name with city_id less than 5
SELECT city
FROM city
WHERE city_id < 5;

# All languages that don't have a language_id of 2
SELECT language_id, name
FROM language
WHERE language_id != 2;

# String comparison (By default it is not case sensitive)
SELECT first_name
FROM actor
WHERE first_name < 'b';

# Film with a title that contains the word `family`
SELECT title
FROM film
WHERE title LIKE '%family%';

# Titles of all moves starring an actor whose name begins with the three letters NAT
SELECT title, actors
FROM film_list
WHERE actors LIKE 'NAT_%';

-- COMBINING CONDITIONS WITH AND, OR, NOT AND XOR

# titles of sci-fi movies that are rated PG
SELECT title
FROM film_list
WHERE category LIKE 'sci-fi'
  AND rating LIKE 'pg';

# List of movies in the children or family category
SELECT title
FROM film_list
WHERE category LIKE 'children'
   OR category LIKE 'family';

# Sci-fi or family rated movies that are rated PG
SELECT title
FROM film_list
WHERE (category
           LIKE 'sci-fi'
    OR category
           LIKE 'family')
  AND rating LIKE 'PG';

# Listing all languages with language_id not equal to 2 using NOT operator
SELECT language_id, name
FROM language
WHERE NOT (language_id = 2);

# List of all movie titles with an FID less than 7, but not those numbered 4 or 6
SELECT FID, title
FROM film_list
WHERE FID < 7
  AND NOT (FID = 4 OR FID = 6);

# Get the titles of any movies that have a price range between $2 and $4, belong to the Documentary or Horror category, and have an actor named Bob
SELECT title
FROM film_list
WHERE price BETWEEN 2 AND 4
  AND (category LIKE 'Documentary' OR category LIKE 'Horror')
  AND actors LIKE '%Bob%';