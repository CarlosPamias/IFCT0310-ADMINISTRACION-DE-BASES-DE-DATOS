CREATE TABLE fecha_alta (
empleado int,
usuario char(20),
fecha date)

CREATE FUNCTION alta_empleado()RETURNS TRIGGER AS
$$
BEGIN
INSERT INTO fecha_alta (empleado, usuario, fecha) 
	VALUES(NEW.id,  CURRENT_USER, CURRENT_DATE);
RETURN NULL;
END;
$$ LANGUAGE plpgsql; 

CREATE TRIGGER nuevo_Empleados
AFTER INSERT ON empleados
FOR EACH ROW 
EXECUTE FUNCTION alta_empleado();

SELECT * FROM empleados

INSERT INTO empleados (id, compañía, apellidos, nombre) VALUES (11, 'Northwin', 'Grilllo', 'Pepito')

SELECT * FROM fecha_alta
