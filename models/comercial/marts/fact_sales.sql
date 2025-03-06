    with dim_orderdetail as (
        select 
        distinct(sod.fk_pedido) as fk_pedido
        , sod.fk_cliente as fk_cliente
        , sod.pk_produto as fk_produto
        , sod.nome_do_produto
        , sod.desc_categoria
        , sod.desc_subcategoria
        , sod.fk_cartao as fk_cartao
        , sod.quantidade_do_pedido
        , sod.preco_unitario
        , sod.ticket_medio
        , sod.frete_rateado
        , sod.imposto_rateado
        , sod.total_bruto
        , sod.dt_pedido as data_do_pedido
        , sod.fk_vendedor as vendedor
        , cu.pk_cliente
        , cu.pk_nome_loja as fk_nome_loja
        , cu.regiao as regiao_do_cliente
        , sp.nome_vendedor 
        , dc.tipo_cartao
        , dc.titular_cartao
        , sr.motivo_da_venda
        , sr.motivo_complementar
        , a.cidade
        , a.estado
        , a.pais

        , case
            when sod.status = 5 then 'Aprovado'
            else 'Não Aprovado'
            end as status

        from {{ ref('dim_orderdetail') }} sod
        left join {{ ref('dim_customer') }} cu on sod.fk_cliente = cu.pk_cliente
        left join {{ ref('dim_salesperson') }} sp on cast(sod.fk_vendedor as integer) = sp.pk_vendedor
        left join {{ ref('dim_creditcard') }} dc on sod.fk_cartao = dc.pk_cartao
        left join {{ ref('dim_salesreason') }} sr on sod.fk_pedido = sr.fk_pedido
        left join {{ ref('dim_address') }} a on cu.id_endereco = a.pk_endereco
        
    )
    select * from dim_orderdetail 
