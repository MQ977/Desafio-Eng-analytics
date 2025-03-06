    with SALESORDERHEADER as (
    select 
        cast(salesorderid as int) as pk_pedido
        , cast(status as int) as status
        , cast(purchaseordernumber as varchar) as numero_pedido
        , cast(TO_DATE(orderdate) as date) as dt_pedido
        , cast(subtotal as numeric(18,2)) as subtotal
        , cast(taxamt as numeric(18,2)) as imposto
        , cast(freight as numeric(18,2)) as frete
        , cast(totaldue as numeric(18,2)) as valor_total
        , cast(customerid as int) as fk_cliente
        , cast(salespersonid as int) as fk_vendedor
        , cast(territoryid as int) as fk_territorio
        , cast(billtoaddressid as int) as cod_endereco
        , cast(shiptoaddressid as int) cod_endereco_novo
        , cast(creditcardid as int) as fk_cartao
        , cast(currencyrateid as int) as fk_moeda
    from {{ source ('erp_northwind','SALESORDERHEADER') }}
)
SELECT * FROM SALESORDERHEADER