With SALESORDERDETAIL as (
    select 
        s.pk_ID as pedido
        , s.dt_pedido
        , s.fk_cliente
        , d.fk_produto
        , d.quantidade_do_pedido as quantidade
        , d.preco_unitario
        , d.valor_liq as faturamento_liquido
        , mv.pk_motivo_venda
        , mv.motivo_da_venda
        , c.pk_cartao
        , e.pk_endereco as fk_cidade  
    from {{ ref('stg_sales_order_header') }} s
    join {{ ref('stg_sales_order_detail') }} d on s.pk_ID = d.fk_salesorderid
    left join (
        SELECT DISTINCT fk_pedido, pk_motivo_venda, motivo_da_venda 
        FROM {{ ref('dim_motivo_venda') }}) mv on s.pk_ID = mv.fk_pedido
    left join {{ ref('dim_cartao') }} c on s.fk_cartao = c.pk_cartao
    left join {{ ref('dim_cidades') }} e on s.fk_endereco = e.pk_endereco
)

select * from SALESORDERDETAIL
