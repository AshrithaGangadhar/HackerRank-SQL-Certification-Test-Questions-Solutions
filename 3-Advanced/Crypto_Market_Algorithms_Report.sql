# This is an SQL query to return a list of algorithms and their volumes for each quarter of the year 2020.
# The results are displayed in this order: algorith name, Q1, Q2, Q3, Q4 transactions.
# Results are sorted ascending by algorithm name.

WITH quarterly_volume AS (
  SELECT 
    algorithm, 
    SUM(volume) AS volume, 
    CEIL(MONTH(dt) / 3) AS quarters  
  FROM 
    coins c 
    JOIN transactions t ON t.coin_code = c.code 
  WHERE 
    YEAR (dt) = 2020 
  GROUP BY 
    algorithm, 
    CEIL(MONTH(dt) / 3)
) 
SELECT 
  c.algorithm, 
  qv1.volume AS transactions_Q1, 
  qv2.volume AS transactions_Q2, 
  qv3.volume AS transactions_Q3, 
  qv4.volume AS transactions_Q4 
FROM 
  coins c 
  LEFT JOIN quarterly_volume qv1 ON c.algorithm = qv1.algorithm 
  AND qv1.quarters = 1 
  LEFT JOIN quarterly_volume qv2 ON c.algorithm = qv2.algorithm 
  AND qv2.quarters = 2 
  LEFT JOIN quarterly_volume qv3 ON c.algorithm = qv3.algorithm 
  AND qv3.quarters = 3 
  LEFT JOIN quarterly_volume qv4 ON c.algorithm = qv4.algorithm 
  AND qv4.quarters = 4 
WHERE 
  c.code NOT LIKE 'DOGE' 
ORDER BY 
  algorithm