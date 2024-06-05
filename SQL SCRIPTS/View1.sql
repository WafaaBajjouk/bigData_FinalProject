CREATE MATERIALIZED VIEW MV_time_agg AS
SELECT
    EXTRACT(YEAR FROM L.L_SHIPDATE) AS Year,
    EXTRACT(QUARTER FROM L.L_SHIPDATE) AS Quarter,
    EXTRACT(MONTH FROM L.L_SHIPDATE) AS Month,
    P.P_TYPE AS Type,
    N1.N_NAME AS ExportingNation,
    N2.N_NAME AS ImportingNation,
    SUM(L.L_EXTENDEDPRICE * (1 - L.L_DISCOUNT)) AS Revenue
FROM LINEITEM L
JOIN ORDERS O ON L.L_ORDERKEY = O.O_ORDERKEY
JOIN CUSTOMER C ON O.O_CUSTKEY = C.C_CUSTKEY
JOIN SUPPLIER S ON L.L_SUPPKEY = S.S_SUPPKEY
JOIN PART P ON L.L_PARTKEY = P.P_PARTKEY
JOIN NATION N1 ON S.S_NATIONKEY = N1.N_NATIONKEY
JOIN NATION N2 ON C.C_NATIONKEY = N2.N_NATIONKEY
WHERE N1.N_NATIONKEY != N2.N_NATIONKEY
GROUP BY 
    ROLLUP(
        EXTRACT(MONTH FROM L.L_SHIPDATE), 
        EXTRACT(QUARTER FROM L.L_SHIPDATE), 
        EXTRACT(YEAR FROM L.L_SHIPDATE), 
        P.P_TYPE, 
        N1.N_NAME, 
        N2.N_NAME
    )
ORDER BY Year, Quarter, Month, Type, ExportingNation, ImportingNation;
-- the query using the view 
SELECT *
FROM MV_time_agg
WHERE Type = 'STANDARD POLISHED STEEL' 
AND ExportingNation = 'MOROCCO'
ORDER BY Year, Quarter, Month, Type, ExportingNation, ImportingNation;
--note :  considered a materialized view using the ROLLUP function directly within the view
--definition to pre-aggregate data. However, this
--approach resulted in fewer rows than expected when filtering by specific pa-
--rameters (Type and ExportingNation), which indicated that the pre-aggregation
--was causing discrepancies


--CORRECTED QUERY :
CREATE MATERIALIZED VIEW mv_export_import_revenue AS
SELECT
    EXTRACT(YEAR FROM L.L_SHIPDATE) AS Year,
    EXTRACT(QUARTER FROM L.L_SHIPDATE) AS Quarter,
    EXTRACT(MONTH FROM L.L_SHIPDATE) AS Month,
    P.P_TYPE AS Type,
    N1.N_NAME AS ExportingNation,
    N2.N_NAME AS ImportingNation,
    L.L_EXTENDEDPRICE * (1 - L.L_DISCOUNT) AS Revenue
FROM LINEITEM L
JOIN ORDERS O ON L.L_ORDERKEY = O.O_ORDERKEY
JOIN CUSTOMER C ON O.O_CUSTKEY = C.C_CUSTKEY
JOIN SUPPLIER S ON L.L_SUPPKEY = S.S_SUPPKEY
JOIN PART P ON L.L_PARTKEY = P.P_PARTKEY
JOIN NATION N1 ON S.S_NATIONKEY = N1.N_NATIONKEY
JOIN NATION N2 ON C.C_NATIONKEY = N2.N_NATIONKEY
WHERE N1.N_NATIONKEY != N2.N_NATIONKEY;















