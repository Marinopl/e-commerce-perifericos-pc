# 🖥️ Comércio de Periféricos para Computador — Análise de Vendas (SQL + Power BI)

Projeto de portfólio que simula a operação de uma **rede de lojas de tecnologia** que realiza vendas online e físicas de periféricos para computador.  
O objetivo é **analisar o desempenho de vendas, lucro e comportamento dos clientes** utilizando **SQL para tratamento e modelagem dos dados** e **Power BI para visualização e geração de insights**.

---

## 📊 Objetivo do Projeto

Criar um pipeline completo de análise de dados:
1. **Modelagem e criação do banco de dados** em MySQL;
2. **Consultas SQL** para gerar indicadores e métricas de negócio;
3. **Integração com o Power BI**;
4. **Desenvolvimento de um dashboard interativo** com KPIs e visualizações gerenciais.

---

## 🧩 Estrutura do Banco de Dados

O banco foi modelado com base em um cenário de vendas de produtos tecnológicos, com 6 tabelas principais:

**clientes**: Dados demográficos e socioeconômicos dos clientes
**pedidos**: Informações de cada venda (data, receita, custo, quantidade, etc.)
**produtos**: Catálogo de produtos e suas características
**categorias**: Classificação dos produtos
**lojas**: Informações das lojas físicas e seus gerentes
**locais**: Localização geográfica das lojas

---

## 🧱 Modelagem Relacional

- **Relação 1:N** entre `clientes` e `pedidos`  
- **Relação 1:N** entre `produtos` e `pedidos`  
- **Relação 1:N** entre `lojas` e `pedidos`  
- **Relação 1:N** entre `categorias` e `produtos`  
- **Relação 1:1** entre `lojas` e `locais`  

**Chaves Primárias e Estrangeiras:**
- `clientes.id_cliente` → `pedidos.id_cliente`
- `produtos.id_produto` → `pedidos.id_produto`
- `lojas.id_loja` → `pedidos.id_loja`
- `categorias.id_categoria` → `produtos.id_categoria`

---

## 💾 Etapas no MySQL

1. Criação das tabelas [Banco de Dados](https://github.com/Marinopl/e-commerce-perifericos-pc/tree/main/Banco%20de%20Dados);
2. Criação das Chaves Primárias (PKs) para cada tabela e conexão por Engenharia Reversa no MySQL Workbench;
3. **Parte1-EDA**: Realização de Análise Exploratória dos dados (EDA), entendendo métricas e dimensões -> utilizando-se SELECT, COUNT(), FROM e GROUP BY;
4. **Parte2-Relacional**: Entendendo as ferramentas relacionais entre as tabelas e criando KPIs relevantes para a análise -> utilizando-se JOIN E ORDER BY;
5. **Parte3-Margem&Lucro**: Encontrando KPIs relevantes para insights de negócio;
6. **Parte4-KPIs**: Encontrando KPIs relevantes para insightes de produto e clientes.

![Modelo Relacional](https://github.com/Marinopl/e-commerce-perifericos-pc/blob/main/Dashboard-PowerBI/relacional.jpg)

--- 

## 🔗 Integração com Power BI

* Conexão direta com o servidor MySQL local
* Configuração das relações conforme modelo relacional
* Criação de medidas DAX para cálculos dinâmicos para os KPIs

---

## 📊 Dashboard - Power BI

* KPIs Principais
  - Receita Total;
  - Lucro Total;
  - Ticket Médio;
  - Margem de Lucro;
  - Número de Clientes;
 
* [Principais visualizações no dashboard](https://github.com/Marinopl/e-commerce-perifericos-pc/tree/main/Dashboard-PowerBI)
  - Receita e Lucro por Cidade -> Identificar quais lojas eram mais lucrativas;
  - Lucro por Nº de Funcionário -> Avaliar a produtividade das lojas;
  - Receita total por Mês -> Observar a tendência temporal das vendas;
  - Lucro e Custo por Marca -> Analisar tendência de Marcas;
  - Receita por Categoria -> Entender participação por linha de produto;
  - Filtros por escolaridade -> Segmentar o público consumidor.

 ![Previwe do Dashboard](https://github.com/Marinopl/e-commerce-perifericos-pc/blob/main/Dashboard-PowerBI/dashboard_preview.jpg)
