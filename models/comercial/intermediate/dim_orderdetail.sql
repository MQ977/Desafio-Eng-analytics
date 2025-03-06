    with SALESORDERDETAIL as (
    select 
        sod.fk_pedido
        , soh.fk_cliente
        , p.pk_produto
        , p.nome_do_produto
        , p.cod_produto
        , soh.fk_cartao
        , TO_CHAR(soh.dt_pedido, 'DD/MM/YYYY') as dt_pedido
        , soh.fk_vendedor as fk_vendedor
        , sod.preco_unitario
        , pc.desc_categoria 
        , ps.desc_subcategoria     
        , sum(sod.quantidade_do_pedido) as quantidade_do_pedido
        , soh.valor_total
        , soh.status   
        , coalesce(max(so.descricao), 'Fora de promoção') as descricao_oferta
        , max(so.tipo_de_desconto) as tipo_de_desconto
        , max(so.quantidade_minima) as quantidade_minima
        , sum(sod.quantidade_do_pedido * sod.preco_unitario) / nullif(count(distinct sod.fk_pedido), 0) as ticket_medio
        , cast(sum(soh.frete) / nullif(count(distinct sod.fk_pedido), 0) as numeric(18,2)) as frete_rateado
        , cast(sum(soh.imposto) / nullif(count(distinct sod.fk_pedido), 0) as numeric(18,2)) as imposto_rateado
        , sum((sod.preco_unitario * sod.quantidade_do_pedido) * (1 - coalesce(sod.desconto_preco_unitario, 0)) ) + cast(sum(soh.imposto) / nullif(count(distinct sod.fk_pedido), 0) as numeric(18,2)) + cast(sum(soh.frete) / nullif(count(distinct sod.fk_pedido), 0) as numeric(18,2)) as total_bruto

    from {{ ref('stg_sales_order_detail') }} sod
    left join {{ ref('stg_sales_order_header') }} soh on sod.fk_pedido = soh.pk_pedido
    left join {{ ref('stg_product') }} p on sod.fk_produto = p.pk_produto
    left join {{ ref('stg_productsubcategory') }} ps on p.fk_subcategoria = ps.pk_subcategoria
    left join {{ ref('stg_productcategory') }} pc on ps.fk_categoria = pc.pk_categoria
    left join {{ ref('stg_special_offer_product') }} sop on sod.fk_produto = sop.fk_produto
    left join {{ ref('stg_special_offer') }} so on sop.fk_oferta = so.pk_oferta

    group by 
        sod.fk_pedido, soh.fk_cliente, soh.fk_vendedor, soh.fk_cartao, soh.dt_pedido, p.pk_produto, p.nome_do_produto, p.cod_produto, pc.desc_categoria, ps.desc_subcategoria, sod.preco_unitario, soh.valor_total, soh.status, soh.fk_vendedor
    )
select * from SALESORDERDETAIL
