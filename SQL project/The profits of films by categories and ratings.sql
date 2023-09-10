--The profits of films by categories and ratings 
--category of each film
SELECT c.name, f.title
FROM film f JOIN film_category fc
ON f.film_id=fc.film_id
JOIN category c
ON fc.category_id=c.category_id
ORDER BY c.name
--profit of each film
SELECT p.amount, f.title, i.store_id
FROM film f JOIN inventory i
ON f.film_id=i.film_id
JOIN rental r 
ON i.inventory_id=r.inventory_id
JOIN payment p

--window function to solve the problem
SELECT c.name,
f.rating,
SUM(p.amount) OVER (PARTITION BY c.name ORDER BY f.rating)
FROM category c 
JOIN film_category fc
ON fc.category_id=c.category_id
JOIN film f 
ON f.film_id=fc.film_id
JOIN inventory i
ON f.film_id=i.film_id
JOIN rental r 
ON i.inventory_id=r.inventory_id
JOIN payment p
ON p.rental_id=r.rental_id

