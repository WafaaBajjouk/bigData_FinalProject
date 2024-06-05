
EXPLAIN ANALYZE
SELECT type, ExportingNation, ImportingNation,sum(Revenue) As Revenue
FROM mv_export_import_revenue 
WHERE type = 'ECONOMY ANODIZED BRASS'
AND ExportingNation = 'CANADA'
GROUP BY ROLLUP(
			TYPE, 
			ExportingNation, 
			ImportingNation)
ORDER BY Type, ExportingNation, ImportingNation;

