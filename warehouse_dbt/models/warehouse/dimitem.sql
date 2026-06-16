WITH items AS(
    SELECT *
    FROM {{(ref('stg_items'))}}
)


SELECT
    ROW_NUMBER() OVER (ORDER BY items.id) AS itemkey,
    items.id AS itemid,
    items.name,
    items.brand,
    items.category
FROM items