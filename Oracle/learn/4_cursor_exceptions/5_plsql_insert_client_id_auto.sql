-- Procedure
CREATE OR REPLACE PROCEDURE insert_client
(
p_ID cliente.id%TYPE,  
p_RAZAO cliente.razao_social%TYPE,
p_CNPJ cliente.cnpj%TYPE,
p_SEGMERCADO cliente.segmercado_id%TYPE,
p_FATURAMENTO cliente.faturamento_previsto%TYPE
)
IS
    v_CATEGORIA cliente.categoria%TYPE;
BEGIN

    v_CATEGORIA := get_category_client_by_faturamento(p_FATURAMENTO);
    INSERT INTO CLIENTE
    VALUES
    (p_ID, p_RAZAO, p_CNPJ, p_SEGMERCADO, SYSDATE, p_FATURAMENTO, v_CATEGORIA);
    COMMIT;
    
END;

-- Function

select id from CLIENTE where rownum <= 1 order by id DESC;

CREATE OR REPLACE FUNCTION get_last_id_client
RETURN cliente.id%type
IS
    v_ID cliente.id%type;
BEGIN

    SELECT id INTO v_ID from CLIENTE where rownum <= 1 order by id DESC;
    dbms_output.put_line(v_ID);
    RETURN v_ID;
END;

-- WAY 1
VARIABLE g_ID NUMBER;
EXECUTE :g_ID:= get_last_id_client;
PRINT g_ID;

-- Test =====================================================================================

SELECT * FROM cliente;

EXECUTE insert_client(2, 'SUPERMERCADOS RAINHA', '1234567890', 1,90000);

select id from CLIENTE ORDER BY id DESC;

--insert putting id automatically ----------------===================================

-- Procedure
CREATE OR REPLACE PROCEDURE insert_client
(
p_RAZAO cliente.razao_social%TYPE,
p_CNPJ cliente.cnpj%TYPE,
p_SEGMERCADO cliente.segmercado_id%TYPE,
p_FATURAMENTO cliente.faturamento_previsto%TYPE
)
IS
    v_CATEGORIA cliente.categoria%TYPE;
    v_ID cliente.id%TYPE;  
BEGIN

    v_ID := get_last_id_client + 1;
    v_CATEGORIA := get_category_client_by_faturamento(p_FATURAMENTO);
    INSERT INTO CLIENTE
    VALUES
    (v_ID, p_RAZAO, p_CNPJ, p_SEGMERCADO, SYSDATE, p_FATURAMENTO, v_CATEGORIA);
    COMMIT;
    
END;


---

EXECUTE insert_client('SUPERMERCADOS HADASSA', '1234567890', 1,90000);

SELECT * FROM cliente;


