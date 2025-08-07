Select name  From Salesperson left join 
(select sales_id from Orders join Company on Company.com_id = Orders.com_id where Company.name = "RED")
as t on Salesperson.sales_id = t.sales_id where t.sales_id is NULL;
-- OR
SELECT name FROM Salesperson 
WHERE sales_id NOT IN
(SELECT sales_id FROM Orders 
WHERE com_id=(SELECT com_id FROM Company WHERE name='RED')); 
