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
JOIN NATION N1 ON S.S_NATIONKEY = N1.N_NATIONKEY  -- Exporting nation
JOIN NATION N2 ON C.C_NATIONKEY = N2.N_NATIONKEY  -- Importing nation
WHERE N1.N_NATIONKEY != N2.N_NATIONKEY
GROUP BY ROLLUP(P.P_TYPE,N1.N_NAME, N2.N_NAME)
ORDER BY Type;