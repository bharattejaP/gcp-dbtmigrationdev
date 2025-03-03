CREATE VIEW retaildummy.vfactPiecesPerHour AS
SELECT
    a.dimActualDayDateKey,
    a.dimWarehouseKey,
    a.dimWarehouseHierarchyKey,
    IFNULL(a.TotalPickedPieces, 0) AS TotalPickedPieces,
    IFNULL(h.TotalActualHours, 0) AS TotalActualHours,
    CASE
        WHEN IFNULL(h.TotalActualHours, 0) = 0 THEN 0
        ELSE IFNULL(a.TotalPickedPieces, 0) * 1.0 / IFNULL(h.TotalActualHours, 0)
    END AS PiecesPickedPerHour
FROM mimetic-setup-451414-e7.retaildummy.mv_factplanpieces_agg a
JOIN mimetic-setup-451414-e7.retaildummy.mv_factActualHours_Agg h 
ON a.dimActualDayDateKey = h.dimWorkDayDateKey
AND a.dimWarehouseKey = h.dimWarehouseKey
AND a.dimWarehouseHierarchyKey = h.dimWarehouseHierarchyKey;
