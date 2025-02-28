CREATE OR REPLACE MATERIALIZED VIEW retaildummy.vfactPlanHours_Agg AS
SELECT
    dimBusinessDayDateKey,
    dimWarehouseKey,
    dimWarehouseHierarchyKey,
    SUM(PaidHours) AS TotalPaidHours,
    SUM(EHTotal) AS TotalEHTotal,
    SUM(EHSales) AS TotalEHSales,
    SUM(EHDisplay) AS TotalEHDisplay,
    SUM(EHUnpacking) AS TotalEHUnpacking,
    SUM(EHOther) AS TotalEHOther,
    SUM(EHManagement) AS TotalEHManagement,
    SUM(EHEducation) AS TotalEHEducation,
    SUM(IHProdTotal) AS TotalIHProdTotal,
    SUM(IHOHTotal) AS TotalIHOHTotal,
    SUM(IHTotal) AS TotalIHTotal,
    SUM(IHVacationProd) AS TotalIHVacationProd,
    SUM(IHVacationOH) AS TotalIHVacationOH,
    SUM(IHVacation) AS TotalIHVacation,
    SUM(IHIllnessProd) AS TotalIHIllnessProd,
    SUM(IHIllnessOH) AS TotalIHIllnessOH,
    SUM(IHIllness) AS TotalIHIllness,
    SUM(IHOtherProd) AS TotalIHOtherProd,
    SUM(IHOtherOH) AS TotalIHOtherOH,
    SUM(IHOther) AS TotalIHOther,
    SUM(IH_Overhead_Other_PH) AS TotalIHOverheadOtherPH  -- Fixed column name
FROM retaildummy.vfactPlanHours
GROUP BY dimBusinessDayDateKey, dimWarehouseKey, dimWarehouseHierarchyKey;
