with c as (

    select 
        customer_id,
        name as customer_name,
        address,
        phone_number,
        account_balance,
        market_segment,
        nation_id,
        comment
    from {{ ref('stg_customers') }}

),

n as (

    select 
        nation_id,
        name as nation_name,
        region_id
    from {{ ref('stg_nations') }}

),

r as (

    select 
        region_id,
        name as region_name
    from {{ ref('stg_regions') }}

)

select 
    c.* exclude(nation_id, comment),
    n.nation_name,
    r.region_name,
    c.comment

from c

join n 
    on c.nation_id = n.nation_id

join r 
    on n.region_id = r.region_id