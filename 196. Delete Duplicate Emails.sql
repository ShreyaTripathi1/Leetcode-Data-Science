DELETE p FROM Person p
JOIN Person p2 
ON p.Email = p2.Email AND p.Id > p2.Id;

-- delete p1 from person p1,person p2 
-- where p1.email=p2.email and p1.id>p2.id;
