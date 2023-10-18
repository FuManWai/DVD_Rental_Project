SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (SELECT customer_id FROM payment WHERE amount > 10);