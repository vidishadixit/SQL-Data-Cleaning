-- Step 0: Understand the data structure

-- describe dirty_cafe_sales in mysql

-- For a quick check
EXEC sp_help dirty_cafe_sales;

-- standard SQL
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE, 
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dirty_cafe_sales';

--Very detailed SQL Server–specific info
SELECT 
    c.name AS ColumnName,
    t.name AS DataType,
    c.max_length,
    c.is_nullable,
    c.is_identity
FROM sys.columns c
JOIN sys.types t ON c.user_type_id = t.user_type_id
WHERE c.object_id = OBJECT_ID('dirty_cafe_sales');

--Data Sample

SELECT TOP 10 * from dirty_cafe_sales

-- Step 1: Explore Data
--distributions for numeric columns
SELECT 
    MIN(Quantity) AS MinQuantity,
    MAX(Quantity) AS MaxQuantity,
    AVG(Quantity) AS AvgQuantity,
	STDEV(Quantity) AS STDDEVQuantity,

	MIN(Price_per_unit) AS MinPrice,
    MAX(Price_per_unit) AS MaxPrice,
    AVG(Price_per_unit) AS AvgPrice,
	STDEV(Price_per_unit) AS STDDEVPrice,

	MIN(Total_spent) AS MinSpent,
    MAX(Total_spent) AS MaxSpent,
    AVG(Total_spent) AS AvgSpent,
	STDEV(Total_spent) AS STDDEVSpent
FROM dirty_cafe_sales;

-- Count total rows
SELECT COUNT(*) AS TotalRows FROM dirty_cafe_sales;

-- Find distinct categories
SELECT DISTINCT Item FROM dirty_cafe_sales;
