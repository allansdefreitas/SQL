-- exceptions with RAISE_APPLICATION_ERROR
-- Available custom ORA error numbers (1000 numbers):
-- from -20000 to -20999 (that is not a minus '-', but a character of '-')
-- IS BETTER THAN USE DBMS_OUTPUT (that, by the way, depends on SERVEROUTPUT ON to work!)
SELECT * FROM CLIENTE order by id;

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
        RAISE_APPLICATION_ERROR(-20010, 'Cliente especificado já existe!');
END;
