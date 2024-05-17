SELECT * FROM cliente order by id asc;

DECLARE
    v_SEGMERCADO cliente.segmercado_id%type := 3;
    v_NUMCLI INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_NUMCLI FROM CLIENTE;

    FOR v_ID IN 1..v_NUMCLI LOOP
        -- call a procedure with the parameters in a different order, using named parameters
        atualizar_segmercado(p_SEGMERCADO_ID =>  v_SEGMERCADO, p_ID => v_ID);
    END LOOP;
END;