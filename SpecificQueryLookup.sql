SELECT
    q.query_id,
    q.last_execution_time
    p.plan_id,
    p.is_forced_plan,
    p.force_failure_count,
    p.last_compile_start_time,
    p.count_compiles,
    rsi.start_time,
    rsi.end_time,
    rs.execution_type_desc,
    rs.count_executions,
    rs.avg_duration / 1000.0        AS avg_duration_ms,
    rs.max_duration / 1000.0        AS max_duration_ms,
    rs.avg_cpu_time / 1000.0        AS avg_cpu_ms,
    rs.avg_logical_io_reads,
    (rs.avg_logical_io_reads * 8)/(1024*1024) AS 'Read (GB)', -- This may be excessive in most use cases, but if this is returning numbers bigger than 1 you probably have a problem
    rs.avg_rowcount
FROM sys.query_store_query q
JOIN sys.query_store_plan p            ON q.query_id = p.query_id
JOIN sys.query_store_runtime_stats rs  ON p.plan_id = rs.plan_id
JOIN sys.query_store_runtime_stats_interval rsi ON rs.runtime_stats_interval_id = rsi.runtime_stats_interval_id
-- Some optional filters
-- WHERE q.last_execution_time > '2026-02-15' AND q.last_execution_time < '2026-02-17'
-- WHERE q.object_id = OBJECT_ID('INSERT NAME HERE') (useful for stored proces)
ORDER BY q.last_execution_time ASC 
-- rs.avg_logical_io_reads DESC, p.plan_id;
