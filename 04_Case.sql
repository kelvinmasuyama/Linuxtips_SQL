-- Databricks notebook source
SELECT *,

       CASE 
         WHEN descUF = 'SP' THEN 'Paulista' 
         WHEN descUF = 'RJ' THEN 'Fluminense'
         WHEN descUF = 'PR' THEN 'Paranaense'
         ELSE 'Outros'
       END AS DescNacionalidade,
       
       CASE
         WHEN descCidade LIKE '%sao%' THEN 'TEM são no nome'
         ELSE 'Não tem são no nome'
         END AS DesccidadeSao

-- LIKE = parecido (ou seja, vai ter algo parecido com isso onde estamos buscando)


FROM silver_olist.cliente

-- COMMAND ----------

SELECT *, 
       CASE 
         WHEN descUF IN ('SP', 'MG', 'RJ', 'ES') THEN 'sudeste'
      
       END AS descRegiao
      
FROM silver_olist.vendedor

-- COMMAND ----------

SELECT *
FROM silver_olist.item_pedido

-- COMMAND ----------


