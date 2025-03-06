with COUNTRYREGION as (
    select
    cast(countryregioncode as varchar) as pk_pais
    , cast(name as varchar) as nome_do_pais
    from {{source('erp_northwind','COUNTRYREGION')}}
)
select * from COUNTRYREGION