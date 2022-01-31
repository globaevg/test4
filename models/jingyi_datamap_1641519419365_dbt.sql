{{config(
	catalog = "hive",
	schema = "pm61devs3",
	materialized = "view"
)}}
WITH select_step1 as (
  SELECT
    "hive"."pm61devs3"."jingyi_datamap_1641514612216_mqt"."agent_role_end_date" AS "agent_role_end_date",
    "hive"."pm61devs3"."jingyi_datamap_1641514612216_mqt"."activation_source" AS "activation_source"
  FROM
    "hive"."pm61devs3"."jingyi_datamap_1641514612216_mqt"
)
SELECT
  *
FROM
  select_step1
LIMIT
  100