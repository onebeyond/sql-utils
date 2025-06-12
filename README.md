# SQL Utils

This repository is for containing any useful SQL Snippets for use in day-to-day programming. These should be largely generic in nature (ie: not project/codebase specific). Please document what each snippet does in this readme as well as any limitations (what SQL versions/libraries it's for).

### TableSize.sql

This lists all DB Tables in a database by size. Helpful for figuring out if there's any weird growth in a DB table, or if indexing might be required, without having to execute `SELECT COUNT(*)` which uses significant DB processing time .

- SQLServer specific.

### FirstRowOfEachTable.sql
This script lists the first row of each table with a column called "Id", where the data type is an "int"
and the value of that Id is 0. While that's quite specific, it gives an example on how to filter
table lists by values in their columns etc - so can be adapted to use nvarchar etc, change column
names etc. Useful for diagnosing strange cross-table problems.

- SQLServer specific.
