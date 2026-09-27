SELECT
    c.customer_name,
    COALESCE(SUM(o.sales), 0) AS total_sales,
    COALESCE(AVG(o.discount), 0) AS average_discount,
    COUNT(o.order_id) AS order_count,
    CASE
        WHEN COALESCE(SUM(o.sales), 0) > 2500 THEN 'VIP'
        ELSE 'REGULAR'
    END AS customer_type
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_sales DESC;