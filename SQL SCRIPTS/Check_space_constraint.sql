SELECT pg_size_pretty(pg_database_size('TPCH-Project')) AS total_db_size;
WITH index_size AS (
    SELECT sum(pg_relation_size(indexrelid::regclass)) AS total_index_size
    FROM pg_index
),
matview_size AS (
    SELECT sum(pg_total_relation_size(c.oid)) AS total_matview_size
    FROM pg_class c
    JOIN pg_namespace n ON n.oid = c.relnamespace
    WHERE c.relkind = 'm'
),
db_size AS (
    SELECT pg_database_size('TPCH-Project') AS total_db_size
)
SELECT 
    pg_size_pretty(i.total_index_size) AS total_index_size,
    pg_size_pretty(m.total_matview_size) AS total_matview_size,
    pg_size_pretty(d.total_db_size) AS total_db_size,
    pg_size_pretty(d.total_db_size * 1.5) AS max_allowed_size,
    pg_size_pretty(i.total_index_size + m.total_matview_size) AS total_used_size,
    CASE 
	        WHEN i.total_index_size + m.total_matview_size < d.total_db_size * 1.5 
	        THEN 'Space constraint satisfied'
	        ELSE 'Space constraint not satisfied'
    END AS constraint_status
FROM index_size i, matview_size m, db_size d;
