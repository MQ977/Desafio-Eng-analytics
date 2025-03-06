with CREDITCARD as (
    select
    cast(creditcardid as int) pk_cartao
    , cast(cardtype as varchar) as tipo_de_cartao
    , cast(cardnumber as varchar) as numero_cartao
    from {{source('erp_northwind','CREDITCARD')}}
)
select * from CREDITCARD