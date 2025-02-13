WITH SALESREASON AS (
    SELECT
        sr.pk_numero_venda AS pk_motivo_venda,
        sr.motivo_da_venda,
        sr.motivo_complementar
    FROM {{ ref('stg_sales_reason') }} sr
),

SALESORDERHEADERSALESREASON AS (
    SELECT
        sohr.fk_pedido,
        sohr.fk_motivo_venda
    FROM {{ ref('stg_salesorderheadersalesreason') }} sohr
),

JOINED_DATA AS (
    SELECT
        sohr.fk_pedido,
        sr.pk_motivo_venda,
        sr.motivo_da_venda,
        sr.motivo_complementar
    FROM SALESORDERHEADERSALESREASON sohr
    LEFT JOIN SALESREASON sr 
        ON sohr.fk_motivo_venda = sr.pk_motivo_venda
)

SELECT * FROM JOINED_DATA

