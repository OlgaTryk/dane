WITH sales AS(
    SELECT *
    FROM {{ref('stg_sales')}}
),

stores AS(
    SELECT *
    FROM {{ref('dimstore')}}
),

dates AS(
    SELECT * 
    FROM {{ref('dimdate')}}
),

clients AS(
    SELECT *
    FROM {{ref('dimclient')}}
),

items AS(
    SELECT *
    FROM {{ref('dimitem')}}
)

SELECT
    ROW_NUMBER() OVER (ORDER BY sales.id) AS salekey,
    stores.storekey as storekey,
    dates.datekey as datekey,
    clients.clientkey as clientkey,
    items.itemkey as itemkey,
    sales.unitprice,
    sales.quantity as quantity,
    sales.discount as discount,
    CAST(sales.quantity * sales.unitprice * (1 - sales.discount) AS numeric(10, 2))AS totalvalue

FROM sales

LEFT JOIN stores ON sales.storeid = stores.storeid
LEFT JOIN dates ON sales.orderdate = dates.fulldate
LEFT JOIN clients ON sales.clientid = clients.clientid
LEFT JOIN items ON sales.itemid = items.itemid

