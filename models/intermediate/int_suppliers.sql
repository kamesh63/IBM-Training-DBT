-- SELECT *
-- FROM {{ ref('stg_suppliers') }}



SELECT
    supplier_id,
    nation_id,
    supplier_name,
    supplier_address,
    phone_number,
    comment,

    -- USD
    account_balance AS account_balance_usd,

    -- EUR
    {{ usd_eur('account_balance') }}
        AS account_balance_eur,

    CURRENT_TIMESTAMP() AS updated_time

FROM {{ ref('stg_suppliers') }}