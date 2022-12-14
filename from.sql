-- Databricks notebook source
SELECT * FROM silver_olist.pedido

-- leia-se: selecione TUDO da tabela silver_olist.pedido

-- COMMAND ----------

SELECT idPedido, 
       idCliente,
       descSituacao

FROM silver_olist.pedido

-- leia-se: Selecione a coluna idPedido, idcliente e descSituacao da tabela silver_olist.pedido

-- COMMAND ----------

SELECT
  idPedido,
  idCliente,
  descSituacao
FROM
  silver_olist.pedido
LIMIT
  5

-- COMMAND ----------

SELECT *,
       DATEDIFF(dtEstimativaEntrega, dtEntregue) AS qtDiasPromessaEntrega

FROM silver_olist.pedido

-- COMMAND ----------



-- COMMAND ----------


