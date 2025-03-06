with EMPLOYEE as (
    select 
        cast(businessentityid as int) as pk_employee
    from {{ source('erp_northwind', 'EMPLOYEE') }}
)
select * from EMPLOYEE
