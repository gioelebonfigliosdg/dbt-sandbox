{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'merge',
        merge_exclude_columns = ['created_at'],
        unique_key = 'order_id'
    )
}}

{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}

WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

payments AS (
    SELECT * FROM {{ ref('stg_payments') }}
),

order_payments AS (
    SELECT
        order_id,
        {% for payment_method in payment_methods -%}
            SUM(
                CASE WHEN payment_method = '{{ payment_method }}' THEN amount ELSE 0 END
            ) AS {{ payment_method }}_amount,
        {% endfor -%}
        SUM(amount) AS total_amount
    FROM payments
    {{ dbt_utils.group_by(n=1) }}

),

final AS (
    SELECT
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        CASE
            WHEN orders.status = 'completed' THEN 'ok'
            ELSE orders.status
        END AS status,
        {% for payment_method in payment_methods -%}
            order_payments.{{ payment_method }}_amount,
        {% endfor -%}
        order_payments.total_amount AS amount,
        NOW() AS created_at,
        NOW() AS updated_at
    FROM orders
    LEFT JOIN order_payments
        ON orders.order_id = order_payments.order_id
)

SELECT * FROM final
