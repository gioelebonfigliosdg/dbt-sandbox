{% set as_is_query %}
select * from {{ ref('orders')}}
{% endset %}

{% set to_be_query %}
select * from {{ ref('orders_new')}}
{% endset %}

{% set audit_query = audit_helper.compare_column_values(
    a_query=as_is_query,
    b_query=to_be_query,
    primary_key="order_id",
    column_to_compare="status"
) %}

{{ audit_query }}
