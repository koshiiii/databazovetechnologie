SELECT
    c.region,
    SUM(o.sales) AS total_sales,
    AVG(o.discount) AS average_discount,
    COUNT(o.order_id) AS order_count
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.region
ORDER BY c.region;