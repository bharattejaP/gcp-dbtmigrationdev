SELECT
    dimAllocationDateKey,
    dimWarehouseKey,
    dimProductSeasonKey,
    dimProductOrganizationKey,
    dimDistributionPackModeKey,
    dimCurrencyKey,
    dimToShopKey,
    dimDeliveryTypeKey,
    dimCountryKey,
    SUM(AllocatedPieces) AS TotalAllocatedPieces,
    SUM(AllocationGrossAmountCC) AS TotalAllocationGrossAmountCC,
    SUM(UnitPieces) AS TotalUnitPieces
FROM retaildummy.vfactAllocation
GROUP BY dimAllocationDateKey, dimWarehouseKey, dimProductSeasonKey, dimProductOrganizationKey, dimDistributionPackModeKey, dimCurrencyKey, dimToShopKey, dimDeliveryTypeKey, dimCountryKey