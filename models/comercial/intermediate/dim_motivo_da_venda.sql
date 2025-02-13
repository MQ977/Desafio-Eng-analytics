with SALESREASON as (
    select
    motivo_da_venda
    , cast(motivo_da_venda as varchar) as motivo
    from {{ref('stg_sales_reason')}}
)
select * from SALESREASON