-- Databricks notebook source
SELECT 
   descState,
   COUNT(DISTINCT idSeller) AS qtSeller
   
FROM silver_olist.sellers

GROUP BY descState
ORDER BY qtSeller DESC

LIMIT 5

-- COMMAND ----------

SELECT 
   descState,
   COUNT(DISTINCT idSeller) AS qtSeller
   
FROM silver_olist.sellers

GROUP BY descState
ORDER BY descState

LIMIT 5

-- COMMAND ----------

select * from silver_olist.sellers
