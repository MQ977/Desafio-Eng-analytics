with PRODUCTCATEGORY as (
    select
    cast(PRODUCTCATEGORYID as int) as pk_categoria
    , cast(name as varchar) as desc_categoria
    from {{ source('erp_northwind','PRODUCTCATEGORY')}}
)
select * from PRODUCTCATEGORY