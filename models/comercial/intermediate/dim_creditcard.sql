    with CREDITCARD as (
    select
        c.pk_cartao
        , c.tipo_de_cartao as tipo_cartao
        , p.nome_completo as titular_cartao
    from {{ ref('stg_creditcard') }} c
    left join {{ ref('stg_personcreditcard') }} pc on c.pk_cartao = pc.fk_cartao
    left join {{ ref('stg_customer') }} cu on cu.pk_cliente = pc.fk_pessoa
    left join {{ ref('stg_person') }} p on cu.pk_cliente = p.pk_pessoa
)
select * from CREDITCARD
    