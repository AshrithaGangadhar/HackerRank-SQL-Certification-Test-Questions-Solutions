# This is an SQL Query to find the employee IDs along with names of all its employees - 
# who work in the HR department who earned a bonus of 5000 dollars or more in the last quarter.
# from the two tables in the database: employee_information and last_quarter_bonus

# The first table contains details of the employees such as employee_ID, name and division
# The second table contains employee_ID and bonus

SELECT ei.employee_ID, ei.name
FROM employee_information ei
JOIN last_quarter_bonus b ON b.employee_ID = ei.employee_ID
WHERE ei.division LIKE 'HR' AND b.bonus >= 5000;