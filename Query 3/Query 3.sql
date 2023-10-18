SELECT category.name AS film_category, COUNT(film_category.film_id) AS film_count
FROM category
LEFT JOIN film_category ON category.category_id = film_category.category_id
GROUP BY category.name;