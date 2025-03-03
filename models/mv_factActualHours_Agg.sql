CREATE OR REPLACE TABLE retaildummy.vfactActualHours_Agg AS
SELECT
    PARSE_DATE('%Y%m%d', CAST(dimWorkDayDateKey AS STRING)) AS dimWorkDayDateKey, 
    dimWarehouseKey,
    dimWarehouseHierarchyKey,
    SUM(ActualHours) AS TotalActualHours,
    SUM(PaidHours) AS TotalPaidHours,
    SUM(EHTotal) AS TotalEHTotal,
    SUM(EHSale) AS TotalEHSale,
    SUM(EHDisplay) AS TotalEHDisplay,
    SUM(EHEducation) AS TotalEHEducation,
    SUM(EHManagment) AS TotalEHManagment,
    SUM(EHOS) AS TotalEHOS,
    SUM(EHOther) AS TotalEHOther,
    SUM(IHIllness) AS TotalIHIllness,
    SUM(IHOther) AS TotalIHOther,
    SUM(IHVacation) AS TotalIHVacation,
    SUM(IHTotal) AS TotalIHTotal,
    SUM(IHIllnessProd) AS TotalIHIllnessProd,
    SUM(IHIllnessOH) AS TotalIHIllnessOH,
    SUM(IHProdTotal) AS TotalIHProdTotal,
    SUM(IHOHTotal) AS TotalIHOHTotal,
    SUM(IHVacationProd) AS TotalIHVacationProd,
    SUM(IHVacationOH) AS TotalIHVacationOH,
    SUM(IHOtherProd) AS TotalIHOtherProd,
    SUM(IHOtherOH) AS TotalIHOtherOH
FROM retaildummy.vfactActualHours
GROUP BY dimWorkDayDateKey, dimWarehouseKey, dimWarehouseHierarchyKey;