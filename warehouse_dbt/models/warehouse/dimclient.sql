WITH clients AS (

    SELECT *
    FROM {{ ref('stg_clients') }}

),

addresses AS (

    SELECT *
    FROM {{ ref('stg_address') }}

)


SELECT
    ROW_NUMBER() OVER (ORDER BY clients.id) AS clientkey,
    clients.id AS clientid,
    clients.firstname,
    clients.lastname,
    clients.gender,
    CASE
        WHEN clients.age < 18 THEN '<18'
        WHEN clients.age BETWEEN 18 AND 24 THEN '18-24'
        WHEN clients.age BETWEEN 25 AND 34 THEN '25-34'
        WHEN clients.age BETWEEN 35 AND 49 THEN '35-49'
        WHEN clients.age BETWEEN 50 AND 64 THEN '50-64'
        ELSE '65+'
    END AS agegroup,
    addresses.city,
    addresses.region,
    addresses.country

FROM clients

LEFT JOIN addresses ON clients.addressid = addresses.id