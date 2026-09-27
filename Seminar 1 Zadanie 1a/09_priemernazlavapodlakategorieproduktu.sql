SELECT
    p.category,
    AVG(o.discount) AS average_discount
FROM products AS p
INNER JOIN orders AS o
    ON p.product_id = o.product_id
GROUP BY p.category
ORDER BY p.category;