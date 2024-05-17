
-- Par�metro IN n�o pode receber valor, mas pode ser fonte de atribui��o
-- Par�metro OUT n�o pode ser fonte de atriui��o, mas pode receber valor
-- Qualquer outro caso deve ser associado a uma vari�vel declarada entre o IS e o BEGIN.
CREATE OR REPLACE PROCEDURE formata_cnpj_simples (
    p_CNPJ_SAIDA OUT CLIENTE.CNPJ%type
)
IS
    v_CNPJ cliente.cnpj%type := p_CNPJ_SAIDA;
BEGIN
    p_CNPJ_SAIDA := SUBSTR(p_CNPJ_SAIDA,1,2) || '/' || SUBSTR(p_CNPJ_SAIDA,3,2) || '-' || SUBSTR(p_CNPJ_SAIDA,5,1);
    dbms_output.put_line('AA' || v_CNPJ);
END;

-- to show output with dmbs
SET SERVEROUTPUT ON;

DECLARE
    v_CNPJ cliente.cnpj%type;
BEGIN
    v_CNPJ := '1234567890';
   
    dbms_output.put_line(v_CNPJ);
    
    formata_cnpj_simples(v_CNPJ);
    
    dbms_output.put_line(v_CNPJ);
    
END;
