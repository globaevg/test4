{{config(
	catalog = "snowflake",
	schema = "DATA_PIPELINE",
	materialized = "table"
)}}
WITH select_step1 as (
  SELECT
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."PLAN_ID" AS "PLAN_ID",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."PLAN_NAME" AS "PLAN_NAME",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."MER" AS "MER"
  FROM
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"
)
SELECT
  *
FROM
  select_step1
LIMIT
  100