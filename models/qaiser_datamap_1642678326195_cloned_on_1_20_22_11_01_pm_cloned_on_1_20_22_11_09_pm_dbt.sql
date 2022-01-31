{{config(
	catalog = "hive",
	schema = "pm61devs3",
	materialized = "view"
)}}
WITH select_step1 as (
  SELECT
    "hive"."pm61devs3"."maksim_datamap_1635261213325"."plan_name" AS "plan_name",
    "hive"."pm61devs3"."maksim_datamap_1635261213325"."package" AS "package"
  FROM
    "hive"."pm61devs3"."maksim_datamap_1635261213325"
)
SELECT
  *
FROM
  select_step1
LIMIT
  100