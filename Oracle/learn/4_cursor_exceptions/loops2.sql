SELECT * FROM cliente order by id asc;

EXECUTE INCLUIR_CLIENTE(10, 'ARMAZEM POPULAR', '6746512357645',1,40000);


EXECUTE atualizar_segmercado(10,4);


DECLARE
    v_SEGMERCADO cliente.segmercado_id%type := 2;
    v_ID cliente.id%type := 1;
    v_NUMCLI INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_NUMCLI FROM CLIENTE;
    LOOP
        atualizar_segmercado(v_ID, v_SEGMERCADO);
        v_ID := v_ID + 1;
    EXIT WHEN v_ID > v_NUMCLI;
    END LOOP;  
END;


----exercício

INSERT INTO PRODUTO_VENDA_EXERCICIO
VALUES (3, '41232',TO_DATE('01/02/2022','DD/MM/YYYY'), 250, 20, 0, 0);
INSERT INTO PRODUTO_VENDA_EXERCICIO
VALUES (4, '32223',TO_DATE('03/02/2022','DD/MM/YYYY'), 200, 16, 0, 0);
INSERT INTO PRODUTO_VENDA_EXERCICIO
VALUES (5, '92347',TO_DATE('05/02/2022','DD/MM/YYYY'), 200, 16, 0, 0);
INSERT INTO PRODUTO_VENDA_EXERCICIO
VALUES (6, '41232',TO_DATE('02/03/2022','DD/MM/YYYY'), 210, 19, 0, 0);
INSERT INTO PRODUTO_VENDA_EXERCICIO
VALUES (7, '33854',TO_DATE('05/03/2022','DD/MM/YYYY'), 180, 21, 0, 0);
INSERT INTO PRODUTO_VENDA_EXERCICIO
VALUES (8, '92347',TO_DATE('09/03/2022','DD/MM/YYYY'), 170, 20, 0, 0);

select * from PRODUTO_VENDA_EXERCICIO;

--Faça uma procedure que percorra, de forma sequencial, o valor do identificador 
-- da venda (ID) e atualize, na tabela PRODUTO_VENDA_EXERCICIO, as colunas VALOR_TOTAL e PERCENTUAL_IMPOSTO.

create or replace PROCEDURE ATUALIZAR_VALOR_TOTAL_IMPOSTO IS
   v_ID produto_venda_exercicio.id%type := 1;
   v_NUMERO_VENDA INTEGER;
   v_COD_PRODUTO produto_venda_exercicio.cod_produto%type;
   v_VALOR produto_venda_exercicio.valor_total%type;
   v_QUANTIDADE produto_venda_exercicio.quantidade%type;
   v_PRECO produto_venda_exercicio.preco%type;
   v_PERCENTUAL produto_venda_exercicio.percentual_imposto%type;

BEGIN
   SELECT COUNT(*) INTO v_NUMERO_VENDA FROM PRODUTO_VENDA_EXERCICIO;
   LOOP
      SELECT COD_PRODUTO, QUANTIDADE, PRECO INTO v_COD_PRODUTO, v_QUANTIDADE, v_PRECO 
      FROM PRODUTO_VENDA_EXERCICIO WHERE ID = v_ID;
      
      v_PERCENTUAL := RETORNA_IMPOSTO(v_COD_PRODUTO);
      v_VALOR := v_QUANTIDADE * v_PRECO;
      UPDATE PRODUTO_VENDA_EXERCICIO SET VALOR_TOTAL = v_VALOR, PERCENTUAL_IMPOSTO = v_PERCENTUAL WHERE ID = v_ID;
      v_ID := v_ID + 1;
   EXIT WHEN v_ID > v_NUMERO_VENDA;
   END LOOP;
END;

execute ATUALIZAR_VALOR_TOTAL_IMPOSTO;
