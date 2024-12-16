-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-09-2024 a las 13:25:11
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `la_rapita`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `captura`
--

CREATE TABLE `captura` (
  `Matricula` char(12) NOT NULL,
  `Fecha` date NOT NULL,
  `Id_especie` tinyint(3) UNSIGNED NOT NULL,
  `Cantidad_Kilos` decimal(10,2) DEFAULT NULL,
  `Beneficio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `captura`
--

INSERT INTO `captura` (`Matricula`, `Fecha`, `Id_especie`, `Cantidad_Kilos`, `Beneficio`) VALUES
('ESTRELLA5678', '2024-09-20', 5, 250.30, 5100.90),
('LUNA12345678', '2024-09-15', 4, 100.75, 3200.80),
('MAR123456789', '2024-09-01', 1, 300.50, 4500.75),
('OCE456789012', '2024-09-05', 2, 150.25, 3500.00),
('SOL789012345', '2024-09-10', 3, 200.00, 4200.50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `embarcacion`
--

CREATE TABLE `embarcacion` (
  `Matricula` char(12) NOT NULL,
  `Manga` decimal(5,2) DEFAULT NULL,
  `Eslora` decimal(5,2) DEFAULT NULL,
  `Calado` decimal(5,2) DEFAULT NULL,
  `Max_Tripulantes` tinyint(3) UNSIGNED DEFAULT NULL,
  `Foto_Lateral` blob DEFAULT NULL,
  `Foto_Proa` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `embarcacion`
--

INSERT INTO `embarcacion` (`Matricula`, `Manga`, `Eslora`, `Calado`, `Max_Tripulantes`, `Foto_Lateral`, `Foto_Proa`) VALUES
('ESTRELLA5678', 5.90, 19.70, 3.30, 13, NULL, NULL),
('LUNA12345678', 6.00, 20.50, 3.40, 14, NULL, NULL),
('MAR123456789', 5.75, 18.50, 3.20, 12, NULL, NULL),
('OCE456789012', 6.30, 22.80, 3.50, 16, NULL, NULL),
('SOL789012345', 4.80, 15.00, 2.90, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `embarcacion_tripulante`
--

CREATE TABLE `embarcacion_tripulante` (
  `Matricula` char(12) NOT NULL,
  `NIF` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `embarcacion_tripulante`
--

INSERT INTO `embarcacion_tripulante` (`Matricula`, `NIF`) VALUES
('LUNA12345678', '99887766E'),
('MAR123456789', '12345678A'),
('MAR123456789', '87654321B'),
('OCE456789012', '11223345C'),
('SOL789012345', '44332211D');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especie`
--

CREATE TABLE `especie` (
  `Id_especie` tinyint(3) UNSIGNED NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especie`
--

INSERT INTO `especie` (`Id_especie`, `Nombre`) VALUES
(1, 'Atún Rojo'),
(2, 'Sardina Dorada'),
(3, 'Merluza Imperial'),
(4, 'Langostino Gigante'),
(5, 'Pulpo Real');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcion`
--

CREATE TABLE `funcion` (
  `Id_funcion` tinyint(3) UNSIGNED NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `funcion`
--

INSERT INTO `funcion` (`Id_funcion`, `Nombre`) VALUES
(1, 'Capitán'),
(2, 'Timonel'),
(3, 'Marinero'),
(4, 'Cocinero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `NIF` char(9) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Movil` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`NIF`, `Nombre`, `Apellidos`, `Movil`, `Email`) VALUES
('11223344C', 'Pedro Solano', '', '600112233', 'pedro@embarcaciones.com'),
('11223345C', 'José', 'Gaviota', '600112459', 'jose@tripulantes.com'),
('12345678A', 'Carlos Viento', '', '600123456', 'carlos@embarcaciones.com'),
('44332211D', 'Lucia Barco', '', '600443322', 'lucia@embarcaciones.com'),
('87654321B', 'Ana Pescadora', 'Marino Lopez', '700987654', 'ana@tripulantes.com'),
('99887766E', 'Lucia Timonel', 'Navega Alvarez', '700998877', 'lucia@tripulantes.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE `propietario` (
  `NIF` char(9) NOT NULL,
  `Direccion_Fiscal` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `propietario`
--

INSERT INTO `propietario` (`NIF`, `Direccion_Fiscal`) VALUES
('11223344C', 'Calle Oceano 7'),
('12345678A', 'Calle de los Marineros 5'),
('44332211D', 'Paseo de la Costa 15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario_embarcacion`
--

CREATE TABLE `propietario_embarcacion` (
  `Matricula` char(12) NOT NULL,
  `NIF` char(9) NOT NULL,
  `Porcentaje_Propiedad` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `propietario_embarcacion`
--

INSERT INTO `propietario_embarcacion` (`Matricula`, `NIF`, `Porcentaje_Propiedad`) VALUES
('MAR123456789', '12345678A', 100.00),
('OCE456789012', '11223344C', 25.00),
('SOL789012345', '44332211D', 100.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `Matricula` char(12) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Millas` decimal(5,2) DEFAULT NULL,
  `Consumo_Gasoil` decimal(10,2) DEFAULT NULL,
  `Importe_Gasoil` decimal(10,2) DEFAULT NULL,
  `Hora_Salida` time DEFAULT NULL,
  `Hora_Vuelta` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `salida`
--

INSERT INTO `salida` (`Matricula`, `Fecha`, `Millas`, `Consumo_Gasoil`, `Importe_Gasoil`, `Hora_Salida`, `Hora_Vuelta`) VALUES
('MAR123456789', '2024-09-01', 250.75, 500.00, 750.50, '06:00:00', '18:00:00'),
('OCE456789012', '2024-09-05', 300.10, 650.75, 850.00, '07:00:00', '19:30:00'),
('SOL789012345', '2024-09-10', 180.50, 400.00, 550.25, '05:30:00', '17:00:00'),
('LUNA12345678', '2024-09-15', 210.00, 550.25, 700.75, '06:30:00', '18:30:00'),
('ESTRELLA5678', '2024-09-20', 275.30, 620.00, 820.10, '07:15:00', '20:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tripulante`
--

CREATE TABLE `tripulante` (
  `NIF` char(9) NOT NULL,
  `Id_funcion` tinyint(3) UNSIGNED DEFAULT NULL,
  `Foto_Cara` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tripulante`
--

INSERT INTO `tripulante` (`NIF`, `Id_funcion`, `Foto_Cara`) VALUES
('11223344C', 3, NULL),
('11223345C', 3, NULL),
('12345678A', 1, NULL),
('44332211D', 1, NULL),
('87654321B', 2, NULL),
('99887766E', 2, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `captura`
--
ALTER TABLE `captura`
  ADD PRIMARY KEY (`Matricula`,`Fecha`,`Id_especie`),
  ADD KEY `Id_especie` (`Id_especie`);

--
-- Indices de la tabla `embarcacion`
--
ALTER TABLE `embarcacion`
  ADD PRIMARY KEY (`Matricula`);

--
-- Indices de la tabla `embarcacion_tripulante`
--
ALTER TABLE `embarcacion_tripulante`
  ADD PRIMARY KEY (`Matricula`,`NIF`),
  ADD KEY `NIF` (`NIF`);

--
-- Indices de la tabla `especie`
--
ALTER TABLE `especie`
  ADD PRIMARY KEY (`Id_especie`);

--
-- Indices de la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD PRIMARY KEY (`Id_funcion`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`NIF`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`NIF`);

--
-- Indices de la tabla `propietario_embarcacion`
--
ALTER TABLE `propietario_embarcacion`
  ADD PRIMARY KEY (`Matricula`,`NIF`),
  ADD KEY `NIF` (`NIF`);

--
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD KEY `Matricula` (`Matricula`);

--
-- Indices de la tabla `tripulante`
--
ALTER TABLE `tripulante`
  ADD PRIMARY KEY (`NIF`),
  ADD KEY `Id_funcion` (`Id_funcion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `especie`
--
ALTER TABLE `especie`
  MODIFY `Id_especie` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `funcion`
--
ALTER TABLE `funcion`
  MODIFY `Id_funcion` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `captura`
--
ALTER TABLE `captura`
  ADD CONSTRAINT `captura_ibfk_1` FOREIGN KEY (`Matricula`) REFERENCES `embarcacion` (`Matricula`) ON UPDATE CASCADE,
  ADD CONSTRAINT `captura_ibfk_2` FOREIGN KEY (`Id_especie`) REFERENCES `especie` (`Id_especie`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `embarcacion_tripulante`
--
ALTER TABLE `embarcacion_tripulante`
  ADD CONSTRAINT `embarcacion_tripulante_ibfk_1` FOREIGN KEY (`Matricula`) REFERENCES `embarcacion` (`Matricula`),
  ADD CONSTRAINT `embarcacion_tripulante_ibfk_2` FOREIGN KEY (`NIF`) REFERENCES `tripulante` (`NIF`);

--
-- Filtros para la tabla `propietario_embarcacion`
--
ALTER TABLE `propietario_embarcacion`
  ADD CONSTRAINT `propietario_embarcacion_ibfk_1` FOREIGN KEY (`Matricula`) REFERENCES `embarcacion` (`Matricula`),
  ADD CONSTRAINT `propietario_embarcacion_ibfk_2` FOREIGN KEY (`NIF`) REFERENCES `propietario` (`NIF`);

--
-- Filtros para la tabla `tripulante`
--
ALTER TABLE `tripulante`
  ADD CONSTRAINT `tripulante_ibfk_1` FOREIGN KEY (`Id_funcion`) REFERENCES `funcion` (`Id_funcion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
