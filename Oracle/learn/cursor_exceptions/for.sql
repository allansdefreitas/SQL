--

SELECT * FROM cliente order by id asc;

DECLARE
    v_SEGMERCADO cliente.segmercado_id%type := 4;
    v_NUMCLI INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_NUMCLI FROM CLIENTE;

    FOR v_ID IN 1..v_NUMCLI LOOP
        atualizar_segmercado(v_ID, v_SEGMERCADO);
    END LOOP;
END;
