CREATE OR REPLACE VIEW vw_state_affordability_summary AS
SELECT 
    s.region,
    h.state,
    h.year,
    h.income_mean,
    h.income_median,
    h.expenditure_mean,
    (h.income_median - h.expenditure_mean) AS net_disposable_rm,
    ROUND(((h.income_median - h.expenditure_mean) / h.income_median) * 100, 2) AS savings_rate_pct,
    h.gini,
    h.poverty,
    c.cpi_index AS overall_cpi,
    f.cpi_index AS food_cpi
FROM fact_hies h
INNER JOIN dim_states s 
    ON h.state = s.state
INNER JOIN fact_cpi_annual c 
    ON h.state = c.state AND h.year = c.year AND c.division = 'overall'
INNER JOIN fact_cpi_annual f 
    ON h.state = f.state AND h.year = f.year AND f.division = '01';

-- Preview the final view (32 rows: 16 states x 2 survey years 2022 & 2024)
SELECT * FROM vw_state_affordability_summary ORDER BY year DESC, net_disposable_rm DESC;