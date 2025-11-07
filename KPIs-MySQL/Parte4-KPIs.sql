#================================ Análises de Indicadores de Clientes e Performance ================================#

-- Receita média por faixa de renda
SELECT CASE
	WHEN Renda_Anual < 30000 THEN 'Baixa'
    WHEN Renda_Anual BETWEEN 30000 AND 70000 THEN 'Média'
    ELSE 'Alta'
    END AS faixa_renda,
    ROUND(AVG(ped.Receita_Venda), 2) AS receita_media
FROM clientes c
JOIN pedidos ped ON c.ID_Cliente = ped.ID_Cliente
GROUP BY faixa_renda
ORDER BY receita_media DESC;

-- Clientes com maior número de pedidos
SELECT
	cl.Nome,
    COUNT(ped.ID_Pedido) AS 'Total de Pedidos'
FROM pedidos ped
JOIN clientes cl ON cl.ID_Cliente = ped.ID_Cliente
GROUP BY cl.Nome
ORDER BY COUNT(ped.ID_Pedido) DESC
LIMIT 5;


