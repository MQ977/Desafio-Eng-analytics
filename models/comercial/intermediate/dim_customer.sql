with CUSTOMER as (
    select 
        cu.pk_cliente
        , coalesce(p.nome_completo, 'Sem nome') as nome_cliente
        , s.pk_loja
        , s.nome_loja as pk_nome_loja           
        , coalesce(st.nome_territorio, 'Sem território') as regiao
        , coalesce(a.pk_endereco, bea.fk_endereco, a_store.pk_endereco, -1) as id_endereco
    from {{ ref('stg_customer') }} cu
    left join {{ ref('stg_person') }} p on cu.fk_pessoa = p.pk_pessoa
    left join {{ ref('stg_store') }} s on cu.fk_loja = s.pk_loja
    left join {{ ref('stg_salesterritory') }} st on cu.fk_territorio = st.pk_territorio
    left join {{ ref('stg_businessentityaddress') }} bea on cu.pk_cliente = bea.fk_business
    left join {{ ref('stg_address') }} a on bea.fk_endereco = a.pk_endereco
    left join {{ ref('stg_address') }} a_store on s.pk_loja = a_store.pk_endereco
)

select * from CUSTOMER