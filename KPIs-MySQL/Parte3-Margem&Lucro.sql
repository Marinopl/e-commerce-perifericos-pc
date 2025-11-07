#====================================== Análises de margem, lucratividade e comportamento ======================================#

-- Margem de lucro por produto
SELECT
	pr.Nome_Produto,
    SUM(ped.Receita_Venda - ped.Custo_Venda) AS 'Lucro Total',
    ROUND(SUM(ped.Receita_Venda - ped.Custo_Venda) / SUM(ped.Receita_Venda) * 100, 2) AS 'Margem de Lucro (%)'
FROM pedidos ped
JOIN produtos pr ON pr.ID_Produto = ped.ID_Produto
GROUP BY pr.Nome_Produto
ORDER BY SUM(ped.Receita_Venda - ped.Custo_Venda) DESC;

-- Receita e Margem de lucro por categoria
SELECT
	cat.Categoria,
    SUM(ped.Receita_Venda) AS 'Receita Total',
    ROUND(SUM(ped.Receita_Venda - ped.Custo_Venda),2) AS 'Lucro',
    ROUND(SUM(ped.Receita_Venda - ped.Custo_Venda) / SUM(ped.Receita_Venda) * 100, 2) AS 'Margem de Lucro (%)'
FROM categorias cat
JOIN produtos pr ON cat.ID_Categoria = pr.ID_Categoria
JOIN pedidos ped ON pr.ID_Produto = ped.ID_Produto
GROUP BY cat.Categoria
ORDER BY SUM(ped.Receita_Venda) DESC;

-- Receita por região
SELECT
	l.Loja,
    SUM(ped.Receita_Venda) AS 'Receita Total',
    ROUND(SUM(ped.Receita_Venda - ped.Custo_Venda),2) AS 'Lucro'
FROM pedidos ped
JOIN lojas l ON l.ID_Loja = ped.ID_Loja
GROUP BY l.Loja
ORDER BY SUM(ped.Receita_Venda) DESC;