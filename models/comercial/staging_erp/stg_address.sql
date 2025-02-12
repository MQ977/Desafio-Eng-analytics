with ADDRESS as (
    select
    cast(addressid as int) as pk_endereco
    , cast(addressline1 as varchar) as des_endereco
    , cast(city as varchar) as cidade
    , cast(stateprovinceid as int) as fk_estado

    from {{source('erp_northwind','ADDRESS')}}
)
select * from ADDRESS