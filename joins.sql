-- Databricks notebook source
SELECT T1.*,
       T2.descState

FROM silver_olist.orders AS T1

LEFT JOIN silver_olist.customers AS T2

ON T1.idCustomer = T2.idCustomer
