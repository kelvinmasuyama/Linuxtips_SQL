-- Databricks notebook source
-- LINHAS NÃO NULAS

SELECT COUNT(*) AS LinhasNaonulas


FROM silver_olist.cliente

-- COMMAND ----------

SELECT 
    COUNT(*) AS nrLinhasNaonulas, -- Conta Linhas não nulas
    COUNT(idCliente) AS nrIdClientenaonulo, -- Conta id de clientes não nulos
    COUNT(DISTINCT idCliente) AS nrIdClienteDistintos, -- Conta id de clientes distintos 
    
    COUNT(idClienteUnico) AS nrIdClienteUnico,
    COUNT(DISTINCT idClienteUnico) AS nrIdClienteUnicoDistintos -- Conta id de clientes únicos distintos
    
    
FROM silver_olist.cliente

-- COMMAND ----------

SELECT 
    COUNT(*)

FROM silver_olist.cliente

WHERE descCidade = 'presidente prudente' -- Contagem das pessoas que moram em presidente prudente

-- COMMAND ----------

SELECT 
    COUNT(*) AS qtLinhas,
    COUNT(distinct idCliente) AS qtClientes,
    COUNT(distinct idClienteUnico) AS qtClientesUnicos

FROM silver_olist.cliente

WHERE descCidade IN ('presidente prudente', 'curitiba') -- Contagem das pessoas que moram em presidente prudente

-- COMMAND ----------

SELECT 
    ROUND(AVG(vlPreco),2) AS avgPreco, -- Media da coluna vlPreco (preço médio dos produtos)
    
    INT(PERCENTILE(vlPreco, 0.5)) AS medianPreco, -- Preço mediano dos produtos
    
    MAX(vlPreco) AS maxPreco,
    AVG(vlFrete) AS avgFrete,
    MIN(vlFrete) AS minFrete,
    MAX(vlFrete) AS maxFrete
    
    
FROM silver_olist.item_pedido

-- COMMAND ----------

SELECT COUNT(*) 
FROM silver_olist.cliente
WHERE descUF = 'SC'

-- COMMAND ----------


