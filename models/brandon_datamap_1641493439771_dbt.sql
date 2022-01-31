{{config(
	catalog = "hive",
	schema = "pm61devs3",
	materialized = "view"
)}}
WITH select_step1 as (
  SELECT
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."SBSCRN_ID" AS "SBSCRN_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."ACTVTY_TYPE_ID" AS "ACTVTY_TYPE_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."USED_ACTVTY_TYPE_ID" AS "USED_ACTVTY_TYPE_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."PLAN_KEY" AS "PLAN_KEY",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."PLAN_ID" AS "PLAN_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."PROD_ID" AS "PROD_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."PKG_ID" AS "PKG_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."TRIAL_ID" AS "TRIAL_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."RENW_ID" AS "RENW_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."BILLING_METHOD" AS "BILLING_METHOD"
  FROM
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"
),
join_step2 as (
  SELECT
    select_step1."SBSCRN_ID" AS "SBSCRN_ID",
    select_step1."ACTVTY_TYPE_ID" AS "ACTVTY_TYPE_ID",
    select_step1."USED_ACTVTY_TYPE_ID" AS "USED_ACTVTY_TYPE_ID",
    select_step1."PLAN_KEY" AS "PLAN_KEY",
    select_step1."PLAN_ID" AS "PLAN_ID",
    select_step1."PROD_ID" AS "PROD_ID",
    select_step1."PKG_ID" AS "PKG_ID",
    select_step1."TRIAL_ID" AS "TRIAL_ID",
    select_step1."RENW_ID" AS "RENW_ID",
    select_step1."BILLING_METHOD" AS "BILLING_METHOD",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."PLAN_NAME" AS "PLAN_NAME",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."MER" AS "MER",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."DISC" AS "DISC",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."PACKAGE" AS "PACKAGE",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."LEN" AS "LEN",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."ROLLUP1" AS "ROLLUP1",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."STARTDATE" AS "STARTDATE",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."ENDDATE" AS "ENDDATE"
  FROM
    select_step1
    LEFT OUTER JOIN "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES" ON (
      select_step1."PLAN_ID" = "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."PLAN_ID"
    )
)
SELECT
  *
FROM
  join_step2
LIMIT
  100