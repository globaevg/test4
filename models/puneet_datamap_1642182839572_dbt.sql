{{config(
	schema = "MODELS",
	materialized = "view"
)}}
WITH select_step1 as (
  SELECT
    "STAGE"."PAYMENTS"."ID" AS "ID",
    "STAGE"."PAYMENTS"."ORDER_ID" AS "ORDER_ID",
    "STAGE"."PAYMENTS"."PAYMENT_METHOD" AS "PAYMENT_METHOD",
    "STAGE"."PAYMENTS"."AMOUNT" AS "AMOUNT",
    {{ dbt_utils.current_timestamp() }} AS "ROW_TIME_STAMP"
  FROM
    "STAGE"."PAYMENTS"
)
SELECT
  *
FROM
  select_step1
LIMIT
  100