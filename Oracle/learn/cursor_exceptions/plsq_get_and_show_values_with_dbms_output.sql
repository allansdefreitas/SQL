

SET SERVEROUTPUT ON;

DECLARE
    v_ID segmercado.ID%type := 1;
    v_DESCRICAO segmercado.DESCRICAO%TYPE;

BEGIN
    SELECT DESCRICAO INTO v_DESCRICAO FROM SEGMERCADO WHERE ID = v_ID;
    dbms_output.put_line(v_DESCRICAO);
END;


DECLARE
    v_ID segmercado.ID%type := 1;
    v_ID_SAIDA segmercado.ID%TYPE;
    v_DESCRICAO segmercado.DESCRICAO%TYPE;

BEGIN
    SELECT DESCRICAO INTO v_DESCRICAO FROM SEGMERCADO WHERE ID = v_ID;
    SELECT ID INTO v_ID_SAIDA FROM SEGMERCADO WHERE ID = v_ID;
    
    dbms_output.put_line(v_DESCRICAO);
    dbms_output.put_line(v_ID);
    dbms_output.put_line(v_ID_SAIDA);
END;

SELECT DESCRICAO FROM SEGMERCADO WHERE ID = 2;

