
CREATE OR REPLACE FUNCTION get_descricao_segmercado
(p_ID IN segmercado.ID%TYPE)
RETURN segmercado.DESCRICAO%TYPE -- we specify the data type returned by function
IS
v_DESCRICAO segmercado.DESCRICAO%TYPE;
BEGIN
      SELECT DESCRICAO INTO v_DESCRICAO FROM SEGMERCADO WHERE ID = p_ID;
      RETURN v_DESCRICAO;
END;


SELECT ID, get_descricao_segmercado(ID), DESCRICAO, LOWER(DESCRICAO) FROM SEGMERCADO WHERE ID = 1;


-- execute function line to line
SELECT ID, get_descricao_segmercado(ID), DESCRICAO, LOWER(DESCRICAO) FROM SEGMERCADO;

SELECT get_descricao_segmercado(ID), DESCRICAO, LOWER(DESCRICAO) FROM SEGMERCADO;


-- More functions

CREATE OR REPLACE FUNCTION RETORNA_CATEGORIA
(p_COD IN produto_exercicio.cod%type)
RETURN produto_exercicio.categoria%type
IS
   v_CATEGORIA produto_exercicio.categoria%type;
BEGIN
    SELECT CATEGORIA INTO v_CATEGORIA FROM PRODUTO_EXERCICIO WHERE COD = p_COD;
    RETURN v_CATEGORIA;
END;

SELECT RETORNA_CATEGORIA(COD) FROM PRODUTO_EXERCICIO;