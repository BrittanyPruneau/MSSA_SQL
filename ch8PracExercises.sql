USE TSQLV4

DROP TABLE IF EXISTS dbo.Customers

CREATE TABLE dbo.Customers
(
	custid		INT	NOT NULL PRIMARY KEY, 
	companyname NVARCHAR(40)	NOT NULL,
	country		NVARCHAR(15)	NOT NULL,
	region		NVARCHAR(15)	null, 
	city		NVARCHAR(15)	NOT NULL
	);
-- EXERCISE 1 PG 287 
INSERT INTO dbo.Customers (custid, companyname, country, region, city)
VALUES (100, 'Coho Winery', 'USA', 'WA', 'Redmond'); 

--notes to study:
-- insert into the dbo.Customers table all customers from Sales.Customers who placed orders. 
-- insert into using the same tables as the ones you will select
-- from which table will these columns being inserted come from?
-- where filters which of the rows in those columns 
-- rememeber IN correlates two tables, here we are taking Sales.Orders custid
-- and w
INSERT INTO dbo.Customers (custid, companyname, country, region, city) 
SELECT custid, companyname, country, region, city
FROM Sales.Customers
WHERE custid IN(SELECT custid FROM Sales.Orders); 


-- EX 1-3 
--notes:
-- use SELECT INTO to create and populate the dbo.Orders table with orders from
-- the Sales.Orders table that were placed in the years 2014 through 2016
DROP TABLE IF EXISTS dbo.OrderDetails, dbo.Orders;
SELECT * 
INTO dbo.Orders FROM Sales.Orders 
WHERE YEAR(orderdate) BETWEEN 2014 AND 2016;

-- EX 2
-- notes:
-- Delete from the dbo.Orders table orders that were 
-- placed before August 2014. 
-- Use the OUTPUT clause to return the orderid and orderdate 
-- values of the deleted orders: 
DELETE 
FROM dbo.Orders
OUTPUT DELETED.orderid, DELETED.orderdate
WHERE orderdate < '20140801'; 

-- EX 3
-- Delete from the dbo.Orders table orders place dby customers from Brazil. 
DELETE O 
FROM dbo.Orders AS O
INNER JOIN Sales.Customers AS C 
		ON O.custid = C.custid
		AND C.country = 'Brazil'; 

-- EX 4 
-- Change all the NULL to <None> 
UPDATE dbo.Customers 
SET region = '<None>'
OUTPUT 
	deleted.region AS OldRegion,
	inserted.region AS NewRegion,
	inserted.custid
WHERE region IS NULL; 

-- EX 5 
-- Update all orders in dbo.Ordesr table that were placed by 
-- UK customers, and set their shipcountry, shipregion and shipcity 
-- values to the country, region, and city values of the corresponding customes. 
UPDATE dbo.Orders
SET shipcountry = C.country, 
		shipregion = C.region,
		shipcity = C.city 
		FROM dbo.Orders AS O
		INNER JOIN dbo.Customers AS C 
			ON O.custid = C.custid
			AND shipcountry = 'UK'; 

-- EX 6 
--{ this portion is in the book }
-- next
GO
INSERT INTO dbo.Orders SELECT * FROM Sales.Orders;
INSERT INTO dbo.OrderDetails SELECT * FROM Sales.OrderDetails; 
SELECT * FROM dbo.Customers; 
TRUNCATE TABLE dbo.OrderDetails;
DELETE FROM dbo.OrderDetails;
GO 
TRUNCATE TABLE dbo.Orders;

SELECT * FROM dbo.OrderDetails; 
