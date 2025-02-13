with PRODUCT as (
    select
    pk_produto
    , cast(nome_do_produto as varchar) as nome_do_produto
    , cast(fk_subcategoria as int) as fk_subcategoria
    from {{ref('stg_product')}}
)
select * from PRODUCT