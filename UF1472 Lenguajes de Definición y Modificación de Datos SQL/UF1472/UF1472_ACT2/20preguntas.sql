-- 1 Pedidos realizados por cada cliente  --
SELECT c.nombre, c.apellidos, p."id de pedido", p."fecha de pedido"
FROM clientes c
JOIN pedidos p ON c.id  = p."id de cliente"
ORDER BY c.nombre, c.apellidos, p."fecha de pedido";

-- 2 Obtener el numero de pedidos realizados por cada cliente --
SELECT c.nombre, c.apellidos, COUNT(p."id de pedido") AS "numero de pedidos"
FROM clientes c
JOIN pedidos p ON c.id  = p."id de cliente"
GROUP BY c.nombre, c.apellidos

-- 3 listar los pedidos realizados en 2006 --
SELECT * 
FROM pedidos
WHERE "fecha de pedido">= '20060101' AND "fecha de pedido" <= '20061231';

-- 4 Obtener el cliente que ha realizado el pedido mas reciente --
SELECT c.nombre,c.apellidos, p."id de pedido", p."fecha de pedido"
FROM clientes c
JOIN pedidos p ON c.id = p."id de cliente"
ORDER BY p."fecha de pedido" DESC
LIMIT 1;

-- 5 Listar los clientes que no han tenido ningún pedido --
SELECT c.nombre,c.apellidos
FROM clientes c
LEFT JOIN pedidos p ON c.id = p."id de cliente"
WHERE p."id de pedido" IS NULL;

-- 6 Obtener el total de gastos de envio por cliente--
SELECT c.nombre, c.apellidos, SUM(p."gastos de envío") AS total_gastos_envio, COUNT(p."gastos de envío") AS cantidad_pedidos
FROM clientes c
JOIN pedidos p ON c.id = p."id de cliente"
GROUP BY c.nombre, c.apellidos
ORDER BY total_gastos_envio;

-- 7 listar los pedidos cuyo cargo sea mayor de 100 --
SELECT * 
FROM pedidos
WHERE "gastos de envío">= 100;

-- 8 Obtener el cliente con el mayor numero de pedidos --
SELECT c.nombre, c.apellidos, SUM(p."gastos de envío") AS total_gastos_envio
FROM clientes c
JOIN pedidos p ON c.id = p."id de cliente"
GROUP BY c.nombre, c.apellidos
ORDER BY total_gastos_envio DESC
LIMIT 1;

--9 Listar los pedidos realizados en el último mes.--
SELECT c.nombre, c.apellidos, p."id de pedido", p."fecha de pedido"
FROM clientes c
JOIN pedidos p ON c.id = p."id de cliente"
WHERE p."fecha de pedido" >= '20060601';

--10 Obtener el pedido promedio de gastos de envío de los pedidos realizados por cada cliente.--
SELECT c.nombre, c.apellidos, AVG(p."gastos de envío") AS PromedioGastosEnvio
FROM clientes c
JOIN pedidos p ON c.id = p."id de cliente"
GROUP BY c.nombre, c.apellidos;

--11 Listar los clientes que han realizado pedidos en más de una ocasión.--
SELECT c.nombre, c.apellidos, COUNT(p."id de pedido") AS NumeroPedidos
FROM clientes c
JOIN pedidos p ON c.id = p."id de cliente"
GROUP BY c.nombre, c.apellidos
HAVING COUNT(p."id de pedido") > 1;

--12 Obtener el pedido con el importe de gastos de envío más alto.--
SELECT p."id de pedido", p."gastos de envío", c.nombre, c.apellidos
FROM pedidos p
JOIN clientes c ON p."id de cliente" = c.id
ORDER BY p."gastos de envío" DESC
LIMIT 1;

--13 listar los pedidos realizados por clientes cuyo nombre empiece por “A”,--
SELECT p."id de pedido", p."fecha de pedido", c.nombre, c.apellidos
FROM pedidos p
JOIN clientes c ON p."id de cliente" = c.id
WHERE c.nombre LIKE 'A%';

--14 obtener el total de gastos de envío realizados en cada mes del año 2006--
SELECT EXTRACT(MONTH FROM p."fecha de pedido") AS Mes, 
       SUM(p."gastos de envío") AS TotalGastosEnvio
FROM pedidos p
WHERE EXTRACT(YEAR FROM p."fecha de pedido") = 2006
GROUP BY EXTRACT(MONTH FROM p."fecha de pedido");

--15 Listar los clientes y sus pedidos ordenados por la fecha del pedido--
SELECT c.nombre, c.apellidos, p."id de pedido", p."fecha de pedido"
FROM clientes c
JOIN pedidos p ON c.id = p."id de cliente"
ORDER BY p."fecha de pedido";

--16 Obtener el importe de los gastos de envío--
SELECT SUM("gastos de envío") AS TotalGastosEnvio
FROM pedidos;

--17 Listar los pedidos realizados por clientes que tienen más de 5 pedidos.--
SELECT p."id de pedido", p."fecha de pedido", c.nombre, c.apellidos
FROM pedidos p
JOIN clientes c ON p."id de cliente" = c.id
JOIN (
      SELECT p."id de cliente"
      FROM pedidos p
      GROUP BY p."id de cliente"
      HAVING COUNT(p."id de pedido") > 5
) AS clientes_frecuentes ON p."id de cliente" = clientes_frecuentes."id de cliente";


--18 Obtener el cliente con el importe total de los gastos de envío más alto.--
SELECT c.nombre, c.apellidos, SUM(p."gastos de envío") AS TotalGastosEnvio
FROM clientes c
JOIN pedidos p ON c.id = p."id de cliente"
GROUP BY c.nombre, c.apellidos
ORDER BY TotalGastosEnvio DESC
LIMIT 1;


--19 listar los pedidos realizados en los 15 primeros días de enero de 2006.--
SELECT p."id de pedido", p."fecha de pedido", c.nombre, c.apellidos
FROM pedidos p
JOIN clientes c ON p."id de cliente" = c.id
WHERE p."fecha de pedido" BETWEEN '20060101' AND '20060115';

--20 Obtener el numero total de clientes que han realizados pedidos en el año 2006.--
SELECT COUNT(DISTINCT p."id de cliente") AS TotalClientes
FROM pedidos p
WHERE EXTRACT(YEAR FROM p."fecha de pedido") = 2006;
