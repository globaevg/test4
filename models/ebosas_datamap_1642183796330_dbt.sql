{{config(
	catalog = "hive",
	schema = "pm61devs3",
	materialized = "view"
)}}
WITH select_step1 as (
  SELECT
    "postgresql_dev_all_tenats"."public"."pm61_users"."tenant_id" AS "tenant_id",
    "postgresql_dev_all_tenats"."public"."pm61_users"."id" AS "id",
    "postgresql_dev_all_tenats"."public"."pm61_users"."name" AS "name"
  FROM
    "postgresql_dev_all_tenats"."public"."pm61_users"
)
SELECT
  *,
  {{ dbt_utils.datediff("'2018-01-01'", "'2018-01-20'", 'day') }} as date_diff
FROM
  select_step1
LIMIT
  100