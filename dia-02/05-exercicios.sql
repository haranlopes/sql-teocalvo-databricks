-- Databricks notebook source
-- DBTITLE 1,Exercícios de fixação - Lista de clientes da cidade de São Paulo
SELECT
  *
FROM
  silver_olist.cliente
WHERE
  descCidade = 'sao paulo'

-- COMMAND ----------

-- DBTITLE 1,Lista de clientes do estado de São Paulo
SELECT
  *
FROM
  silver_olist.cliente
WHERE
  descUF = 'SP'

-- COMMAND ----------

-- DBTITLE 1,Lista de clientes da cidade de São Paulo utilizando o 'IN'
SELECT
  *
FROM
  silver_olist.cliente
WHERE
  descCidade IN ('sao paulo')

-- COMMAND ----------

-- DBTITLE 1,Lista de vendedores da cidade do Rio de Janeiro e da cidade de São Paulo
SELECT
  *
FROM
  silver_olist.vendedor
WHERE
  descCidade IN ('rio de janeiro', 'sao paulo')
  
-- outra forma para a mesma query e resultados
-- SELECT * FROM silver_olist.vendedor WHERE descCidade = 'rio de janeiro' OR descUF = 'SP'

-- COMMAND ----------

-- DBTITLE 1,Lista de produtos categorizados como 'perfumaria' OU 'bebes' e com Altura maior que 5
SELECT
  *
FROM
  silver_olist.produto
WHERE
  descCategoria IN ('perfumaria', 'bebes')
  AND vlAlturaCm > 5

-- COMMAND ----------

-- DBTITLE 1,1. Lista de pedidos com mais de um item.
SELECT
  *
FROM
  silver_olist.
WHERE

-- COMMAND ----------

-- DBTITLE 1,2. Lista de pedidos que o frete é mais caro que o item.
SELECT
  *
FROM
  silver_olist.item_pedido
WHERE
  vlFrete > vlPreco

-- COMMAND ----------

-- DBTITLE 1,3. Lista de pedidos que ainda não foram enviados.
SELECT
  *
FROM
  silver_olist.pedido
WHERE
  descSituacao NOT IN ('delivered')

-- COMMAND ----------

-- DBTITLE 1,4. Lista de pedidos que foram entregues com atraso.
SELECT
  *
FROM
  silver_olist.pedido
WHERE
  DATE(dtEstimativaEntrega) < DATE(dtEntregue)

-- COMMAND ----------

-- DBTITLE 1,5. Lista de pedidos que foram entregues com 2 dias de antecedência.
SELECT
  *
FROM
  silver_olist.pedido
WHERE
  DATEDIFF(dtEntregue, dtEstimativaEntrega) = -2

-- COMMAND ----------

-- DBTITLE 1,6. Lista de pedidos feito em dezembro de 2017 e entregues com atraso.
SELECT
  *
FROM
  silver_olist.pedido
WHERE
  YEAR(dtPedido) = '2017'
  AND MONTH(dtPedido) = '12'
  AND dtEntregue > dtEstimativaEntrega -- WHERE DATEDIFF(dtEntregue, dtEstimativaEntrega) = -2

-- COMMAND ----------

-- DBTITLE 1,7. Lista de pedidos com avaliação maior ou igual que 4.
SELECT
  *
FROM
  silver_olist.avaliacao_pedido
WHERE
  vlNota >= 4

-- COMMAND ----------

-- DBTITLE 1,8. Lista de pedidos com 2 ou mais parcelas menores que R$ 20,00.
SELECT
  *,
  vlPagamento / nrPacelas AS vlParcela
FROM
  silver_olist.pagamento_pedido
  
-- WHERE vlParcela >= 20