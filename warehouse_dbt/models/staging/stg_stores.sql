SELECT
    id,
    NULLIF(TRIM(LOWER(storetype)),'') as storetype,
    addressid
FROM raw.stores