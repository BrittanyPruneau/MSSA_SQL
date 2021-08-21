USE TSQLV4;DROP TABLE IF EXISTS dbo.Customers;CREATE TABLE dbo.Customers(  custid      INT         NOT NULL PRIMARY KEY,  companyname NVARCHAR(40) NOT NULL,  country     NVARCHAR(15) NOT NULL,  region      NVARCHAR(15) NULL,  city        NVARCHAR(15) NOT NULL,);
-- 1-1 
INSERT INTO dbo.Customers(custid, companyname, country, region, city)
	VALUES(100, 'Coho Whinery', 'USA', 'WA', 'Redmond'); 
SELECT * FROM dbo.Customers; 
-- 1-2 
INSERT INTO dbo.Customers(custid, companyname, country, region, city)   SELECT DISTINCT C.custid, C.companyname, C.country, C.region, C.city      FROM Sales.Customers AS C         INNER JOIN Sales.Orders AS O	        ON O.custid = C.custid;

-- 1-3 