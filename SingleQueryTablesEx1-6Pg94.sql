USE TSQLV4

--SELECT * 
-- EXERCISE 1 
--FROM SALES.ORDERS  -- ORDERS PLACED IN JUNE 2015 
--WHERE month(orderdate) = 06  
--order by orderdate; 

-- EXERCISE 2  -- ORDERS PLACED ON THE LAST DAY OF THE MONTH 
--SELECT *
--FROM SALES.ORDERS 
--WHERE day(orderdate) = 30;  

-- EXERCISE 3  -- HR.employees returns employees with last name containing the letter e twice or more. 
--SELECT * 
--FROM HR.Employees
--WHERE lastname like N'%e%e%';

-- EXERCISE 4 -- Sales.OrderDetails returns total value(quantity*unitprice)> 10,000 sort by total value
--SELECT (qty*unitprice) as 'total value'  
--FROM Sales.OrderDetails 
--ORDER BY 'total value' desc;  

-- EXERCISE 5 -- HR.Employees , returns last name starts with a-z.
--SELECT lastname, count(lastname) as 'The number of people with this particular last name:' 
--FROM HR.Employees
--GROUP BY lastname
--ORDER BY lastname asc; 

-- EXERCISE 6 -- 
--SELECT empid, COUNT(*) as NUMORDERS  
--FROM Sales.Orders
--WHERE  orderdate < '20160501'
--GROUP BY empid; 
-- Since we are grouping by empid, we will see only one empid 6, one empid 5 etc. 
-- and COUNT will give us the total number of rows with the orderdate < 20160501  that is associated 
-- with each distinct empid. 
--SELECT empid, COUNT(*) as NUMORDERS  
--FROM Sales.Orders
--GROUP BY empid
--having max(orderdate) < '20160501'; 
-- Since we are grouping by empid, we will see only one empid 6, one empid 5 etc; 
-- we will see the total number of orders associated with empid 6, where the their max order date is less than 20160501. 
-- The difference between this one and the first one is, 1st one we were counting empid with order dates below a certain date. 
-- This table, we are counting the number of times the empid had a max orderdate < 2016 05 01. 


 




