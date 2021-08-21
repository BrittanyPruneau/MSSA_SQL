-- 
-- ORDER NUMER AND DATE of each order sold by each employee
USE Northwind

-- What is the order number and the date of each order sold by each employee?
SELECT E.firstName, E.lastName, O.OrderDate, orderID
FROM Employees AS E 
INNER JOIN Orders AS O 
ON E.EmployeeID = O.EmployeeID 
ORDER BY E.EmployeeID; 

-- List each territory by region.

select T.TerritoryDescription, R.RegionDescription
FROM Territories AS T
INNER JOIN Region AS R
ON T.RegionID = R.RegionID
ORDER BY R.RegionDescription, T.TerritoryDescription; 




-- What is the supplier name for each product alphabetically by supplier?
-- we want to join SUPPLIERS and PRODUCTS by supplierID 
-- show company name and product name  
SELECT S.CompanyName, P.ProductName 
FROM Suppliers As S INNER JOIN Products AS P
ON P.SupplierID = S.SupplierID
ORDER BY CompanyName; 


-- For every order on May 5, 1998, how many of each item was ordered, and what was the price of the item?
-- where can I find orderdate and where can i find quantity ordered AND price of the item. 
-- order details has Unit Price and Quantity 
-- orders  has order date 
-- what do they have in common ? - OrderID
SELECT D.UnitPrice, D.Quantity, O.OrderDate, (D.UnitPrice*D.Quantity) AS Subtotal
FROM [Order Details] AS D
INNER JOIN Orders AS O 
ON D.OrderID = O.OrderID 
WHERE O.OrderDate = '1998-May-05'; 


-- For every order on May 5, 1998, how many of each item was ordered giving the name of the item, and what was the price of the item?
SELECT D.Quantity, D.UnitPrice, O.OrderDate, P.ProductName
FROM [Order Details] AS D 
INNER JOIN Orders AS O 
ON D. OrderID = O.OrderID
INNER JOIN Products AS P
ON P.ProductID = D.ProductID
WHERE O.OrderDate = '1998-May-05'; 

-- For every order in May, 1998, what was the customer’s 
-- name and the shipper’s name?
SELECT C.CompanyName, S.CompanyName, O.OrderDate
		FROM Orders AS O
		INNER JOIN Customers AS C
			ON C.CustomerID = O.CustomerID
			INNER JOIN Shippers AS S
				ON O. ShipVia = S.ShipperID
				WHERE MONTH(O.OrderDate) = 5
				AND YEAR(O.OrderDate) = 1998; 


-- What is the customer’s name and the employee’s name for every order shipped to France?
-- empoloyees table doesnt have employees in france. 
SELECT C.CompanyName, E.EmployeeID, E.LastName, E.FirstName, O.OrderID, O.ShipCountry
FROM Orders AS O
INNER JOIN Customers AS C
on C.CustomerID = O.CustomerID
INNER JOIN Employees AS E
ON O.EmployeeID = E.EmployeeID
where ShipCountry LIKE 'France'
ORDER BY E.EmployeeID; 

-- List the products by name that were shipped to Germany.
-- orders table and employees table 

SELECT P.ProductID, ProductName, O.ShipCountry
FROM Products AS P 
INNER JOIN [Order Details] AS OD
ON OD.ProductID = P.ProductID
INNER JOIN Orders AS O 
ON ShipCountry = 'Germany' 
ORDER BY P.ProductName; 