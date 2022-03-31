USE sakila;

-- List all actors.
SELECT first_name, last_name
FROM actor;

-- Find the surname of the actor with the forename 'John'.
SELECT last_name
FROM actor
WHERE first_name = "John";

-- Find all actors with surname 'Neeson'.
SELECT first_name, last_name
FROM actor
WHERE last_name = "Neeson";

-- Find all actors with ID numbers divisible by 10.
SELECT first_name, last_name
FROM actor
WHERE actor_id%10 = 0;

-- What is the description of the movie with an ID of 100?
SELECT `description`
FROM film_text
WHERE film_id = 100;

-- Find every R-rated movie.
SELECT title
FROM film
WHERE rating="R";

-- Find every non-R-rated movie.
SELECT title
FROM film
WHERE rating!="R";

-- Find the ten shortest movies.
SELECT title, length
FROM film
ORDER BY length ASC
limit 10;

-- Find the movies with the longest runtime, without using LIMIT.
SELECT title, length
FROM film
ORDER BY length DESC;

-- Find all movies that have deleted scenes.
SELECT title
FROM film
WHERE special_Features LIKE "%Deleted Scenes%";

-- Using HAVING, reverse-alphabetically list the last names that are not repeated.
SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(last_name)=1
ORDER BY last_name DESC;


-- Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(last_name)>1
ORDER BY COUNT(last_name) DESC;

-- Which actor has appeared in the most films?
SELECT actor.first_name, actor.last_name, COUNT(film_actor.actor_id), actor.actor_id
FROM actor
JOIN film_actor ON actor.actor_id=film_actor.actor_id
GROUP BY film_actor.actor_id
ORDER BY COUNT(film_actor.actor_id) DESC;

-- When is 'Academy Dinosaur' due?
SELECT title, release_year
FROM film
WHERE title = "Academy Dinosaur";


-- What is the average runtime of all films?
SELECT SUM(length)/COUNT(film_id)
from film;

-- List the average runtime for every film category.
SELECT SUM(film.length)/COUNT(category.name), category.`name`
FROM film
JOIN film_category on film.film_id=film_category.film_id
JOIN category ON film_category.category_id=category.category_id
GROUP BY category.`name`;

-- List all movies featuring a robot.
SELECT film.title, film_text.`description`
FROM film
JOIN film_text on film.film_id=film_text.film_id
WHERE film_text.`description` LIKE "%robot%";

-- How many movies were released in 2010?
SELECT COUNT(film_id)
FROM film
WHERE release_year = 2010;

-- Find the titles of all the horror movies.
SELECT film.title, category.`name`
FROM film
JOIN film_category on film.film_id=film_category.film_id
JOIN category ON film_category.category_id=category.category_id
WHERE category.`name` = "horror";

-- List the full name of the staff member with the ID of 2.
SELECT first_name, last_name
FROM staff
Where staff_id = 2;

-- List all the movies that Fred Costner has appeared in.
SELECT film.title
FROM film
JOIN film_actor ON film.film_id=film_actor.film_id
JOIN actor ON film_actor.actor_id=actor.actor_id
WHERE actor.first_name = "Fred" AND actor.last_name = "Costner";

-- How many distinct countries are there?
SELECT COUNT(country_id)
FROM country;

-- List the name of every language in reverse-alphabetical order.
SELECT `name`
FROM `language`
ORDER BY `name` DESC;

-- List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE "%son"
ORDER BY first_name;

-- Which category contains the most films?
SELECT category.`name`, COUNT(category.name)
FROM film
JOIN film_category on film.film_id=film_category.film_id
JOIN category ON film_category.category_id=category.category_id
GROUP BY category.`name`
ORDER BY COUNT(category.name) DESC
LIMIT 1;