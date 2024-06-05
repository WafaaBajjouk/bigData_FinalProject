SELECT type, ExportingNation, ImportingNation,sum(Revenue) As Revenue
FROM mv_export_import_revenue 
WHERE type = 'ECONOMY ANODIZED BRASS'
AND ExportingNation = 'CANADA'
GROUP BY ROLLUP(
			TYPE, 
			ExportingNation, 
			ImportingNation)
ORDER BY Type, ExportingNation, ImportingNation;
--before indexing    48 secs 560 msec.
-- afteer indexing :  45 secs 591 msec.
-- after Mat View : 14 secs 618 msec.
-- after Mat View and indexing  :  49 msec.
