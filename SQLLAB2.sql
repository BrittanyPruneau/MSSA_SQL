USE Northwind;
 
 -- What are the regions ?

 SELECT RegionDescription 
 From dbo.Region 

 -- What are the cities ?

 SELECT DISTINCT City 
 From dbo.Customers 
 -- or 

 SELECT DISTINCT City 
 FROM Employees

 -- or 
 SELECT City
 FROM Employees 
 GROUP BY City 

 -- What are the cities in the southern region?
SELECT TerritoryDescription FROM Territories 
WHERE RegionID =4
ORDER BY TerritoryDescription ASC;

--  How do you run this query with the fully qualified column name? 

-- what is contact name, telephone number, and city
-- for each customer? 

SELECT contactname, phone, city FROM customers	
	ORDER BY ContactNAME ASC; 


-- What products are out of stock?
SELECT productname, unitsinstock 
FROM dbo.Products
where unitsinstock = 0 

-- what are the ten products on 
-- hand with the least amount on hand? 
SELECT top 10 ProductName, unitsinstock  
FROM Products
WHERE UnitsInStock > 0 
ORDER BY UnitsInStock asc; 

-- What are five most expensive products in stock? 
SELECT TOP 5 productname, unitprice
FROM products
  order by unitprice DESC;

-- How many products does Northwind have? 
-- How many customers
-- How many suppliers? 

SELECT count(distinct productID) AS productcount from products; 

SELECT COUNT(distinct supplierID) AS Suppliers from products;

SELECT COUNT(DISTINCT Companyname) AS SupplierCount FROM Suppliers;



