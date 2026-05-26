BULK INSERT dim_product
FROM 'C:\Users\Nacho\Desktop\Data Projects\supply-constrained-demand-forecasting-engine\data\raw\dim_product.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT dim_market
FROM 'C:\Users\Nacho\Desktop\Data Projects\supply-constrained-demand-forecasting-engine\data\raw\dim_market.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT dim_calendar
FROM 'C:\Users\Nacho\Desktop\Data Projects\supply-constrained-demand-forecasting-engine\data\raw\dim_calendar.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT allocation_results
FROM 'C:\Users\Nacho\Desktop\Data Projects\supply-constrained-demand-forecasting-engine\data\raw\allocation_results.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT demand_history
FROM 'C:\Users\Nacho\Desktop\Data Projects\supply-constrained-demand-forecasting-engine\data\raw\demand_history.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT forecast_snapshots
FROM 'C:\Users\Nacho\Desktop\Data Projects\supply-constrained-demand-forecasting-engine\data\raw\forecast_snapshots.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT inventory
FROM 'C:\Users\Nacho\Desktop\Data Projects\supply-constrained-demand-forecasting-engine\data\raw\inventory.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT shipments
FROM 'C:\Users\Nacho\Desktop\Data Projects\supply-constrained-demand-forecasting-engine\data\raw\shipments.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT supply_capacity
FROM 'C:\Users\Nacho\Desktop\Data Projects\supply-constrained-demand-forecasting-engine\data\raw\supply_capacity.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

SELECT *
FROM supply_capacity;