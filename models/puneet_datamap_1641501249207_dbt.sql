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
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."SBSCRN_ACTVTY_KEY" AS "SBSCRN_ACTVTY_KEY",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."SBSCRN_ID" AS "SBSCRN_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."ACTVTY_TYPE_ID" AS "ACTVTY_TYPE_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."USED_ACTVTY_TYPE_ID" AS "USED_ACTVTY_TYPE_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."ACTVTY_DT" AS "ACTVTY_DT",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."ACTVTY_TS" AS "ACTVTY_TS",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."HHLD_ID" AS "HHLD_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."PRTY_KEY" AS "PRTY_KEY",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."PRTY_ID" AS "PRTY_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."PARNT_ACCT_KEY" AS "PARNT_ACCT_KEY",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."PARNT_ACCT_ID" AS "PARNT_ACCT_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."PARNT_ACCT_NUM" AS "PARNT_ACCT_NUM",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."CHILD_ACCT_KEY" AS "CHILD_ACCT_KEY",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."CHILD_ACCT_ID" AS "CHILD_ACCT_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."CHILD_ACCT_NUM" AS "CHILD_ACCT_NUM",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."VEH_KEY" AS "VEH_KEY",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."DVC_KEY" AS "DVC_KEY",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."dvc_id" AS "dvc_id",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."EQMNT_KEY" AS "EQMNT_KEY",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."EQMNT_ID" AS "EQMNT_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."PLAN_KEY" AS "PLAN_KEY",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."PLAN_ID" AS "PLAN_ID1",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."OFR_ID" AS "OFR_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."FROM_PLAN_KEY" AS "FROM_PLAN_KEY",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."FROM_PLAN_ID" AS "FROM_PLAN_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."FROM_OFR_ID" AS "FROM_OFR_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."PROD_KEY" AS "PROD_KEY",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."PROD_ID" AS "PROD_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."FROM_PROD_KEY" AS "FROM_PROD_KEY",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."FROM_PROD_ID" AS "FROM_PROD_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."PKG_ID" AS "PKG_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."FROM_PKG_ID" AS "FROM_PKG_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."FEAT_ID" AS "FEAT_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."AGN_KEY" AS "AGN_KEY",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."cust_rep_id" AS "cust_rep_id",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."PTNR_ID" AS "PTNR_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."LNKD_INET_FL" AS "LNKD_INET_FL",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."MRD_TYPE_CD" AS "MRD_TYPE_CD",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."SBSCR_LIFCYC_KEY" AS "SBSCR_LIFCYC_KEY",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."CONV_REP_OWN_SEGMT_KEY" AS "CONV_REP_OWN_SEGMT_KEY",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."OWNR_TYPE2_KEY" AS "OWNR_TYPE2_KEY",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."DEACTIVATION_REASON_CODE" AS "DEACTIVATION_REASON_CODE",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."TRIAL_ID" AS "TRIAL_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."SRVC_ID" AS "SRVC_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."RENW_ID" AS "RENW_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."FROM_RENW_ID" AS "FROM_RENW_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."COLL_SCNRO_ID" AS "COLL_SCNRO_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."SRVC_LVL_PMT_KEY" AS "SRVC_LVL_PMT_KEY",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."NONPAY_SRVC_KEY" AS "NONPAY_SRVC_KEY",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."BILLING_METHOD" AS "BILLING_METHOD",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."FROM_BILLING_METHOD" AS "FROM_BILLING_METHOD",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."SLFPAY_TURNOVER_RSN" AS "SLFPAY_TURNOVER_RSN",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."SLFPAY_TURNOVER_DT" AS "SLFPAY_TURNOVER_DT",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."FUTURE_DEACTVN_DT" AS "FUTURE_DEACTVN_DT",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."SCHD_SEASONAL_SUSP_REACTVN_DT" AS "SCHD_SEASONAL_SUSP_REACTVN_DT",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."Call_Reason" AS "Call_Reason",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."Call_Disposition" AS "Call_Disposition",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."INSE_USER_ID" AS "INSE_USER_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."INSE_TS" AS "INSE_TS",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."UPDT_USER_ID" AS "UPDT_USER_ID",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."UPDT_TS" AS "UPDT_TS",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."Save_Activity" AS "Save_Activity",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."Deact_Activity_By_Save_Agent" AS "Deact_Activity_By_Save_Agent",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."Conversion_Activity_By_Save_Agent" AS "Conversion_Activity_By_Save_Agent",
    "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."Save_Opportunity_Activity" AS "Save_Opportunity_Activity"
  FROM
    select_step1
    LEFT OUTER JOIN "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY" ON (
      select_step1."PLAN_ID" = "mysql"."customer_demo"."FACT_SUBSCRIPTION_ACTIVITY"."PLAN_ID"
    )
)
SELECT
  *
FROM
  join_step2
LIMIT
  100