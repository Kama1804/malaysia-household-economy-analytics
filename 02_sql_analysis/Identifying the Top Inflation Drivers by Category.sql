WITH CategoryInflation AS (
    SELECT 
        state,
        year,
        division,
        category,
        cpi_index,
        ROW_NUMBER() OVER (PARTITION BY state ORDER BY cpi_index DESC) AS cost_driver_rank
    FROM fact_cpi_annual
    WHERE year = 2024 
      AND division != 'overall'
)
SELECT 
    state,
    cost_driver_rank,
    category,
    cpi_index
FROM CategoryInflation
WHERE cost_driver_rank <= 3
ORDER BY state, cost_driver_rank;