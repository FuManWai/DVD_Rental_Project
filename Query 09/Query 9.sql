SELECT c.name, AVG(f.rental_duration) AS avg_rental_duration
FROM film_category fc
JOIN category c
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
GROUP by c.name
ORDER by avg_rental_duration;