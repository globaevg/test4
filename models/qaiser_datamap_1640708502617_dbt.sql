{{config(
	catalog = "snowflake",
	schema = "DATA_PIPELINE",
	materialized = "table"
)}}
SELECT
  "SCHEMA_INFO"."MASTER_PLAN_TABLE_WDATES"."PLAN_ID" AS "PLAN_ID"
FROM
  "SCHEMA_INFO"."MASTER_PLAN_TABLE_WDATES"
LIMIT
  7