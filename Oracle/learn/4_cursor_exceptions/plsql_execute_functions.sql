
-- WAY 1
VARIABLE g_DESCRICAO VARCHAR2(100);
EXECUTE :g_DESCRICAO:= get_descricao_segmercado(3);
PRINT g_DESCRICAO;


-- WAY 2
SET SERVEROUTPUT ON;
DECLARE
    v_DESCRICAO segmercado.DESCRICAO%TYPE;
    v_ID segmercado.ID%TYPE := 1;
BEGIN
    v_DESCRICAO := get_descricao_segmercado(v_ID);
    dbms_output.put_line('A descrição é :'|| v_DESCRICAO);
END;



