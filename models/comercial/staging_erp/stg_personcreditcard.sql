with PERSONCREDITCARD as (
    select
    cast(BUSINESSENTITYID as int) as fk_pessoa
    , cast(creditcardid as int) as fk_cartao
    from {{source('erp_northwind','PERSONCREDITCARD')}}
)
select * from PERSONCREDITCARD