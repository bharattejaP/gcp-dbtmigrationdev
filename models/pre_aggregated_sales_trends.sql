{{ config(
    materialized='table'  -- Change to 'view' or 'incremental' if needed
) }}

SELECT 
    d.FiscalYear_week AS FiscalWeek,
    ap.dimWarehouseKey AS Warehouse,
    SUM(ap.PickedPieces) AS TotalSales
FROM {{ ref('vfactActualPieces') }} ap
JOIN {{ ref('vdimDate') }} d 
    ON ap.dimActualDayDateKey = d.dimDateKey
GROUP BY FiscalWeek, Warehouse;
