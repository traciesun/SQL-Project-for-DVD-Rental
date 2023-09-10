--1.Display the top 10 most rented film titles 
--step1: how many times each movie is rented
SELECT i.film_id, COUNT(i.film_id) as times
FROM inventory i join rental r
ON i.inventory_id=r.inventory_id
WHERE store_id=1
GROUP BY i.film_id
ORDER BY COUNT(i.film_id) DESC
--step 2: display the title of the movies
SELECT title
FROM film
WHERE film_id IN
(SELECT i.film_id
FROM inventory i join rental r
ON i.inventory_id=r.inventory_id
GROUP BY i.film_id
ORDER BY COUNT(i.film_id) DESC)
LIMIT 10



