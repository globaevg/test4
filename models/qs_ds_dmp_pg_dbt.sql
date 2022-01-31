{{config(
	schema = "public",
	materialized = "table"
)}}
WITH select_step1 as (
  SELECT
    "public"."pm61_users"."tenant_id" AS "tenant_id",
    "public"."pm61_users"."id" AS "id",
    "public"."pm61_users"."name" AS "name"
  FROM
    "public"."pm61_users"
)
SELECT
  *
FROM
  select_step1
LIMIT
  100