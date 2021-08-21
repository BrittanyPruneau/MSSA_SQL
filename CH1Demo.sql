USE master;

DROP DATABASE IF EXISTS PlantSale;

CREATE DATABASE PlantSale;

USE PlantSale;

--	C r e a t e  V e h i c l e  T a b l e  

CREATE TABLE PlantSale
(
	id		INT		NOT NULL IDENTITY(1,1) PRIMARY KEY,
	month	INT		NOT NULL,
	CHECK (year >=2018 AND year <= 1 + YEAR(GETDATE()),
	make	VARCHAR(20)	NOT NULL,
	model	VARCHAR(20)	NOT NULL, 
	color	VARCHAR(20)	NULL, 
	vin		VARCHAR(20)	NULL
);
