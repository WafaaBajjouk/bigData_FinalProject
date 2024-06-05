SELECT
    ExportingNation AS "Exporting nation",
    ExportingRegion AS "Exporting region",
    ImportingNation AS "Importing nation",
    ImportingRegion AS "Importing region",
    Type,
    SUM(Revenue) AS Revenue
FROM mv_export_import_revenue_region

WHERE Type = 'ECONOMY BRUSHED STEEL'
AND ExportingNation = 'ARGENTINA'
GROUP BY ROLLUP(ExportingNation, ExportingRegion, ImportingNation, ImportingRegion, Type)
ORDER BY "Exporting nation", "Exporting region", "Importing nation", "Importing region", Type;

-- before indexing : 56 secs 745 msec.
-- after indexing :  48 secs 363 msec.
-- after Mat View :  14 secs 108 msec.
-- after Mat View and indexing  :  61 msec.
