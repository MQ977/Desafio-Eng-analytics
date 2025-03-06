with SALESREASON as (
    select
      shsr.fk_pedido
    , sr.motivo_da_venda
    , sr.motivo_complementar
    , row_number() over (partition by shsr.fk_pedido order by sr.pk_motivo_venda) as rn

    from {{ ref('stg_salesorderheadersalesreason') }} shsr
    left join {{ ref('stg_sales_reason') }} sr on sr.pk_motivo_venda = shsr.fk_motivo_venda
)

select * from SALESREASON where rn = 1
