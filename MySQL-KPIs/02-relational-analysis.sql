#========================================== Relational Analysis ==========================================#

-- Total revenue by store.
SELECT
	l.Loja,
    SUM(p.Receita_Venda) AS 'Total Revenue'
FROM pedidos p
JOIN lojas l ON p.ID_Loja = l.ID_Loja
GROUP BY l.Loja
ORDER BY SUM(p.Receita_Venda) DESC;

-- Average order value by product.
SELECT
	pr.Nome_Produto,
	ROUND(AVG(p.Receita_Venda), 0) AS 'Average Order Value'
FROM pedidos p
JOIN produtos pr ON p.ID_Produto = pr.ID_Produto
GROUP BY pr.Nome_Produto
ORDER BY AVG(p.Receita_Venda) DESC;

-- Total revenue by category.
SELECT
	c.Categoria,
    SUM(ped.Receita_Venda) AS 'Total Revenue'
FROM pedidos ped
JOIN produtos pr ON ped.ID_Produto = pr.ID_Produto
JOIN categorias c ON pr.ID_Categoria = c.ID_Categoria
GROUP BY c.Categoria
ORDER BY SUM(ped.Receita_Venda) DESC;

-- Top 10 customers by revenue.
SELECT
	cl.Nome,
    SUM(ped.Receita_Venda) AS 'Total Spent'
FROM pedidos ped
JOIN clientes cl ON cl.ID_Cliente = ped.ID_Cliente
GROUP BY cl.Nome
ORDER BY SUM(ped.Receita_Venda) DESC
LIMIT 10;

-- Top five customers by order count.
SELECT
	cl.Nome,
    COUNT(ped.ID_Pedido) AS 'Total Orders'
FROM pedidos ped
JOIN clientes cl ON cl.ID_Cliente = ped.ID_Cliente
GROUP BY cl.Nome
ORDER BY COUNT(ped.ID_Pedido) DESC
LIMIT 5;
