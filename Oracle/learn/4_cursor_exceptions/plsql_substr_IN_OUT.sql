

SELECT * FROM CLIENTE;

-- supondo que um CNPJ se formate assim:
-- 123/45-67890

SELECT SUBSTR(CNPJ, 1,3) || '/' || SUBSTR(CNPJ, 4,2) || '-' || SUBSTR(CNPJ, 6) AS CNPJ_FORMATADO FROM CLIENTE;




