SELECT w1.id
FROM Weather w1
JOIN Weather w2 ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature;

-- # Write your MySQL query statement below
-- with cte as (
--     select w1.*,w2.recordDate as prev_date, (Case when w2.temperature is null then 0 else w2.temperature end) as prev_temp from weather w1
--     left join weather w2
--     on w1.recordDate = date_add(w2.recordDate,interval 1 day)
--     where w1.recordDate != (select MIN(recordDate) from weather)
--     order by recordDate
-- )

-- select id from cte
-- where temperature > prev_temp and prev_date is not null