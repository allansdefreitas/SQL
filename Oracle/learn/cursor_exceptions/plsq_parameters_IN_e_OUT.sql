
-- IN OUT: O parâmetro é, ao mesmo tempo, de entrada e de saída.
-- Melhor forma de se fazer.
CREATE OR REPLACE PROCEDURE formata_cnpj_simples (
    p_CNPJ_SAIDA IN OUT CLIENTE.CNPJ%type
)
IS
BEGIN
    p_CNPJ_SAIDA := SUBSTR(p_CNPJ_SAIDA,1,3) || '/' || SUBSTR(p_CNPJ_SAIDA,4,2) || '-' || SUBSTR(p_CNPJ_SAIDA, 6);
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

----


create or replace PROCEDURE DUPLICA_VALOR
(p_VALOR IN OUT FLOAT)
IS
BEGIN
  p_VALOR := p_VALOR * 2;
END;


---rotina PL/SQL

DECLARE
    v_VALOR FLOAT;
BEGIN
    v_VALOR := 256;
    
    duplica_valor(v_VALOR);
    duplica_valor(v_VALOR);
    dbms_output.put_line('v_VALOR após chamada de procedure com IN OUT: ' || v_VALOR);

END;