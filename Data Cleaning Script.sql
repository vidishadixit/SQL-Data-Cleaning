CREATE DATABASE database_name;

USE database_name;


-- Data Cleaning Scripts - Nulls and Normalizing 

-- Step 0: See column name and types

EXEC sp_help table_name;


-- Step 0: See sample data

SELECT TOP 5* FROM table_name;


-- Step 1: Explore the data

SELECT
	MAX(price) AS MaximumPrice,
	MIN(price) AS MinimunPrice,
	AVG(price) AS AveragePrice,
	STDEV(price) AS StandarddDeviationPrice
FROM
	Table_Name;


SELECT
	price,
	COUNT(*) AS Distributions
FROM
	Table_Name
GROUP BY
	price
ORDER BY
	COUNT(*);



-- Step 2: Standardize data formats: I feel there is no need

LOWER(column_name)
UPPER(column_name)

TO_Date(column_name, 'yyyy-MM-dd')

TRIM(column_name)

--Step 3: Remove dupliates

SELECT
	customer_id,
	COUNT(*)
FROM
	Customers
GROUP BY
	customer_id
HAVING
	COUNT(*)>1;

SELECT DISTINCT * FROM Table_name;

-- Step 4: Nulls

SELECT
	*
FROM
	Customers
WHERE customer_id is null;

SELECT
	COALESCE(column, 0) AS column_filled
FROM
	Table_name;


SELECT
	COALESCE(column, avg(column) OVER()) AS column_filled
FROM
	Table_name;

-- Step 5: Standardize string variables

SELECT
	CASE
		WHEN country IN ('IN', 'In', 'INDIA', 'India')
		THEN 'India'
		ELSE Country
		END AS Country_Cleaned
FROM
	Customers;

-- Step 6: Filter out bad data

SELECT * FROM Table WHERE sales<=0;

-- Step 7: Rename columns

SELECT
	Column1 as Clear_Column1
FROM
	Table;

-- Step 8: Save Clean Data

CREATE TABLE Cleaned_Table AS
SELECT...

CREATE VIEW Cleaned_Table AS
SELECT...
