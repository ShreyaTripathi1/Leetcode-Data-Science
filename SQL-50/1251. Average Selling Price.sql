-- Calculate the average selling price for each product
SELECT 
    u.product_id, 
    ROUND(SUM(p.price * u.units) / SUM(u.units), 2) AS average_price
FROM 
    UnitsSold u
JOIN 
    Prices p
ON 
    u.product_id = p.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY 
    u.product_id

UNION

-- Include products with no sales, setting their average price to 0
SELECT 
    p.product_id, 
    0 AS average_price
FROM 
    Prices p
WHERE 
    p.product_id NOT IN (SELECT DISTINCT product_id FROM UnitsSold);