Data Dictionary

01_fund_master.csv

- amfi_code : Unique AMFI scheme code
- fund_house : Name of the fund house
- scheme_name : Name of the mutual fund scheme
- category : Main fund category
- sub_category : Sub-category of the scheme
- plan : Regular or Direct plan
- launch_date : Scheme launch date
- benchmark : Benchmark index used for comparison
- expense_ratio_pct : Expense ratio percentage
- exit_load_pct : Exit load percentage
- min_sip_amount : Minimum SIP investment amount
- min_lumpsum_amount : Minimum lump sum investment amount
- fund_manager : Name of the fund manager
- risk_category : Risk classification of the scheme
- sebi_category_code : SEBI category code

02_nav_history.csv

- amfi_code : Unique AMFI scheme code
- date : NAV date
- nav : Net Asset Value

03_aum_by_fund_house.csv

- date : Reporting date
- fund_house : Name of fund house
- aum_lakh_crore : AUM in lakh crore
- aum_crore : AUM in crore rupees
- num_schemes : Number of schemes

04_monthly_sip_inflows.csv

- month : Reporting month
- sip_inflow_crore : SIP inflow amount in crore
- active_sip_accounts_crore : Active SIP accounts in crore
- new_sip_accounts_lakh : New SIP accounts in lakh
- sip_aum_lakh_crore : SIP AUM in lakh crore
- yoy_growth_pct : Year-over-year growth percentage

05_category_inflows.csv

- month : Reporting month
- category : Fund category
- net_inflow_crore : Net inflow amount in crore

06_industry_folio_count.csv

- month : Reporting month
- total_folios_crore : Total folios in crore
- equity_folios_crore : Equity folios in crore
- debt_folios_crore : Debt folios in crore
- hybrid_folios_crore : Hybrid folios in crore
- others_folios_crore : Other folios in crore

07_scheme_performance.csv

- amfi_code : Unique AMFI scheme code
- scheme_name : Scheme name
- fund_house : Fund house name
- category : Scheme category
- plan : Scheme plan type
- return_1yr_pct : 1-year return percentage
- return_3yr_pct : 3-year return percentage
- return_5yr_pct : 5-year return percentage
- benchmark_3yr_pct : 3-year benchmark return
- alpha : Alpha value
- beta : Beta value
- sharpe_ratio : Sharpe ratio
- sortino_ratio : Sortino ratio
- std_dev_ann_pct : Annualized standard deviation
- max_drawdown_pct : Maximum drawdown percentage
- aum_crore : Assets under management in crore
- expense_ratio_pct : Expense ratio percentage
- morningstar_rating : Morningstar rating
- risk_grade : Risk grade

08_investor_transactions.csv

- investor_id : Unique investor ID
- transaction_date : Transaction date
- amfi_code : Scheme AMFI code
- transaction_type : Type of transaction
- amount_inr : Transaction amount in INR
- state : Investor state
- city : Investor city
- city_tier : City tier classification
- age_group : Investor age group
- gender : Investor gender
- annual_income_lakh : Annual income in lakh
- payment_mode : Payment mode
- kyc_status : KYC verification status

09_portfolio_holdings.csv

- amfi_code : Scheme AMFI code
- stock_symbol : Stock symbol
- stock_name : Stock name
- sector : Industry sector
- weight_pct : Portfolio weight percentage
- market_value_cr : Market value in crore
- current_price_inr : Current stock price in INR
- portfolio_date : Portfolio reporting date

10_benchmark_indices.csv

- date : Index date
- index_name : Benchmark index name
- close_value : Closing index value