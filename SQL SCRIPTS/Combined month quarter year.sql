-- the parameters using a WITH clause
WITH
param_type AS (SELECT 'STANDARD POLISHED STEEL':: text AS type), 
param_exportingNation AS (SELECT 'MOROCCO':: text AS exportingNation)
	
SELECT
	EXTRACT (YEAR FROM L.L_SHIPDATE) AS Year,
	EXTRACT (QUARTER FROM L.L_SHIPDATE) AS Quarter,
	EXTRACT (MONTH FROM L.L_SHIPDATE) AS Month,
	P.P_TYPE AS Type,
	N1. N_NAME AS "Exporting nation", N2. N_NAME AS "Importing nation",
	SUM (L.L_EXTENDEDPRICE * (1 - L.L_DISCOUNT)) AS Revenue
FROM LINEITEM L
JOIN ORDERS O ON L.L_ORDERKEY = O.O_ORDERKEY
JOIN CUSTOMER C ON O.O_CUSTKEY = C.C_CUSTKEY
JOIN SUPPLIER S ON L.L_SUPPKEY = S.S_SUPPKEY
JOIN PART P ON L.L_PARTKEY = P.P_PARTKEY
JOIN NATION N1 ON S.S_NATIONKEY = N1. N_NATIONKEY
JOIN NATION N2 ON C.C_NATIONKEY = N2. N_NATIONKEY
WHERE   N1.N_NATIONKEY != N2.N_NATIONKEY
		AND P.P_TYPE = (SELECT type FROM param_type)
		AND N1.N_NAME = (SELECT exportingNation FROM param_exportingNation)
--aggregate the data first by month, then roll up to the quarter, and finally to the year,
GROUP BY ROLLUP
	(EXTRACT 
	(MONTH FROM L.L_SHIPDATE), 
	EXTRACT (QUARTER FROM L. L_SHIPDATE) ,
	EXTRACT (YEAR FROM L.L_SHIPDATE),
	P.P_TYPE,
	N1.N_NAME, 
	N2.N_NAME)
ORDER BY Year, Quarter, Month, Type, "Exporting nation", "Importing nation";