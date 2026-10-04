SELECT DISTINCT fs1.product_category
FROM flourmills_sales AS fs1
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales AS fs2
    WHERE fs2.product_category = fs1.product_category
    GROUP BY fs2.product_category
    HAVING COUNT(DISTINCT fs2.region) > 3
)
ORDER BY product_category;