USE TSQLV4
SELECT * FROM HR.Employees   -- 9 employee rows
SELECT * FROM Production.Categories; -- 8 categories
SELECT * FROM Sales.Shippers;   - 3 shippers 

SELECT C.*, S.*
	FROM Production.Categories AS C   -- saving this table to C
	CROSS JOIN Sales.Shippers AS S; 

	-- YOU GET BOTH TABLES NEXT TO EACH OTHER 

-- Inner Join 
SELECT *
FROM Sales.Orders -- 830 rows 
WHERE orderid = 10248; -- one row 

SELECT *
   FROM Sales.Customers
   WHERE custid = 85; 

   SELECT *
   FROM HR.Employees
   WHERE empid = 5;

   SELECT *
   FROM Sales.Shippers
   WHERE shipperid = 3;

   
   SELECT O.*, C.* 
   FROM Sales.Orders AS O    -- here we named sales orders O so we can use it in SELECT statement above
      CROSS JOIN Sales.Customers AS C   -- named Sales.Customers C and used it above
   WHERE O.orderid = 10248; -- now we joined both tables next to each other 
   -- with ONLY the order id 10248 from table and the row associated with that row in 
   -- table O

   SELECT O.*, C.*
   FROM Sales.Orders AS O
      INNER JOIN Sales.Customers AS C
         ON O.custid = C.custid  -- both tables have custid in common.   and all columns are printed as along as they both have the same custid.
   WHERE O.orderid = 10248;  -- even if both tables have custid in common we are only printing ORDERIDs 10248.

SELECT O.*, C.*
   FROM Sales.Orders AS O
      INNER JOIN Sales.Customers AS C
         ON O.custid = C.custid
   WHERE O.orderid <= 10250;


SELECT O.*, E.*
   FROM Sales.Orders AS O
      CROSS JOIN HR.Employees AS E
   WHERE O.orderid = 10248;  -- prints both tables next to each other BUT only the rows with 10248 as orderid. 

   SELECT O.*, E.*
   FROM Sales.Orders AS O
      INNER JOIN HR.Employees AS E
         ON O.empid = E.empid  -- both tables have same empid's
   WHERE O.orderid = 10248;
   -- HR.Employees have only 9 empid
   -- Sales.Orders has 9 empid possible but multiples of them. 
   -- inner join on empid's creaes 830 rows.
   -- HR.Employees has lastname, first name, etc and so those columns are now on the 
   -- right of the table and matched by the same empid (both tables had empid column)
   -- THEN we added another constraint; orderid, which only has one row. 

   -- cross join puts both tables next to each other without losing any rows bc 
   --one of the tables doesnt have that in common. 
   -- inner join MUST have a column in common. IF one of the tables doesnt have the 
   -- same constraint in common, it will show up NULL.  

   -- ???????? 


   SELECT * FROM Sales.Orders -- 830 rows
   SELECT * FROM HR.Employees   -- 9 employee rows
SELECT * FROM Production.Categories; -- 8 categories
SELECT * FROM Sales.Shippers;   -- 3 shippers 

SELECT O.*, S.*, E.firstname, E.lastname
   FROM Sales.Orders AS O
      INNER JOIN Sales.Shippers AS S
         ON O.shipperid = S.shipperid
      INNER JOIN HR.Employees AS E
         ON O.empid = E.empid
   WHERE O.orderid <= 10250;

SELECT * FROM Sales.Orders ; 




   










