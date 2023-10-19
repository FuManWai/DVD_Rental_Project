# Insight of DVD Rental Database

The DVD Rental Sample Database is a comprehensive dataset for learning and practicing in PostgreSQL. It models a fictional DVD rental store's operations, featuring film, actor, customer, rental, and payment data. With its diverse tables and relationships, it's a valuable resource for honing database management and analysis skills.

These queries provide a range of insights, from customer behavior to film categorization, inventory management, and revenue generation, making them valuable tools for data analysis within the DVD rental business.

<br>

**1. LENGTH and MAX**

```
SELECT title AS longest_title, LENGTH(title) AS title_length
FROM film
WHERE LENGTH(title) = (SELECT MAX(LENGTH(title)) FROM film);
```

This query is looking for the film title with the longest character length in the "film" table. It also returns the length of that title.

<br>

**2. DISTINCT and WHERE**

```
SELECT DISTINCT film.title AS action_film
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Action';
```

This query aims to retrieve a list of distinct film titles that belong to the "Action" category. It seeks to identify all unique action films in the database.

<br>

**3. LEFT JOIN and GROUP BY**

```
SELECT category.name AS film_category, COUNT(film_category.film_id) AS film_count
FROM category
LEFT JOIN film_category ON category.category_id = film_category.category_id
GROUP BY category.name;
```

This query is looking to count the number of films in each film category. It returns the category name along with the count of films in that category.

<br>

**4. LEFT JOIN and IS NULL**

```
SELECT film.film_id, film.title, rental.rental_id
FROM film
Full JOIN inventory
ON inventory.film_id = film.film_id
LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id
WHERE rental.rental_id IS NULL;
```

This query is searching for films that have not been rented yet. It seeks to identify films in the "film" table that do not have corresponding rental records.

<br>

**5. SUBQUERY and IN**

```
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (SELECT customer_id FROM payment WHERE amount > 10);
```

This query is looking for customers who have made payments exceeding $10. It returns the customer details for those high-paying customers.

<br>

**6. CASE Statement**

```
SELECT title, 
       rental_rate,
       CASE
           WHEN rental_rate >= 4 THEN 'High'
           WHEN rental_rate >= 2 THEN 'Medium'
           ELSE 'Low'
       END AS rental_rate_category
FROM film;
```

This query categorizes films based on their rental rates. It aims to classify films as "High," "Medium," or "Low" based on their rental rates.

<br>

**7. WINDOW FUNCTION**

```
SELECT customer_id, rental_count,
       RANK() OVER (ORDER BY rental_count DESC) AS customer_rank
FROM (SELECT customer_id, COUNT(*) AS rental_count FROM rental GROUP BY customer_id) AS rental_counts;
```

This query is attempting to rank customers by the number of rentals they have made. It calculates the rental count for each customer and assigns a rank based on that count.

<br>

**8. ORDER BY and LIMIT**

```
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id = (
    SELECT customer_id
    FROM rental
    GROUP BY customer_id
    ORDER BY COUNT(*) DESC
    LIMIT 1);
```

This query is searching for the most active customer in terms of the number of rentals they've made. It identifies the customer with the highest rental count.

<br>

**9. AVG() and GROUP BY**

```
SELECT c.name, AVG(f.rental_duration) AS avg_rental_duration
FROM film_category fc
JOIN category c
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
GROUP by c.name
ORDER by avg_rental_duration;
```

This query calculates the average rental duration for films in each category. It aims to provide insights into how long films in different categories are typically rented.

<br>

**10. INNER JOIN and ORDER BY**

```
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
```

This query is looking for the top revenue-generating films in the "Action" category. It identifies and ranks the action films based on the revenue generated from rentals and payments.
