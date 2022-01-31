{{config(
	catalog = "hive",
	schema = "pm61devs3",
	materialized = "view"
)}}
WITH select_step1 as (
  SELECT
    "mysql"."customer_demo"."DIM_AGENT"."AGENT_ROLE_END_DATE" AS "AGENT_ROLE_END_DATE",
    "mysql"."customer_demo"."DIM_AGENT"."ACTIVATION_SOURCE" AS "ACTIVATION_SOURCE"
  FROM
    "mysql"."customer_demo"."DIM_AGENT"
)
SELECT
  *
FROM
  select_step1
LIMIT
  100