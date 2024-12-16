create database cursos encoding 'utf-8'

CREATE TABLE curso (
curso char(20) primary key,
precio decimal(9,2),
fecha_inicio date)

INSERT INTO curso (curso, precio, fecha_inicio) VALUES ('SQL', 2200, '20050115');

UPDATE curso SET precio = precio+300 WHERE curso = 'Python';

UPDATE curso SET fecha_inicio = '20050130' WHERE curso = 'SQL';

SELECT * FROM curso;

SELECT * FROM cambios_precio;

SELECT * FROM cambios_fecha;

CREATE TABLE cambios_precio (
curso char(20),
precio_anterior decimal(9,2),
precio_actual decimal(9,2),
usuario char(20),
fecha date)

CREATE TABLE cambios_fecha (
curso char(20),
fecha_anterior date,
fecha_actual date,
usuario char(20),
fecha date)

CREATE FUNCTION cambiar_precios() RETURNS TRIGGER AS
$$
BEGIN
INSERT INTO cambios_precio (curso, precio_anterior, precio_actual, usuario, fecha) 
	VALUES(OLD.curso, OLD.precio, NEW.precio, CURRENT_USER, CURRENT_DATE);
RETURN NULL;
END;
$$ LANGUAGE plpgsql; 

CREATE FUNCTION cambiar_fechas() RETURNS TRIGGER AS
$$
BEGIN
INSERT INTO cambios_fecha (curso, fecha_anterior, fecha_actual,usuario, fecha) 
	VALUES(OLD.curso, OLD.fecha_inicio, NEW.fecha_inicio, CURRENT_USER, CURRENT_DATE);
RETURN NULL;
END;
$$ LANGUAGE plpgsql; 

CREATE TRIGGER modificar_precios
AFTER UPDATE OF precio ON curso
FOR EACH ROW 
EXECUTE FUNCTION cambiar_precios();

CREATE TRIGGER modificar_fechas
AFTER UPDATE OF fecha_inicio ON curso
FOR EACH ROW 
EXECUTE FUNCTION cambiar_fechas();