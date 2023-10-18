SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id = (
    SELECT customer_id
    FROM rental
    GROUP BY customer_id
    ORDER BY COUNT(*) DESC
    LIMIT 1);