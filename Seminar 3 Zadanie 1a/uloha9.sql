-- Najprv označte a spustite iba tento blok:
CREATE OR REPLACE PROCEDURE apply_regional_discount(
    region_name VARCHAR,
    discount_rate NUMERIC
)
LANGUAGE plpgsql
AS $procedure$
DECLARE
    updated_orders INTEGER;
BEGIN
    UPDATE orders
    SET sales = sales * (1 - discount_rate)
    WHERE region = region_name;

    GET DIAGNOSTICS updated_orders = ROW_COUNT;

    RAISE NOTICE 'Discount % applied to region %. Updated orders: %',
        discount_rate, region_name, updated_orders;
END;
$procedure$;

-- Až potom spustite každé CALL samostatne:
CALL apply_regional_discount('West'::VARCHAR, 0.10::NUMERIC);
CALL apply_regional_discount('West'::VARCHAR, 0.10::NUMERIC);