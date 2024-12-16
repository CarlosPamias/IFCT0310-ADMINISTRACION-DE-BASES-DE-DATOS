--20preguntas--
-- Pedidos realizados por cada cliente  --
SELECT c.nombre, c.apellidos, p."id de pedido", p."fecha de pedido"
FROM clientes c
JOIN pedidos p ON c.id  = p."id de cliente"
ORDER BY c.nombre, c.apellidos, p."fecha de pedido";

-- Obtener el numero de pedidos realizados por cada cliente --

SELECT c.nombre, c.apellidos, COUNT(p."id de pedido") AS "numero de pedidos"
FROM clientes c