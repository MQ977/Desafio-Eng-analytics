with CUSTOMER as (
    select
    cast(customerid as int) as pk_cliente
    , cast(personid as int) as fk_pessoa
    , cast(storeid as int) as fk_loja
    , cast(territoryid as int) as fk_territorio

    from {{ source('erp_northwind', 'CUSTOMER') }}
)
select * from CUSTOMER
