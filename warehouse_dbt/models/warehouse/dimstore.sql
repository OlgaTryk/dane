WITH stores AS(
    SELECT *
    FROM {{ref('stg_stores')}}
),

addresses AS(
    SELECT *
    FROM {{ref('stg_address')}}
)


SELECT
    ROW_NUMBER() OVER (ORDER BY stores.id) AS storekey,
    stores.id AS storeid,
    stores.storetype,
    addresses.city,
    addresses.region,
    addresses.country
FROM stores

LEFT JOIN addresses ON stores.addressid = addresses.id