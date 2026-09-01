SELECT
    p.plan_id,
    p.is_forced_plan,
    p.last_compile_start_time,
    TRY_CAST(p.query_plan AS XML) AS query_plan_xml
FROM sys.query_store_plan p
WHERE p.plan_id = --PLAN ID;