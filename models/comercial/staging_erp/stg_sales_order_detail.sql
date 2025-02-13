with SALESORDERDETAIL as (
    select
    cast(salesorderid as int) as fk_salesorderid
    , cast(salesorderdetailid as int) as pk_salesorderdetaild
    , cast(carriertrackingnumber as varchar) as codigo_de_rastreamento
    , cast(orderqty as int) as quantidade_do_pedido
    , cast(productid as int) as fk_produto
    , cast(specialofferid as int) oferta_especial
    , cast(unitprice as numeric(18,2)) as preco_unitario
    , cast(unitpricediscount as int) as desconto
    , cast(rowguid as varchar) as guia
    , cast(TO_DATE(modifieddate) as date) as dt_modificacao
    , (unitprice * orderqty * (1 - coalesce(unitpricediscount, 0))) as valor_liq
    from {{source('erp_northwind','SALESORDERDETAIL')}}
    
)
select * from SALESORDERDETAIL
