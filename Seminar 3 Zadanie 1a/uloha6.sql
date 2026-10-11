CREATE INDEX idx_orders_region_category
ON orders(customer_id, order_date);

SELECT
    c.customer_name,
    c.region,
    o.order_date,
    o.profit
FROM orders AS o
JOIN customers AS c
    ON c.customer_id = o.customer_id
WHERE c.region = 'West'
  AND o.order_date >= '2024-01-01';