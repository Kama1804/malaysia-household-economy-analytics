CREATE DATABASE IF NOT EXISTS malaysia_economy_db;
USE malaysia_economy_db;

SELECT 'dim_states' AS table_name, COUNT(*) AS total_rows FROM dim_states
UNION ALL
SELECT 'fact_hies', COUNT(*) FROM fact_hies
UNION ALL
SELECT 'fact_income_history', COUNT(*) FROM fact_income_history
UNION ALL
SELECT 'fact_cpi_annual', COUNT(*) FROM fact_cpi_annual;

WITH StateAffordability AS (
    SELECT 
        s.region,
        h.state,
        h.year,
        h.income_median,
        h.income_mean,
        h.expenditure_mean,
        -- Calculate monthly leftover buffer in RM
        (h.income_median - h.expenditure_mean) AS net_disposable_rm,
        -- Calculate leftover buffer as a percentage of median income
        ROUND(((h.income_median - h.expenditure_mean) / h.income_median) * 100, 2) AS savings_rate_pct,
        h.gini,
        h.poverty
    FROM fact_hies h
    INNER JOIN dim_states s 
        ON h.state = s.state
)
SELECT 
    region,
    state,
    year,
    income_median,
    expenditure_mean,
    net_disposable_rm,
    savings_rate_pct,
    poverty,
    -- National rank by savings rate for each survey year
    DENSE_RANK() OVER (PARTITION BY year ORDER BY savings_rate_pct DESC) AS national_affordability_rank,
    -- Regional rank within Central, Northern, Southern, etc.
    DENSE_RANK() OVER (PARTITION BY year, region ORDER BY savings_rate_pct DESC) AS regional_rank
FROM StateAffordability
WHERE year = 2024
ORDER BY national_affordability_rank ASC;