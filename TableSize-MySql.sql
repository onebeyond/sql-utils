SELECT
    table_name AS "Table",
    ROUND(((data_length + index_length) / 1024 / 1024), 2) AS "Size (MB)",
    TABLE_ROWS AS "Row Count"
    FROM information_schema.TABLES
    WHERE table_schema = 'INSERT DATABASE NAME HERE'
    ORDER BY (data_length + index_length) DESC;