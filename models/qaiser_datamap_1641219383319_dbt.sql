{{config(
	catalog = "hive",
	schema = "pm61devs3",
	materialized = "view"
)}}
WITH select_step1 as (
  SELECT
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."PLAN_ID" AS "PLAN_ID",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."PLAN_NAME" AS "PLAN_NAME",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."MER" AS "MER"
  FROM
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"
),
group_by_step2 as (
  SELECT
    select_step1."PLAN_ID" AS "PLAN_ID",
    Max("MER") as "MaxRevenue"
  FROM
    select_step1
  GROUP BY
    select_step1."PLAN_ID"
),
join_step3 as (
  SELECT
    group_by_step2."PLAN_ID" AS "PLAN_ID",
    group_by_step2."MaxRevenue" AS "MaxRevenue",
    "oracle"."CUSTOMER_DEMO"."FACT_SUBSCRIPTION_ACTIVITY"."SBSCRN_ACTVTY_KEY" AS "SBSCRN_ACTVTY_KEY",
    "oracle"."CUSTOMER_DEMO"."FACT_SUBSCRIPTION_ACTIVITY"."SBSCRN_ID" AS "SBSCRN_ID",
    CAST("group_by_step2"."MaxRevenue" AS varchar) AS "newReve"
  FROM
    group_by_step2
    LEFT OUTER JOIN "oracle"."CUSTOMER_DEMO"."FACT_SUBSCRIPTION_ACTIVITY" ON (
      cast(group_by_step2."PLAN_ID" AS VARCHAR) != "oracle"."CUSTOMER_DEMO"."FACT_SUBSCRIPTION_ACTIVITY"."ACTVTY_TS"
    )
)
SELECT
  *
FROM
  join_step3
LIMIT
  100