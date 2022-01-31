{{config(
	schema = "MODELS",
	materialized = "view"
)}}
WITH select_step1 as (
  SELECT
    "STAGE"."ORDERS"."ID" AS "ID",
    "STAGE"."ORDERS"."USER_ID" AS "USER_ID",
    "STAGE"."ORDERS"."ORDER_DATE" AS "ORDER_DATE",
    "STAGE"."ORDERS"."STATUS" AS "STATUS"
  FROM
    "STAGE"."ORDERS"
)
SELECT
  *
FROM
  select_step1
LIMIT
  100