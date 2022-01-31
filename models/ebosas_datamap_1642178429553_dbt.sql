{{config(
	catalog = "hive",
	schema = "pm61devs3",
	materialized = "view"
)}}
WITH select_step1 as (
  SELECT
    "postgresql_newdashboards"."public"."pm61_summary_data"."metric" AS "metric",
    "postgresql_newdashboards"."public"."pm61_summary_data"."start_ts" AS "start_ts",
    "postgresql_newdashboards"."public"."pm61_summary_data"."end_ts" AS "end_ts"
  FROM
    "postgresql_newdashboards"."public"."pm61_summary_data"
)
SELECT
  *,
  {{ dbt_utils.datediff("'2018-01-01'", "'2018-01-20'", 'day') }} as date_diff
FROM
  select_step1
LIMIT
  100