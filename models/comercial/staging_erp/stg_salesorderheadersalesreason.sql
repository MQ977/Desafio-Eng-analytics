with SALESORDERHEADERSALESREASON as (
    select
    cast(salesorderid as int) fk_pedido
    , cast(salesreasonid as int) fk_motivo_venda
    from {{(source('erp_northwind','SALESORDERHEADERSALESREASON'))}}
)
select * from SALESORDERHEADERSALESREASON
