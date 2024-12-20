CREATE DATABASE neptuno;

CREATE TABLE categorias (
  IdCategoria SERIAL PRIMARY KEY, 
  NombreDeCategoria VARCHAR(15),  
  Descripcion VARCHAR(64),  
  ProductoBasico BOOLEAN  
);

INSERT INTO categorias ("idcategoria", "nombredecategoria", "descripcion", "productobasico") VALUES
(1, 'Bebidas', 'Gaseosas, café, té, cervezas y maltas', FALSE),
(2, 'Condimentos', 'Salsas dulces y picantes, delicias, comida para untar y aderezos', TRUE),
(3, 'Repostería', 'Postres, dulces y pan dulce', FALSE),
(4, 'Lácteos', 'Quesos', FALSE),
(5, 'Granos/Cereales', 'Pan, galletas, pasta y cereales', TRUE),
(6, 'Carnes', 'Carnes preparadas', TRUE),
(7, 'Frutas/Verduras', 'Frutas secas y queso de soja', FALSE),
(8, 'Pescado/Marisco', 'Pescados, mariscos y algas', FALSE);

CREATE TABLE companiasdeenvios (
  IdCompaniaEnvios integer CHECK (IdCompaniaEnvios BETWEEN 0 AND 999) NOT NULL,
  NombreCompania varchar(16),
  Telefono varchar(14)
);

INSERT INTO "companiasdeenvios" ("idcompaniaenvios", "nombrecompania", "telefono") VALUES
(1, 'Speedy Express', '(503) 555-9831'),
(2, 'United Package', '(503) 555-3199'),
(3, 'Federal Shipping', '(503) 555-9931');

CREATE TABLE productos (
  IdProducto INT PRIMARY KEY,
  NombreProducto VARCHAR(40),
  IdProveedor INT,
  IdCategoria INT,
  CantidadPorUnidad VARCHAR(20),
  PrecioUnidad DECIMAL(5,2),
  UnidadesEnExistencia INT,
  UnidadesEnPedido INT,
  NivelNuevoPedido INT,
  Suspendido INT
);

INSERT INTO productos (idproducto, nombreproducto, idproveedor, idcategoria, cantidadporunidad, preciounidad, unidadesenexistencia, unidadesenpedido, nivelnuevopedido, suspendido) VALUES
(1, 'Té Dharamsala', 1, 1, '10 cajas x 20 bolsas', '18.00', 39, 0, 10, 0),
(2, 'Cerveza tibetana Barley', 1, 1, '24 - bot. 12 l', '19.00', 17, 40, 25, 0),
(3, 'Sirope de regaliz', 1, 2, '12 - bot. 550 ml', '10.00', 13, 70, 25, 0),
(4, 'Especias Cajun del chef Anton', 2, 2, '48 - frascos 6 l', '22.00', 53, 0, 0, 0),
(5, 'Mezcla Gumbo del chef Anton', 2, 2, '36 cajas', '21.35', 0, 0, 0, 1),
(6, 'Mermelada de grosellas de la abuela', 3, 2, '12 - frascos 8 l', '25.00', 120, 0, 25, 0),
(7, 'Peras secas orgánicas del tío Bob', 3, 7, '12 - paq. 1 kg', '30.00', 15, 0, 10, 0),
(8, 'Salsa de arándanos Northwoods', 3, 2, '12 - frascos 12 l', '40.00', 6, 0, 0, 0),
(9, 'Buey Mishi Kobe', 4, 6, '18 - paq. 500 g', '97.00', 29, 0, 0, 1),
(10, 'Pez espada', 4, 8, '12 - frascos 200 ml', '31.00', 31, 0, 0, 0),
(11, 'Queso Cabrales', 5, 4, 'paq. 1 kg', '21.00', 22, 30, 30, 0),
(12, 'Queso Manchego La Pastora', 5, 4, '10 - paq. 500 g', '38.00', 86, 0, 0, 0),
(13, 'Algas Konbu', 6, 8, 'caja 2 kg', '6.00', 24, 0, 5, 0),
(14, 'Cuajada de judías', 6, 7, '40 - paq. 100 g', '23.25', 35, 0, 0, 0),
(15, 'Salsa de soja baja en sodio', 6, 2, '24 - bot. 250 ml', '15.50', 39, 0, 5, 0),
(16, 'Postre de merengue Pavlova', 7, 3, '32 - cajas 500 g', '17.45', 29, 0, 10, 0),
(17, 'Cordero Alice Springs', 7, 6, '20 - latas 1 kg', '39.00', 0, 0, 0, 1),
(18, 'Langostinos tigre Carnarvon', 7, 8, 'paq. 16 kg', '62.50', 42, 0, 0, 0),
(19, 'Pastas de té de chocolate', 8, 3, '10 cajas x 12 piezas', '9.20', 25, 0, 5, 0),
(20, 'Mermelada de Sir Rodneys', 8, 3, '30 cajas regalo', '81.00', 40, 0, 0, 0),
(21, 'Bollos de Sir Rodneys', 8, 3, '24 paq. x 4 piezas', '10.00', 3, 40, 5, 0),
(22, 'Pan de centeno crujiente estilo Gustafs', 9, 5, '24 - paq. 500 g', '21.00', 104, 0, 25, 0),
(23, 'Pan fino', 9, 5, '12 - paq. 250 g', '9.00', 61, 0, 25, 0),
(24, 'Refresco Guaraná Fantástica', 10, 1, '12 - latas 355 ml', '4.50', 20, 0, 0, 1),
(25, 'Crema de chocolate y nueces NuNuCa', 11, 3, '20 - vasos 450 g', '14.00', 76, 0, 30, 0),
(26, 'Ositos de goma Gumbär', 11, 3, '100 - bolsas 250 g', '31.23', 15, 0, 0, 0),
(27, 'Chocolate Schoggi', 11, 3, '100 - piezas 100 g', '43.90', 49, 0, 30, 0),
(28, 'Col fermentada Rössle', 12, 7, '25 - latas 825 g', '45.60', 26, 0, 0, 1),
(29, 'Salchicha Thüringer', 12, 6, '50 bolsas x 30 salch', '123.79', 0, 0, 0, 1),
(30, 'Arenque blanco del noroeste', 13, 8, '10 - vasos 200 g', '25.89', 10, 0, 15, 0),
(31, 'Queso gorgonzola Telino', 14, 4, '12 - paq. 100 g', '12.50', 0, 70, 20, 0),
(32, 'Queso Mascarpone Fabioli', 14, 4, '24 - paq. 200 g', '32.00', 9, 40, 25, 0),
(33, 'Queso de cabra', 15, 4, '500 g', '2.50', 112, 0, 20, 0),
(34, 'Cerveza Sasquatch', 16, 1, '24 - bot. 12 l', '14.00', 111, 0, 15, 0),
(35, 'Cerveza negra Steeleye', 16, 1, '24 - bot. 12 l', '18.00', 20, 0, 15, 0),
(36, 'Escabeche de arenque', 17, 8, '24 - frascos 250 g', '19.00', 112, 0, 20, 0),
(37, 'Salmón ahumado Gravad', 17, 8, '12 - paq. 500 g', '26.00', 11, 50, 25, 0),
(38, 'Vino Côte de Blaye', 18, 1, '12 - bot. 75 cl', '263.50', 17, 0, 15, 0),
(39, 'Licor verde Chartreuse', 18, 1, '750 cc por bot.', '18.00', 69, 0, 5, 0),
(40, 'Carne de cangrejo de Boston', 19, 8, '24 - latas 4 l', '18.40', 123, 0, 30, 0),
(41, 'Crema de almejas estilo Nueva Inglaterra', 19, 8, '12 - latas 12 l', '9.65', 85, 0, 10, 0),
(42, 'Tallarines de Singapur', 20, 5, '32 - 1 kg paq.', '14.00', 26, 0, 0, 1),
(43, 'Café de Malasia', 20, 1, '16 - latas 500 g', '46.00', 17, 10, 25, 0),
(44, 'Azúcar negra Malacca', 20, 2, '20 - bolsas 2 kg', '19.45', 27, 0, 15, 0),
(45, 'Arenque ahumado', 21, 8, 'paq. 1k', '9.50', 5, 70, 15, 0),
(46, 'Arenque salado', 21, 8, '4 - vasos 450 g', '12.00', 95, 0, 0, 0),
(47, 'Galletas Zaanse', 22, 3, '10 - cajas 4 l', '9.50', 36, 0, 0, 0),
(48, 'Chocolate holandés', 22, 3, '10 paq.', '12.75', 15, 70, 25, 0),
(49, 'Regaliz', 23, 3, '24 - paq. 50 g', '20.00', 10, 60, 15, 0),
(50, 'Chocolate blanco', 23, 3, '12 - barras 100 g', '16.25', 65, 0, 30, 0),
(51, 'Manzanas secas Manjimup', 24, 7, '50 - paq. 300 g', '53.00', 20, 0, 10, 0),
(52, 'Cereales para Filo', 24, 5, '16 - cajas 2 kg', '7.00', 38, 0, 25, 0),
(53, 'Empanada de carne', 24, 6, '48 porc.', '32.80', 0, 0, 0, 1),
(54, 'Empanada de cerdo', 25, 6, '16 tartas', '7.45', 21, 0, 10, 0),
(55, 'Paté chino', 25, 6, '24 cajas x 2 tartas', '24.00', 115, 0, 20, 0),
(56, 'Gnocchi de la abuela Alicia', 26, 5, '24 - paq. 250 g', '38.00', 21, 10, 30, 0),
(57, 'Raviolis Angelo', 26, 5, '24 - paq. 250 g', '19.50', 36, 0, 20, 0),
(58, 'Caracoles de Borgoña', 27, 8, '24 porc.', '13.25', 62, 0, 20, 0),
(59, 'Raclet de queso Courdavault', 28, 4, 'paq. 5 kg', '55.00', 79, 0, 0, 0),
(60, 'Camembert Pierrot', 28, 4, '15 - paq. 300 g', '34.00', 19, 0, 0, 0),
(61, 'Sirope de arce', 29, 2, '24 - bot. 500 ml', '28.50', 113, 0, 25, 0),
(62, 'Tarta de azúcar', 29, 3, '48 tartas', '49.30', 17, 0, 0, 0),
(63, 'Sandwich de vegetales', 7, 2, '15 - frascos 625 g', '43.90', 24, 0, 5, 0),
(64, 'Bollos de pan de Wimmer', 12, 5, '20 bolsas x 4 porc.', '33.25', 22, 80, 30, 0),
(65, 'Salsa de pimiento picante de Luisiana', 2, 2, '32 - bot. 8 l', '21.05', 76, 0, 0, 0),
(66, 'Especias picantes de Luisiana', 2, 2, '24 - frascos 8 l', '17.00', 4, 100, 20, 0),
(67, 'Cerveza Laughing Lumberjack', 16, 1, '24 - bot. 12 l', '14.00', 52, 0, 10, 0),
(68, 'Barras de pan de Escocia', 8, 3, '10 cajas x 8 porc.', '12.50', 6, 10, 15, 0),
(69, 'Queso Gudbrandsdals', 15, 4, 'paq. 10 kg', '36.00', 26, 0, 15, 0),
(70, 'Cerveza Outback', 7, 1, '24 - bot. 355 ml', '15.00', 15, 10, 30, 0),
(71, 'Crema de queso Fløtemys', 15, 4, '10 - paq. 500 g', '21.50', 26, 0, 0, 0),
(72, 'Queso Mozzarella Giovanni', 14, 4, '24 - paq. 200 g', '34.80', 14, 0, 0, 0),
(73, 'Caviar rojo', 17, 8, '24 - frascos150 g', '15.00', 101, 0, 5, 0),
(74, 'Queso de soja Longlife', 4, 7, 'paq. 5 kg', '10.00', 4, 20, 5, 0),
(75, 'Cerveza Klosterbier Rhönbräu', 12, 1, '24 - bot. 0,5 l', '7.75', 125, 0, 25, 0),
(76, 'Licor Cloudberry', 23, 1, '500 ml', '18.00', 57, 0, 20, 0),
(77, 'Salsa verde original Frankfurter', 12, 2, '12 cajas', '13.00', 32, 0, 15, 0);



--
-- Índices de la tabla "productos"
--
ALTER TABLE "productos"
  ADD CONSTRAINT "fk_productos_IdCategoria" FOREIGN KEY (IdCategoria) REFERENCES "categorias" (IdCategoria);
