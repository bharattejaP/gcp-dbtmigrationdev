SELECT
    dimPlanDayDateKey,
    dimWarehouseKey,
    dimWarehouseHierarchyKey,
    SUM(PiecesAWToRW) AS TotalPiecesAWToRW,
    SUM(PiecesAWToStore) AS TotalPiecesAWToStore,
    SUM(PiecesMO) AS TotalPiecesMO,
    SUM(PickedPieces) AS TotalPickedPieces,
    SUM(PiecesAWAllocTotal) AS TotalPiecesAWAllocTotal,
    SUM(PiecesMOQ2) AS TotalPiecesMOQ2,
    SUM(PiecesAW) AS TotalPiecesAW
FROM retaildummy.vfactPlanPieces
GROUP BY dimPlanDayDateKey, dimWarehouseKey, dimWarehouseHierarchyKey