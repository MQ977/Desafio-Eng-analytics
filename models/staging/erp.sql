version: 2

sources:
  - name: erp_northwind
    description: "Essa é a fonte do sistema ERP da northwind."
    database: FEA24_11
    schema: "DBT_AMARQUISSOLO"
    tables:
      - name: ADDRESS
        description: "Tabela de endereços dos clientes."
        columns:
          - name: ADDRESS_ID
            description: "Identificador único do endereço."
          - name: ADDRESS_LINE1
            description: "Endereço principal."
          - name: CITY
            description: "Cidade do endereço."
          - name: STATE_PROVINCE
            description: "Estado ou província."
          - name: POSTAL_CODE
            description: "Código postal."