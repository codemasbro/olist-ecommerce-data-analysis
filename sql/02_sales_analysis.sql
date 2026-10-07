-- =========================================================
-- OLIST E-COMMERCE ANALYSIS
-- 02 - SALES ANALYSIS
-- =========================================================

-- 1. Monthly Sales Performance
SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS revenue,
    ROUND(SUM(oi.price) / COUNT(DISTINCT o.order_id), 2) AS average_order_value
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY 1
ORDER BY 1;

-- 2. Yearly Sales Performance
SELECT
    EXTRACT(YEAR FROM o.order_purchase_timestamp) AS year,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS revenue,
    ROUND(SUM(oi.price) / COUNT(DISTINCT o.order_id), 2) AS average_order_value
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
  AND o.order_purchase_timestamp >= '2017-01-01'
GROUP BY 1
ORDER BY 1;
