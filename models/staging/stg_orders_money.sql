with raw_orders as (
    -- Use the source we defined earlier
    select * from {{ source('snowflake_sample', 'orders') }}
)

select
    o_orderkey as order_id,
    -- Here we use your actual macro on a real column
    {{ cents_to_dollars('o_totalprice') }} as amount_usd
from raw_orders