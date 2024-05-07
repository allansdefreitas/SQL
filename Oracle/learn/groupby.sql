select cidade, sum(idade) from tabela_de_clientes
group by Cidade  
order by cidade;


select cidade, sum(limite_de_credito), sum(idade) from tabela_de_clientes group by cidade;

select embalagem, max(preco_de_lista) from tabela_de_produtos group by embalagem order by embalagem;