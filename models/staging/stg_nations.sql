{{ config(materialized='table') }}


with stg_nation as (
    select
      n_nationkey as nation_id,
      n_regionkey as region_id,
      n_name as name,
      n_comment as comment
    from SOURCEDB.MK_MALL.NATIONS
)

select * from stg_nation