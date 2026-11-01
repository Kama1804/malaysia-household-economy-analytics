# Malaysia Household Economy & Affordability Analytics

A comprehensive end-to-end data analytics project analyzing Malaysian household income, expenditure, and Consumer Price Index (CPI) inflation dynamics across 16 states and federal territories.

---

## 📌 Project Overview
This project examines the economic well-being and purchasing power of Malaysian households by integrating datasets from the Department of Statistics Malaysia (DOSM / OpenDOSM). It tracks how inflation in essential goods (notably food & beverage) compares against median wage growth, evaluating net disposable buffers and regional affordability disparities.

### Key Highlights:
- **End-to-End Pipeline**: From raw data cleaning in Python to SQL warehousing, Excel financial simulation, and Power BI visualization.
- **Granular Regional Analysis**: Evaluates household income, expenditure, Gini coefficient, poverty incidence, and CPI across all Malaysian states.
- **Affordability Modeling**: Measures net disposable income (`income_median - expenditure_mean`) and savings rate buffers.

---

## 📁 Repository Structure

```text
malaysia-household-economy-analytics/
├── 01_python_etl/
│   ├── Raw Data/                     # Raw datasets (cpi_2d_state, hh_income, hies_state)
│   ├── 01_data_cleaning.ipynb        # Data extraction, transformation, & cleaning pipeline
│   ├── clean_dim_states.csv          # Clean state dimension table
│   ├── clean_fact_cpi_annual.csv     # Cleaned annual CPI by state and division
│   ├── clean_fact_income_hies.csv    # Cleaned HIES income & expenditure data
│   └── clean_fact_income_history.csv # Historical income trends
├── 02_sql_analysis/
│   ├── Creating a Permanent SQL View & Exporting for Excel.sql
│   ├── Fix Date to year.sql
│   ├── Household Affordability, Disposable Buffer & Regional Ranking.sql
│   ├── Identifying the Top Inflation Drivers by Category.sql
│   ├── Wage Growth vs. Inflation Pace Using LAG.sql
│   └── sql_state_summary.csv         # Aggregated analytical output
├── 03_excel_simulator/
│   └── 03_affordability_simulator.xlsm.xlsx # Scenario planning & affordability simulator
└── 04_powerbi_dashboard/
    ├── malaysia_economic_dashboard.pbix    # Interactive Power BI report
    ├── Dashboard Overview.png              # Power BI report screenshot
    └── Dashboard Inflation and Wage Trends.jpg
```

---

## 🛠️ Tech Stack & Workflow

1. **Python & Jupyter Notebook (`01_python_etl`)**:
   - Data cleaning, missing value handling, column standardization, and schema normalization into star-schema dimension & fact tables.
2. **SQL (`02_sql_analysis`)**:
   - Advanced analytical queries using window functions (`LAG()`), subqueries, and views (`vw_state_affordability_summary`) to compare wage growth against inflation.
3. **Microsoft Excel (`03_excel_simulator`)**:
   - Financial modeling, scenario simulation, and disposable income sensitivity analysis.
4. **Power BI (`04_powerbi_dashboard`)**:
   - Executive dashboard reporting macro indicators, state-by-state comparisons, and category-level inflation drivers.

---

## 📊 Dashboard Previews

### 1. Dashboard Overview
![Dashboard Overview](04_powerbi_dashboard/Dashboard%20Overview.png)

### 2. Inflation & Wage Trends
![Inflation and Wage Trends](04_powerbi_dashboard/Dashboard%20Inflation%20and%20Wage%20Trends.jpg)

---

## 🚀 Getting Started

### Prerequisites
- Python 3.10+ (`pandas`, `numpy`, `jupyter`)
- SQL Database (PostgreSQL, MySQL, or SQLite)
- Microsoft Excel
- Power BI Desktop

### Setup & Replication
1. **Clone the repository**:
   ```bash
   git clone https://github.com/Kama1804/malaysia-household-economy-analytics.git
   cd malaysia-household-economy-analytics
   ```
2. **Run Python ETL**:
   - Open and execute `01_python_etl/01_data_cleaning.ipynb` to regenerate clean datasets.
3. **Run SQL Queries**:
   - Import the cleaned CSVs into your SQL database and run the scripts in `02_sql_analysis/`.
4. **Open Power BI**:
   - Launch `04_powerbi_dashboard/malaysia_economic_dashboard.pbix` in Power BI Desktop to explore the interactive visual reports.
