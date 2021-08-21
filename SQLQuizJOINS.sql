-- BRITTANY PRUNEAU 

USE TSQLV4 

-- 1A. (No Join: 10 Points) List all the Categories in alphabetical order.
SELECT * 
FROM Production.Categories 
ORDER BY categoryname ASC; 


-- 1B. (Yes Join: 15 Points) List all the Categories in alphabetical order along with all of the 
-- products in each category.
SELECT * 
FROM Production.Categories AS C 
INNER JOIN Production.Products AS P
	ON C.categoryid = P.categoryid
	ORDER BY categoryname ASC; 

-- 2A. (No Join: 10 Points) List all the Products that contain both an 'A' and a 'Z' in their name 
-- (in either order - A...Z or Z...A).
SELECT * 
FROM Production.Products
WHERE productname like '%a%z%'; 

-- 2B. (Yes Join: 15 Points) List all the Products that contain both an 'A' and a 'Z' in their name 
-- as well as the company name(s) that supply us those products.

SELECT P.supplierid, P.productname, S.companyname
FROM Production.Products AS P 
INNER JOIN Production.Suppliers AS S 
ON P.supplierid = S.supplierid
WHERE productname like '%A%Z%'; 

-- 3A. (No Join: 10 Points) List all of the Suppliers (in order of id).
SELECT supplierid, companyname 
FROM Production.Suppliers
ORDER BY supplierid ASC; 

-- 3B. (Yes Join: 15 Points) List all of the Suppliers (in order of id) along with all of 
-- the products that they supply that are not discontinued.
-- not discontinued means discontinued = 0
SELECT S.supplierid, S.companyname, P.productname, P.discontinued 
FROM Production.Suppliers AS S
LEFT OUTER JOIN Production.Products AS P
ON S.supplierid = P.supplierid
WHERE discontinued = '0'
ORDER BY S.supplierid ASC; 

-- 4. (Yes Join: 25 Points) List all Orders that were placed by the "Owner" of the Customer Company.
-- Owner is in contactitle in sales.customers 
-- orders table and customers table have custid in common 
-- join orders table with suppliers table. 
SELECT O.orderid, O.custid, O.empid, S.contactname, S.contacttitle  
FROM Sales.Orders AS O
INNER JOIN Sales.Customers AS S 
ON O.custid = S.custid 
WHERE S.contacttitle = 'Owner';  







