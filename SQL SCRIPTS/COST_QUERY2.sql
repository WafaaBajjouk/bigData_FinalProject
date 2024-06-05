EXPLAIN ANALYZE
WITH params AS (
    SELECT 'ECONOMY ANODIZED BRASS'::text AS type,
           'CANADA'::text AS exportingNation
)

SELECT
    P.P_TYPE AS Type,
    N1.N_NAME AS "Exporting nation",
    N2.N_NAME AS "Importing nation",
    SUM(L.L_EXTENDEDPRICE * (1 - L.L_DISCOUNT)) AS Revenue
FROM LINEITEM L
JOIN PART P ON L.L_PARTKEY = P.P_PARTKEY
JOIN ORDERS O ON L.L_ORDERKEY = O.O_ORDERKEY
JOIN CUSTOMER C ON O.O_CUSTKEY = C.C_CUSTKEY
JOIN SUPPLIER S ON L.L_SUPPKEY = S.S_SUPPKEY
JOIN NATION N1 ON S.S_NATIONKEY = N1.N_NATIONKEY  
JOIN NATION N2 ON C.C_NATIONKEY = N2.N_NATIONKEY 
JOIN params ON TRUE  
WHERE N1.N_NATIONKEY != N2.N_NATIONKEY
AND P.P_TYPE = params.type
AND N1.N_NAME = params.exportingNation
GROUP BY ROLLUP(P.P_TYPE, N1.N_NAME, N2.N_NAME)
ORDER BY Type, "Exporting nation", "Importing nation";
-- cost before indexes  (cost= 3228022.28..3228246.04 rows=2987 width=69) (actual time=49142.324..50016.339 rows=27 loops=1)
-- cost after indexes:  (cost=3215269.89..3215493.65 rows=2987 width=69)  (actual time=44479.155..45363.290 rows=27 loops=1)