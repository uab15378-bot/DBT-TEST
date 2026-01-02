with raw_customers as (
    select * from {{ source('snowflake_sample', 'customer') }}
)

select
    c_custkey as customer_id,
    c_name as customer_name,
    -- Using your new masking macro
    {{ mask_email('c_address') }} as masked_address_info
from raw_customers