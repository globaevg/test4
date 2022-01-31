{{config(
	schema = "public",
	materialized = "table"
)}}
WITH select_step1 as (
  SELECT
    "public"."sales"."salesid" AS "salesid",
    "public"."sales"."saletime" AS "saletime"
  FROM
    "public"."sales"
),
filter_step2 as (
  SELECT
    *
  FROM
    select_step1
  WHERE
    (
      select_step1."saletime" BETWEEN timestamp '2007-01-03 00:00:00'
      AND timestamp '2008-02-29 00:00:00'
    )
)
SELECT
  *
FROM
  filter_step2
LIMIT
  100