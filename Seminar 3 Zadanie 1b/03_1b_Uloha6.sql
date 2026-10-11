WITH RECURSIVE date_bounds AS (
    SELECT
        MIN(sale_date)::date AS min_date,
        MAX(sale_date)::date AS max_date
    FROM flourmills_sales
),
sales_calendar AS (
    SELECT
        min_date AS sale_date,
        max_date
    FROM date_bounds

    UNION ALL

    SELECT
        sale_date + 1,
        max_date
    FROM sales_calendar
    WHERE sale_date < max_date
)
SELECT sale_date
FROM sales_calendar
ORDER BY sale_date ASC;