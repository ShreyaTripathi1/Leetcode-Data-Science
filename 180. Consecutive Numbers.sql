SELECT distinct Num as ConsecutiveNums
FROM Logs
WHERE (Id + 1, Num) in (select * from Logs) and (Id + 2, Num) in (select * from Logs)

-- -- or
-- select
--     distinct a.Num as ConsecutiveNums 
-- from
--     Logs a
-- join logs b on a.id=b.id+1 and a.num=b.num
-- join logs c on a.id=c.id+2 and a.num=c.num
