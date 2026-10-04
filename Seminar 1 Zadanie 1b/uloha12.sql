SELECT fs1.*
FROM flourmills_sales AS fs1
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales AS fs2
    WHERE fs2.region = fs1.region
      AND EXTRACT(YEAR FROM fs2.sale_date) = 2024
);