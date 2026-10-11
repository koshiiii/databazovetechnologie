CREATE OR REPLACE PROCEDURE get_sales_between(
    start_date DATE,
    end_date DATE
)
LANGUAGE plpgsql
AS $procedure$
DECLARE
    total_sales NUMERIC(18,2);
BEGIN
    SELECT COALESCE(SUM(sales), 0)
    INTO total_sales
    FROM orders
    WHERE order_date BETWEEN start_date AND end_date;

    RAISE NOTICE 'Period: % to %, total sales: %',
        start_date, end_date, total_sales;
END;
$procedure$;

CALL get_sales_between(
    DATE '2024-01-01',
    DATE '2024-03-31'
);