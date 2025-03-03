SELECT
    PARSE_DATE('%Y%m%d', CAST(dimActualDayDateKey AS STRING)) AS dimActualDayDateKey,
    dimWarehouseKey,
    dimWarehouseHierarchyKey,
    SUM(PiecesAWToRW) AS TotalPiecesAWToRW,
    SUM(PiecesAWToStore) AS TotalPiecesAWToStore,
    SUM(PiecesMO) AS TotalPiecesMO,
    SUM(ListPieces) AS TotalListPieces,
    SUM(PickedPieces) AS TotalPickedPieces,
    SUM(PiecesAWAllocTotal) AS TotalPiecesAWAllocTotal,
    SUM(PiecesMOQ2) AS TotalPiecesMOQ2,
    SUM(PiecesAW) AS TotalPiecesAW
FROM retaildummy.vfactActualPieces
GROUP BY dimActualDayDateKey, dimWarehouseKey, dimWarehouseHierarchyKey