{{config(
	catalog = "hive",
	schema = "pm61devs3",
	materialized = "view"
)}}
WITH select_step1 as (
  SELECT
    "oracle"."CUSTOMER_DEMO"."FACT_SUBSCRIPTION_ACTIVITY"."SBSCRN_ID" AS "SBSCRN_ID"
  FROM
    "oracle"."CUSTOMER_DEMO"."FACT_SUBSCRIPTION_ACTIVITY"
)
SELECT
  *
FROM
  select_step1
LIMIT
  100