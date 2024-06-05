
CREATE INDEX idx_mv_revenue_type_exportingnation_year_quarter_month
ON mv_export_import_revenue (Type, ExportingNation, Year, Quarter, Month);

CREATE INDEX idx_mv_revenue_type_exporting_importing_nation
ON mv_export_import_revenue (Type, ExportingNation, ImportingNation);





CREATE INDEX idx_mv_revenue_region_type_exporting_importing
ON mv_export_import_revenue_region (Type, ExportingNation, ExportingRegion, ImportingNation, ImportingRegion);
