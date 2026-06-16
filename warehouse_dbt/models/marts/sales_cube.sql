SELECT 
    dates.year,
    dates.quarter,
    dates.month,
    stores.region,
    stores.city,
    items.category,
    SUM(sales.totalvalue) AS revenue,
    SUM(sales.quantity) AS quantity

FROM {{ref('factsale')}} sales

JOIN {{ref('dimdate')}} dates ON sales.datekey = dates.datekey
JOIN {{ref('dimstore')}} stores ON sales.storekey = stores.storekey
JOIN {{ref('dimitem')}} items ON sales.itemkey = items.itemkey


WHERE stores.storetype != 'online'

GROUP BY CUBE(
    dates.year,
    dates.quarter,
    dates.month,
    stores.region,
    stores.city,
    items.category
)