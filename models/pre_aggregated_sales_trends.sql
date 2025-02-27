CREATE OR REPLACE TABLE `dbt_bpuvvada.pre_aggregated_sales_trends` AS SELECT 
    d.FiscalYear_week AS FiscalWeek,
    ap.dimWarehouseKey AS Warehouse,
SUM(ap.PickedPieces) AS TotalSales
FROM retaildummy.vfactActualPieces ap
JOIN retaildummy.vdimDate d ON ap.dimActualDayDateKey = d.dimDateKey
GROUP BY FiscalWeek, Warehouse;