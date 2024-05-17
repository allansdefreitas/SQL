SELECT * FROM cliente order by id asc;

-- use EXIT to BREAK the loop

DECLARE
    v_SEGMERCADO cliente.segmercado_id%type := 2;
    v_ID cliente.id%type := 1;
    v_NUMCLI INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_NUMCLI FROM CLIENTE;
    LOOP
        IF v_ID <= v_NUMCLI THEN
            atualizar_segmercado(v_ID, v_SEGMERCADO);
            v_ID := v_ID + 1;
        ELSE
            EXIT;
        END IF;    
    END LOOP;  
END;


-- exercício 
-- Temos 9 vendas realizadas no ano de 2022. Com quantas vendas no ano o valor total atingiu 20.000?
 -- Se olharmos no "olho", veremos que após a venda 6, o valor somado das vendas, desde a venda 1, 
 -- atingiu mais de 20.000,00. A resposta para a pergunta acima seria então a partir da venda 6.

-- Faça uma procedure que retorne este valor (nome: SOMA_VENDAS), que use um FOR e 
-- que execute o EXIT no meio do LOOP.


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


SET SERVEROUTPUT ON;
DECLARE
   v_NUM INTEGER;
BEGIN
   SOMA_VENDAS(20000, v_NUM);
   dbms_output.put_line(v_NUM);
END;