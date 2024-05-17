CREATE OR REPLACE PROCEDURE insert_client
(
p_ID cliente.id%TYPE,  
p_RAZAO cliente.razao_social%TYPE,
p_CNPJ cliente.cnpj%TYPE,
p_SEGMERCADO cliente.segmercado_id%TYPE,
p_FATURAMENTO cliente.faturamento_previsto%TYPE,
p_CATEGORIA cliente.categoria%TYPE
)
IS
BEGIN
    INSERT INTO CLIENTE
    VALUES
    (p_ID, p_RAZAO, p_CNPJ, p_SEGMERCADO, SYSDATE, p_FATURAMENTO, p_CATEGORIA);
    COMMIT;
    
END;

SELECT * FROM CLIENTE;
SELECT * FROM SEGMERCADO;

EXECUTE insert_client(1, 'SUPERMERCADOS CAMPEÃO', '1234567890', 1,90000, 'MÉDIO GRANDE');



--- More

CREATE OR REPLACE PROCEDURE INCLUINDO_DADOS_VENDA 
(
p_ID produto_venda_exercicio.id%type,
p_COD_PRODUTO produto_venda_exercicio.cod_produto%type,
p_DATA produto_venda_exercicio.data%type,
p_QUANTIDADE produto_venda_exercicio.quantidade%type,
p_PRECO produto_venda_exercicio.preco%type,
p_VALOR produto_venda_exercicio.valor_total%type,
p_PERCENTUAL produto_venda_exercicio.percentual_imposto%type
)
IS
BEGIN
   INSERT INTO PRODUTO_VENDA_EXERCICIO 
   (id, cod_produto, data, quantidade, preco, valor_total, percentual_imposto) 
   VALUES 
   (p_ID, p_COD_PRODUTO, p_DATA, p_QUANTIDADE, p_PRECO, p_VALOR, p_PERCENTUAL);
    COMMIT;
END;


select * from PRODUTO_VENDA_EXERCICIO;

EXECUTE INCLUINDO_DADOS_VENDA(2, '41232', TO_DATE('01/01/2024','DD/MM/YYYY'),100, 10, 1000, 10);