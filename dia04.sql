-- Databricks notebook source
-- LISTA DE VENDEDORES QUE ESTÃO NO ESTADO COM MENOS CLIENTES

SELECT descState,
       COUNT(DISTINCT idUniqueCustomer)

FROM silver_olist.customers

GROUP BY descState
ORDER BY COUNT(DISTINCT idUniqueCustomer) DESC


-- COMMAND ----------

SELECT idSeller, descState
FROM silver_olist.sellers
WHERE descState = (

   SELECT descState
   FROM silver_olist.customers
   GROUP BY descState
   ORDER BY COUNT(DISTINCT idUniqueCustomer) DESC
   LIMIT 1
  
)

-- COMMAND ----------

SELECT descState,
       COUNT(DISTINCT idUniqueCustomer)

FROM silver_olist.customers

GROUP BY descState
ORDER BY COUNT(DISTINCT idUniqueCustomer) DESC

-- COMMAND ----------

SELECT idSeller, descState
FROM silver_olist.sellers
WHERE descState IN (

   SELECT descState
   FROM silver_olist.customers
   GROUP BY descState
   ORDER BY COUNT(DISTINCT idUniqueCustomer) DESC
   LIMIT 2
  
)

-- COMMAND ----------

-- Isso é o que chamam de CTE

WITH tb_estados AS( 

  SELECT descState
  FROM silver_olist.customers
  GROUP BY descState
  ORDER BY COUNT(DISTINCT idUniqueCustomer) DESC
  LIMIT 2

) 
SELECT idSeller, 
       descState
       
FROM silver_olist.sellers

WHERE descState IN (SELECT * FROM tb_estados)

-- COMMAND ----------

-- Em andamento

WITH tb_estados AS( 

  SELECT descState
  FROM silver_olist.customers
  GROUP BY descState
  ORDER BY COUNT(DISTINCT idUniqueCustomer) DESC
  LIMIT 2

),

SELECT idSeller, 
       descState
       
FROM silver_olist.sellers

WHERE descState IN (SELECT * FROM tb_estados)

tb_vendedores AS(

  SELECT idSaller, descState
  FROM silver_olist.sellers
  WHERE descState IN (SELECT descState FROM tb_estados)

-- COMMAND ----------

-- Nota média dos pedidos dos vendedores de cada estado

WITH tb_pedido_nota AS(

  SELECT T1.idSeller, T2.vlScore
  FROM silver_olist.order_items AS T1
  
  LEFT JOIN silver_olist.order_review AS T2
  ON T1.idOrder = T2.idOrder

),

tb_AVG_vendedor AS (

  SELECT idSeller,
       AVG(vlScore) AS avgScore
  FROM tb_pedido_nota
  GROUP BY idSeller

),

tb_vendedor_estado AS (

  SELECT T1.*,
         T2.descState
  FROM tb_avg_vendedor AS T1
  LEFT JOIN silver_olist.sellers AS T2
  ON T1.idSeller = T2.idSeller


)

SELECT * FROM tb_vendedor_estado

-- COMMAND ----------



-- COMMAND ----------

-- Nota média dos pedidos dos vendedores de cada estado

WITH tb_pedido_nota AS(

  SELECT T1.idSeller, T2.vlScore
  FROM silver_olist.order_items AS T1
  
  LEFT JOIN silver_olist.order_review AS T2
  ON T1.idOrder = T2.idOrder

),

tb_AVG_vendedor AS (

  SELECT idSeller,
       AVG(vlScore) AS avgScore
  FROM tb_pedido_nota
  GROUP BY idSeller

),

tb_vendedor_estado AS (

  SELECT T1.*,
         T2.descState
  FROM tb_avg_vendedor AS T1
  LEFT JOIN silver_olist.sellers AS T2
  ON T1.idSeller = T2.idSeller


)

SELECT descState,
       AVG(avgNotaVendedoravgNota) AS avgNotaEstado
       
FROM tb_vendedor_estado

GROUP By descState
Order BY avgNotaEstado DESC
