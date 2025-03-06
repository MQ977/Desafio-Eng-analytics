with BUSINESSENTITYADDRESS as (
    select 
        cast(businessentityid as int) as fk_business
        , cast(addressid as int) as fk_endereco
    from {{ source('erp_northwind','BUSINESSENTITYADDRESS') }}
)
select * from BUSINESSENTITYADDRESS
