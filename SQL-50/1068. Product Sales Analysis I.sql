# Write your MySQL query statement below
SELECT product_name, year, price 
FROM Sales 
INNER JOIN Product ON Product.product_id = Sales.product_id;
-- or JOIN Product ON Sales.product_id = Product.product_id;