{{config(
	catalog = "hive",
	schema = "pm61devs3",
	materialized = "view"
)}}
WITH select_step1 as (
  SELECT
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."PLAN_ID" AS "PLAN_ID",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."PLAN_NAME" AS "PLAN_NAME",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."MER" AS "MER",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."DISC" AS "DISC",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."PACKAGE" AS "PACKAGE",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."LEN" AS "LEN",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."ROLLUP1" AS "ROLLUP1",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."ASP" AS "ASP",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."STARTDATE" AS "STARTDATE",
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"."ENDDATE" AS "ENDDATE"
  FROM
    "oracle"."CUSTOMER_DEMO"."MASTER_PLAN_TABLE_WDATES"
),
join_step2 as (
  SELECT
    select_step1."PLAN_ID" AS "PLAN_ID",
    select_step1."PLAN_NAME" AS "PLAN_NAME",
    select_step1."MER" AS "MER",
    select_step1."DISC" AS "DISC",
    select_step1."PACKAGE" AS "PACKAGE",
    select_step1."LEN" AS "LEN",
    select_step1."ROLLUP1" AS "ROLLUP1",
    select_step1."ASP" AS "ASP",
    select_step1."STARTDATE" AS "STARTDATE",
    select_step1."ENDDATE" AS "ENDDATE",
    "snowflake"."SCHEMA_INFO"."FACT_SUBSCRIPTION_ACTIVITY"."SBSCRN_ID" AS "SBSCRN_ID",
    "snowflake"."SCHEMA_INFO"."FACT_SUBSCRIPTION_ACTIVITY"."ACTVTY_DT" AS "ACTVTY_DT",
    "snowflake"."SCHEMA_INFO"."FACT_SUBSCRIPTION_ACTIVITY"."DVC_KEY" AS "DVC_KEY",
    "snowflake"."SCHEMA_INFO"."FACT_SUBSCRIPTION_ACTIVITY"."EQMNT_KEY" AS "EQMNT_KEY"
  FROM
    select_step1
    LEFT OUTER JOIN "snowflake"."SCHEMA_INFO"."FACT_SUBSCRIPTION_ACTIVITY" ON (
      select_step1."PLAN_ID" = "snowflake"."SCHEMA_INFO"."FACT_SUBSCRIPTION_ACTIVITY"."PLAN_ID"
    )
),
group_by_step3 as (
  SELECT
    CAST(join_step2."PACKAGE" as varchar) AS "PACKAGE",
    CAST(join_step2."PLAN_NAME" as varchar) AS "PLAN_NAME",
    CAST(join_step2."LEN" as varchar) AS "LEN",
    CAST(Sum("MER") as INT) AS "Sum of MER"
  FROM
    join_step2
  GROUP BY
    join_step2."PACKAGE",
    join_step2."PLAN_NAME",
    join_step2."LEN"
)
{%- set terms = ["Annual", "Semi Annual", "Monthly", "Two Year", "Quarterly", "5 Months", "3 Year", "5 Year", "Lifetime", "2 Months", "4 Months", "TBD"] -%}
select
"PACKAGE", "PLAN_NAME", 
{%- for term in terms %}
sum(case when len = '{{term}}' then "Sum of MER" end) 
as TERM_{{dbt_utils.slugify(len)}}
{%- if not loop.last %},{% endif -%}
{% endfor %}
from group_by_step3
group by 1, 2