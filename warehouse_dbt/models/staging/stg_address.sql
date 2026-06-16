SELECT
    id,
    nullif(trim(initcap(city)),'') as city,
    nullif(trim(initcap(region)),'') as region,
    nullif(trim(initcap(country)),'') as country
FROM raw.address