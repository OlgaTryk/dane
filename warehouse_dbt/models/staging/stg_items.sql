SELECT
    id,
    NULLIF(TRIM(INITCAP(name)), '') as name,
    NULLIF(TRIM(brand), '') as brand,
    NULLIF(TRIM(LOWER(category)), '') as category
FROM raw.items
