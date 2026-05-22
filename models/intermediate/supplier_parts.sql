{{ config(materialized='ephemeral') }}

WITH supplier_parts AS (

    SELECT
        s.supplier_id,
        s.nation_id,
        s.supplier_name,
        s.account_balance,

        ps.part_id,
        ps.available_quantity,
        ps.supply_cost,

        p.name,
        p.type,
        p.size,
        p.manufacturer,
        p.brand,
        p.container,
        p.retail_price

    FROM {{ ref('stg_suppliers') }} s

    JOIN {{ ref('stg_partsupps') }} ps
        ON s.supplier_id = ps.supplier_id

    JOIN {{ ref('stg_parts') }} p
        ON ps.part_id = p.part_id

)

SELECT
    supplier_id,
    nation_id,
    supplier_name,
    account_balance,

    available_quantity,
    supply_cost,

    part_id,
    name AS part_name,
    manufacturer AS part_manufacturer,
    brand AS part_brand,
    type AS part_type,
    size AS part_size,
    container AS part_container,
    retail_price AS part_retail_price

FROM supplier_parts