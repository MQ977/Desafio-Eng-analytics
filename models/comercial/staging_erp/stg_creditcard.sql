with CREDITCARD as (
    select
    cast(creditcardid as int) pk_cartao
    , cast(cardtype as varchar) as tipo_de_cartao
    , cast(expmonth as int) as exp_mes
    , cast(expyear as int) as exp_ano
    from {{source('erp_northwind','CREDITCARD')}}
)
select * from CREDITCARD