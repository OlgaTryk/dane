SELECT
    clients.agegroup,
    clients.gender,
    items.category,
    items.brand,

    SUM(sales.totalvalue) AS revenue,
    SUM(sales.quantity) AS units,
    COUNT(*) AS transactions

FROM {{ref('factsale')}} sales

JOIN {{ref('dimclient')}} clients ON sales.clientkey = clients.clientkey
JOIN {{ref('dimitem')}} items ON sales.itemkey = items.itemkey

GROUP BY CUBE(
    clients.agegroup,
    clients.gender,
    items.category,
    items.brand
)

