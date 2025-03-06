with SALESPERSON as (
    select
    sp.pk_vendedor
    , p.nome_completo as nome_vendedor
    , st.nome_territorio as territorio
    , st.fk_pais
    from {{ref('stg_salesperson')}} sp 
    left join {{ref('stg_person')}} p on sp.pk_vendedor = p.pk_pessoa
    left join {{ref('stg_salesterritory')}} st on sp.fk_territorio = st.pk_territorio


)
select * from SALESPERSON