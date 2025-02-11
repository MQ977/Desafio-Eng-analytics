with SALESPERSON as (
    select 
        cast(businessentityid as int) as pk_vendedor
        , cast(territoryid as int) as fk_territorio
    from {{ source('erp_northwind', 'SALESPERSON') }}
)

select * from SALESPERSON
