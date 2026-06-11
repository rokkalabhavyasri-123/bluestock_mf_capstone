## Mutual Fund Analytics Capstone Project

## Bluestock Fintech Capstone Program

### Prepared By
Bhavya Sri Rokkala

---

# Project Overview

The Mutual Fund Analytics Capstone Project is an end-to-end financial analytics solution developed to analyze mutual fund performance, investor behavior, benchmark tracking, and portfolio risk.

The project combines Data Engineering, Data Analysis, Financial Analytics, and Business Intelligence techniques using Python, SQLite, and Power BI.

The objective is to transform raw mutual fund data into meaningful business insights that support investment decision-making and performance evaluation.

---

# Project Objectives

- Build an ETL pipeline for data processing.
- Create a centralized SQLite database.
- Perform Exploratory Data Analysis (EDA).
- Analyze mutual fund performance.
- Compare funds against benchmark indices.
- Analyze investor demographics and behavior.
- Perform advanced risk analytics.
- Build an interactive Power BI dashboard.
- Generate actionable investment insights.

---

# Technologies Used

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- SQLite
- Power BI
- Jupyter Notebook
- Git
- GitHub

---

# Project Structure

```text
bluestock_mf_capstone/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── notebooks/
│   ├── day2_data_cleaning.ipynb
│   ├── EDA_Analysis.ipynb
│   ├── Performance_Analytics.ipynb
│   ├── Investor_Analysis.ipynb
│   ├── Benchmark_Comparison.ipynb
│   └── 05_advanced_analytics.ipynb
│
├── dashboard/
│   └── bluestock_mf_dashboard.pbix
│
├── reports/
│   ├── Final_Report.pdf
│   ├── Bluestock_MF_Presentation.pptx
│   └── Supporting Charts
│
├── sql/
│
├── scripts/
│
├── bluestock_mf.db
│
└── README.md
```

---

# Database Design

The project uses SQLite as the central database.

Main tables include:

- fact_nav
- fact_transaction
- fund_master
- benchmark_data

Relationships are established using:

- AMFI Code
- Date Fields

The database supports efficient querying and analytics.

---

# ETL Pipeline

## Extract

Raw mutual fund datasets were collected and loaded into Python.

## Transform

Data cleaning activities included:

- Missing value handling
- Duplicate removal
- Date conversion
- Column standardization
- Data validation

## Load

Processed data was loaded into SQLite for analytics and dashboard development.

---

# Exploratory Data Analysis (EDA)

EDA was performed to understand investor behavior and mutual fund characteristics.

Analyses included:

- Age Group Distribution
- Gender Distribution
- City Tier Analysis
- State-wise Investment Analysis
- Income Distribution
- Transaction Type Analysis

Key insights revealed demographic and regional investment trends.

---

# Performance Analytics

Performance metrics calculated:

- CAGR
- Sharpe Ratio
- Sortino Ratio
- Alpha
- Beta
- Maximum Drawdown

A composite fund scorecard was created to rank mutual funds based on performance and risk-adjusted returns.

Generated Outputs:

- fund_scorecard.csv
- alpha_beta.csv
- top10_fund_score.png

---

# Investor Analytics

Investor behavior analysis included:

- Age Group Analysis
- Gender Analysis
- Income Analysis
- State-wise Investment Trends
- SIP vs Lumpsum Preferences

The analysis helped identify investor participation patterns across demographic segments.

---

# Benchmark Comparison

Mutual fund performance was compared with:

- NIFTY 50
- NIFTY 100
- NIFTY Midcap 150

Analysis included:

- Benchmark Tracking
- Relative Performance
- Normalized Returns

Generated Outputs:

- benchmark_comparison.csv
- benchmark_comparison_chart.png

---

# Advanced Analytics

Advanced risk and investor analytics were implemented.

## Risk Analytics

- Value at Risk (VaR)
- Conditional Value at Risk (CVaR)
- Rolling 90-Day Sharpe Ratio
- Volatility Analysis

## Investor Analytics

- SIP Continuity Risk
- Investor Cohort Analysis
- At-Risk Investor Identification

## Fund Recommendation System

A rule-based recommendation engine was developed using:

- Risk Category
- Sharpe Ratio Rankings

Generated Outputs:

- var_cvar_report.csv
- rolling_sharpe_chart.png

---

# Power BI Dashboard

An interactive dashboard was developed with four pages:

## Page 1 – Industry Overview

- Total AUM
- SIP Inflows
- Total Folios
- Total Schemes
- AUM Trend Analysis

## Page 2 – Fund Performance

- Top Funds
- Sharpe Ratio Analysis
- Alpha-Beta Analysis
- Drawdown Metrics

## Page 3 – Investor Insights

- Demographic Analysis
- State-wise Investments
- City Tier Distribution

## Page 4 – Risk Analytics

- VaR Analysis
- CVaR Analysis
- Volatility Analysis
- Risk Rankings

---

# Key Findings

- Top-performing funds achieved superior Sharpe Ratios.
- SIP investments dominate investor activity.
- Benchmark tracking efficiency varies across funds.
- High volatility does not always lead to higher returns.
- Risk-adjusted metrics provide better fund rankings.
- Investor behavior differs across age groups and regions.
- Advanced risk analytics improve investment evaluation.

---

# Deliverables

Completed project deliverables:

- SQLite Database
- ETL Pipeline
- EDA Analysis
- Performance Analytics
- Investor Analytics
- Benchmark Comparison
- Advanced Analytics
- Power BI Dashboard
- Final_Report.pdf
- Bluestock_MF_Presentation.pptx

---

# How to Run

## Step 1

Clone Repository

```bash
git clone <repository-url>
```

## Step 2

Install Dependencies

```bash
pip install pandas numpy matplotlib seaborn sqlite3
```

## Step 3

Run Notebooks

Execute notebooks in the following order:

1. day2_data_cleaning.ipynb
2. EDA_Analysis.ipynb
3. Performance_Analytics.ipynb
4. Investor_Analysis.ipynb
5. Benchmark_Comparison.ipynb
6. 05_advanced_analytics.ipynb

## Step 4

Open Dashboard

Open:

```text
dashboard/bluestock_mf_dashboard.pbix
```

using Power BI Desktop.

---

# GitHub Repository

Project Version:

v1.0

Source Code, Reports, Dashboard, and Analytics Outputs are available in this repository.

---

# Limitations

- Historical data availability was limited.
- Results depend on source data quality.
- Some assumptions were required during preprocessing.
- Benchmark coverage may not represent all market conditions.

---

# Future Improvements

- Machine Learning based fund recommendation system.
- Real-time market data integration.
- Automated ETL scheduling.
- Web dashboard deployment.
- Portfolio optimization models.

---

# Conclusion

The Mutual Fund Analytics Capstone Project successfully integrated data engineering, financial analytics, and business intelligence into a single end-to-end solution.

The project demonstrates practical applications of Python, SQLite, and Power BI for evaluating mutual fund performance, investor behavior, benchmark tracking, and portfolio risk.

The generated insights can support informed investment decisions and improve understanding of mutual fund industry trends.

---

# Author

Bhavya Sri Rokkala

Bluestock Fintech Capstone Program

2026