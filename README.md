**AWS + Snowflake + dbt Data Engineering Pipeline (Medallion Architecture)**

**Overview**
This project implements a modern data engineering pipeline leveraging:
1. AWS S3 as the cloud data lake (raw data storage)
2. Snowflake as the cloud data warehouse
3. dbt (Data Build Tool) for transformation, modeling, and lineage
4. Medallion Architecture (Bronze → Silver → Gold) for modular, scalable data processing
5. Incremental ingestion for efficient CDC (Change Data Capture)

**Tech Stack**
- Storage	--> AWS S3
- Warehousing	--> Snowflake
- Transformation --> dbt Core
- Security --> IAM Role + Storage Integration
- Modeling --> Jinja SQL / dbt Macros
- Ingestion --> COPY INTO + dbt
- Format --> CSV
- Architecture --> Medallion (Bronze/Silver/Gold)

**Security & Access Control**
Snowflake uses:
1. Storage Integrations
2. External Stages
3. IAM Role Trust Policies

**Data Model**
1. Bronze Layer
- Mirrors raw staging data
- Incremental ingestion logic
- Minimal transformation
- Timestamp-based filtering using dbt {{ this }}

2. Silver Layer
- Cleans data
- Standardizes types
- Removes nulls/duplicates
- Handles joins

3. Gold Layer
- Star-schema dimensional modeling
- Business logic
- Fact + Dimension tables

**How to Run**
1. Clone repo:  git clone (https://github.com/sanchirkksharma/AWS-Snowflake-dbt-Medallion-Architecture.git)

2. Create & activate virtual environment:
python -m venv .venv
source .venv/bin/activate   # mac
.venv\Scripts\activate      # windows

3. Install dependencies: pip install dbt-core dbt-snowflake

4. Test connection: dbt debug

5. Compile: dbt compile

6. Run models: dbt run