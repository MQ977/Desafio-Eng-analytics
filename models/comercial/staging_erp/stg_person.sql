with PERSON as (
    select
    cast(businessentityid as int) as pk_pessoa
    , cast(firstname as varchar) || ' ' || cast(lastname as varchar) as nome_completo
    from {{source('erp_northwind','PERSON')}}
)
select * from PERSON
