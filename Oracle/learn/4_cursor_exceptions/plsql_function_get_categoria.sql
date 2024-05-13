
CREATE OR REPLACE FUNCTION get_category_client_by_faturamento
(p_FATURAMENTO IN cliente.faturamento_previsto%type)     
RETURN cliente.categoria%type
IS
    v_CATEGORIA cliente.categoria%type;
BEGIN

    IF p_FATURAMENTO <= 10000 THEN
        v_CATEGORIA := 'Pequeno';
    ELSIF p_FATURAMENTO <= 50000 THEN
         v_CATEGORIA := 'Médio';
    ELSIF p_FATURAMENTO <= 100000 THEN
        v_CATEGORIA := 'Médio grande';
    ELSE
        v_CATEGORIA := 'Grande';
    END IF;
    RETURN v_CATEGORIA;
END;


-- Test function

VARIABLE g_CATEGORIA VARCHAR2(100);
EXECUTE :g_CATEGORIA:= get_category_client_by_faturamento(65000);
PRINT g_CATEGORIA;


-- More

CREATE OR REPLACE FUNCTION RETORNA_IMPOSTO 
(p_COD_PRODUTO produto_venda_exercicio.cod_produto%type)
RETURN produto_venda_exercicio.percentual_imposto%type
IS
   v_CATEGORIA produto_exercicio.categoria%type;
   v_IMPOSTO produto_venda_exercicio.percentual_imposto%type;
BEGIN
    v_CATEGORIA := retorna_categoria(p_COD_PRODUTO);
    IF TRIM(v_CATEGORIA) = 'Sucos de Frutas' THEN
        v_IMPOSTO := 10;
    ELSIF  TRIM(v_CATEGORIA) = 'Águas' THEN
        v_IMPOSTO := 20;
    ELSIF  TRIM(v_CATEGORIA) = 'Mate' THEN
        v_IMPOSTO := 15;
    END IF;
    RETURN v_IMPOSTO;
END;


-- Test

SELECT * FROM produto_exercicio;

VARIABLE g_PORCENTUAL_IMPOSTO NUMBER;
EXECUTE :g_PORCENTUAL_IMPOSTO:= RETORNA_IMPOSTO(41231);
PRINT g_PORCENTUAL_IMPOSTO;
