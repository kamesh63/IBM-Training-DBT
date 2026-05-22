{{ config(materialized='ephemeral') }}

SELECT
    part_id,
    AVG(available_quantity) AS average_available_quantity,
    AVG(supply_cost) AS average_supply_cost

FROM {{ ref('supplier_parts') }}

GROUP BY part_id