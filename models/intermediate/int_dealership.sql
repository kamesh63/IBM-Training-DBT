{{ config(materialized='table') }}

select
    *,
    current_timestamp() as updated_date
from mkmotors_dv.staging.stg_dealership