with ADDRESS as (
    select
    e.pk_endereco
    , e.cidade
    , f.nome_do_estado
    , g.nome_do_pais
    from {{(ref('stg_address'))}} e
    left join {{ref('stg_state_province')}} f on e.fk_estado = f.Pk_estado
    left join {{ref('stg_country_region')}} g on f.fk_pais = g.pk_pais
)
select * from ADDRESS