-- =========================================================
-- OLIST E-COMMERCE ANALYSIS
-- 01 - BUSINESS OVERVIEW
-- =========================================================

-- 1. Total Orders
SELECT
    COUNT(*) AS total_orders
FROM olist_orders_dataset;


-- 2. Total Customers
SELECT
    COUNT(DISTINCT customer_unique_id) AS total_customers
FROM olist_customers_dataset;


-- 3. Total Revenue
SELECT
    ROUND(SUM(price), 2) AS total_revenue
FROM olist_order_items_dataset;


-- 4. Average Order Value
SELECT
    ROUND(SUM(price) / COUNT(DISTINCT order_id), 2) AS average_order_value
FROM olist_order_items_dataset;


-- 5. Orders by Status
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM olist_orders_dataset
GROUP BY order_status
ORDER BY total_orders DESC;