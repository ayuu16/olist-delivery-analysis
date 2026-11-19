# Olist Delivery Performance Analysis

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
Delivery reliability directly drives customer satisfaction. The 8% of late orders generate a disproportionate share of 1-star reviews. Olist should prioritize delivery reliability in its fastest-growing period and set estimates it can actually hit.

## Tools
SQLite (DB Browser), SQL queries in queries.sql
