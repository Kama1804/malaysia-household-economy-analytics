-- 1. Add the 'year' column to fact_income_history
ALTER TABLE fact_income_history ADD COLUMN year INT;

-- 2. Populate 'year' from the 'date' column and remove pre-2010 rows
SET SQL_SAFE_UPDATES = 0;
UPDATE fact_income_history SET year = YEAR(STR_TO_DATE(date, '%Y-%m-%d'));
DELETE FROM fact_income_history WHERE year < 2010;
SET SQL_SAFE_UPDATES = 1;

DROP TABLE IF EXISTS fact_income_history;
DROP TABLE IF EXISTS fact_cpi_annual;


USE malaysia_economy_db;

-- 1. Turn off safe updates so we can populate the 'year' column
SET SQL_SAFE_UPDATES = 0;

-- 2. Fill the 'year' column using the first 4 digits of the 'date' column ('2012-01-01' -> 2012)
UPDATE fact_income_history 
SET year = CAST(LEFT(date, 4) AS UNSIGNED);

-- 3. Turn safe updates back on
SET SQL_SAFE_UPDATES = 1;

-- 4. Verify that 'year' is now populated with 2012, 2014, 2016, etc.
SELECT * FROM fact_income_history LIMIT 5;