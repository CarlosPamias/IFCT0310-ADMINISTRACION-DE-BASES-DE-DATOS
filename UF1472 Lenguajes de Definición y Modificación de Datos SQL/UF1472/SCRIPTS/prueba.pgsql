CREATE TABLE Autores (autor_id SERIAL PRIMARY KEY, nombre VARCHAR(50) NOT NULL,     apellido VARCHAR(100) NOT NULL, pais_id VARCHAR(3) REFERENCES Naciones(pais_id));
CREATE TABLE Naciones (pais_id VARCHAR(3) PRIMARY KEY, nombre VARCHAR(50) NOT NULL);
CREATE TABLE Libros (ISBN VARCHAR(13) PRIMARY KEY, titulo VARCHAR(150) NOT NULL,    genero_id INT REFERENCES Genero(genero_id),  autor_id INT REFERENCES Autores(autor_id) fecha_publicacion DATE);
CREATE TABLE Genero (genero_id SERIAL PRIMARY KEY, nombre VARCHAR(50) NOT NULL);
CREATE TABLE Usuarios (usuario_id SERIAL PRIMARY KEY, nombre VARCHAR(50) NOT NULL,     apellido VARCHAR(50) NOT NULL,  telefono VARCHAR(15), email VARCHAR(50));
CREATE TABLE Prestamos (libro_id VARCHAR(13) REFERENCES Libros(ISBN), usuario_id INTEGER REFERENCES Usuarios(usuario_id), fecha_prestamo DATE PRIMARY KEY,  fecha_devolucion DATE );

