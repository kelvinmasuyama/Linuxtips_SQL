-- Databricks notebook source
SELECT *
FROM silver_olist.customers

-- COMMAND ----------

SELECT descState,
       COUNT(idCustomer) AS qtSellerState
       
FROM silver_olist.customers

WHERE descState IN ('SP', 'MG', 'RJ', 'ES')

GROUP BY descState 

HAVING COUNT(idCustomer) >= 100

ORDER BY qtSellerState DESC

LIMIT 5


-- COMMAND ----------

SELECt *

FROM silver_olist.abt_churn

LIMIT 1000
