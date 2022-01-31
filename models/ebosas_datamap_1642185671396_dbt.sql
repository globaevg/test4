{{config(
	schema = "MODELS",
	materialized = "view"
)}}
WITH select_step1 as (
  SELECT
    "STAGE"."STG_ORDERS"."ORDER_ID" AS "ORDER_ID",
    "STAGE"."STG_ORDERS"."CUSTOMER_ID" AS "CUSTOMER_ID",
    "STAGE"."STG_ORDERS"."ORDER_DATE" AS "ORDER_DATE",
    "STAGE"."STG_ORDERS"."STATUS" AS "STATUS",
    {{ dbt_utils.datediff("'2018-01-01'", "'2018-01-20'", 'day') }} as date_diff
  FROM
    "STAGE"."STG_ORDERS"
)
SELECT
  *
FROM
  select_step1
LIMIT
  100