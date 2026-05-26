-- demand by month view
CREATE VIEW vw_monthly_demand AS
SELECT
    dh.month,
    dp.category,
    dp.brand,
    dm.region,

    SUM(dh.actual_demand_units) AS total_demand_units,

    SUM(
        dh.actual_demand_units * dp.unit_price_eur
    ) AS gross_revenue_eur
FROM demand_history dh
JOIN dim_product dp
    ON dh.product_id = dp.product_id
JOIN dim_market dm
    ON dh.market_id = dm.market_id
GROUP BY
    dh.month,
    dp.category,
    dp.brand,
    dm.region;

-- time series view
CREATE VIEW vw_forecasting_base AS
SELECT
    dh.month,
    dh.product_id,
    dh.market_id,
    dp.category,
    dp.brand,
    dp.lifecycle_stage,
    dm.region,
    dm.lead_time_months,
    dm.strategic_priority,
    dh.actual_demand_units,
    dh.promo_flag,
    dh.campaign_intensity,
    dh.demand_signal_quality,
    sc.available_supply_units,
    sc.production_capacity_units,
    sc.supply_constraint_flag,
    s.actual_shipped_units,
    s.unfulfilled_demand_units,
    s.service_level_pct,
    i.ending_inventory_units,
    i.inventory_risk_status
FROM demand_history dh
JOIN dim_product dp
    ON dh.product_id = dp.product_id
JOIN dim_market dm
    ON dh.market_id = dm.market_id
LEFT JOIN supply_capacity sc
    ON dh.month = sc.month
    AND dh.product_id = sc.product_id
LEFT JOIN shipments s
    ON dh.month = s.month
    AND dh.product_id = s.product_id
    AND dh.market_id = s.market_id
LEFT JOIN inventory i
    ON dh.month = i.month
    AND dh.product_id = i.product_id
    AND dh.market_id = i.market_id;

-- executive KPI view
CREATE VIEW vw_executive_kpis AS
SELECT
    month,
    SUM(actual_demand_units) AS total_demand_units,
    SUM(actual_shipped_units) AS total_shipped_units,
    SUM(unfulfilled_demand_units) AS total_unfulfilled_units,
    ROUND(
        100.0 * SUM(actual_shipped_units)
        / NULLIF(SUM(actual_demand_units), 0),
        2
    ) AS fulfillment_rate_pct,
    ROUND(
        100.0 * SUM(unfulfilled_demand_units)
        / NULLIF(SUM(actual_demand_units), 0),
        2
    ) AS stockout_rate_pct
FROM vw_forecasting_base
GROUP BY month;

-- forecast accuracy view
CREATE VIEW vw_forecast_accuracy AS
SELECT
    fs.forecast_month,
    fs.target_month,
    fs.forecast_horizon_months,
    fs.product_id,
    fs.market_id,
    fs.forecast_units,
    dh.actual_demand_units,
    fs.forecast_units - dh.actual_demand_units
        AS forecast_error,
    ABS(fs.forecast_units - dh.actual_demand_units)
        AS absolute_error,
    ROUND(
        100.0 * ABS(fs.forecast_units - dh.actual_demand_units)
        / NULLIF(dh.actual_demand_units, 0),
        2
    ) AS absolute_percentage_error
FROM forecast_snapshots fs
JOIN demand_history dh
    ON fs.target_month = dh.month
    AND fs.product_id = dh.product_id
    AND fs.market_id = dh.market_id;

-- I will export vw_forecasting_base as a CSV for further analysis in python
SELECT *
FROM vw_forecasting_base;