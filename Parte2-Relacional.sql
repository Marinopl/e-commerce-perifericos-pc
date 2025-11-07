#========================================== Relacionamento entre tabelas ==========================================#

-- Receita total por loja
SELECT
	l.Loja,
    SUM(p.Receita_Venda) AS 'Receita Total'
FROM pedidos p
JOIN lojas l ON p.ID_Loja = l.ID_Loja
GROUP BY l.Loja
ORDER BY SUM(p.Receita_Venda) DESC;

-- Ticket médio por produto
SELECT
	pr.Nome_Produto,
	ROUND(AVG(p.Receita_Venda), 0) AS 'Ticket Médio'
FROM pedidos p
JOIN produtos pr ON p.ID_Produto = pr.ID_Produto
GROUP BY pr.Nome_Produto
ORDER BY AVG(p.Receita_Venda) DESC;

-- Receita total por categoria
SELECT
	c.Categoria,
    SUM(ped.Receita_Venda) AS 'Receita Total'
FROM pedidos ped
JOIN produtos pr ON ped.ID_Produto = pr.ID_Produto
JOIN categorias c ON pr.ID_Categoria = c.ID_Categoria
GROUP BY c.Categoria
ORDER BY SUM(ped.Receita_Venda) DESC;

-- Top 10 clientes por receita
SELECT
	cl.Nome,
    SUM(ped.Receita_Venda) AS 'Total Gasto'
FROM pedidos ped
JOIN clientes cl ON cl.ID_Cliente = ped.ID_Cliente
GROUP BY cl.Nome
ORDER BY SUM(ped.Receita_Venda) DESC
LIMIT 10;

-- Top 5 clientes por pedidos
SELECT
	cl.Nome,
    COUNT(ped.ID_Pedido) AS 'Total de Pedidos'
FROM pedidos ped
JOIN clientes cl ON cl.ID_Cliente = ped.ID_Cliente
GROUP BY cl.Nome
ORDER BY COUNT(ped.ID_Pedido) DESC
LIMIT 5;
