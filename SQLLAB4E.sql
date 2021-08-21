USE NORTHWIND

-- 1 Createa  query that shows the product name and supplier
-- id for all products supplied by Exotic Liquids, Grandma Kellys HomeStead and Tokyo Traders. 
SELECT P.ProductName, P.SupplierId
	FROM dbo.Products AS P
	WHERE P.SupplierId IN (SELECT S.SupplierID
						FROM Suppliers AS S
						WHERE S.CompanyName = 'Exotic Liquids' 
						OR S.CompanyName LIKE 'Grandma Kelly%s Homestead'
						OR S.CompanyName = 'Tokyo Traders')


--2 Create a query that shows all products by name that are in 
-- the Seafood category.
-- this is uncorrelated. 
SELECT P.ProductName, P.CategoryId
		FROM Products AS P
		WHERE P.CategoryID = (SELECT C.CategoryID
						      FROM Categories AS C 
							  WHERE C.CategoryName = 'Seafood');

								

-- 3 Create a query that shows all companies by name that sell products in CategoryID 8.
SELECT CompanyName 
		FROM Suppliers AS S 
		WHERE S.SupplierID IN (SELECT DISTINCT SupplierID	
								FROM Products	
								WHERE CategoryID = 8);

--4 Create a query that shows all companies by name that sell products in the 
-- Seafood category.
SELECT CompanyName			
		FROM Suppliers	
		WHERE SupplierID IN (SELECT SupplierID	
								FROM Products AS P
								WHERE P.CategoryID IN (SELECT CategoryID		
														FROM Categories	
														WHERE CategoryName = 'Seafood') ); 
 

--5 Create a query that lists the ten most expensive products.

SELECT ProductName, UnitPrice
	FROM Products 
	WHERE UnitPrice IN (SELECT TOP 10 UnitPrice FROM Products ORDER BY UnitPrice DESC) 
	ORDER BY Unitprice DESC; 

--6 Create a query that shows the date of the last order by all employees.
SELECT DISTINCT O1.Orderid, O1.OrderDate, 01.EmployeeID
		FROM Orders AS O1
		WHERE O1.OrderId = (SELECT TOP 1 OrderId
							FROM Orders AS O2
							WHERE O1.EmployeeID = O2.EmployeeID
							ORDER BY OrderDate DESC)
