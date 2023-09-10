--The top 10 customers' information who paid the most
--step1: find out the customers who paid the most
SELECT SUM(p.amount) as total_payment, 
CONCAT (c.first_name, ' ', c.last_name) AS customer_name,
c.email
FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY c.email,CONCAT (c.first_name, ' ', c.last_name) 
ORDER BY SUM(p.amount) DESC
LIMIT 10
--find their whole information
SELECT SUM(p.amount) as total_payment, 
CONCAT (c.first_name, ' ', c.last_name) AS customer_name,
c.email,
ad.phone,
ad.address,
ad.postal_code,
ci.city,
co.country
FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
JOIN address ad
ON c.address_id=ad.address_id
JOIN city ci
ON ad.city_id=ci.city_id
JOIN country co
ON ci.country_id = co.country_id
GROUP BY c.email,
CONCAT (c.first_name, ' ', c.last_name),
ad.phone,
ad.address,
ad.postal_code,
ci.city,
co.country 
ORDER BY SUM(p.amount) DESC
LIMIT 10