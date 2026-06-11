# %%
import sqlite3
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

conn = sqlite3.connect("bluestock_mf.db")

nav_df = pd.read_sql("SELECT * FROM fact_nav", conn)
fund_df = pd.read_sql("SELECT * FROM fact_transaction", conn)

print(nav_df.shape)
print(fund_df.shape)

# %%
nav_df['date'] = pd.to_datetime(nav_df['date'])

nav_df = nav_df.sort_values(['amfi_code', 'date'])

nav_df['daily_return'] = (
    nav_df.groupby('amfi_code')['nav']
    .pct_change()
)

# %%
nav_df['daily_return'].describe()

# %%
plt.figure(figsize=(8,5))
nav_df['daily_return'].hist(bins=50)
plt.title("Daily Return Distribution")
plt.show()

# %%
cagr_table = fund_df[
    [
        'scheme_name',
        'return_1yr_pct',
        'return_3yr_pct',
        'return_5yr_pct'
    ]
]

cagr_table.head()

# %%
sharpe_rank = fund_df[
    ['scheme_name','sharpe_ratio']
].sort_values(
    'sharpe_ratio',
    ascending=False
)

sharpe_rank.head(10)

# %%
sortino_rank = fund_df[
    ['scheme_name','sortino_ratio']
].sort_values(
    'sortino_ratio',
    ascending=False
)

sortino_rank.head(10)

# %%
alpha_beta = fund_df[
    [
        'scheme_name',
        'alpha',
        'beta'
    ]
]

alpha_beta.head()

# %%
alpha_beta.to_csv(
    "alpha_beta.csv",
    index=False
)

# %%
dd = fund_df[
    [
        'scheme_name',
        'max_drawdown_pct'
    ]
]

dd.sort_values(
    'max_drawdown_pct'
).head(10)

# %%
score_df = fund_df.copy()

score_df['return_rank'] = score_df['return_3yr_pct'].rank(pct=True)

score_df['sharpe_rank'] = score_df['sharpe_ratio'].rank(pct=True)

score_df['alpha_rank'] = score_df['alpha'].rank(pct=True)

score_df['expense_rank'] = (
    1 - score_df['expense_ratio_pct'].rank(pct=True)
)

score_df['dd_rank'] = (
    1 - score_df['max_drawdown_pct'].rank(pct=True)
)

score_df['fund_score'] = (
    score_df['return_rank'] * 30 +
    score_df['sharpe_rank'] * 25 +
    score_df['alpha_rank'] * 20 +
    score_df['expense_rank'] * 15 +
    score_df['dd_rank'] * 10
)

score_df = score_df.sort_values(
    'fund_score',
    ascending=False
)

# %%
score_df.to_csv(
    "fund_scorecard.csv",
    index=False
)

# %%
top10 = score_df.head(10)

plt.figure(figsize=(12,6))

sns.barplot(
    data=top10,
    x='fund_score',
    y='scheme_name'
)

plt.title("Top 10 Funds")
plt.show()

# %% [markdown]
# Deliverables:
# 1. Performance_Analytics.ipynb
# 2. fund_scorecard.csv
# 3. alpha_beta.csv
# 4. benchmark_comparison.png

# %% [markdown]
# # Key Findings
# 
# 1. Daily returns show normal market fluctuations.
# 2. Top funds achieved higher Sharpe ratios.
# 3. Higher alpha funds outperformed benchmarks.
# 4. Expense ratio impacts overall fund score.
# 5. Maximum drawdown varies across schemes.
# 6. Risk-adjusted returns differ significantly.
# 7. 3-year returns strongly influence rankings.
# 8. Beta values indicate different market sensitivities.
# 9. Fund scorecard provides balanced evaluation.
# 10. Top-ranked funds combine strong returns with controlled risk.

# %% [markdown]
# # Conclusion
# 
# This analysis evaluated mutual fund performance using daily returns, CAGR, Sharpe Ratio, Sortino Ratio, Alpha, Beta, and Maximum Drawdown. A composite fund scorecard was developed to rank funds based on return, risk-adjusted performance, cost efficiency, and downside risk. The analysis helps identify top-performing mutual funds using multiple performance indicators.

# %% [markdown]
# Performance_Analytics.ipynb
# fund_scorecard.csv
# alpha_beta.csv

# %%
plt.savefig("top10_fund_score.png", bbox_inches="tight")

# %%
import matplotlib.pyplot as plt

# %%
plt.savefig("top10_fund_score.png", bbox_inches="tight")

# %%
top10 = score_df.head(10)

plt.figure(figsize=(12,6))

sns.barplot(
    data=top10,
    x='fund_score',
    y='scheme_name'
)

plt.title("Top 10 Funds")

plt.savefig("top10_fund_score.png", bbox_inches="tight")

plt.show()

# %% [markdown]
# Performance_Analytics.ipynb
# fund_scorecard.csv
# alpha_beta.csv
# top10_fund_score.png

# %%
import pandas as pd

scorecard = pd.read_csv("fund_scorecard.csv")

top5 = scorecard.sort_values(
    by='fund_score',
    ascending=False
).head(5)

print(top5)

# %%
benchmark = pd.read_csv(
    r"C:\Users\rokka\OneDrive\Desktop\bluestock_mf_capstone\data\raw\10_benchmark_indices.csv"
)

nifty50 = benchmark[
    benchmark['index_name'] == 'NIFTY50'
].copy()

nifty100 = benchmark[
    benchmark['index_name'] == 'NIFTY100'
].copy()

nifty50['date'] = pd.to_datetime(nifty50['date'])
nifty100['date'] = pd.to_datetime(nifty100['date'])

# %%
from datetime import timedelta

end_date = nifty50['date'].max()

start_date = end_date - pd.DateOffset(years=3)

nifty50 = nifty50[
    nifty50['date'] >= start_date
]

nifty100 = nifty100[
    nifty100['date'] >= start_date
]

# %%
import matplotlib.pyplot as plt

plt.figure(figsize=(14,6))

plt.plot(
    nifty50['date'],
    nifty50['close_value'],
    label='NIFTY50',
    linewidth=3
)

plt.plot(
    nifty100['date'],
    nifty100['close_value'],
    label='NIFTY100',
    linewidth=3
)

# %%
nav = pd.read_csv(
    r"C:\Users\rokka\OneDrive\Desktop\bluestock_mf_capstone\data\raw\02_nav_history.csv"
)

nav['date'] = pd.to_datetime(nav['date'])

# %%
print(top5.columns)

# %%
for code in top5['amfi_code']:

    fund = nav[
        nav['amfi_code'] == code
    ].copy()

    fund = fund[
        fund['date'] >= start_date
    ]

    plt.plot(
        fund['date'],
        fund['nav'],
        alpha=0.8
    )

# %%
plt.figure(figsize=(14,6))

# NIFTY50 normalized
nifty50_norm = (
    nifty50['close_value']
    / nifty50['close_value'].iloc[0]
) * 100

plt.plot(
    nifty50['date'],
    nifty50_norm,
    label='NIFTY50'
)

# NIFTY100 normalized
nifty100_norm = (
    nifty100['close_value']
    / nifty100['close_value'].iloc[0]
) * 100

plt.plot(
    nifty100['date'],
    nifty100_norm,
    label='NIFTY100'
)

# Top 5 Funds normalized
for code in top5_available['amfi_code']:

    fund = nav[
        nav['amfi_code'] == code
    ].copy()

    fund['date'] = pd.to_datetime(fund['date'])

    fund_norm = (
        fund['nav']
        / fund['nav'].iloc[0]
    ) * 100

    plt.plot(
        fund['date'],
        fund_norm,
        label=str(code)
    )

plt.title(
    "Normalized Returns: Top 5 Funds vs NIFTY50 vs NIFTY100"
)

plt.xlabel("Date")
plt.ylabel("Growth Index (Base = 100)")
plt.legend()

plt.savefig(
    "benchmark_comparison_chart.png",
    bbox_inches="tight"
)

plt.show()

# %%
plt.figure(figsize=(14,6))

plt.plot(
    nifty50['date'],
    nifty50['close_value'],
    label='NIFTY50'
)

plt.plot(
    nifty100['date'],
    nifty100['close_value'],
    label='NIFTY100'
)

for code in top5_available['amfi_code']:

    fund = nav[
        nav['amfi_code'] == code
    ].copy()

    fund['date'] = pd.to_datetime(fund['date'])

    plt.plot(
        fund['date'],
        fund['nav'],
        label=str(code)
    )

plt.legend()
plt.title("Top 5 Funds vs NIFTY50 vs NIFTY100")
plt.show()

# %% [markdown]
# Benchmark_Comparison.ipynb
# benchmark_comparison.csv
# benchmark_comparison_chart.png

# %%
import os

print(os.getcwd())
print(os.path.exists("benchmark_comparison_chart.png"))

# %%



