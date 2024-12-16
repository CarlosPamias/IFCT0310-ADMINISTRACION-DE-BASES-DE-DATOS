CREATE TABLE cambios_gastos_envio (
id_pedido int,
gastos_anterior decimal(9,2),
gastos_actual decimal(9,2),
usuario char(20),
fecha timestamp)

CREATE FUNCTION cambiar_gastos_envio() RETURNS TRIGGER AS
$$
BEGIN
INSERT INTO cambios_gastos_envio (id_pedido, gastos_anterior, gastos_actual, usuario, fecha) 
	VALUES(OLD."id de pedido", OLD."gastos de envío", NEW."gastos de envío", CURRENT_USER, CURRENT_TIMESTAMP);
RETURN NULL;
END;
$$ LANGUAGE plpgsql; 

CREATE TRIGGER modificar_gastos_envio
AFTER UPDATE OF "gastos de envío" ON pedidos
FOR EACH ROW 
EXECUTE FUNCTION cambiar_gastos_envio();

SELECT * FROM pedidos WHERE "id de pedido" = 43;

UPDATE pedidos SET "gastos de envío" = 152 WHERE "id de pedido" = 43;

SELECT * FROM cambios_gastos_envio