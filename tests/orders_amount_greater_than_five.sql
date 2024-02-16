select amount
from {{ref('stg_payments')}}
where amount <= 5
