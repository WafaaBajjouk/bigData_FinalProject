SELECT pg_size_pretty(SUM(size_bytes)) AS total_size
FROM (
    SELECT pg_total_relation_size('idx_lineitem_orderkey_shipdate') AS size_bytes
    UNION ALL
    SELECT pg_total_relation_size('idx_lineitem_partkey_suppkey')
    UNION ALL
    SELECT pg_total_relation_size('idx_lineitem_extendedprice_discount')
    UNION ALL
    SELECT pg_total_relation_size('idx_lineitem_partkey_suppkey_orderkey')
    UNION ALL
    SELECT pg_total_relation_size('idx_orders_custkey_orderdate')
    UNION ALL
    SELECT pg_total_relation_size('idx_customer_nationkey_custkey')
    UNION ALL
    SELECT pg_total_relation_size('idx_supplier_nationkey_suppkey')
    UNION ALL
    SELECT pg_total_relation_size('idx_part_type')
    UNION ALL
    SELECT pg_total_relation_size('idx_part_type_partkey')
    UNION ALL
    SELECT pg_total_relation_size('idx_part_partkey_type')
    UNION ALL
    SELECT pg_total_relation_size('idx_nation_regionkey_nationkey')
    UNION ALL
    SELECT pg_total_relation_size('idx_nation_name')
) AS total;
