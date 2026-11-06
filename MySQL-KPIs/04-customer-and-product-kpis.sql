#================================ Customer and Product KPIs ================================#

-- Average revenue by annual income segment.
SELECT CASE
	WHEN Renda_Anual < 30000 THEN 'Low'
    WHEN Renda_Anual BETWEEN 30000 AND 70000 THEN 'Middle'
    ELSE 'High'
    END AS income_segment,
    ROUND(AVG(ped.Receita_Venda), 2) AS average_revenue
FROM clientes c
JOIN pedidos ped ON c.ID_Cliente = ped.ID_Cliente
GROUP BY income_segment
ORDER BY average_revenue DESC;

-- Customers with the highest number of orders.
SELECT
	cl.Nome,
    COUNT(ped.ID_Pedido) AS 'Total Orders'
FROM pedidos ped
JOIN clientes cl ON cl.ID_Cliente = ped.ID_Cliente
GROUP BY cl.Nome
ORDER BY COUNT(ped.ID_Pedido) DESC
LIMIT 5;
