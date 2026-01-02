{% macro mask_email(column_name) -%}
    -- This logic keeps the first letter, masks the rest of the username, 
    -- and keeps the domain name visible.
    regexp_replace(
        {{ column_name }}, 
        '^(.)[^@]+', 
        '\\1*****'
    )
{%- endmacro %}