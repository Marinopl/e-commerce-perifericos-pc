#========================================== Exploratory Data Analysis ==========================================#

-- Understand dimensions, metrics, and useful columns.
-- Identify missing values and potential outliers.

SELECT * FROM clientes;
SELECT * FROM pedidos;

-- How many customers and orders are in the dataset?
SELECT COUNT(*) AS 'Total Customers' FROM clientes;
SELECT COUNT(*) AS 'Total Orders' FROM pedidos;

-- Which five products have the highest unit prices?
SELECT Nome_Produto
FROM produtos
ORDER BY Preco_Unit DESC
LIMIT 5;

-- Customer distribution by gender.
SELECT
	Sexo,
	COUNT(*) AS 'Customer Count'
FROM clientes
GROUP BY Sexo;
