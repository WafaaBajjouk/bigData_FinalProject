--time based aggregation query 

SELECT  month, quarter ,year, TYPE, 
		ExportingNation,ImportingNation,sum(Revenue) As Revenue
FROM mv_export_import_revenue
WHERE TYPE = 'STANDARD POLISHED STEEL'
AND ExportingNation = 'MOROCCO'
GROUP BY ROLLUP(month,quarter ,year, TYPE, ExportingNation, ImportingNation)
ORDER BY Year, Quarter, Month, Type, ExportingNation, ImportingNation;
--before indexing :27sec 336 msec
--after indexing : 15 secs 181 msec.
--after Mat View : 12 secs 144 msec.
--after mat view and indexng :  116 msec.