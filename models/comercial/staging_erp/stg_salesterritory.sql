with SALESTERRITORY as (
    select 
        cast(territoryid as int) as pk_territorio
        , cast(name as varchar) as nome_territorio
        , cast(countryregioncode as varchar) as fk_pais
        , cast(salesytd as numeric(18,2)) as vendas_acumuladas
    from {{ source('erp_northwind', 'SALESTERRITORY') }}
)
select * from SALESTERRITORY