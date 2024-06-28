{% set as_is_relation=ref('orders') %}

{% set to_be_relation=ref('orders_new') %}

{{ audit_helper.compare_relations(
    a_relation=as_is_relation,
    b_relation=to_be_relation,
    exclude_columns=["created_at", "updated_at"],
    primary_key="order_id",
    summarize=true,
) }}
