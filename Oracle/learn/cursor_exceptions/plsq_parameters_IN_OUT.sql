
CREATE OR REPLACE PROCEDURE formata_cnpj (
    p_CNPJ IN CLIENTE.CNPJ%type, 
    p_CNPJ_SAIDA OUT CLIENTE.CNPJ%type
)
IS
BEGIN
    p_CNPJ_SAIDA := SUBSTR(p_CNPJ,1,2) || '/' || SUBSTR(p_CNPJ,3,2) || '-' || SUBSTR(p_CNPJ,5,1);
END;

-- to show output with dmbs
SET SERVEROUTPUT ON;

DECLARE
    v_CNPJ cliente.cnpj%type;
    v_CNPJ_SAIDA cliente.cnpj%type;
BEGIN
    v_CNPJ := '1234567890';
    v_CNPJ_SAIDA := '1234567890';
    
    dbms_output.put_line(v_CNPJ || '       ' || v_CNPJ_SAIDA);
    
    formata_cnpj(v_CNPJ, v_CNPJ_SAIDA);
    
    dbms_output.put_line(v_CNPJ || '       ' || v_CNPJ_SAIDA);
    
END;



---Crie uma procedure que, dado um identificador da venda (ID ), da tabela PRODUTO_VENDA_EXERCICIO, temos como retorno 
-- o valor financeiro do imposto. O parâmetro referente ao resultado do imposto deve ser passado para essa procedure como um parâmetro OUT.
--A fórmula do imposto será:

--(PRECO * QUANTIDADE)*(PERCENTUAL_IMPOSTO/100)

create or replace PROCEDURE CALCULA_IMPOSTO
(p_ID IN produto_venda_exercicio.id%type, p_VALOR_IMPOSTO OUT FLOAT)
IS
   v_PRECO produto_venda_exercicio.preco%type;
   v_QUANTIDADE produto_venda_exercicio.quantidade%type;
   v_PERCENTUAL_IMPOSTO produto_venda_exercicio.percentual_imposto%type;
BEGIN
-- Nova forma de associar variáveis
   SELECT PRECO, QUANTIDADE, PERCENTUAL_IMPOSTO INTO v_PRECO, v_QUANTIDADE, v_PERCENTUAL_IMPOSTO
   FROM PRODUTO_VENDA_EXERCICIO WHERE ID = p_ID;
   p_VALOR_IMPOSTO := (v_PRECO * v_QUANTIDADE) * (v_PERCENTUAL_IMPOSTO/100);
END;
