CREATE TABLE dim_market (
    market_id VARCHAR(10) PRIMARY KEY,
    market_name VARCHAR(100) NOT NULL,
    region VARCHAR(20) NOT NULL,
    lead_time_months INT NOT NULL,
    strategic_priority INT NOT NULL,
    channel_mix VARCHAR(50) NOT NULL,
    market_size_index DECIMAL(5,2) NOT NULL
);

CREATE TABLE dim_product (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    brand VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    lifecycle_stage VARCHAR(30) NOT NULL,
    unit_price_eur DECIMAL(10,2) NOT NULL,
    unit_cost_eur DECIMAL(10,2) NOT NULL,
    gross_margin_pct DECIMAL(5,3) NOT NULL,
    launch_month DATE NULL
);

CREATE TABLE dim_calendar (
    month DATE PRIMARY KEY,
    year INT NOT NULL,
    quarter INT NOT NULL,
    month_number INT NOT NULL,
    month_name VARCHAR(20) NOT NULL,
    season VARCHAR(50) NOT NULL,
    campaign_intensity DECIMAL(5,2) NOT NULL
);

CREATE TABLE demand_history (
    month DATE NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    market_id VARCHAR(10) NOT NULL,
    actual_demand_units INT NOT NULL,
    promo_flag BIT NOT NULL,
    campaign_intensity DECIMAL(5,2) NOT NULL,
    demand_signal_quality VARCHAR(20) NOT NULL,

    CONSTRAINT PK_demand_history
        PRIMARY KEY (month, product_id, market_id),

    CONSTRAINT FK_demand_history_calendar
        FOREIGN KEY (month) REFERENCES dim_calendar(month),

    CONSTRAINT FK_demand_history_product
        FOREIGN KEY (product_id) REFERENCES dim_product(product_id),

    CONSTRAINT FK_demand_history_market
        FOREIGN KEY (market_id) REFERENCES dim_market(market_id)
);

CREATE TABLE forecast_snapshots (
    forecast_month DATE NOT NULL,
    target_month DATE NOT NULL,
    forecast_horizon_months INT NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    market_id VARCHAR(10) NOT NULL,
    forecast_units INT NOT NULL,
    forecast_version VARCHAR(10) NOT NULL,
    business_override_flag BIT NOT NULL,

    CONSTRAINT PK_forecast_snapshots
        PRIMARY KEY (
            forecast_month,
            target_month,
            forecast_horizon_months,
            product_id,
            market_id
        ),

    CONSTRAINT FK_forecast_snapshots_target_calendar
        FOREIGN KEY (target_month) REFERENCES dim_calendar(month),

    CONSTRAINT FK_forecast_snapshots_product
        FOREIGN KEY (product_id) REFERENCES dim_product(product_id),

    CONSTRAINT FK_forecast_snapshots_market
        FOREIGN KEY (market_id) REFERENCES dim_market(market_id)
);

CREATE TABLE supply_capacity (
    month DATE NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    available_supply_units INT NOT NULL,
    production_capacity_units INT NOT NULL,
    supply_constraint_flag BIT NOT NULL,
    constraint_reason VARCHAR(100) NOT NULL,

    CONSTRAINT PK_supply_capacity
        PRIMARY KEY (month, product_id),

    CONSTRAINT FK_supply_capacity_calendar
        FOREIGN KEY (month) REFERENCES dim_calendar(month),

    CONSTRAINT FK_supply_capacity_product
        FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

CREATE TABLE shipments (
    month DATE NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    market_id VARCHAR(10) NOT NULL,
    actual_shipped_units INT NOT NULL,
    unfulfilled_demand_units INT NOT NULL,
    service_level_pct DECIMAL(6,4) NOT NULL,

    CONSTRAINT PK_shipments
        PRIMARY KEY (month, product_id, market_id),

    CONSTRAINT FK_shipments_calendar
        FOREIGN KEY (month) REFERENCES dim_calendar(month),

    CONSTRAINT FK_shipments_product
        FOREIGN KEY (product_id) REFERENCES dim_product(product_id),

    CONSTRAINT FK_shipments_market
        FOREIGN KEY (market_id) REFERENCES dim_market(market_id)
);

CREATE TABLE inventory (
    month DATE NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    market_id VARCHAR(10) NOT NULL,
    opening_inventory_units INT NOT NULL,
    replenishment_units INT NOT NULL,
    actual_shipped_units INT NOT NULL,
    ending_inventory_units INT NOT NULL,
    inventory_risk_status VARCHAR(50) NOT NULL,

    CONSTRAINT PK_inventory
        PRIMARY KEY (month, product_id, market_id),

    CONSTRAINT FK_inventory_calendar
        FOREIGN KEY (month) REFERENCES dim_calendar(month),

    CONSTRAINT FK_inventory_product
        FOREIGN KEY (product_id) REFERENCES dim_product(product_id),

    CONSTRAINT FK_inventory_market
        FOREIGN KEY (market_id) REFERENCES dim_market(market_id)
);

CREATE TABLE allocation_results (
    month DATE NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    market_id VARCHAR(10) NOT NULL,
    actual_demand_units INT NOT NULL,
    available_supply_units_product_month INT NOT NULL,
    allocation_score DECIMAL(10,4) NOT NULL,
    recommended_allocation_units INT NOT NULL,
    expected_unfulfilled_units INT NOT NULL,
    expected_revenue_at_risk_eur DECIMAL(12,2) NOT NULL,
    priority_reason VARCHAR(100) NOT NULL,

    CONSTRAINT PK_allocation_results
        PRIMARY KEY (month, product_id, market_id),

    CONSTRAINT FK_allocation_results_calendar
        FOREIGN KEY (month) REFERENCES dim_calendar(month),

    CONSTRAINT FK_allocation_results_product
        FOREIGN KEY (product_id) REFERENCES dim_product(product_id),

    CONSTRAINT FK_allocation_results_market
        FOREIGN KEY (market_id) REFERENCES dim_market(market_id)
);