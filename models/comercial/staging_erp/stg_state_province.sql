with STATEPROVINCE as (
    select
    cast(stateprovinceid as int) as pk_estado
    , cast(name as varchar) as nome_do_estado
    , cast(countryregioncode as varchar) fk_pais
    from {{source('erp_northwind','STATEPROVINCE')}}
)
select * from STATEPROVINCE