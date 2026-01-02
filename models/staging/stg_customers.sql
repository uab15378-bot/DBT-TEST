with source as (
    -- This function tells dbt to look at your YAML definition
    select * from {{ source('snowflake_sample', 'customer') }}
),

renamed as (
    select
        c_custkey as customer_id,
        c_name as customer_name,
        c_address as address,
        c_phone as phone_number,
        c_acctbal as account_balance,
        c_nationkey as nation_key,
        c_mktsegment as market_segment,
        c_comment as comment
    from source
)

select * from renamed