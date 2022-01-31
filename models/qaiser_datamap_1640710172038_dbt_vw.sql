{{config(
	catalog = "snowflake",
	schema = "DATA_PIPELINE",
	materialized = "view"
)}}
WITH select_step1 as (
  SELECT
    "SCHEMA_INFO"."MASTER_PLAN_TABLE_WDATES"."PLAN_NAME" AS "PLAN_NAME"
  FROM
    "SCHEMA_INFO"."MASTER_PLAN_TABLE_WDATES"
)
SELECT
  *
FROM
  select_step1
LIMIT
  100