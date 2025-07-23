UPDATE Salary SET sex = CHAR(ASCII('f') ^ ASCII('m') ^ ASCII(sex));

-- or

Update Salary
SET sex =
    CASE        
        WHEN sex = 'm' THEN 'f'
        ELSE 'm'
    END

