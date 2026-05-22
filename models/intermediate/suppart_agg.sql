{{ config(materialized='table') }}

SELECT
    sp.*,
    ac.average_available_quantity,
    ac.average_supply_cost

FROM {{ ref('supplier_parts') }} sp

JOIN {{ ref('average_cost') }} ac
    ON ac.part_id = sp.part_id