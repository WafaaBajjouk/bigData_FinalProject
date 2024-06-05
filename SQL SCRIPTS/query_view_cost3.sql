EXPLAIN ANALYZE
SELECT
    ExportingNation AS "Exporting nation",
    ExportingRegion AS "Exporting region",
    ImportingNation AS "Importing nation",
    ImportingRegion AS "Importing region",
    TYPE,
    SUM(Revenue) AS Revenue
FROM mv_export_import_revenue_region
WHERE TYPE = 'ECONOMY BRUSHED STEEL'
AND ExportingNation = 'ARGENTINA'
GROUP BY ROLLUP(ExportingNation, ExportingRegion, ImportingNation, ImportingRegion, TYPE)
ORDER BY "Exporting nation", "Exporting region", "Importing nation", "Importing region", TYPE;
