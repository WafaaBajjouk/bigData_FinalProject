-- LINEITEM 
CREATE INDEX idx_lineitem_orderkey_shipdate ON LINEITEM (L_ORDERKEY, L_SHIPDATE);  -- For joining with ORDERS and filtering by ship date
CREATE INDEX idx_lineitem_partkey_suppkey ON LINEITEM (L_PARTKEY, L_SUPPKEY);    -- For joining with PART and SUPPLIER
CREATE INDEX idx_lineitem_extendedprice_discount ON LINEITEM (L_EXTENDEDPRICE, L_DISCOUNT); -- For the SUM aggregation.
CREATE INDEX idx_lineitem_partkey_suppkey_orderkey ON LINEITEM (L_PARTKEY, L_SUPPKEY, L_ORDERKEY);
-- ORDERS 
CREATE INDEX idx_orders_custkey_orderdate ON ORDERS (O_CUSTKEY, O_ORDERDATE);    -- For joining with CUSTOMER and filtering by order date
-- CUSTOMER 
CREATE INDEX idx_customer_nationkey_custkey ON CUSTOMER (C_NATIONKEY, C_CUSTKEY);-- For joining with NATION and optimizing customer lookups
-- SUPPLIER 
CREATE INDEX idx_supplier_nationkey_suppkey ON SUPPLIER (S_NATIONKEY, S_SUPPKEY);-- For joining with NATION and optimizing supplier lookups
-- PART 
CREATE INDEX idx_part_type ON PART (P_TYPE);  -- For filtering by part type
CREATE INDEX idx_part_type_partkey ON PART (P_TYPE, P_PARTKEY);  -- For filtering by part type and optimizing part lookups
CREATE INDEX idx_part_partkey_type ON PART (P_PARTKEY, P_TYPE); -- For joining with LINEITEM and filtering by part type
-- NATION 
CREATE INDEX idx_nation_regionkey_nationkey ON NATION (N_REGIONKEY, N_NATIONKEY);-- For joining with REGION and optimizing nation lookups
CREATE INDEX idx_nation_name ON NATION (N_NAME);  --For filtering by nation names
-- REGION  
CREATE INDEX idx_region_name ON REGION (R_NAME);  --For filtering by region names

