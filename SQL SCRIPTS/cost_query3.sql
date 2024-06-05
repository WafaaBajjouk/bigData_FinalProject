EXPLAIN ANALYZE
WITH params AS (
    SELECT 'ECONOMY BRUSHED STEEL'::text AS type,
           'ARGENTINA'::text AS exportingNation
)
SELECT
    N1.N_NAME AS "Exporting nation",
    R1.R_NAME AS "Exporting region",
    N2.N_NAME AS "Importing nation",
    R2.R_NAME AS "Importing region",
    P.P_TYPE AS Type,
    SUM(L.L_EXTENDEDPRICE * (1 - L.L_DISCOUNT)) AS Revenue
FROM LINEITEM L
JOIN ORDERS O ON L.L_ORDERKEY = O.O_ORDERKEY
JOIN CUSTOMER C ON O.O_CUSTKEY = C.C_CUSTKEY
JOIN SUPPLIER S ON L.L_SUPPKEY = S.S_SUPPKEY
JOIN PART P ON L.L_PARTKEY = P.P_PARTKEY
JOIN NATION N1 ON S.S_NATIONKEY = N1.N_NATIONKEY  
JOIN NATION N2 ON C.C_NATIONKEY = N2.N_NATIONKEY  
JOIN REGION R1 ON N1.N_REGIONKEY = R1.R_REGIONKEY  
JOIN REGION R2 ON N2.N_REGIONKEY = R2.R_REGIONKEY 
JOIN params ON TRUE  
WHERE N1.N_NATIONKEY != N2.N_NATIONKEY
AND P.P_TYPE = params.type
AND N1.N_NAME = params.exportingNation
GROUP BY ROLLUP(N1.N_NAME, R1.R_NAME, N2.N_NAME, R2.R_NAME, P.P_TYPE)
ORDER BY "Exporting nation", "Exporting region", "Importing nation", "Importing region", Type;
-- cost before indexing : cost=3418118.21..3418366.78 rows=4405 width=205) (actual time=54157.594..55233.941 rows=75 loops=1)
-- cost after indexing  : cost=3405365.82..3405614.39 rows=4405 width=205) (actual time=53634.637..54638.633 rows=75 loops=1)