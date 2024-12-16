CREATE TABLE cuenta (
    num_cuenta VARCHAR(4) PRIMARY KEY,
    nombre VARCHAR(50),
    email VARCHAR(50),
    saldo NUMERIC(10, 2)
);
-- Insertar las 10 cuentas con saldos iniciales (ejemplo)
INSERT INTO cuenta (num_cuenta, nombre, email, saldo) VALUES
('0001', 'Persona 1', 'persona1@colectivo.com', 1500.00),
('0002', 'Persona 2', 'persona2@colectivo.com', 1600.00),
('0003', 'Persona 3', 'persona3@colectivo.com', 1700.00),
('0004', 'Persona 4', 'persona4@colectivo.com', 1800.00),
('0005', 'Persona 5', 'persona5@colectivo.com', 1900.00),
('0006', 'Persona 6', 'persona6@colectivo.com', 2000.00),
('0007', 'Persona 7', 'persona7@colectivo.com', 2100.00),
('0008', 'Persona 8', 'persona8@colectivo.com', 2200.00),
('0009', 'Persona 9', 'persona9@colectivo.com', 2300.00),
('0010', 'Persona 10', 'persona10@colectivo.com', 2400.00),
('A001', 'Colectividad', 'colectividad@colectividad.com', 100.00);

-- Transacción bloqueada
BEGIN;

-- Restar 100 € de cada miembro
UPDATE cuenta
SET saldo = saldo - 100
WHERE num_cuenta != 'A001';

-- Sumar los 1000 € en total a la cuenta general
UPDATE cuenta
SET saldo = saldo + 1000
WHERE num_cuenta = 'A001';

COMMIT;
3.	Crear el disparador (trigger) para registrar las modificaciones de saldo:

-- Crear la tabla para registrar las modificaciones de saldo
CREATE TABLE log_modificaciones (
    id SERIAL PRIMARY KEY,
    num_cuenta VARCHAR(4),
    nombre VARCHAR(100),
    saldo_anterior NUMERIC(10, 2),
    saldo_nuevo NUMERIC(10, 2),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear la función para el disparador
CREATE OR REPLACE FUNCTION registrar_modificacion()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO log_modificaciones (num_cuenta, nombre, saldo_anterior, saldo_nuevo)
    VALUES (OLD.num_cuenta, OLD.nombre, OLD.saldo, NEW.saldo);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear el disparador
CREATE TRIGGER trigger_modificacion_saldo
AFTER UPDATE ON cuenta
FOR EACH ROW
EXECUTE FUNCTION registrar_modificacion();

select * from cuenta
select * from log_modificaciones

CREATE TABLE usuarios (
    alias VARCHAR(40) PRIMARY KEY,
    password VARCHAR(40)
);
INSERT INTO usuarios (alias, password) VALUES ('admin', 'admin123');
INSERT INTO usuarios (alias, password) VALUES ('usu001', '123456');

select * from usuarios;
