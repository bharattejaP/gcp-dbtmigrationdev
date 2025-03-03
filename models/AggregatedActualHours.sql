INSERT INTO AggregatedActualHours
SELECT
    wh.ProfitCenter,
    SUM(ah.EHOS) AS ServiceHoursACT,
    SUM(ah.PaidHours) AS PaidHoursACT,
    SUM(ah.IHIllness) AS IllnessHoursACT,
    SUM(ah.EHDisplay) AS TemporaryStaffHoursACT,
    SUM(ah.EHEducation) AS EducationHoursACT,
    SUM(ah.EHOther) AS OtherEffectiveHoursACT,
    SUM(ah.IHOther) AS OtherInEffectiveHoursACT,
    SUM(ah.EHTotal) AS EffectiveHoursACT
FROM
    vfactActualHours ah
JOIN
    vdimWarehouseFinanceHierarchy wh ON ah.dimWarehouseHierarchyKey = wh.dimWarehouseFinanceHierarchykey
GROUP BY
    wh.ProfitCenter;