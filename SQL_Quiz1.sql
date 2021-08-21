USE TSQLV4
-- (20 Points) List all the Customers located in Germany.
--(20 Points) Count all the Customers with "Jr." in their name (contactname).
--(20 Points) What are the three highest priced Products that we sell?
--(20 Points) What is the total quantity of all products that were sold?
--(20 Points) What were the top 10 products by quantity that were sold?
--Extra Credit (5 Points) Give the counts of how many Orders each employee (empid) 
-- took - from most orders to least orders.

-- 1 List all the Customers located in Germany.
SELECT distinct contactname, country
FROM Sales.Customers
WHERE country = 'Germany'; 

-- 2 Count all the Customers with "Jr." in their name (contactname).
SELECT count(*) as 'number of jr'
FROM Sales.Customers
WHERE contactname like '%Jr.%'; 

--3 What are the three highest priced Products that we sell?
SELECT TOP 3 unitprice AS 'top three', productname 
FROM production.products
ORDER BY unitprice DESC;
 
--4 What is the total quantity of all products that were sold?
SELECT SUM(qty) as 'Total Products sold' 
FROM Sales.OrderDetails

--5 What were the top 10 products by quantity that were sold?
SELECT TOP 10 qty, productid
FROM Sales.OrderDetails
ORDER BY qty DESC; 
-- this works better
SELECT TOP 10 productid, count(qty) as 'numbof'
FROM sales.orderdetails
group by productid
order by numbof; 

-- extra credit   how many orders each employee took. from  most to least
SELECT empid, COUNT(empid) AS OrderTotalFROM Sales.OrdersGROUP BY empid
order by ordertotal desc; 


