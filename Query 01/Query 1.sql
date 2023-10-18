SELECT title AS longest_title, LENGTH(title) AS title_length
FROM film
WHERE LENGTH(title) = (SELECT MAX(LENGTH(title)) FROM film);