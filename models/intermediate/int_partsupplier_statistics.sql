SELECT

    AVAILABLE_QUANTITY * SUPPLY_COST AS int_value_usd,

    {{ usd_eur('AVAILABLE_QUANTITY * SUPPLY_COST') }}
        AS int_value_eur,

    p.RETAIL_PRICE - ps.SUPPLY_COST AS unit_margin,

    ROUND(
        (
            (p.RETAIL_PRICE - ps.SUPPLY_COST)
            / NULLIF(p.RETAIL_PRICE, 0)
        ) * 100,
        2
    ) AS margin_percent,

    CASE
        WHEN s.ACCOUNT_BALANCE > 5000
            THEN 'PREMIUM'

        WHEN s.ACCOUNT_BALANCE <= 5000
            THEN 'STANDARD'

        ELSE 'RISK'
    END AS supplier_financial_health,

    CASE
        WHEN s.PHONE_NUMBER IS NULL
             OR s.SUPPLIER_ADDRESS IS NULL
            THEN FALSE

        ELSE TRUE
    END AS supplier_data_status,

    CASE
        WHEN ps.SUPPLY_COST > p.RETAIL_PRICE
            THEN FALSE

        ELSE TRUE
    END AS margin_status_normal

FROM {{ ref('stg_parts') }} p

JOIN {{ ref('stg_partsupps') }} ps
    ON p.PART_ID = ps.PART_ID

JOIN {{ ref('stg_suppliers') }} s
    ON ps.SUPPLIER_ID = s.SUPPLIER_ID