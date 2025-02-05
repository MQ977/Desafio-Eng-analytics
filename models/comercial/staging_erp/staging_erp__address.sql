with 
address as (
    select
    cast(ID as int) as pk_endereço
    , cast(ADDRESS_LINE1 as varchar) as endereco
    
    from {{source('erp_northwind','address')}}
) 

select *
from address