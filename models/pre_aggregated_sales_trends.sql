CREATE OR REPLACE TABLE `retaildummy.myfourthmodel` AS SELECT 
    d.FiscalYear_week AS FiscalWeek,
    ap.dimWarehouseKey AS Warehouse,
SUM(ap.PickedPieces) AS TotalSales
FROM retaildummy.vfactActualPieces ap
JOIN retaildummy.vdimDate d ON ap.dimActualDayDateKey = d.dimDateKey
GROUP BY FiscalWeek, Warehouse limit 10;