# SQL Utils

This repository is for containing any useful SQL Snippets for use in day-to-day programming. These should be largely generic in nature (ie: not project/codebase specific). Please document what each snippet does in this readme as well as any limitations (what SQL versions/libraries it's for).

### TableSize.sql

This lists all DB Tables in a database by size. Helpful for figuring out if there's any weird growth in a DB table, or if indexing might be required, without having to execute `SELECT COUNT(*)` which uses significant DB processing time .

- SQLServer specific.
