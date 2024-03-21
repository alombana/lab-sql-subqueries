-- 1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT fi.title, count(re.inventory_id) AS "amount of copies" FROM sakila.rental as re
JOIN inventory as inv
on re.inventory_id = inv.inventory_id
JOIN film as fi
on fi.film_id = inv.film_id
GROUP BY fi.title
HAVING fi.title = "Hunchback Impossible";

-- 2. List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT * FROM sakila.film
WHERE length> (SELECT avg(length) AS "AVG" from sakila.film);

-- 3. Use a subquery to display all actors who appear in the film "Alone Trip".
SELECT * FROM sakila.film_actor as fa
JOIN actor as ac
on ac.actor_id = fa.actor_id
WHERE film_id =  (SELECT film_id FROM sakila.film
WHERE title = "Alone Trip");