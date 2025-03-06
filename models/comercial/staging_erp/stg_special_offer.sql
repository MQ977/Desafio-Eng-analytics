with SPECIALOFFER as (
    select
    cast(specialofferid as int) as pk_oferta
    , cast(description as varchar) as descricao
    , cast(discountpct as numeric(18,2)) as desconto
    , cast(type as varchar) as tipo_de_desconto
    , cast(category as varchar) as categoria
    , cast(minqty as int) as quantidade_minima
    , cast(maxqty as int) as quantidade_maxima
    from {{ source('erp_northwind','SPECIALOFFER')}}

)
select * from SPECIALOFFER