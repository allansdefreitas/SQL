-- exceptions

SELECT * FROM CLIENTE order by id;


EXECUTE incluir_cliente(12, 'LOJA SANTOS', '54234897897', 1, 150000);

EXECUTE incluir_cliente(11, 'LOJA FREITAS', '54234897897', 1, 250000);

SET SERVEROUTPUT ON;

--- ERRORS AND EXCEPTION LIST:
-- https://docs.oracle.com/database/timesten-18.1/TTPLS/exceptions.htm
create or replace PROCEDURE incluir_cliente 
(
  p_ID CLIENTE.ID%type,
  p_RAZAO CLIENTE.RAZAO_SOCIAL%type,
  p_CNPJ CLIENTE.CNPJ%type,
  p_SEGMERCADO CLIENTE.SEGMERCADO_ID%type,
  p_FATURAMENTO CLIENTE.FATURAMENTO_PREVISTO%type
)
IS
  v_CATEGORIA CLIENTE.CATEGORIA%type;
  v_CNPJ CLIENTE.CNPJ%type;
BEGIN
    v_CATEGORIA := categoria_cliente(p_FATURAMENTO);
    FORMATA_CNPJ(p_CNPJ, v_CNPJ);

  INSERT INTO CLIENTE
  VALUES (p_ID, p_RAZAO, v_CNPJ, p_SEGMERCADO, SYSDATE, p_FATURAMENTO, v_CATEGORIA);
  COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        dbms_output.put_line('========================================');
        dbms_output.put_line('Erro: Cliente especificado já existe');
        dbms_output.put_line('========================================');
END;



--- get_last_id_client
create or replace FUNCTION get_last_id_client
RETURN cliente.id%type
IS
    v_ID cliente.id%type;
BEGIN

    SELECT id INTO v_ID from CLIENTE where rownum <= 1 order by id DESC;
    dbms_output.put_line(v_ID);
    RETURN v_ID;
END;



