{% set as_is_query %}
select * from {{ ref('orders')}}
{% endset %}

{% set to_be_query %}
select * from {{ ref('orders_new')}}
{% endset %}

{{ audit_helper.compare_queries(
    a_query=as_is_query,
    b_query=to_be_query,
    primary_key="order_id",
    summarize=false,
) }}
