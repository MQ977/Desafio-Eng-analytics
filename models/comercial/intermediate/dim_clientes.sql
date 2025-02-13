with CUSTOMER as (
    select
    c.pk_cliente
    , cast(c.fk_pessoa as int) as fk_pessoa
    from {{ref('stg_customer')}} c
)
select * from CUSTOMER