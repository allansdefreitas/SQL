SELECT * FROM TABELA_DE_VENDEDORES;

SELECT * FROM NOTAS_FISCAIS;


SELECT MATRICULA, COUNT(MATRICULA) AS "Quantidade de notas fiscais" FROM NOTAS_FISCAIS
GROUP BY MATRICULA
ORDER BY count(matricula) DESC;


SELECT N.MATRICULA, V.NOME, COUNT(V.MATRICULA)
FROM 
tabela_de_vendedores V
INNER JOIN
notas_fiscais N
ON
n.matricula = v.matricula
GROUP BY n.matricula, v.nome
ORDER BY count(matricula) DESC;


SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) FROM ITENS_NOTAS_FISCAIS 
GROUP BY CODIGO_DO_PRODUTO HAVING SUM(QUANTIDADE) > 394000 
ORDER BY SUM(QUANTIDADE) DESC;


SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) FROM ITENS_NOTAS_FISCAIS 
GROUP BY CODIGO_DO_PRODUTO HAVING SUM(QUANTIDADE) > 394000 
ORDER BY SUM(QUANTIDADE) DESC;


