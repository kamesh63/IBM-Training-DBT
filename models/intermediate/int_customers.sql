with combined as (
    select 
        c.customer_id,
        c.name as customer_name, 
        c.address,
        c.phone_number,
        c.account_balance,
        c.market_segment,
        n.name as nation_name,
        n.comment
    from {{ ref('stg_customers') }} c 
    join {{ ref('stg_nations') }} n
        on c.nation_id = n.nation_id 
)

select * from combined
