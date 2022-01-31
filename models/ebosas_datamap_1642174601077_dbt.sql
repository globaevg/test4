{{config(
	catalog = "hive",
	schema = "pm61devs3",
	materialized = "view"
)}}
WITH select_step1 as (
  SELECT
    "hive"."pm61devs3"."car_sales_postgres"."sales" AS "sales",
    "hive"."pm61devs3"."car_sales_postgres"."date" AS "date",
    "hive"."pm61devs3"."car_sales_postgres"."month" AS "month"
  FROM
    "hive"."pm61devs3"."car_sales_postgres"
)
SELECT
  *
FROM
  select_step1
LIMIT
  100