# Olist Delivery Performance Analysis

Live dashboard: https://datastudio.google.com/reporting/8d994fc4-373f-4af2-b14f-215e46c463e4

[View the dashboard PDF](<Olist_Delivery_Performance (2).pdf>)

SQL analysis of ~100,000 orders from Olist, a Brazilian e-commerce marketplace. Question: how does delivery performance affect customer review scores?

## Dataset
Olist public dataset (Kaggle). Queried with SQLite in DB Browser.

## Data preparation
Started with 99,441 orders. Kept delivered orders with a valid delivery date: 96,470 orders (excluded 8 delivered orders with missing dates).

## Findings
- Orders arrive 11.2 days EARLIER than the promised date on average
- But 8.1% of orders are delivered late
- Late orders average 2.57 stars vs 4.29 stars for on-time orders
- 46.2% of late orders receive a 1-star review, vs 6.6% of on-time orders
- Delivery reliability worsened as Olist grew: ~3-6% late in mid-2017, peaking at 18.6% in April 2018

## Recommendation
- The monthly late-delivery rate was about 3-6% in mid-2017 and 18.6% in April 2018 (7,850 delivered orders). Dec 2016 had 4 delivered orders, Sep 2018 had 56, and Oct 2018 had 3. Their late rates of 50-100% should be interpreted cautiously because the samples are small.

## Tools
SQLite (DB Browser), SQL queries in olist_sql.sql
