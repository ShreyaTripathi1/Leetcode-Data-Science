SELECT person_name 
FROM (SELECT person_name,turn,
    sum(weight) over (order by turn) AS cum 
    FROM queue) temp_table 
WHERE cum<=1000 order by turn DESC limit 1;
