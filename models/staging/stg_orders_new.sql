WITH source AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

renamed AS (
    SELECT *
    FROM source
    where order_id <> 1
)

SELECT * FROM renamed
