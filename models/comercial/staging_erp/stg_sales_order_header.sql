with 
SALESORDERHEADER as (
    select 
        cast(salesorderid as int) as pk_ID
        , cast(TO_DATE(orderdate) as date) as dt_pedido
        , cast(subtotal as numeric(18,2)) as subtotal
        , cast(taxamt as numeric(18,2)) as imposto
        , cast(freight as numeric(18,2)) as frete
        , cast(totaldue as numeric(18,2)) as valor_total
        , cast(customerid as int) as fk_cliente
        , cast(salespersonid as int) as fk_vendedor
    from {{ source('erp_northwind','SALESORDERHEADER') }}
)

select * 
from SALESORDERHEADER
