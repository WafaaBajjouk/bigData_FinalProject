-- to load the data generated from the tool , save the same order for avoiding constraint integrity errors 
COPY REGION FROM '/Users/wafaabajjouk/BigData/TPC-H/dbgen/data/region.csv' DELIMITER '|' CSV;
COPY NATION FROM '/Users/wafaabajjouk/BigData/TPC-H/dbgen/data/nation.csv' DELIMITER '|' CSV;
COPY PART FROM '/Users/wafaabajjouk/BigData/TPC-H/dbgen/data/part.csv' DELIMITER '|' CSV;
COPY SUPPLIER FROM '/Users/wafaabajjouk/BigData/TPC-H/dbgen/data/supplier.csv' DELIMITER '|' CSV;
COPY PARTSUPP FROM '/Users/wafaabajjouk/BigData/TPC-H/dbgen/data/partsupp.csv' DELIMITER '|' CSV;
COPY CUSTOMER FROM '/Users/wafaabajjouk/BigData/TPC-H/dbgen/data/customer.csv' DELIMITER '|' CSV;
COPY ORDERS FROM '/Users/wafaabajjouk/BigData/TPC-H/dbgen/data/orders.csv' DELIMITER '|' CSV;
COPY LINEITEM FROM '/Users/wafaabajjouk/BigData/TPC-H/dbgen/data/lineitem.csv' DELIMITER '|' CSV;