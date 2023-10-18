SELECT f.title, c.name, SUM(p.amount) AS revenue
FROM film_category fc
JOIN category c
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
JOIN inventory i
ON i.film_id = f.film_id
JOIN rental r 
ON r.inventory_id = i.inventory_id
JOIN payment p 
ON r.rental_id = p.rental_id
WHERE c.name IN ('Action')
GROUP BY 1, 2
ORDER BY revenue desc
Limit 10