SELECT 
    dates.season,
    items.category,

    SUM(sales.quantity) AS quantity

FROM {{ref('factsale')}} sales

JOIN {{ref('dimdate')}} dates ON sales.datekey = dates.datekey
JOIN {{ref('dimitem')}} items ON sales.itemkey = items.itemkey

GROUP BY
    dates.season,
    items.category