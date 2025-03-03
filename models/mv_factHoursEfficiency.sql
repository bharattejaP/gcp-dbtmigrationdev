CREATE VIEW retaildummy.vfactHoursEfficiency AS
SELECT
    p.dimBusinessDayDateKey,
    p.dimWarehouseKey,
    p.dimWarehouseHierarchyKey,
    IFNULL(p.TotalPaidHours, 0) AS PlannedHours,
    IFNULL(a.TotalPaidHours, 0) AS ActualHours,
    CASE
        WHEN IFNULL(p.TotalPaidHours, 0) = 0 THEN NULL
        ELSE (IFNULL(a.TotalPaidHours, 0) - IFNULL(p.TotalPaidHours, 0)) * 1.0 / IFNULL(p.TotalPaidHours, 0)
    END AS HoursEfficiencyVariance
FROM mimetic-setup-451414-e7.retaildummy.mv_factplanhours_agg p
FULL OUTER JOIN mimetic-setup-451414-e7.retaildummy.mv_factActualHours_Agg
 a 
ON p.dimBusinessDayDateKey = a.dimWorkDayDateKey
AND p.dimWarehouseKey = a.dimWarehouseKey
AND p.dimWarehouseHierarchyKey = a.dimWarehouseHierarchyKey;
