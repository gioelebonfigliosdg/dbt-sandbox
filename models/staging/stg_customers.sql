WITH source AS (
    SELECT * FROM {{ source('file', 'raw_customers') }}
),

renamed AS (
    SELECT
        id AS customer_id,
        first_name,
        last_name
    FROM source
)

SELECT * FROM renamed
