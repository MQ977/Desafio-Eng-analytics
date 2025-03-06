with SALESPERSON as (
    select 
        cast(businessentityid as int) as pk_vendedor
        , cast(SALESYTD as int) id
        , cast(territoryid as int) as fk_territorio
        , cast(salesquota as numeric (18,2)) as cota_de_venda
    from {{ source('erp_northwind', 'SALESPERSON') }}
)

select * from SALESPERSON
