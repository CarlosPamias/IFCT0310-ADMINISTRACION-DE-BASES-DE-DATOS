CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    importe NUMERIC(10, 2),
    ciudad_cliente VARCHAR(60)
);
-- Fichero cambios pedidos
CREATE TABLE auditoria_pedidos (
    id_pedido INT,
    usuario VARCHAR(60),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION registrar_auditoria() 
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO auditoria_pedidos (id_pedido, usuario, fecha)
    VALUES (NEW.id_pedido, current_user, CURRENT_TIMESTAMP);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_registrar_auditoria
AFTER INSERT ON pedidos
FOR EACH ROW
EXECUTE FUNCTION registrar_auditoria();

CREATE OR REPLACE FUNCTION aumentar_importe() 
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.ciudad_cliente = 'Barcelona' THEN
        NEW.importe := NEW.importe + 100;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_aumentar_importe
BEFORE INSERT ON pedidos
FOR EACH ROW
EXECUTE FUNCTION aumentar_importe();

BEGIN;

UPDATE pedidos
SET importe = importe * 0.90
WHERE importe > 1000;

COMMIT;

INSERT INTO pedidos (importe, ciudad_cliente) VALUES 
(1500, 'Barcelona'), 
(200, 'Madrid'),
(1200, 'Barcelona'), 
(800, 'Valencia'),
(1000, 'Barcelona'), 
(500, 'Sevilla'),
(3000, 'Barcelona'),
(950, 'Madrid'),
(1100, 'Barcelona');   

SELECT * FROM pedidos

SELECT * FROM auditoria_pedidos