CREATE TABLE alumnos (
    codigo SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(50),
    nota_final NUMERIC(3,1) CHECK (nota_final >= 0 AND nota_final <= 10),
    asistencia NUMERIC(5,2) CHECK (asistencia >= 0 AND asistencia <= 100)
);
INSERT INTO alumnos (nombre, apellidos, nota_final, asistencia)
VALUES
('Juan', 'Pérez', 7.5, 95),      
('María', 'Gómez', 8.0, 85),     
('Pedro', 'Sánchez', 9.0, 92),   
('Lucía', 'Martínez', 5.0, 45),  
('Carlos', 'Díaz', 4.5, 50),     
('Ana', 'López', 3.0, 48),       
('Luis', 'Fernández', 6.0, 70),  
('Sofía', 'Rodríguez', 10.0, 100); 

select * from alumnos;

-- Crear la función que ajusta la nota según la asistencia
CREATE OR REPLACE FUNCTION ajustar_notas() RETURNS VOID AS $$
BEGIN
    -- Aumentar la nota en 1 si la asistencia es mayor a 90, pero que no exceda de 10
    UPDATE alumnos
    SET nota_final = LEAST(nota_final + 1, 10)
    WHERE asistencia > 90;

    -- Reducir la nota en 1 si la asistencia es menor a 50, pero que no sea menor de 0
    UPDATE alumnos
    SET nota_final = GREATEST(nota_final - 1, 0)
    WHERE asistencia < 50;
END;
$$ LANGUAGE plpgsql;

-- Ejecutar la función para ajustar las notas
SELECT ajustar_notas();

select * from alumnos order by codigo;



