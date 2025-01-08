# This is an SQL Query to retrieve a list of all customer ids, names and phone numbers, with their country codes concatenated with their phone numbers
# from the two tables in the database: customers and country_codes

# The first table contains details of every customer: customer_id, name, phone_number, country
# The second table contains the country code for every country
 
SELECT a.customer_id, a.name, CONCAT("+", b.country_code, a.phone_number)
FROM customers as a
LEFT join country_codes as b 
ON a.country = b.country
ORDER BY a.customer_id;