
SELECT 
    d.FiscalYear_week AS FiscalWeek,
    ap.dimWarehouseKey AS Warehouse,
    SUM(ap.PickedPieces) AS TotalSales
FROM retaildummy.vfactActualPieces as ap
JOIN retaildummy.vdimDate as d 
    ON ap.dimActualDayDateKey = d.dimDateKey
GROUP BY d.FiscalYear_week, ap.dimWarehouseKey
