SELECT
    items.category,
    items.brand,

    SUM(sales.totalvalue) AS revenue,
    SUM(sales.quantity) AS quantity

FROM {{ref('factsale')}} sales

JOIN {{ref('dimitem')}} items ON sales.itemkey = items.itemkey

GROUP BY
    items.category,
    items.brand