#========================================== Análise Exploratória do Database ==========================================#

-- É necessário entender dimensões, métricas e colunas úteis
-- Descobrir valores faltantes ou outliers

SELECT * FROM clientes;
SELECT * FROM pedidos;

-- Quantos clientes estão cadastrados e qual foi o total de pedidos realizados?
SELECT COUNT(*) AS 'Total_Clientes' FROM clientes;
SELECT COUNT(*) AS 'Total_Pedidos' FROM pedidos;

-- Quais foram os 5 produtos mais vendido do maior para o menor?
SELECT Nome_Produto
FROM produtos
ORDER BY Preco_Unit DESC
LIMIT 5;

-- Distribuição de clientes por sexo
SELECT
	Sexo,
	COUNT(*) AS 'Quantidade Clientes'
FROM clientes
GROUP BY Sexo;
