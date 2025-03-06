with PRODUCT as (
    select 
    cast(productid as int) as pk_produto
    , cast(name as varchar) as nome_do_produto
    , cast(productnumber as varchar) as cod_produto
    , cast(listprice as float) as preco_produto
    , cast(productsubcategoryid as int) as fk_subcategoria
    from {{ source('erp_northwind','PRODUCT') }}
)

select * from PRODUCT
