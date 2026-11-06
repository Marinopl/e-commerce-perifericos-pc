#====================================== Margin and Profitability Analysis ======================================#

-- Profit and margin by product.
SELECT
	pr.Nome_Produto,
    SUM(ped.Receita_Venda - ped.Custo_Venda) AS 'Total Profit',
    ROUND(SUM(ped.Receita_Venda - ped.Custo_Venda) / SUM(ped.Receita_Venda) * 100, 2) AS 'Profit Margin (%)'
FROM pedidos ped
JOIN produtos pr ON pr.ID_Produto = ped.ID_Produto
GROUP BY pr.Nome_Produto
ORDER BY SUM(ped.Receita_Venda - ped.Custo_Venda) DESC;

-- Revenue, profit, and margin by category.
SELECT
	cat.Categoria,
    SUM(ped.Receita_Venda) AS 'Total Revenue',
    ROUND(SUM(ped.Receita_Venda - ped.Custo_Venda),2) AS 'Profit',
    ROUND(SUM(ped.Receita_Venda - ped.Custo_Venda) / SUM(ped.Receita_Venda) * 100, 2) AS 'Profit Margin (%)'
FROM categorias cat
JOIN produtos pr ON cat.ID_Categoria = pr.ID_Categoria
JOIN pedidos ped ON pr.ID_Produto = ped.ID_Produto
GROUP BY cat.Categoria
ORDER BY SUM(ped.Receita_Venda) DESC;

-- Revenue and profit by store.
SELECT
	l.Loja,
    SUM(ped.Receita_Venda) AS 'Total Revenue',
    ROUND(SUM(ped.Receita_Venda - ped.Custo_Venda),2) AS 'Profit'
FROM pedidos ped
JOIN lojas l ON l.ID_Loja = ped.ID_Loja
GROUP BY l.Loja
ORDER BY SUM(ped.Receita_Venda) DESC;