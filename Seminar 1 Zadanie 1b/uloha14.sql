SELECT DISTINCT fs1.region
FROM flourmills_sales AS fs1
WHERE NOT EXISTS (
    SELECT 1
    FROM flourmills_sales AS fs2
    WHERE fs2.region = fs1.region
      AND fs2.product_category = 'Flour'
);