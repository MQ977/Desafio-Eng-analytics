with SALESORDERDETAIL as (
    select
    cast(salesorderid as int) as fk_pedido
    , cast(salesorderdetailid as int) as pk_item_venda
    , cast(orderqty as int) as quantidade_do_pedido
    , cast(productid as int) as fk_produto
    , cast(specialofferid as int) oferta_especial
    , cast(unitprice as numeric(18,2)) as preco_unitario
    , cast(unitpricediscount as int) as desconto_preco_unitario
    from {{source('erp_northwind','SALESORDERDETAIL')}}
    
)
select * from SALESORDERDETAIL 
