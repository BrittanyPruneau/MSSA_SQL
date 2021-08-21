USE master;

DROP DATABASE IF EXISTS PlantSale;

CREATE DATABASE PlantSale;

USE PlantSale;

--	C r e a t e  P l a n t  S a l e  T a b l e  

CREATE TABLE PlantSale
(
	id					INT		NOT NULL IDENTITY(1,1) PRIMARY KEY,
	monthNo				INT		NOT NULL,
		CHECK (monthNo >=1 AND monthNo <= 12), 
	PlantName			VARCHAR(20)	NOT NULL,
	MonthPurchased		VARCHAR(20)	NOT NULL, 
	Price				DECIMAL(4,2)		NOT NULL, 
	QuantityOfVeg		INT		NULL,
);

-- A D D   D A T A   T O   T A B L E

INSERT
	INTO PlantSale
	(monthNo, PlantName, MonthPurchased, Price, QuantityofVeg)
	VALUES	
	(1, 'Tomato', 'January', 12.30, 4),
	(2, 'Zucchini', 'February', 15.50, 4),
	(4, 'Kale', 'April', 5.67, 3), 
	(2, 'Broccoli', 'February', 3.55, 1),
	(5, 'Kale', 'May', 5.50, 3);

	SELECT * 
	FROM PlantSale 


	-- The following is one example of SELECT and Sum() AS 
	-- In order to use the function aggregate AS, we have to use GROUP 
	-- We GROUP BY PlantName and then Sum the price value associated with the row in Plant Name 
	-- Notice Kale is listed twice, and the sum of Kale bought is added together to equal 11.17
	-- SELECT PlantName, Sum(Price) AS TotalPrice  
	-- FROM PlantSale 
	-- GROUP BY PlantName 
	-- ORDER BY TotalPrice

	-- The following is an example using DISTINCT to restrict monthNo so that it has no repeating values.
	-- Then we SELECT THE rows in monthNo where only values greater than 1 exist.
	-- Then we order the column by monthNo, even though they were already in order. 
	--
	-- SELECT DISTINCT monthNo
	-- FROM PlantSale 
	-- WHERE monthNo > 1 
	-- ORDER BY monthNo 