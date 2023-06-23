-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-06-2023 a las 21:47:30
-- Versión del servidor: 8.0.32-0ubuntu0.22.04.2
-- Versión de PHP: 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Proyecto_final`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agennte`
--

CREATE TABLE `agennte` (
  `cedula` int NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido` varchar(30) NOT NULL,
  `id_cuidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `agennte`
--

INSERT INTO `agennte` (`cedula`, `Nombre`, `Apellido`, `id_cuidad`) VALUES
(2, 'juan', 'velez', 1),
(4, 'gonzalo', 'montiel', 1),
(5, 'camilo', 'loaiza', 2),
(6, 'daniel', 'torres', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casa_automotriz`
--

CREATE TABLE `casa_automotriz` (
  `id_casa_automotriz` int NOT NULL,
  `Nombre_casa_automotriz` varchar(50) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `id_cuidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `casa_automotriz`
--

INSERT INTO `casa_automotriz` (`id_casa_automotriz`, `Nombre_casa_automotriz`, `direccion`, `id_cuidad`) VALUES
(1, 'consesionari #|', 'calle 15', 1),
(2, 'consesionari #2', 'calle 17', 1),
(3, 'consesionario #3', 'avenida sur ', 2),
(4, 'consesionario #4', 'avenida  norte', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id_cuidad` int NOT NULL,
  `Nombre_cuidad` varchar(30) NOT NULL,
  `id_departamento` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id_cuidad`, `Nombre_cuidad`, `id_departamento`) VALUES
(1, 'cali', 1),
(2, 'cartago', 1),
(3, 'buenaventura', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` int NOT NULL,
  `Nombre_departamento` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id_departamento`, `Nombre_departamento`) VALUES
(1, 'valle'),
(2, 'Manizales'),
(3, 'RISARALDA'),
(4, 'Atlantico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infracion`
--

CREATE TABLE `infracion` (
  `codigo_infracion` int NOT NULL,
  `fecha_infraccion` varchar(30) NOT NULL,
  `articulo_infracion` varchar(30) NOT NULL,
  `lugar_infracion` varchar(30) NOT NULL,
  `importe_infracion` int NOT NULL,
  `matricula` int NOT NULL,
  `cedula_persona` int NOT NULL,
  `id_cuidad` int NOT NULL,
  `cedula_agente` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `infracion`
--

INSERT INTO `infracion` (`codigo_infracion`, `fecha_infraccion`, `articulo_infracion`, `lugar_infracion`, `importe_infracion`, `matricula`, `cedula_persona`, `id_cuidad`, `cedula_agente`) VALUES
(1, '11/12/10', '11', 'aqui', 1000, 1, 1, 1, 2),
(2, '3', '11', 'alla', 30000, 1, 2, 2, 2),
(3, '3', '11', 'alla', 30000, 1, 2, 2, 2),
(8, '11/12/10', '11', 'aqui', 1000, 1, 1, 1, 2),
(11, '24/11/2022', '01', 'carrera 4 ', 900, 3, 1, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_codigo` int NOT NULL,
  `Direccion_marca` varchar(30) NOT NULL,
  `Nombre_Marca` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_codigo`, `Direccion_marca`, `Nombre_Marca`) VALUES
(1, 'calle 2', 'toyota'),
(2, 'calle 2', 'mitsubishi'),
(3, 'calle 2', 'mercedes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `id_codigo` int NOT NULL,
  `potenica` int NOT NULL,
  `Nombre_modelo` varchar(30) NOT NULL,
  `id_codigo_marca` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `modelo`
--

INSERT INTO `modelo` (`id_codigo`, `potenica`, `Nombre_modelo`, `id_codigo_marca`) VALUES
(1, 2300, 'Txl', 1),
(2, 1800, 'Montero', 2),
(3, 5000, 'RAM', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `Nombre` varchar(30) NOT NULL,
  `cedula_persona` int NOT NULL,
  `domicilio` varchar(30) NOT NULL,
  `fecha_nacimiento` varchar(20) NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `id_cuidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`Nombre`, `cedula_persona`, `domicilio`, `fecha_nacimiento`, `Apellido`, `id_cuidad`) VALUES
('Benito ', 1, 'pereira', '1', 'martinez', 1),
('austin ', 2, 'pereira', '1', 'santos', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `matricula` int NOT NULL,
  `fecha_matricula` varchar(30) NOT NULL,
  `id_codigo` int NOT NULL,
  `id_casa_automotriz` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`matricula`, `fecha_matricula`, `id_codigo`, `id_casa_automotriz`) VALUES
(1, '11/11/2011', 1, 1),
(2, '11/11/2011', 1, 1),
(3, '11/11/2011', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agennte`
--
ALTER TABLE `agennte`
  ADD PRIMARY KEY (`cedula`),
  ADD KEY `id_cuidad` (`id_cuidad`);

--
-- Indices de la tabla `casa_automotriz`
--
ALTER TABLE `casa_automotriz`
  ADD PRIMARY KEY (`id_casa_automotriz`),
  ADD KEY `id_cuidad` (`id_cuidad`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id_cuidad`),
  ADD KEY `id_cuidad` (`id_departamento`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `infracion`
--
ALTER TABLE `infracion`
  ADD PRIMARY KEY (`codigo_infracion`),
  ADD KEY `matricula` (`matricula`),
  ADD KEY `cedula_persona` (`cedula_persona`),
  ADD KEY `id_cuidad` (`id_cuidad`),
  ADD KEY `cc_agente` (`cedula_agente`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_codigo`);

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id_codigo`),
  ADD KEY `id_codigo` (`id_codigo_marca`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`cedula_persona`),
  ADD KEY `id_cuidad` (`id_cuidad`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`matricula`),
  ADD KEY `id_codigo` (`id_codigo`),
  ADD KEY `id_casa_automotriz` (`id_casa_automotriz`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agennte`
--
ALTER TABLE `agennte`
  ADD CONSTRAINT `agennte_ibfk_1` FOREIGN KEY (`id_cuidad`) REFERENCES `ciudad` (`id_cuidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `casa_automotriz`
--
ALTER TABLE `casa_automotriz`
  ADD CONSTRAINT `casa_automotriz_ibfk_2` FOREIGN KEY (`id_cuidad`) REFERENCES `ciudad` (`id_cuidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `infracion`
--
ALTER TABLE `infracion`
  ADD CONSTRAINT `infracion_ibfk_1` FOREIGN KEY (`id_cuidad`) REFERENCES `ciudad` (`id_cuidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `infracion_ibfk_2` FOREIGN KEY (`cedula_agente`) REFERENCES `agennte` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `infracion_ibfk_3` FOREIGN KEY (`cedula_persona`) REFERENCES `persona` (`cedula_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `infracion_ibfk_4` FOREIGN KEY (`matricula`) REFERENCES `vehiculo` (`matricula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`id_codigo_marca`) REFERENCES `marca` (`id_codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`id_cuidad`) REFERENCES `ciudad` (`id_cuidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`id_codigo`) REFERENCES `marca` (`id_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehiculo_ibfk_2` FOREIGN KEY (`id_casa_automotriz`) REFERENCES `casa_automotriz` (`id_casa_automotriz`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
