WITH DateRange AS (
    SELECT 
        MIN(DateDesc) AS MinDate,
        MAX(DateDesc) AS MaxDate
    FROM retaildummy.vdimDate
    WHERE DateDesc BETWEEN '2022-08-12' AND '2025-02-01'
)
SELECT
    wh.ProfitCenter,
    SUM(ap.PiecesAW) AS PiecesAW_ACT,
    SUM(CASE WHEN d.DateDesc BETWEEN dr.MinDate AND dr.MaxDate THEN ap.PiecesAWToStore ELSE 0 END) AS PiecesAWToStore_ACT,
    SUM(ap.PiecesMO) AS PiecesMO_ACT,
    SUM(ap.PiecesAWToRW) AS PiecesAWToRW_ACT,
    SUM(CASE WHEN d.DateDesc BETWEEN dr.MinDate AND dr.MaxDate THEN ap.ListPieces ELSE 0 END) AS ListPieces_ACT,
    SUM(CASE WHEN d.DateDesc BETWEEN dr.MinDate AND dr.MaxDate THEN ap.PickedPieces ELSE 0 END) AS PickedPieces_ACT,
    SUM(CASE WHEN d.DateDesc BETWEEN dr.MinDate AND dr.MaxDate THEN ap.PiecesAWAllocTotal ELSE 0 END) AS PiecesAWAllocTotal_ACT,
    SUM(ap.PiecesMOQ2) AS PiecesMOQ2_ACT,
    (SUM(ah.IHIllness) / NULLIF(SUM(ah.EHTotal) - SUM(ah.EHDisplay), 0)) AS Illness_ACT,
    (SUM(ah.EHDisplay) / NULLIF(SUM(ah.EHTotal), 0)) AS ManpowerPercent_ACT,
    (SUM(ah.IHVacation) / NULLIF(SUM(ah.EHTotal) - SUM(ah.EHDisplay), 0)) AS Vacation_ACT,
    (SUM(CASE WHEN d.DateDesc BETWEEN dr.MinDate AND dr.MaxDate THEN ap.PickedPieces ELSE 0 END) +
     SUM(CASE WHEN d.DateDesc BETWEEN dr.MinDate AND dr.MaxDate THEN ap.PiecesAWToStore ELSE 0 END) +
     SUM(ap.PiecesAW) + SUM(ap.PiecesMO)) / NULLIF(SUM(ah.EHTotal), 0) AS Takt1_ACT,
    (SUM(CASE WHEN d.DateDesc BETWEEN dr.MinDate AND dr.MaxDate THEN ap.PickedPieces ELSE 0 END) +
     SUM(CASE WHEN d.DateDesc BETWEEN dr.MinDate AND dr.MaxDate THEN ap.PiecesAWToStore ELSE 0 END) +
     SUM(ap.PiecesAW) + SUM(ap.PiecesMO)) / NULLIF(SUM(ah.PaidHours), 0) AS Takt2_ACT
FROM
    retaildummy.vfactActualPieces_partitioned ap
JOIN
    retaildummy.vdimWarehouseFinanceHierarchy wh ON ap.dimWarehouseHierarchyKey = wh.dimWarehouseFinanceHierarchykey
JOIN
    retaildummy.vfactActualHours_partitioned ah ON ap.dimWarehouseHierarchyKey = ah.dimWarehouseHierarchyKey 
    AND ap.dimActualDayDateKey = ah.dimWorkDayDateKey
JOIN
    retaildummy.vdimDate_partitioned d ON ap.dimActualDayDateKey = d.dimDateKey
JOIN
    DateRange dr ON 1=1
WHERE wh.Path = (SELECT MIN(Path) FROM retaildummy.vdimWarehouseFinanceHierarchy)
GROUP BY
    wh.ProfitCenter