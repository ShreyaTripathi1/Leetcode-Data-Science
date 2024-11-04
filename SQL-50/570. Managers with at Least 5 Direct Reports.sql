SELECT 
    e.name
FROM 
    Employee e
JOIN 
    Employee e2 ON e.id = e2.managerId
GROUP BY 
    e.id, e.name
HAVING 
    COUNT(e2.id) >= 5;