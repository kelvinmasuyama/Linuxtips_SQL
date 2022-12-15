-- Databricks notebook source
-- 01 selecione todos os clientes paulistanos 

SELECT * 

FROM silver_olist.cliente

WHERE descCidade = 'sao paulo'

-- COMMAND ----------

-- 02 Selecione todos os clientes paulistas

SELECT * 

FROM silver_olist.cliente

WHERE descUF = 'SP'

-- COMMAND ----------

-- 03 Selecione todos os vendedores cariocas e paulistas

SELECT *
FROM silver_olist.vendedor
WHERE descCidade = 'rio de janeiro'
OR descUF = 'SP'

-- COMMAND ----------

-- DBTITLE 1,Exercício 04
-- 04 Selecione todos os produtos de perfumaria e bebes com aluta maior que 5cm

SELECT *

FROM silver_olist.produto
WHERE descCategoria IN ('perfumaria', 'bebes')
AND vlAlturaCm > 5
