SELECT
    fs1.product_name,
    fs1.region,
    fs1.total_amount,
    (
        SELECT MIN(fs2.total_amount)
        FROM flourmills_sales AS fs2
        WHERE fs2.region = fs1.region
    ) AS region_min_amount
FROM flourmills_sales AS fs1
ORDER BY fs1.sales_id ASC;