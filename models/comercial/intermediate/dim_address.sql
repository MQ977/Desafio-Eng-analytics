with ADDRESS as (
    select 
        a.pk_endereco
        , a.cidade
        , sp.nome_do_estado as estado
        , st.nome_territorio as territorio
        , cr.nome_do_pais as pais
    from {{ ref('stg_address') }} a
    left join {{ ref('stg_state_province') }} sp on a.fk_estado = sp.pk_estado
    left join {{ ref('stg_salesterritory') }} st on sp.fk_territorio = st.pk_territorio
    left join {{ ref('stg_country_region') }} cr on sp.fk_pais = cr.pk_pais
)

select * from ADDRESS
