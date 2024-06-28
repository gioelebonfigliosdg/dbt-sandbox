{% set as_is_relation=ref('orders') %}

{% set to_be_relation=ref('orders_new') %}

{{
  audit_helper.compare_all_columns(
    a_relation=as_is_relation,
    b_relation=to_be_relation,
    primary_key="order_id"
  )
}}
