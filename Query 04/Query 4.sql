SELECT film.film_id, film.title, rental.rental_id
FROM film
Full JOIN inventory
ON inventory.film_id = film.film_id
LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id
WHERE rental.rental_id IS NULL;