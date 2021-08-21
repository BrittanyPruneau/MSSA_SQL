USE TSQLV4; 
-- 2  corrected:
SELECT C.custid, C.companyname, O.orderid, O.orderdate
FROM Sales.Customers AS C
INNER JOIN Sales.Orders AS O 
	ON C.custid = O.custid; 

-- #3 
-- return US CUSTOMERS and for each customer 
-- return the total number of orders and total quantities
-- what is the one thing both tables need and have in common? custid

-- Below,  COUNT - total number of orders  SUM - add up all the values in qty for each  
SELECT c.custid, COUNT(DISTINCT o.orderid) AS numorders, SUM(od.qty) AS totalqty
FROM Sales.Customers AS c          -- when you INNER JOIN on <- on means this is what both tables will have exactly the same value 
INNER JOIN Sales.Orders AS o  -- first inner join is between orders and customers 
		on c.custid = o.custid   -- both of these tables have custid in common(we want US customers)
INNER JOIN Sales.OrderDetails AS od  -- second inner join is between orders and order details. 
			ON o.orderid = od.orderid  -- we can INNER JOIN TWICE BY using the o. or od. .. 
WHERE Country = 'USA'           -- WHERE is used to isolate that specific value in ALL ROWS of from all 3 tables (already joined). 
GROUP BY c.custid;  -- we are going to take one value(sometimes there will multiple) in the select statement we will count/sum
						-- etc a value that exists for all unique custid. 

-- 4 
-- return customers and their orders 
-- customers table orders table  

-- the following works, but if you use a LEFT OUTER JOIN both tables custid column will sync. 
SELECT distinct c.custid, c.companyname, s.orderid, s.orderdate
FROM Sales.Orders as s
	INNER JOIN Sales.Customers AS c
	ON s.custid = c.custid
-- both have 830 rows. This is the more efficient JOIN.
SELECT c.custid, c.companyname, s.orderid, s.orderdate
FROM Sales.Orders as s
	LEFT OUTER JOIN Sales.Customers AS c
	ON s.custid = c.custid

SELECT c.custid, c.companyname, s.orderid, s.orderdate 
FROM Sales.Customers as c
	LEFT OUTER JOIN Sales.Orders AS s
	ON s.custid = c.custid


-- 5 return customers who placed no orders. 
-- when you join tables, if there is none for one of the tables
-- the table will show NULL. 
-- so we can show only the rows that showed NULL. 

SELECT c.custid, c.companyname
FROM Sales.customers AS c
		LEFT OUTER JOIN Sales.Orders AS o 
		ON c.custid = o.custid 
WHERE o.custid IS NULL; 

-- 6 customers with orders placed on Feb 12 2016 and their orders
SELECT c.custid, c.companyname, o.orderid, o.orderdate
FROM Sales.Customers AS c 
		INNER JOIN Sales.Orders AS o 
		ON c.custid = o.custid
			AND o.orderdate = '2016-02-12';
-- this also works :  
SELECT c.custid, c.companyname, o.orderid, o.orderdate
FROM Sales.Customers AS c 
		INNER JOIN Sales.Orders AS o 
		ON c.custid = o.custid
WHERE o.orderdate = '2016-02-12'

-- 7    Return ALL customers in the output, matches them with their orders
-- that were placed on FEB 12 2016 
-- i had to use left outer join below because I want to see the orderdates and 
-- orderid's that are NULL. If i used an inner join we would lose those rows 
-- which there were no orders and therefore lose customers from the table. 
SELECT c.custid, c.companyname, o.orderid, o.orderdate
FROM Sales.Customers AS c
		LEFT OUTER JOIN Sales.Orders AS o
			ON c.custid = o.custid
			AND o.orderdate = '2016-02-12';
-- 8  
-- why is this incorrect: 
SELECT C.custid, C.companyname, O.orderid, O.orderdate
FROM Sales.Customers AS C 
	LEFT OUTER JOIN Sales.Orders AS O 
		ON O.custid = C.custid
		WHERE O.orderdate = '20160212'
		OR O.orderdate IS NULL; 
-- The query above does not print all custid because 
-- some custid are neither NULL nor order date of 20160212. 
-- so we lose those customers from the table and the data that correlates. 

-- 9 return ALL customers and for each return a yes/no if the customer
-- placed orers on feb 12 2016 
-- 

SELECT c.custid, c.companyname, CASE WHEN O.orderdate = '2016-02-12' THEN 'Yes' ELSE 'No' END AS DoesNotHaveOrder
FROM Sales.Customers AS c 
	LEFT OUTER JOIN Sales.Orders AS O
		ON c.custid = O.custid
		AND O.orderdate = '2016-02-12'
	ORDER BY c.custid; 
-- remember this, another example of CASE WHEN is 
--SELECT OrderID, Quantity,
--CASE
--    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
--    WHEN Quantity = 30 THEN 'The quantity is 30'
--    ELSE 'The quantity is under 30'
--END AS QuantityText
--FROM OrderDetails;


