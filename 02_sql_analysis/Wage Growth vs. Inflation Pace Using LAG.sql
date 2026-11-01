WITH IncomeAndCPI AS (
    SELECT 
        i.state,
        i.year,
        i.income_median,
        c.cpi_index,
        LAG(i.income_median, 1) OVER (PARTITION BY i.state ORDER BY i.year) AS prev_income_median,
        LAG(c.cpi_index, 1) OVER (PARTITION BY i.state ORDER BY i.year) AS prev_cpi_index
    FROM fact_income_history i
    INNER JOIN fact_cpi_annual c 
        ON i.state = c.state AND i.year = c.year
    WHERE c.division = 'overall'
)
SELECT 
    state,
    year,
    income_median,
    prev_income_median,
    ROUND(((income_median - prev_income_median) / prev_income_median) * 100, 2) AS wage_growth_pct,
    cpi_index,
    ROUND(((cpi_index - prev_cpi_index) / prev_cpi_index) * 100, 2) AS cpi_inflation_pct,
    ROUND(
        (((income_median - prev_income_median) / prev_income_median) * 100) - 
        (((cpi_index - prev_cpi_index) / prev_cpi_index) * 100), 
    2) AS real_purchasing_power_delta_pct
FROM IncomeAndCPI
WHERE prev_income_median IS NOT NULL
ORDER BY state, year;



