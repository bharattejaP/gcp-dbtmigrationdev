{{ config(
    materialized = "table"
) }}

SELECT 
    d.FiscalYear_week AS FiscalWeek,
    ap.dimWarehouseKey AS Warehouse,
    SUM(ap.PickedPieces) AS TotalSales
FROM {{ ref('vfactActualPieces') }} ap
JOIN {{ ref('vdimDate') }} d 
    ON ap.dimActualDayDateKey = d.dimDateKey
GROUP BY d.FiscalYear_week, ap.dimWarehouseKey;
