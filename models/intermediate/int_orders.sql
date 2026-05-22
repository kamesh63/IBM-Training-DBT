-- SELECT *
-- FROM {{ ref('stg_orders') }}

{{ config(materialized='table') }}

SELECT
    ORDER_ID,
    CUSTOMER_ID,
    COMMENT,
    CLERK_NAME,

    ROUND(TOTAL_PRICE, 2) AS int_value_usd,

    {{ usd_eur('TOTAL_PRICE') }}
        AS int_value_eur,

    STATUS_CODE,
    ORDER_PRIORITY,
    SHIP_PRIORITY,
    ORDER_DATE,

FROM {{ ref('stg_orders') }}