-- This script lists the first row of each table with a column called "Id", where the data type is an "int"
-- and the value of that Id is 0. While that's quite specific, it gives an example on how to filter
-- table lists by values in their columns etc - so can be adapted to use nvarchar etc, change column
-- names etc. 

DECLARE @sql nvarchar(max) = N'';

SELECT @sql += N'

  SELECT TOP (1) [table] = N''' + REPLACE(t.name, '''','') + ''', [schema] = N''' + REPLACE(QUOTENAME(SCHEMA_NAME([t].[schema_id])), '''','') + ''', *
	FROM ' + QUOTENAME(SCHEMA_NAME([t].[schema_id]))
	+ '.' + QUOTENAME(t.name) + ' WHERE Id = 0;'
	FROM sys.tables as t
	INNER JOIN sys.columns c ON t.object_id = c.object_id
	INNER JOIN sys.types y ON y.user_type_id = c.user_type_id
	WHERE c.name = 'Id' and y.name like '%int%'
	ORDER BY t.schema_id, t.name
	;

PRINT @sql;
EXEC sys.sp_executesql @sql;