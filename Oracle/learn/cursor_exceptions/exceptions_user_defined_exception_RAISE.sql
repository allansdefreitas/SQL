-- EXIBIR TAMB�M A MENSAGEM DE ERRO PADR�O DO ORACLE JUNTO COM A MENSAGEM DE ERRO 'OTHERS' DEFINIDA.
SELECT * FROM CLIENTE order by id;

SELECT * FROM SEGMERCADO;
DESC CLIENTE;

EXECUTE incluir_cliente(20, 'LOJA FREITAS', '54234897897', 1, NULL);

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
  e_IDNULO exception;
  pragma exception_init(e_IDNULO,-1400); -- for ORA-01400
  e_FATURAMENTO_NULO exception;
BEGIN

    IF p_FATURAMENTO IS NULL THEN
        RAISE e_FATURAMENTO_NULO; -- Force/cause an exception. Like Throw in Java.
    END IF;
    
    v_CATEGORIA := categoria_cliente(p_FATURAMENTO);
    FORMATA_CNPJ(p_CNPJ, v_CNPJ);

  INSERT INTO CLIENTE
  VALUES (p_ID, p_RAZAO, v_CNPJ, p_SEGMERCADO, SYSDATE, p_FATURAMENTO, v_CATEGORIA);
  COMMIT;
  
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20010, 'CLIENTE ESPECIFICADO J� EXISTE!');
    WHEN e_IDNULO THEN
        RAISE_APPLICATION_ERROR(-20015, 'ID DO CLIENTE � NULO!');
    WHEN e_FATURAMENTO_NULO THEN
        RAISE_APPLICATION_ERROR(-20025, 'ERRO DE NEG�CIO: FATURAMENTO N�O PODE SER NULL!');
    WHEN others THEN -- others deve ser sempre o �ltimo handler
        RAISE_APPLICATION_ERROR(-20000, 'ERRO N�O ESPERADO! TEXTO ORIGINAL DO ERRO: ' || sqlerrm()); -- get SQL ERROR MESSAGE
END;

SELECT * FROM  "CURSOPLSQL2"."CLIENTE"