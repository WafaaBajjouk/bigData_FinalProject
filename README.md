# TPC-H Implementation and Query Optimization

## Overview

This project focuses on implementing and optimizing the TPC-H benchmark using PostgreSQL to enhance decision support query performance. The optimization strategies include advanced indexing techniques and the use of materialized views.

## Key Highlights

- **Database Creation and Population**: Set up a comprehensive TPC-H database schema and populated it with data using the TPC-H `dbgen` tool.
- **Initial Performance Analysis**: Evaluated initial query performance for time-based, type-based, and nation and region-based aggregations.
- **Optimization Techniques**:
  - **Indexing**: Created strategic indexes to improve query performance.
  - **Materialized Views**: Implemented materialized views for pre-computed query results.
  - **Indexed Materialized Views**: Enhanced materialized views with indexing for further performance gains.
- **Performance Improvements**: Achieved significant reductions in query execution times, with some queries optimized from over 27 seconds to just 116 milliseconds.
- **Space Constraint Verification**: Ensured that the space used for indexes and materialized views is within 1.5 times the size of the database.

## Repository Contents

- **SQL Scripts**: All SQL scripts used for database setup, data population, and query optimization.
- **Report**: Detailed report documenting the implementation, optimization strategies, and performance analysis.

## Contact

For any questions or further information, please contact [Author Name].

---

**Note**: Please ensure you have PostgreSQL installed and properly configured before running the SQL scripts. The detailed instructions for setting up and running the scripts are provided in the report.
