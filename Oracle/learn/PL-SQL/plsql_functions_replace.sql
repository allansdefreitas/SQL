-- Para isso, modifique o script PL/SQL abaixo para que, caso o usu�rio inclua o h�fen como separador 
-- dos nomes e classifica��es do produto, ele seja substitu�do pelo "maior que" (>):

DECLARE
   v_COD produto_exercicio.cod%type := '32213';
   v_DESCRICAO produto_exercicio.descricao%type := 'Sabor de Ver�o - Uva - 1 Litro';
   v_CATEGORIA produto_exercicio.categoria%type := 'Sucos de Frutas';
BEGIN
   INSERT INTO PRODUTO_EXERCICIO (COD, DESCRICAO, CATEGORIA) VALUES (v_COD, v_DESCRICAO, v_CATEGORIA);
   COMMIT;
END;


SELECT * FROM PRODUTO_EXERCICIO;


DECLARE
   v_COD produto_exercicio.cod%type := '67120';
   v_DESCRICAO produto_exercicio.descricao%type := 'Frescor da Montanha - Aroma Lim�o - 1 Litro';
   v_CATEGORIA produto_exercicio.categoria%type := '�guas';
BEGIN
   INSERT INTO PRODUTO_EXERCICIO (COD, DESCRICAO, CATEGORIA) VALUES (v_COD, REPLACE(v_DESCRICAO,'-','>')
   , v_CATEGORIA);
   COMMIT;
END;


SELECT * FROM PRODUTO_EXERCICIO;