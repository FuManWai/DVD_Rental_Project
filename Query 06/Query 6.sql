SELECT title, 
       rental_rate,
       CASE
           WHEN rental_rate >= 4 THEN 'High'
           WHEN rental_rate >= 2 THEN 'Medium'
           ELSE 'Low'
       END AS rental_rate_category
FROM film;