USE ecommerce_analysis;

-- 1. Monthly Revenue Trend
SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    ROUND(SUM(p.payment_value), 2) AS total_revenue
FROM orders o
JOIN payments p ON o.order_id = p.order_id
WHERE o.order_status = 'delivered'
GROUP BY month
ORDER BY month;

-- 2. Top 10 Categories by Revenue
SELECT 
    pr.product_category_name AS category,
    ROUND(SUM(oi.price), 2) AS revenue,
    COUNT(oi.order_id) AS total_orders
FROM order_items oi
JOIN products pr ON oi.product_id = pr.product_id
GROUP BY category
ORDER BY revenue DESC
LIMIT 10;

-- 3. Average Delivery Time by State
SELECT 
    c.customer_state AS state,
    ROUND(AVG(DATEDIFF(
        o.order_delivered_customer_date,
        o.order_purchase_timestamp
    )), 1) AS avg_delivery_days
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY state
ORDER BY avg_delivery_days;
-- 4. Late Delivery Impact on Ratings

SELECT 
    CASE 
        WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date 
        THEN 'Late' 
        ELSE 'On Time' 
    END AS delivery_status,
    ROUND(AVG(r.review_score), 2) AS avg_rating,
    COUNT(*) AS total_orders
FROM orders o
JOIN reviews r ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY delivery_status;

-- 5. Customer Repeat Purchase Rate

SELECT 
    COUNT(CASE WHEN order_count > 1 THEN 1 END) AS repeat_customers,
    COUNT(*) AS total_customers,
    ROUND(100.0 * COUNT(CASE WHEN order_count > 1 THEN 1 END) / COUNT(*), 2) AS repeat_rate_pct
FROM (
    SELECT 
        c.customer_unique_id, 
        COUNT(o.order_id) AS order_count
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
) t;

-- 6. Revenue by Payment Type

SELECT 
    payment_type,
    COUNT(*) AS total_transactions,
    ROUND(SUM(payment_value), 2) AS total_revenue,
    ROUND(AVG(payment_value), 2) AS avg_order_value
FROM payments
GROUP BY payment_type
ORDER BY total_revenue DESC;

-- 7. Top 5 States by Orders

SELECT 
    c.customer_state AS state,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(p.payment_value), 2) AS total_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY state
ORDER BY total_orders DESC
LIMIT 5;