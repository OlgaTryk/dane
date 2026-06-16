SELECT 
    id,
    orderdate,
    clientid,
    storeid,
    itemid,
    COALESCE(quantity,0) as quantity,
    cast(
        replace(
            replace(
                replace(regexp_replace(unitprice, '[^0-9,.\u00A0 ]', '', 'g'), chr(160), '')
                ,'.', ''
                ),
                ',', '.'
            ) as numeric(10, 2)
        ) as unitprice,
    cast ((coalesce(discount, 0) / 100.0) as numeric(10, 2))as discount
FROM raw.sales