with STORE as (
    select 
    cast(businessentityid as int) as pk_loja
    , cast(name as varchar) as nome_loja
    , cast(salespersonid as int) as fk_vendedor
    from {{source('erp_northwind', 'STORE')}}
)
select * from STORE