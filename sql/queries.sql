SELECT *
FROM fact_aum
ORDER BY aum DESC
LIMIT 5;

SELECT AVG(nav)
FROM fact_nav;

SELECT state,
COUNT(*)
FROM fact_transaction
GROUP BY state;

SELECT MAX(nav) AS highest_nav
FROM fact_nav;

SELECT MIN(nav) AS lowest_nav
FROM fact_nav;

SELECT COUNT(*) AS total_transactions
FROM fact_transaction;

SELECT AVG(expense_ratio) AS avg_expense_ratio
FROM fact_performance;

SELECT *
FROM fact_performance
ORDER BY return_1yr DESC
LIMIT 5;

SELECT SUM(aum) AS total_aum
FROM fact_aum;

SELECT COUNT(*) AS total_funds
FROM dim_fund;