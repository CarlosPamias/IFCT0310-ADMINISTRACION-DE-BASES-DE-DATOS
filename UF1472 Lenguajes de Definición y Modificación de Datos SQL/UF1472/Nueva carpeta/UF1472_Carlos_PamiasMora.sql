-- Pregunta 1 --
SELECT idpedido, fechapedido
FROM pedidos
WHERE EXTRACT(YEAR FROM fechapedido) = 1998

-- pregunta 2 --
SELECT DISTINCT(paísdestinatario), COUNT(idpedido) AS Cantidad
FROM pedidos
GROUP BY paísdestinatario;

-- Pregunta 3 --
SELECT idpedido, fechapedido, fechaentrega
FROM pedidos
WHERE fechapedido BETWEEN '1997-05-01' AND '1997-08-01' 
  AND fechaentrega IS NOT NULL;

-- Pregunta 4 --
SELECT *
FROM pedidos
WHERE paísdestinatario IN ('Francia', 'Italia') 
  AND cargo BETWEEN 100 AND 200
ORDER BY paísdestinatario ASC, cargo DESC;

-- Pregunta 5 --
SELECT COUNT(*) AS "pedido pendientes envio"
FROM pedidos
WHERE fechaenvío IS NULL;

-- Pregunta 6 --
SELECT p.idpedido, p.fechapedido, c.nombrecompañía
FROM pedidos p
JOIN clientes c ON p.idcliente = c.idcliente;

-- Pregunta 7 --

SELECT c.nombrecompañía, COUNT(p.idpedido) AS "Total pedidos"
FROM pedidos p
JOIN clientes c ON p.idcliente = c.idcliente
GROUP BY c.nombrecompañía;

-- Pregunta 8 --
SELECT p.idpedido, p.fechapedido, c.nombrecompañía
FROM pedidos p
JOIN clientes c ON p.idcliente = c.idcliente
WHERE c.país = 'México';

-- Pregunta 9 --

SELECT c.nombrecompañía, MIN(p.fechapedido) AS "Primer pedido"
FROM pedidos p
JOIN clientes c ON p.idcliente = c.idcliente
GROUP BY c.nombrecompañía;

-- Pregunta 10 --
SELECT c.nombrecompañía, c.país
FROM clientes c
LEFT JOIN pedidos p ON c.idcliente = p.idcliente
WHERE p.idcliente IS NULL;



