-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-09-2024 a las 14:28:39
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
-- Base de datos: `comisionestrabajo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comision`
--

CREATE TABLE `comision` (
  `ID_comision` varchar(7) NOT NULL,
  `descripción` varchar(50) NOT NULL,
  `presupuesto` float NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comision`
--

INSERT INTO `comision` (`ID_Comision`, `descripción`, `presupuesto`, `fechaInicio`, `fechaFin`) VALUES
('INSRED1', 'Instalación Red 1', 12527.5, '2024-09-19', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comisionmiembro`
--

CREATE TABLE `comisionmiembro` (
  `ID_Comision` varchar(7) NOT NULL,
  `DNI` varchar(9) NOT NULL,
  `STSCoordinador` tinyint(1) NOT NULL,
  `ID_funcion` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comisionmiembro`
--

INSERT INTO `comisionmiembro` (`ID_Comision`, `DNI`, `STSCoordinador`, `ID_funcion`) VALUES
('INSRED1', '23456789D', 0, 2),
('INSRED1', '25669247A', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcion`
--

CREATE TABLE `funcion` (
  `ID_funcion` int(6) NOT NULL,
  `descripción` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `funcion`
--

INSERT INTO `funcion` (`ID_funcion`, `descripción`) VALUES
(1, 'Responsable'),
(2, 'Ayudante1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miembro`
--

CREATE TABLE `miembro` (
  `DNI` varchar(9) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `móvil` varchar(9) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `ID_sector` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `miembro`
--

INSERT INTO `miembro` (`DNI`, `nombre`, `apellidos`, `móvil`, `email`, `ID_sector`) VALUES
('23456789D', 'Profesor', 'Bueno', NULL, 'profesor@profe.com', 2),
('25669247A', 'Pepito', 'Grillo', NULL, 'pepito@grillo.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recurso`
--

CREATE TABLE `recurso` (
  `ID_recurso` int(6) NOT NULL,
  `descripción` varchar(50) NOT NULL,
  `fechaInicio` datetime NOT NULL,
  `fechaFin` datetime DEFAULT NULL,
  `disponible` tinyint(1) NOT NULL,
  `ID_Comision` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recurso`
--

INSERT INTO `recurso` (`ID_recurso`, `descripción`, `fechaInicio`, `fechaFin`, `disponible`, `ID_Comision`) VALUES
(1, 'Portatil NS 12345', '2024-09-19 13:47:39', NULL, 1, 'INSRED1'),
(2, 'Aula 123', '2024-09-19 13:47:39', NULL, 1, 'INSRED1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sector`
--

CREATE TABLE `sector` (
  `ID_Sector` int(6) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sector`
--

INSERT INTO `sector` (`ID_Sector`, `descripcion`) VALUES
(1, 'Alumno'),
(2, 'Profesor');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comision`
--
ALTER TABLE `comision`
  ADD PRIMARY KEY (`ID_Comision`);

--
-- Indices de la tabla `comisionmiembro`
--
ALTER TABLE `comisionmiembro`
  ADD PRIMARY KEY (`ID_Comision`,`DNI`);

--
-- Indices de la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD PRIMARY KEY (`ID_funcion`);

--
-- Indices de la tabla `miembro`
--
ALTER TABLE `miembro`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `recurso`
--
ALTER TABLE `recurso`
  ADD PRIMARY KEY (`ID_recurso`);

--
-- Indices de la tabla `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`ID_Sector`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `funcion`
--
ALTER TABLE `funcion`
  MODIFY `ID_funcion` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `recurso`
--
ALTER TABLE `recurso`
  MODIFY `ID_recurso` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sector`
--
ALTER TABLE `sector`
  MODIFY `ID_Sector` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
