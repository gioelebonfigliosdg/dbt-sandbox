{% set as_is_relation=ref('orders') %}

{% set to_be_relation=ref('orders_new') %}

{{ audit_helper.compare_which_relation_columns_differ(
    a_relation=as_is_relation,
    b_relation=to_be_relation,
    primary_key_columns=["order_id"]
) }}
