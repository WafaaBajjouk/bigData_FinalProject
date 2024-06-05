-- Number of rows in each table
SELECT 'REGION' AS TableName, COUNT(*) AS RowCount FROM REGION
UNION ALL
SELECT 'NATION', COUNT(*) FROM NATION
UNION ALL
SELECT 'PART', COUNT(*) FROM PART
UNION ALL
SELECT 'SUPPLIER', COUNT(*) FROM SUPPLIER
UNION ALL
SELECT 'PARTSUPP', COUNT(*) FROM PARTSUPP
UNION ALL
SELECT 'CUSTOMER', COUNT(*) FROM CUSTOMER
UNION ALL
SELECT 'ORDERS', COUNT(*) FROM ORDERS
UNION ALL
SELECT 'LINEITEM', COUNT(*) FROM LINEITEM;

-- Table sizes in bytes
SELECT 
    relname AS TableName, 
    pg_size_pretty(pg_total_relation_size(relid)) AS TotalSize
FROM 
    pg_catalog.pg_statio_user_tables
ORDER BY 
    pg_total_relation_size(relid) DESC;