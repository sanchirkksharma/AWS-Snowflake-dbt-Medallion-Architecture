select * from LISTINGS;

CREATE OR REPLACE STORAGE INTEGRATION s3_int
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = S3
  ENABLED = TRUE
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::007466042166:role/snowflake_s3_role'
  STORAGE_ALLOWED_LOCATIONS = ('s3://snowflake-dbt-project-bucket/source/');

  DESC INTEGRATION s3_int;

  CREATE OR REPLACE FILE FORMAT csv_format
  TYPE = CSV
  FIELD_DELIMITER = ','
  SKIP_HEADER = 1
  FIELD_OPTIONALLY_ENCLOSED_BY = '"'
  TRIM_SPACE = TRUE
  NULL_IF = ('', 'NULL', 'null');


  CREATE OR REPLACE STAGE snowstage
  URL='s3://snowflake-dbt-project-bucket/source/'
  STORAGE_INTEGRATION = s3_int
  FILE_FORMAT = csv_format;

COPY INTO HOSTS
FROM @snowstage
FILES = ('hosts.csv')


