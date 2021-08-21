-- Using the TSQLV4 database (and SQL Server Management Studio - SSMS), write queries to find the following:

--(20 Points) List all the Customers which have your initials (in order) in their name somewhere.
--(20 Points) How many Customers have your initials (in order) in their name somewhere (contactname)?
--(20 Points) List all the Orders that were shipped to Albuquerque.
--(20 Points) Give the counts of how many orders were shipped to each country - from most orders to least orders.
--(20 Points) <another query / question goes here>

USE TSQLV4

--SELECT contactname
--FROM Sales.Customers 
--WHERE contactname like '%ba%'
-- not likely any contact name has bp in that order together somewhere. 
-- i looked for b a instead of b p.. 

-- #2 i will count how many customers have my initials in order in their name somwhere. 

--USE TSQLV4  
--SELECT contactname, count(*) AS 'Quantity of People with My Initials In Their Name' 
--FROM Sales.Customers 
--WHERE contactname like '%ba%'
--group by contactname 

-- #3 List all orders shipped to  Albuquerque and for extra I want to count them. 

--SELECT COUNT(shipregion) AS 'Total sent to Albuquerque' 
--FROM Sales.Orders
--WHERE shipregion = 'NM'

-- try to use count to count the distinct number of orderids 
-- running into errors using group by 
-- group by works similar to distinct, it will group albuquerque  
-- into 1 row and associate everything else by that row. 
-- this is better: 
--SELECT shipcity, COUNT(shipcity) AS 'Quantity Going to Albuquerque' FROM Sales.Orders
--where shipcity = 'Albuquerque'
--group by shipcity;

-- next 
-- Give the counts of how many orders were shipped to each country - from most orders to least orders.
-- id like to print out 3-4 columns and a column that shows how many orders in each country. 
-- so I could select distinct shipcountry and then count a different something. 

-- In order to print a row and its corresponding count value, you need to use DISTINCT(column) 
--and GROUPBY(same column name). 
--SELECT DISTINCT shipcountry, COUNT(shipcountry) AS 'SHIPPEDhere'
--FROM Sales.Orders 
--GROUP BY shipcountry 
--ORDER BY SHIPPEDhere DESC;    


--SELECT custid, shipcountry, shipcity, COUNT(shipcountry) AS 'total'
--FROM Sales.Orders 
--GROUP BY custid; 



-- Here I was able to find how many countries each customer had their things sent to. 
--SELECT custid, COUNT(DISTINCT shipcountry)
--FROM Sales.Orders
--GROUP BY custid;

-- Here I was able to get the distinct custid id and the number of times they sent out to a country(same/dif). 
--SELECT DISTINCT custid, COUNT(shipcountry)
--FROM Sales.Orders
--group by custid;

SELECT shipcountry, shipcity, custid
FROM Sales.Orders
order by shipcountry

-- here i'm trying to see exactly how group by works. 
SELECT empid, orderdate, shipaddress, shipcountry, custid, COUNT(shipcity) as 'number of each city'  
FROM Sales.Orders
GROUP BY shipcity; 
-- the following doesnt work 
SELECT shipcountry, custid, count(custid) 
FROM Sales.Orders
GROUP BY shipcountry; 
-- this does work 
SELECT shipcountry, count(custid) 
FROM Sales.Orders
GROUP BY shipcountry; 
-- group by will have unique rows. I think that each of those unique rows must have only same values for the other cllumns

--works
SELECT shipcountry, count(distinct custid) 
FROM Sales.Orders
GROUP BY shipcountry;
--works
SELECT shipcountry, custid, count(custid) 
FROM Sales.Orders
GROUP BY shipcountry, custid;

-- works because ship country AND custid have one unique other row.  
SELECT shipcountry, custid, COUNT(custid)
FROM Sales.Orders
WHERE custid = 12 AND shipcountry = 'Argentina' 
group by shipcountry, custid

-- works took out shipping country but you dont know which country when you print it. 
SELECT custid, COUNT(custid)
FROM Sales.Orders
group by shipcountry, custid

-- this works too, BUT not enough info shown after you take out cust id too . 
-- we dont really see enough data if we do that. 
SELECT COUNT(custid)
FROM Sales.Orders
group by shipcountry, custid

-- things that are on top row must be in group by clause. 
-- but things that are in group by dont necessarily have to be 
-- on the SELECT row. 

-- this works 
-- snipped 
SELECT shipcountry, custid, COUNT(shipcity)
FROM Sales.Orders
GROUP BY shipcountry, custid; 


