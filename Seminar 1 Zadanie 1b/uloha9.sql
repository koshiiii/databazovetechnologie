SELECT fs1.*
FROM flourmills_sales AS fs1
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales AS fs2
    WHERE fs2.product_name = fs1.product_name
    GROUP BY fs2.product_name
    HAVING COUNT(
        DISTINCT EXTRACT(MONTH FROM fs2.sale_date)) > 1
);