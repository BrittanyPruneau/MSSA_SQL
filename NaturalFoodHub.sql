
USE master;

DROP DATABASE IF EXISTS NaturalFoodHub;

CREATE DATABASE NaturalFoodHub;

--USE NaturalFoodHub; 



CREATE TABLE Farmers
(
Farmerid			INT				not null PRIMARY KEY, 
Name				NVARCHAR(40)	NOT NULL, 
Address				NVARCHAR(40)	NOT NULL,
City				NVARCHAR(40)	NOT NULL,
PhoneNumber			NVARCHAR(40)	NOT NULL, 
); 

INSERT INTO Farmers (Farmerid, Name, Address, City, PhoneNumber) 
	VALUES(1, 'North Green Team Farm', '622 W 100 S', 'Salt Lake City', '1-800-359-2658');
INSERT INTO Farmers (Farmerid, Name, Address, City, PhoneNumber) 
	VALUES(2, 'Bell Organic Gardens', '975 Canyon Breeze Ln', 'Draper', 801-571-7288);
INSERT INTO Farmers (Farmerid, Name, Address, City, PhoneNumber) 
	VALUES(3, 'Petersen Family Farms', '11800 S 4000 W', 'Riverton', '801-571-7288');
INSERT INTO Farmers (Farmerid, Name, Address, City, PhoneNumber)
	VALUES(4, 'Zoe''s Natural Garden', '1700 N Fort Ln', 'Layton', '801-721-8238');
INSERT INTO Farmers (Farmerid, Name, Address, City, PhoneNumber)
	VALUES(5, 'Backyard Urban Garden Farms', '1998 S Windsor St', 'Salt Lake City', '801-694-6067');


	SELECT * 
	FROM Farmers;

	CREATE TABLE Members
(
MemberID					INT				not null PRIMARY KEY, 
Name						NVARCHAR(40)	NOT NULL, 
PhoneNumber					NVARCHAR(40)	NOT NULL, 
MembershipType				NVARCHAR(40)	NOT NULL,
StartDate					NVARCHAR(40)	NOT NULL,
MembershipLengthInMonths	INT				NOT NULL,
DateMembershipEnds			NVARCHAR(40)	NOT NULL,
); 

INSERT INTO Members (Memberid, Name, PhoneNumber, MembershipType, StartDate, MembershipLengthInMonths, DateMembershipEnds)
	VALUES (1, 'Joe Shmoe', '248-567-7593', 'Gold', '01-03-2017', 12, '01-03-2018') 
INSERT INTO Members (Memberid, Name, PhoneNumber, MembershipType, StartDate, MembershipLengthInMonths, DateMembershipEnds)
	VALUES (2, 'Sally Miller', '248-678-7593', 'Gold', '06-03-2017', 12, '06-03-2018') 
INSERT INTO Members (Memberid, Name, PhoneNumber, MembershipType, StartDate, MembershipLengthInMonths, DateMembershipEnds)
	VALUES (3, 'Joe Miller', '801-567-7593', 'Gold', '01-27-2017', 6, '01-27-2018') 
INSERT INTO Members (Memberid, Name, PhoneNumber, MembershipType, StartDate, MembershipLengthInMonths, DateMembershipEnds)
	VALUES (4, 'Fred Jackobson', '807-567-7593', 'Silver', '06-03-2017', 12, '06-03-2018')
INSERT INTO Members (Memberid, Name, PhoneNumber, MembershipType, StartDate, MembershipLengthInMonths, DateMembershipEnds)
	VALUES (5, 'Rachel Moore', '801-978-7593', 'Platinum', '09-27-2017', 6, '09-27-2018') 

SELECT * 
FROM Members; 

	CREATE TABLE Producers
(
ProducerID					INT				not null PRIMARY KEY, 
Name						NVARCHAR(40)	NOT NULL, 
Address						NVARCHAR(40)	NOT NULL,
City						NVARCHAR(40)	NOT NULL,
PhoneNumber					NVARCHAR(40)	NOT NULL, 
); 


INSERT INTO Producers (ProducerID, Name, Address, PhoneNumber) 
	VALUES (1, 'Whole Foods Market', 'South 700 East', 'Salt Lake City', '801-924-9060')
INSERT INTO Farmers (Farmerid, Name, Address, City, PhoneNumber) 
	VALUES(2, 'Whole Foods Market', 'Wilmington Avenue', 'Salt Lake City', '801-359-7913')
INSERT INTO Farmers (Farmerid, Name, Address, City, PhoneNumber) 
	VALUES(3, 'Trader Joe''s', '634 E 400 S', 'Salt Lake City', '1-801-359-2462')



	CREATE TABLE UtahProduce
(
ProduceID					INT				not null PRIMARY KEY, 
Name						NVARCHAR(40)	NOT NULL, 
Price						NVARCHAR(40)	NOT NULL,
MonthsGrown					NVARCHAR(40)	NOT NULL,
); 

INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(1, 'Artichoke', 3.45, 'March, April, May, June')  
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(2, 'Asparagus', 2.45, 'March, April, May, June')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(3, 'Broccoli', 2.45, 'March, April, May, June')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(4, 'Brussel''s Sprouts', 1.59, 'March, April, May, June')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(5, 'Cabbage', 2.45, 'March, April, May, June')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(6, 'Kohlrabi', 1.35, 'March, April, May, June')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(7, 'Onions', 1.25, 'March, April, May, June')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(8, 'Peas', .99, 'March, April, May, June')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(9, 'Radish', 2.45, 'March, April, May, June')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(10, 'Rhubarb', 2.45, 'March, April, May, June')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(11, 'Spinach', 1.79, 'March, April, May, June')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(12, 'Turnip', 1.50, 'March, April, May, June')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(13, 'Beets', .75, 'March, April, May, June, July')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(14, 'Carrots', .80, 'March, April, May, June, July')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(15, 'Cauliflower', 2.10, 'March, April, May, June, July')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(16, 'Endive', .90, 'March, April, May, June, July')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(17, 'Lettuce', 1.50, 'March, April, May, June, July')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(18, 'Parsley', .99, 'March, April, May, June, July')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(19, 'Parsnip', 1.25, 'March, April, May, June, July')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(20, 'Potato', .99, 'March, April, May, June, July')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(21, 'Swiss Chard', 1.99, 'March, April, May, June, July')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(22, 'Celery', 1.75, 'May, June, July, August')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(23, 'Cucumber', .79, 'May, June, July, August')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(24, 'Dry Bean', .67, 'May, June, July, August')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(25, 'Snap Bean', .67, 'May, June, July, August')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(26, 'Summer Squash', 1.50, 'May, June, July, August')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(27, 'Sweet Corn', .75, 'May, June, July, August')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)	
	VALUES(28, 'Cantaloupe', .99, 'June, July')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(29, 'Eggplant', 1.15, 'June, July')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(30, 'Lima Bean', .75, 'June, July')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(31, 'Hot Sweet Pepper', .50, 'June, July')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(32, 'Pumpkin', 4.00, 'June, July')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(33, 'Tomato', .75, 'June, July')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(34, 'Watermelon', .99, 'June, July')
INSERT INTO UtahProduce (ProduceID, Name, Price, MonthsGrown)
	VALUES(35, 'Winter Squash', .70, 'June, July')

	SELECT * 
	FROM UtahProduce 


		CREATE TABLE ToolsAndResources
(
ToolID						INT				not null PRIMARY KEY, 
NameOfTool					NVARCHAR(40)	NOT NULL, 
GiftedTo					NVARCHAR(40)	NOT NULL,
GiftedBy					NVARCHAR(40)	NOT NULL,
); 

INSERT INTO ToolsAndResources (ToolID, NameOfTool, GiftedTo, GiftedBy)
	VALUES(1, 'Rake', 'Bell Organic Garden', 'Tiny Melony')
	INSERT INTO ToolsAndResources (ToolID, NameOfTool, GiftedTo, GiftedBy)
	VALUES(2, 'Shovel', 'Zoe''s Natural Garden', 'Rachel Cook') 
INSERT INTO ToolsAndResources (ToolID, NameOfTool, GiftedTo, GiftedBy)
	VALUES(3, 'Sheers', 'Petersen Family Farms', 'Melody Toffe')
INSERT INTO ToolsAndResources (ToolID, NameOfTool, GiftedTo, GiftedBy)
	VALUES(4, 'Hoe', 'North Green Team Farm', 'Tim Pearson')
	
SELECT * 
FROM ToolsAndResources 
