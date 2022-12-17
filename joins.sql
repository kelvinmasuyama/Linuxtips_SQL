-- Databricks notebook source
SELECT T1.*,
       T2.descState

FROM silver_olist.orders AS T1

LEFT JOIN silver_olist.customers AS T2

ON T1.idCustomer = T2.idCustomer

-- COMMAND ----------

-- DBTITLE 1,Qual categoria que tem mais produtos vendidos?
SELECT *

FROM silver_olist.order_items AS T1

LEFT JOIN silver_olist.products AS T2
ON T1.idProduct = T2.idProduct



-- COMMAND ----------

SELECT T2.descCategoryName,
       COUNT(*)

FROM silver_olist.order_items AS T1

LEFT JOIN silver_olist.products AS T2
ON T1.idProduct = T2.idProduct

GROUP BY T2.descCategoryName

ORDER BY COUNT(*) DESC

LIMIT 5

-- COMMAND ----------

-- Qual categorias tem produtos mais caros, em média?

SELECT T2.descCategoryName,
       AVG(T1.vlPrice),
       MAX(T1.vlPrice)

FROM silver_olist.order_items AS T1

LEFT JOIN silver_olist.products AS T2
ON T1.idProduct = T2.idProduct 

GROUP BY T2.DescCategoryName

ORDER BY AVG(T1.vlPrice) DESC 

-- COMMAND ----------

--- Os clientes de qual estado pagam mais frete? deu ruim rs



SELECT T1.idOrder,
       T1.vlFreght,
       T2.idCustomer,
       T3.descState 

FROM silver_olist.order_items AS T1

LEFT JOIN silver_olist.orders AS T2
ON T1.idOrder = T2.idOrder 

LEFT JOIN silver_olist.customers AS T3
ON T2.idCustomer = T3.idCustomer

GROUP BY T3.descState

HAVING AVG(T1.vlFreght) > 40 

Order BY avgFregth DESC





-- COMMAND ----------

SELECT * 

FROM silver_olist.customers
