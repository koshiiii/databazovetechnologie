SELECT
    fs1.product_name,
    fs1.product_category,
    fs1.total_amount
FROM flourmills_sales AS fs1
WHERE fs1.total_amount > (
    SELECT AVG(fs2.total_amount)
    FROM flourmills_sales AS fs2
    WHERE fs2.product_category = fs1.product_category
);