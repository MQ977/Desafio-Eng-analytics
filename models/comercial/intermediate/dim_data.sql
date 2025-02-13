With SALESORDERHEADER as (
    select
    distinct dt_pedido as data
    from {{ ref('stg_sales_order_header')}}   
)
select * from SALESORDERHEADER