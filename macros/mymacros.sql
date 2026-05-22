{% macro usd_eur(col, scale=2) -%}

    ROUND(
        ({{ col }} * 0.86),
        {{ scale }}
    )::NUMBER(18, {{ scale }})

{%- endmacro %}