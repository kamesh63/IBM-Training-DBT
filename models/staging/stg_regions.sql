{{ config(materialized='table') }}

with outreg as (
   select 
     r_regionkey as region_id, 
     r_name as name, 
     r_comment as comment
   from SOURCEDB.MK_MALL.REGIONS
)


select * from outreg