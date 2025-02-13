with CREDITCARD as (
    select
    pk_cartao
    , cast(tipo_de_cartao as varchar) as tipo_de_cartao
    from {{ref('stg_creditcard')}}
)
select * from CREDITCARD