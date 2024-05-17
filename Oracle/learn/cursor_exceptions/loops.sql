SELECT * FROM cliente order by id asc;



EXECUTE atualizar_segmercado(10,4);


DECLARE
    v_SEGMERCADO cliente.segmercado_id%type := 4;
    v_ID cliente.id%type := 1;
BEGIN
    LOOP
        atualizar_segmercado(v_ID, v_SEGMERCADO);
        v_ID := v_ID + 1;
    EXIT WHEN v_ID > 7;
    END LOOP;  
END;