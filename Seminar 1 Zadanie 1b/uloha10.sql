SELECT fs1.*
FROM flourmills_sales AS fs1
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales AS fs2
    WHERE fs2.product_category = fs1.product_category
      AND fs2.total_amount > 200000
)
ORDER BY fs1.sales_id ASC;