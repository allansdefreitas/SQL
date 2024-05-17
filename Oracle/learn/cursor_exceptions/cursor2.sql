
SELECT * FROM CLIENTE ORDER BY ID;

EXECUTE INCLUIR_CLIENTE(30, 'LOJA MMM', '568549654906', 2, 60000);


DECLARE
    v_SEGMERCADO cliente.segmercado_id%type := 1;
    v_ID cliente.id%type;
    CURSOR cur_id_clientes IS SELECT ID FROM CLIENTE;
BEGIN
    OPEN cur_id_clientes; 
    LOOP
        FETCH cur_id_clientes INTO v_ID;   
    EXIT WHEN cur_id_clientes%NOTFOUND; -- verifica se o cursor acabou antes de realizar a operação
        atualizar_segmercado(v_ID, v_SEGMERCADO);   
        dbms_output.put_line(v_ID);
    END LOOP;
    CLOSE cur_id_clientes;
END;


SELECT * FROM CLIENTE;


-- experiments with LOOP and EXIT WHEN
DECLARE
BEGIN
    LOOP
        dbms_output.put_line('START');
        dbms_output.put_line('ANTES');
    EXIT WHEN 2 > 1;
        dbms_output.put_line('DEPOIS');
    END LOOP;
    dbms_output.put_line('END');
END;


DECLARE
BEGIN
    LOOP
    dbms_output.put_line('START');
    EXIT WHEN 2 > 1;
        dbms_output.put_line('ANTES');
    
        dbms_output.put_line('DEPOIS');
    END LOOP;
     dbms_output.put_line('END');
END;

-- EXERCÍCIO

create or replace PROCEDURE SOMA_VENDAS 
(p_VENDA_LIMITE IN produto_venda_exercicio.valor_total%type, p_ID_RETORNO OUT produto_venda_exercicio.id%type)
IS
   v_ID produto_venda_exercicio.id%type := 1;
   v_VALOR_TOTAL produto_venda_exercicio.valor_total%type;
   v_VENDA_TOTAL produto_venda_exercicio.valor_total%type := 0;
BEGIN
   LOOP
      SELECT VALOR_TOTAL INTO v_VALOR_TOTAL FROM PRODUTO_VENDA_EXERCICIO WHERE ID = v_ID;
      v_VENDA_TOTAL := v_VENDA_TOTAL + v_VALOR_TOTAL;
      IF v_VENDA_TOTAL >= p_VENDA_LIMITE THEN
         EXIT;
      END IF;
      v_ID := v_ID + 1;
   END LOOP;
   p_ID_RETORNO := v_ID;
END;

-- Aplique o uso de CURSOR para evitar identificadores de vendas na tabela 
-- PRODUTO_VENDA_EXERCICIO que fujam da ordem sequencial numérica


create or replace PROCEDURE SOMA_VENDAS_CURSOR 
(p_VENDA_LIMITE IN produto_venda_exercicio.valor_total%type, p_ID_RETORNO OUT produto_venda_exercicio.id%type)
IS
   v_ID produto_venda_exercicio.id%type := 1;
   v_VALOR_TOTAL produto_venda_exercicio.valor_total%type;
   v_VENDA_TOTAL produto_venda_exercicio.valor_total%type := 0;
   CURSOR cur_VENDA IS SELECT ID FROM PRODUTO_VENDA_EXERCICIO;
BEGIN
   OPEN cur_VENDA;
   LOOP
      FETCH cur_VENDA INTO v_ID;
      SELECT VALOR_TOTAL INTO v_VALOR_TOTAL FROM PRODUTO_VENDA_EXERCICIO WHERE ID = v_ID;
      v_VENDA_TOTAL := v_VENDA_TOTAL + v_VALOR_TOTAL;
      IF v_VENDA_TOTAL >= p_VENDA_LIMITE THEN
         EXIT;
      END IF;
      EXIT WHEN cur_VENDA%NOTFOUND;
   END LOOP;
   CLOSE cur_VENDA;
   p_ID_RETORNO := v_ID;
END;



SET SERVEROUTPUT ON;
DECLARE
   v_NUM INTEGER;
BEGIN
   SOMA_VENDAS_CURSOR(20000, v_NUM);
   dbms_output.put_line(v_NUM);
END;