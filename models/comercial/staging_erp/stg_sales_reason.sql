with SALESREASON as (
    select
        cast(salesreasonid as int) as pk_numero_venda
        , cast(name as varchar) as motivo_da_venda
        , cast(reasontype as varchar) as motivo_complementar
    from {{ source('erp_northwind', 'SALESREASON') }}
)
select * from SALESREASON