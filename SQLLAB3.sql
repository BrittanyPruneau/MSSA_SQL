USE Northwind; 

-- 1. Who are our customers in North America?   -- 
-- SELECT country FROM customers: 

--SELECT contactname FROM Customers
--	WHERE country IN ('USA', 'Mexico','Canada');


-- 2. What orders were placed in April, 1989?
--SELECT * 
	--	FROM Orders  
		--WHERE OrderDate BETWEEN '1998-04-01' AND '1998-04-30';

-- 3 What sauces do we sell?
--SELECT * FROM Products
--WHERE ProductName like N'%Sauce%';

-- 4 You sell some kind of dried fruit that I liked very much. What is its name?
--SELECT ProductName FROM products
--WHERE productname LIKE N'%dried%'
--OR productname LIKE N'%fruit%'; 

-- 5 
--SELECT EmployeeId, COUNT(ShippedDate) 
--FROM Orders
--WHERE MONTH(ShippedDate) =12
--AND ShipCountry = 'Germany'
--GROUP BY EmployeeId; 

--or 
--SELECT DISTINCT EmployeeId
--FROM Orders
--WHERE MONTH(ShippedDate) = 12
--AND ShipCountry = 'Germany'; 


--6 We have an issue with product 19. 
-- I need to know the total amount and the net 
--amount of all orders for product 19 where the customer 
--took a discount.
-- need products . count   and net 
--SELECT * FROM Products COUNT
--WHERE ProductID = 19 
--group by productid 

--SELECT SUM(UnitPrice* Quantity)AS TotalAmount, 
--SUM((unitPrice-Discount) *Quantity) AS DiscountAmount
--FROM [Order Details] 

--7 I need a list of employees by title, first 
--name, and last name, with the employee’s 
--position under their names, and a line separating 
--each employee.

--select LastName, Title 
--FROM Employees
--ORDER BY Title; 

--8 I need a list of our customers and the first name 
--only of the customer representative.

--SELECT ContactName, LEFT(ContactName, CHARINDEX(' ', ContactName)) AS FirstName 
--FROM Customers;

-- 9 Give me a list of our customer contacts alphabetically by
-- last name. 
--SELECT ContactName
--FROM Customers
--ORDER BY RIGHT(ContactName, LEN(ContactName) -CHARINDEX(' ', ContactName));


--SELECT DATEDIFF(day, '1963-07-08', '2021-08-26')

-- or 
--SELECT DATEDIFF(DAY, '1963-07-09', GETDATE())



