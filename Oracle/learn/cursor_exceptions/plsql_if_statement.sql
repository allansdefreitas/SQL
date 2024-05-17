

-- Pequeno cliente fatura at� 10000
-- M�dio cliente fatura entre 10001 e 50000
-- M�dio grande cliente fatura entre 50001 e 100000
-- Grande cliente fatura mais de 100000



SET SERVEROUTPUT ON


DECLARE
    v_FATURAMENTO cliente.faturamento_previsto%type := 10001;
    v_CATEGORIA cliente.categoria%type;
BEGIN
    IF v_FATURAMENTO <= 10000 THEN
        v_CATEGORIA := 'Pequeno';
    ELSIF v_FATURAMENTO <= 50000 THEN
         v_CATEGORIA := 'M�dio';
    ELSIF v_FATURAMENTO <= 100000 THEN
        v_CATEGORIA := 'M�dio grande';
    ELSE
        v_CATEGORIA := 'Grande';
    END IF;
    
    dbms_output.put_line('Categoria: ' || v_CATEGORIA);
END;