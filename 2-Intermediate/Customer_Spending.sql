# This is an SQL Query to list all customers who spent 25% or less than the average amount spent on all invoices from the two tables in the database: customer and invoice
# Each customer's names are displayed as well as the amount spent to 6 decimal places
# The results are ordered by the amount spent from high to low

SELECT c.customer_name, CAST(SUM(i.total_price) AS DECIMAL(9,6)) AS total
FROM customer c
INNER JOIN invoice i 
ON c.id = i.customer_id
GROUP BY c.customer_name
HAVING SUM(i.total_price) <= 0.25 * (SELECT AVG(total_price) FROM invoice)
ORDER BY total DESC;