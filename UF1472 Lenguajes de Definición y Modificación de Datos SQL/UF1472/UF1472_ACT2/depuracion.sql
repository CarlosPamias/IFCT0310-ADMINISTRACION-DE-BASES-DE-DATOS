---- Borramos los campos de las tablas que no usamos en el ejercicio -------
ALTER TABLE pedidos DROP COLUMN "id de transportista";
ALTER TABLE empleados DROP COLUMN "datos adjuntos";
ALTER TABLE clientes DROP COLUMN "datos adjuntos";

select * from clientes;
select * from empleados;
select * from pedidos;