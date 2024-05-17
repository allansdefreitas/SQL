DECLARE
    v_SEGMERCADO_ID cliente.segmercado_id%type := 4;
    CURSOR cur_id_clientes IS SELECT ID FROM CLIENTE;
BEGIN
    -- We do not need OPEN, CLOSE or FETCH the cursor in a FOR statement. Amazing!
    FOR linha_cur_id_clientes IN cur_id_clientes LOOP -- fetch all lines of cursor
        atualizar_segmercado(linha_cur_id_clientes.id, v_SEGMERCADO_ID); 
    END LOOP;
END;


SELECT * FROM CLIENTE;


---- EXERCÍCIO

create or replace PROCEDURE SOMA_VENDAS_CURSOR_WHILE 
(p_VENDA_LIMITE IN produto_venda_exercicio.valor_total%type, p_ID_RETORNO OUT produto_venda_exercicio.id%type)
IS
   v_ID produto_venda_exercicio.id%type := 1;
   v_VALOR_TOTAL produto_venda_exercicio.valor_total%type;
   v_VENDA_TOTAL produto_venda_exercicio.valor_total%type := 0;
   CURSOR cur_VENDA IS SELECT ID FROM PRODUTO_VENDA_EXERCICIO;
BEGIN
   OPEN cur_VENDA;
   FETCH cur_VENDA INTO v_ID;
   WHILE ((v_VENDA_TOTAL < p_VENDA_LIMITE) AND cur_VENDA%FOUND) LOOP
      SELECT VALOR_TOTAL INTO v_VALOR_TOTAL FROM PRODUTO_VENDA_EXERCICIO WHERE ID = v_ID;
      v_VENDA_TOTAL := v_VENDA_TOTAL + v_VALOR_TOTAL;
      IF v_VENDA_TOTAL < p_VENDA_LIMITE THEN
         FETCH cur_VENDA INTO v_ID;
      END IF ; 
   END LOOP;
   CLOSE cur_VENDA;
   p_ID_RETORNO := v_ID;
END;

/* 
Modifique-o para usar FOR e chame a procedure de SOMA_VENDAS_CURSOR_FOR.

Dica: Pesquise como podemos sair de um FOR sem que o número de interações determinadas por ele não tenha sido atingida.
*/


create or replace PROCEDURE SOMA_VENDAS_CURSOR_FOR 
(p_VENDA_LIMITE IN produto_venda_exercicio.valor_total%type, p_ID_RETORNO OUT produto_venda_exercicio.id%type)
IS
   v_ID produto_venda_exercicio.id%type := 1;
   v_VALOR_TOTAL produto_venda_exercicio.valor_total%type;
   v_VENDA_TOTAL produto_venda_exercicio.valor_total%type := 0;
   CURSOR cur_VENDA IS SELECT ID FROM PRODUTO_VENDA_EXERCICIO;
BEGIN
   FOR linha_cur_VENDA IN cur_VENDA LOOP
      v_ID := linha_cur_VENDA.ID;
      SELECT VALOR_TOTAL INTO v_VALOR_TOTAL FROM PRODUTO_VENDA_EXERCICIO WHERE ID = v_ID;
      v_VENDA_TOTAL := v_VENDA_TOTAL + v_VALOR_TOTAL;
      IF v_VENDA_TOTAL >= p_VENDA_LIMITE THEN
         EXIT;
      END IF;
   END LOOP;
   p_ID_RETORNO := v_ID;
END;



SET SERVEROUTPUT ON;
DECLARE
   v_NUM INTEGER;
BEGIN
   SOMA_VENDAS_CURSOR_FOR(20000, v_NUM);
   dbms_output.put_line(v_NUM);
END;