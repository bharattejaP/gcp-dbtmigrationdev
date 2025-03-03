SELECT
    dimBudgetDayDateKey
    dimWarehouseKey,
    dimWarehouseHierarchyKey,
    SUM(PiecesAWToRW) AS TotalPiecesAWToRW,
    SUM(PiecesAWToStore) AS TotalPiecesAWToStore,
    SUM(PiecesMO) AS TotalPiecesMO,
    SUM(PickedPieces) AS TotalPickedPieces,
    SUM(PiecesAWAllocTotal) AS TotalPiecesAWAllocTotal,
    SUM(PiecesMOQ2) AS TotalPiecesMOQ2,
    SUM(PiecesMO) AS TotalPiecesAW
FROM retaildummy.vfactBudgetPieces
GROUP BY dimBudgetDayDateKey, dimWarehouseKey, dimWarehouseHierarchyKey