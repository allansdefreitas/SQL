-- Allow oracle show outputs on 'console'. This funcionality is given by dbms_output libray
SET SERVEROUTPUT ON;

DECLARE
    v_ID NUMBER(5) := 1;

BEGIN

    dbms_output.put_line(v_id);
    v_id := 2;
    dbms_output.put_line(v_id);
END;

