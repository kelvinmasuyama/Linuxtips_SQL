-- Databricks notebook source
SELECT * 
FROM silver_olist.pedido

where descSituacao = 'delivered'

LIMIT 100

-- leia-se: selecione todas as colunas da tabela silver_olist.pedido onde a situação do pedido seja entregue 'delived', (caso queira que seja diferente coloque o sinal <>)

-- COMMAND ----------

SELECT * 
FROM silver_olist.pedido

where (descSituacao = 'shipped' OR descSituacao = 'canceled')
AND YEAR(dtPedido) = '2018'

-- leia-se: selecione todas as colunas da tabela silver_olist.pedido filtrando pedidos (enviados ou cancelados) de 2018

LIMIT 1000



-- COMMAND ----------

SELECT * 
FROM silver_olist.pedido

where descSituacao IN ('shipped','canceled')
AND YEAR(dtPedido) = '2018'

LIMIT 1000

-- leia-se: selecione todas as colunas da tabela silver_olist.pedido filtrando pedidos (enviados ou cancelados) de 2018

-- COMMAND ----------

SELECT *,
       DATEDIFF(dtEstimativaEntrega, dtAprovado) AS diffDatasAprovadoPrevisao
       
FROM silver_olist.pedido

where descSituacao IN ('shipped','canceled')
AND YEAR(dtPedido) = '2018'
AND DATEDIFF(dtEstimativaEntrega, dtAprovado) > 30

LIMIT 1000


-- COMMAND ----------


