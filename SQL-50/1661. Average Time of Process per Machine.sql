SELECT 
    machine_id, 
    ROUND(AVG(end_time - start_time), 3) AS processing_time
FROM (
    SELECT 
        a.machine_id,
        a.process_id,
        MAX(CASE WHEN a.activity_type = 'start' THEN a.timestamp END) AS start_time,
        MAX(CASE WHEN a.activity_type = 'end' THEN a.timestamp END) AS end_time
    FROM 
        Activity a
    GROUP BY 
        a.machine_id, a.process_id
) AS process_times
GROUP BY 
    machine_id;