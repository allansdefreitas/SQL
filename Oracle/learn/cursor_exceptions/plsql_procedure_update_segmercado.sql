

SELECT * FROM CLIENTE;

SELECT * FROM segmercado;


SELECT * FROM CLIENTE;

EXECUTE INCLUIR_CLIENTE(5, 'ARMAZ�M �MEGA', '9877853210', 1, 1300000);
EXECUTE INCLUIR_CLIENTE(6, 'GR�FICA IT', '9872453210', 1, 45000);
EXECUTE INCLUIR_CLIENTE(7, 'ALPHA SOFT', '9874523210', 1, 150000);


CREATE OR REPLACE PROCEDURE ATUALIZAR_SEGMERCADO
(p_ID CLIENTE.ID%type, p_SEGMERCADO_ID CLIENTE.SEGMERCADO_ID%type)
IS
BEGIN
    UPDATE CLIENTE SET SEGMERCADO_ID = p_SEGMERCADO_ID WHERE ID = p_ID;
    COMMIT;
END;




EXECUTE ATUALIZAR_SEGMERCADO(1,3);
EXECUTE ATUALIZAR_SEGMERCADO(2,3);
EXECUTE ATUALIZAR_SEGMERCADO(3,3);
EXECUTE ATUALIZAR_SEGMERCADO(4,3);