with SPECIALOFFERPRODUCT as (
    select
    cast(specialofferid as int) as fk_oferta
    , cast(productid as int) as fk_produto
    from {{ source("erp_northwind",'SPECIALOFFERPRODUCT')}}
)
select * from SPECIALOFFERPRODUCT