-- Check each table's row count
SELECT 'dim_market' AS table_name, COUNT(*) AS row_count FROM dim_market
UNION ALL
SELECT 'dim_product', COUNT(*) FROM dim_product
UNION ALL
SELECT 'dim_calendar', COUNT(*) FROM dim_calendar
UNION ALL
SELECT 'demand_history', COUNT(*) FROM demand_history
UNION ALL
SELECT 'forecast_snapshots', COUNT(*) FROM forecast_snapshots
UNION ALL
SELECT 'supply_capacity', COUNT(*) FROM supply_capacity
UNION ALL
SELECT 'shipments', COUNT(*) FROM shipments
UNION ALL
SELECT 'inventory', COUNT(*) FROM inventory
UNION ALL
SELECT 'allocation_results', COUNT(*) FROM allocation_results;

-- Look for duplicated primary keys (PK)
-- demand_history table
SELECT month, product_id, market_id, COUNT(*) AS records
FROM demand_history
GROUP BY month, product_id, market_id
HAVING COUNT(*) > 1;

-- shipments table
SELECT month, product_id, market_id, COUNT(*) AS records
FROM shipments
GROUP BY month, product_id, market_id
HAVING COUNT(*) > 1;

-- inventory table
SELECT month, product_id, market_id, COUNT(*) AS records
FROM inventory
GROUP BY month, product_id, market_id
HAVING COUNT(*) > 1;

-- allocation_results table
SELECT month, product_id, market_id, COUNT(*) AS records
FROM allocation_results
GROUP BY month, product_id, market_id
HAVING COUNT(*) > 1;

-- supply_capacity table
SELECT month, product_id, COUNT(*) AS records
FROM supply_capacity
GROUP BY month, product_id
HAVING COUNT(*) > 1;

-- forecast_snapshots table
SELECT forecast_month, target_month, forecast_horizon_months, product_id, market_id, COUNT(*) AS records
FROM forecast_snapshots
GROUP BY forecast_month, target_month, forecast_horizon_months, product_id, market_id
HAVING COUNT(*) > 1;

-- Foreign key (FK) checks
-- Look for missing product_id
SELECT dh.*
FROM demand_history dh
LEFT JOIN dim_product dp
    ON dh.product_id = dp.product_id
WHERE dp.product_id IS NULL;

-- Missing markets
SELECT dh.*
FROM demand_history dh
LEFT JOIN dim_market dm
    ON dh.market_id = dm.market_id
WHERE dm.market_id IS NULL;

-- Missing calendar months
SELECT dh.*
FROM demand_history dh
LEFT JOIN dim_calendar dc
    ON dh.month = dc.month
WHERE dc.month IS NULL;

-- Business sanity checks (time period, number of products and number of markets)
SELECT
    MIN(month) AS first_month,
    MAX(month) AS last_month,
    COUNT(DISTINCT product_id) AS products,
    COUNT(DISTINCT market_id) AS markets,
    SUM(actual_demand_units) AS total_demand_units
FROM demand_history;