WITH source AS (
    SELECT * FROM {{ source('file', 'raw_payments') }}
),

renamed AS (
    SELECT
        id AS payment_id,
        order_id,
        payment_method,
        amount / 100 AS amount
    FROM source
)

SELECT * FROM renamed
