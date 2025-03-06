with PRODUCTSUBCATEGORY as (
    select 
    cast(productsubcategoryid as int) pk_subcategoria
    , cast(productcategoryid as int) as fk_categoria
    , cast(name as varchar) as desc_subcategoria

    from {{ source('erp_northwind', 'PRODUCTSUBCATEGORY')}}
)
select * from PRODUCTSUBCATEGORY