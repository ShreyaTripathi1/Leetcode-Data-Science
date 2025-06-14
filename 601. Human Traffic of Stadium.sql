SELECT id, visit_date, people 
FROM
    (SELECT *, COUNT(*) OVER (PARTITION BY consecutive) AS count
    FROM
        (SELECT *, id - ROW_NUMBER() OVER (ORDER BY id) AS consecutive
        FROM Stadium
        WHERE people >= 100) t )t2
WHERE count >= 3
ORDER BY id

-- -- -----------OR----------- --

WITH cte AS (
  SELECT *, ROW_NUMBER() OVER (ORDER BY id) AS row_num, id-ROW_NUMBER() OVER (ORDER BY id) as diff
  FROM Stadium where people >=100)

select id,visit_date,people from cte where diff IN (select diff from cte group by diff having count(*) >= 3)

-- -- -----------OR----------- --

WITH CTE AS (
    SELECT *, id - ROW_NUMBER() OVER(ORDER BY visit_date) AS grp
    FROM Stadium
    WHERE people >= 100
)
SELECT id, visit_date, people
FROM CTE
WHERE grp IN (
    SELECT grp
    FROM CTE
    GROUP BY grp
    HAVING COUNT(grp) >= 3
)
ORDER BY visit_date;
