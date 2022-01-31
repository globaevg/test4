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
),
join_step2 as (
  SELECT
    select_step1."ID" AS "ID",
    select_step1."USER_ID" AS "USER_ID",
    select_step1."ORDER_DATE" AS "ORDER_DATE",
    select_step1."STATUS" AS "STATUS",
    "STAGE"."CUSTOMERS"."FIRST_NAME" AS "FIRST_NAME",
    "STAGE"."CUSTOMERS"."LAST_NAME" AS "LAST_NAME"
  FROM
    select_step1
    LEFT OUTER JOIN "STAGE"."CUSTOMERS" ON (select_step1."ID" = "STAGE"."CUSTOMERS"."ID")
)
SELECT
  *
FROM
  join_step2
LIMIT
  100