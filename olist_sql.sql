SELECT COUNT(*) FROM  olist_customers_dataset;
SELECT order_status, COUNT(*) FROM olist_orders_dataset GROUP BY order_status;

SELECT COUNT(*) FROM olist_orders_dataset WHERE order_delivered_customer_date IS NULL;
SELECT COUNT(*) FROM olist_orders_dataset WHERE order_status = 'delivered' AND order_delivered_customer_date IS NULL;
-- delivered orders with a real delivery date: 96,478 minus 8.
SELECT ROUND(AVG(julianday(order_delivered_customer_date) - julianday(order_estimated_delivery_date)), 1) AS avg_days_vs_estimate FROM olist_orders_dataset WHERE order_status = 'delivered' AND order_delivered_customer_date IS NOT NULL;
SELECT ROUND(100.0 * SUM(CASE WHEN julianday(order_delivered_customer_date) > julianday(order_estimated_delivery_date) THEN 1 ELSE 0 END) / COUNT(*), 1) AS pct_late FROM olist_orders_dataset WHERE order_status = 'delivered' AND order_delivered_customer_date IS NOT NULL;
SELECT CASE WHEN julianday(o.order_delivered_customer_date) > julianday(o.order_estimated_delivery_date) THEN 'late' ELSE 'on time' END AS timing, ROUND(AVG(r.review_score), 2) AS avg_review FROM olist_orders_dataset o JOIN olist_order_reviews_dataset r ON r.order_id = o.order_id WHERE o.order_status = 'delivered' AND o.order_delivered_customer_date IS NOT NULL GROUP BY timing;
SELECT CASE WHEN julianday(o.order_delivered_customer_date) > julianday(o.order_estimated_delivery_date) THEN 'late' ELSE 'on time' END AS timing, ROUND(100.0 * SUM(CASE WHEN r.review_score = 1 THEN 1 ELSE 0 END) / COUNT(*), 1) AS pct_1_star FROM olist_orders_dataset o JOIN olist_order_reviews_dataset r ON r.order_id = o.order_id WHERE o.order_status = 'delivered' AND o.order_delivered_customer_date IS NOT NULL GROUP BY timing;
SELECT strftime('%Y-%m', order_delivered_customer_date) AS month, ROUND(100.0 * SUM(CASE WHEN julianday(order_delivered_customer_date) > julianday(order_estimated_delivery_date) THEN 1 ELSE 0 END) / COUNT(*), 1) AS pct_late FROM olist_orders_dataset WHERE order_status = 'delivered' AND order_delivered_customer_date IS NOT NULL GROUP BY month ORDER BY month;
