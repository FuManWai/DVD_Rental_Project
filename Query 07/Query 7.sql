SELECT customer_id, rental_count,
       RANK() OVER (ORDER BY rental_count DESC) AS customer_rank
FROM (SELECT customer_id, COUNT(*) AS rental_count FROM rental GROUP BY customer_id) AS rental_counts;