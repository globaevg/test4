{{config(
	schema = "MODELS",
	materialized = "view"
)}}
WITH select_step1 as (
  SELECT
    "STAGE"."ORDERS"."ID" AS "ORDER_ID",
    "STAGE"."ORDERS"."USER_ID" AS "CUSTOMER_ID",
    "STAGE"."ORDERS"."ORDER_DATE" AS "ORDER_DATE",
    "STAGE"."ORDERS"."STATUS" AS "STATUS"
  FROM
    "STAGE"."ORDERS"
),
group_by_step2 as (
  SELECT
    select_step1."CUSTOMER_ID" AS "CUSTOMER_ID",
    CAST(Count("ORDER_ID") as INT) AS "number_of_orders",
    CAST(Min("ORDER_DATE") as DATE) AS "first_order_date",
    CAST(Max("ORDER_DATE") as DATE) AS "most_recent_order_date"
  FROM
    select_step1
  GROUP BY
    select_step1."CUSTOMER_ID"
),
join_step3 as (
  SELECT
    group_by_step2."CUSTOMER_ID" AS "CUSTOMER_ID",
    group_by_step2."number_of_orders" AS "number_of_orders",
    group_by_step2."first_order_date" AS "first_order_date",
    group_by_step2."most_recent_order_date" AS "most_recent_order_date",
    "STAGE"."CUSTOMERS"."FIRST_NAME" AS "FIRST_NAME",
    "STAGE"."CUSTOMERS"."LAST_NAME" AS "LAST_NAME",
    CAST(
      coalesce(group_by_step2."number_of_orders", 0) AS INT
    ) AS "total_order"
  FROM
    group_by_step2
    LEFT OUTER JOIN "STAGE"."CUSTOMERS" ON (
      group_by_step2."CUSTOMER_ID" = "STAGE"."CUSTOMERS"."ID"
    )
)
SELECT
  *
FROM
  join_step3
LIMIT
  100