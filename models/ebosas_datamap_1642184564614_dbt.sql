{{config(
	catalog = "hive",
	schema = "pm61devs3",
	materialized = "view"
)}}
WITH select_step1 as (
  SELECT
    "mysql_galaxy"."customer_demo"."automotive_sales_by_country"."Date" AS "Date",
    "mysql_galaxy"."customer_demo"."automotive_sales_by_country"."USA" AS "USA"
  FROM
    "mysql_galaxy"."customer_demo"."automotive_sales_by_country"
)
SELECT
  *,
  {{ dbt_utils.current_timestamp() }} as "now"
FROM
  select_step1
LIMIT
  100