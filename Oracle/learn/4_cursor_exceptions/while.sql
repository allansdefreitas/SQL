SELECT * FROM cliente order by id asc;


DECLARE
    v_SEGMERCADO cliente.segmercado_id%type := 1;
    v_ID cliente.id%type := 1;
    v_NUMCLI INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_NUMCLI FROM CLIENTE;
    WHILE v_ID <= v_NUMCLI LOOP
     
        atualizar_segmercado(v_ID, v_SEGMERCADO);
        v_ID := v_ID + 1;
        
    END LOOP;  
END;