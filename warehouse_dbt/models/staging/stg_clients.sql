SELECT
    id,
    nullif(trim(initcap(firstname)),'') as firstname,
    nullif(trim(initcap(lastname)),'') as lastname,
    coalesce(gender, 'Unknown') as gender,
    date_part('year', age(current_date, birthdate)) AS age,
    addressid
FROM raw.clients