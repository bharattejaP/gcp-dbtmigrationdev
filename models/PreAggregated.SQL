WITH PreAggregated AS (
    SELECT
        ah.dimWarehouseHierarchyKey,
        ah.dimWorkDayDateKey AS ActualDate,
        SUM(ah.EHOS) AS ServiceHoursACT,
        SUM(ah.PaidHours) AS PaidHoursACT,
        SUM(ah.IHIllness) AS IllnessHoursACT,
        SUM(ah.EHDisplay) AS TemporaryStaffHoursACT,
        SUM(ah.EHEducation) AS EducationHoursACT,
        SUM(ah.EHOther) AS OtherEffectiveHoursACT,
        SUM(ah.IHOther) AS OtherInEffectiveHoursACT,
        SUM(ah.EHTotal) AS EffectiveHoursACT
    FROM
        `retaildummy.vfactActualHours_partitioned` ah
    GROUP BY
        ah.dimWarehouseHierarchyKey, ah.dimWorkDayDateKey
)
SELECT
    wh.ProfitCenter,
    pa.ActualDate,
    pa.ServiceHoursACT,
    pa.PaidHoursACT,
    pa.IllnessHoursACT,
    pa.TemporaryStaffHoursACT,
    pa.EducationHoursACT,
    pa.OtherEffectiveHoursACT,
    pa.OtherInEffectiveHoursACT,
    pa.EffectiveHoursACT
FROM
    PreAggregated pa
JOIN
    `retaildummy.vdimWarehouseFinanceHierarchy_deduplicated` wh ON pa.dimWarehouseHierarchyKey = wh.dimWarehouseFinanceHierarchyKey