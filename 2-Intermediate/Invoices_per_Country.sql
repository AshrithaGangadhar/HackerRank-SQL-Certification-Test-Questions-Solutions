# This is an SQL Query to display the country name, total number of invoices and their average amount for each country -
# from the four tables in the database: country, city, customer and invoice.
# The average is formated as a floating-point number with 6 decimal places.
# Only those countries whose average invoice amount is greater than the average invoice amount over all invoices.

SELECT 
    co.country_name,
    COUNT(*) AS total_customers,
    ROUND(AVG(i.total_price), 6) AS avg_total_price
FROM 
    country AS co
    INNER JOIN city AS ci ON co.id = ci.country_id
    INNER JOIN customer AS cu ON ci.id = cu.city_id
    INNER JOIN invoice AS i ON cu.id = i.customer_id
GROUP BY 
    co.country_name
HAVING 
    AVG(i.total_price) > (SELECT AVG(total_price) FROM invoice);