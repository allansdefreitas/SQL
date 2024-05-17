
DECLARE 
    v_SEGMERCADO CLIENTE.SEGMERCADO_ID%type := 1; 
    v_NUMCLI INTEGER; 
BEGIN 
    SELECT COUNT(*) INTO v_NUMCLI FROM CLIENTE; 
    FOR v_ID IN 1..v_NUMCLI LOOP 
        ATUALIZAR_SEGMERCADO(v_ID, v_SEGMERCADO); 
    END LOOP; 
END;


SELECT * FROM CLIENTE ORDER BY ID;

EXECUTE INCLUIR_CLIENTE(30, 'LOJA MMM', '568549654906', 2, 60000);

SELECT max(id) FROM CLIENTE; 


-- CURSORS
-- Cursor consiste nos dados de uma consulta SQL carregada na memória em
-- forma de matriz ou array

SET SERVEROUTPUT ON;

DECLARE
    v_ID cliente.id%type;
    v_RAZAO cliente.razao_social%type;
    CURSOR cur_clientes IS SELECT id, razao_social FROM cliente;
BEGIN
    OPEN cur_clientes;
    LOOP
        FETCH cur_clientes INTO v_ID, v_RAZAO;
        DBMS_OUTPUT.PUT_LINE(v_ID || ' ' || v_RAZAO);
    
    EXIT WHEN cur_clientes%NOTFOUND; -- Quando os dados do cursores acabarem
    
    END LOOP;
    CLOSE cur_clientes;
END;


SELECT id, razao_social FROM cliente;



-- Exercício
CREATE TABLE TAB_FETCH
(ID INTEGER, NOME VARCHAR(10), VALOR VARCHAR(10));
INSERT INTO TAB_FETCH VALUES (1,'PRODUTO1',10);
INSERT INTO TAB_FETCH VALUES (2,'PRODUTO2',10);
INSERT INTO TAB_FETCH VALUES (3,'PRODUTO3',10);
INSERT INTO TAB_FETCH VALUES (4,'PRODUTO4',10);
INSERT INTO TAB_FETCH VALUES (5,'PRODUTO5',10);
INSERT INTO TAB_FETCH VALUES (6,'PRODUTO6',10);
INSERT INTO TAB_FETCH VALUES (7,'PRODUTO7',10);
INSERT INTO TAB_FETCH VALUES (8,'PRODUTO8',10);
INSERT INTO TAB_FETCH VALUES (9,'PRODUTO9',10);


SET SERVEROUTPUT ON;
DECLARE
   v_NOME TAB_FETCH.nome%type;
   v_VALOR TAB_FETCH.valor%type;
   v_VALOR_ACUMULATIVO TAB_FETCH.valor%type:=0;
   CURSOR cur_TABFETCH IS SELECT NOME, VALOR FROM TAB_FETCH WHERE MOD(ID,2) = 0;
BEGIN
   OPEN cur_TABFETCH;
   FETCH cur_TABFETCH INTO v_NOME, v_VALOR; -- starting the fetching. Point to the first position;
   LOOP
       v_VALOR_ACUMULATIVO := v_VALOR_ACUMULATIVO + v_VALOR;
   EXIT WHEN v_VALOR_ACUMULATIVO >= 30;
       FETCH cur_TABFETCH INTO v_NOME, v_VALOR;
   END LOOP;
   CLOSE cur_TABFETCH;
   dbms_output.put_line('VALOR DO PRODUTO = ' || v_NOME);
END;


-- Using cursors to develop a better solution
 