USE TSQLV4 

-- #5 
SELECT * 
FROM HR.Employees
WHERE lastname like '[a-z]'; 
-- returns no rows as it says 

-- #6 
--This query filters the rows where first, before counting. 
SELECT empid, COUNT(*) as numorders
FROM Sales.Orders
WHERE orderdate < '20160501'
GROUP BY empid; 
-- This query select specific columns first(groups by) then selects 
-- certain parameters HAVING after grouping. So it filters the rows last. 
SELECT empid, COUNT(*) AS numorders
FROM Sales.ORders
Group BY empid
HAVING MAX(orderdate) <'20160501';
