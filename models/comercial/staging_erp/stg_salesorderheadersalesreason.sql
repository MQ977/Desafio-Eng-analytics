with SALESORDERHEADERSALESREASON as (
    select
    cast(SALESORDERID as int) fk_pedido
    , cast(SALESREASONID as int) fk_motivo_venda
    from {{(source('erp_northwind','SALESORDERHEADERSALESREASON'))}}
)
select * from SALESORDERHEADERSALESREASON
