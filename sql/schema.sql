CREATE TABLE dim_fund(
    fund_id INTEGER PRIMARY KEY,
    fund_name TEXT
);

CREATE TABLE dim_date(
    date_id INTEGER PRIMARY KEY,
    date DATE
);

CREATE TABLE fact_nav(
    nav_id INTEGER PRIMARY KEY,
    amfi_code INTEGER,
    nav REAL,
    date DATE
);