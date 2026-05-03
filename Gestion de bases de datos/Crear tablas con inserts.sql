-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-05-2026 a las 19:22:54
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
-- Base de datos: `crucero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crucero`
--

CREATE TABLE `crucero` (
  `id_crucero` int(11) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `zonas` varchar(100) NOT NULL,
  `itinerario` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `crucero`
--

INSERT INTO `crucero` (`id_crucero`, `capacidad`, `zonas`, `itinerario`) VALUES
(1, 500, 'Cubierta, Piscina, Restaurante', 'Barcelona-Valencia-Palma');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estancia`
--

CREATE TABLE `estancia` (
  `id_crucero` int(11) NOT NULL,
  `id_puerto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estancia`
--

INSERT INTO `estancia` (`id_crucero`, `id_puerto`) VALUES
(1, 1),
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id_evento` int(11) NOT NULL,
  `id_crucero_fk` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `lugar` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id_evento`, `id_crucero_fk`, `tipo`, `lugar`, `fecha`, `hora`) VALUES
(1, 1, 'Fiesta', 'Cubierta', '2026-06-02', '22:00:00'),
(2, 1, 'Cena', 'Restaurante', '2026-07-02', '20:00:00'),
(3, 1, 'Concierto', 'Teatro', '2026-08-02', '21:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion`
--

CREATE TABLE `gestion` (
  `id_tripulante` int(11) NOT NULL,
  `id_solicitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gestion`
--

INSERT INTO `gestion` (`id_tripulante`, `id_solicitud`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `id_habitacion` int(11) NOT NULL,
  `id_tripulante_fk` int(11) DEFAULT NULL,
  `id_turista_fk` int(11) DEFAULT NULL,
  `planta` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`id_habitacion`, `id_tripulante_fk`, `id_turista_fk`, `planta`, `numero`, `capacidad`, `categoria`) VALUES
(1, NULL, NULL, 1, 101, 2, 'Suite'),
(2, NULL, NULL, 2, 202, 2, 'Doble'),
(3, NULL, NULL, 3, 303, 1, 'Individual');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencias`
--

CREATE TABLE `incidencias` (
  `id_incidencia` int(11) NOT NULL,
  `id_turista_fk` int(11) NOT NULL,
  `id_tripulante_fk` int(11) NOT NULL,
  `servicio` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `incidencias`
--

INSERT INTO `incidencias` (`id_incidencia`, `id_turista_fk`, `id_tripulante_fk`, `servicio`) VALUES
(1, 1, 1, 'Avería'),
(2, 2, 2, 'Retraso'),
(3, 3, 3, 'Ruido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puerto`
--

CREATE TABLE `puerto` (
  `id_puerto` int(11) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `id_crucero_fk` int(11) NOT NULL,
  `llegada` datetime NOT NULL,
  `salida` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `puerto`
--

INSERT INTO `puerto` (`id_puerto`, `ciudad`, `id_crucero_fk`, `llegada`, `salida`) VALUES
(1, 'Barcelona', 1, '2026-06-01 08:00:00', '2026-06-01 18:00:00'),
(2, 'Málaga', 1, '2026-07-01 09:00:00', '2026-07-01 20:00:00'),
(3, 'Atenas', 1, '2026-08-01 07:00:00', '2026-08-01 17:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id_turista` int(11) NOT NULL,
  `id_habitacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`id_turista`, `id_habitacion`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resolucion`
--

CREATE TABLE `resolucion` (
  `id_tripulante` int(11) NOT NULL,
  `id_incidencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `resolucion`
--

INSERT INTO `resolucion` (`id_tripulante`, `id_incidencia`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE `ruta` (
  `id_ruta` int(11) NOT NULL,
  `longitud` float NOT NULL,
  `duracion` time NOT NULL,
  `id_puerto_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ruta`
--

INSERT INTO `ruta` (`id_ruta`, `longitud`, `duracion`, `id_puerto_fk`) VALUES
(1, 450.5, '06:00:00', 1),
(2, 620, '08:30:00', 2),
(3, 700.3, '09:00:00', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `id_solicitud` int(11) NOT NULL,
  `id_turista_fk` int(11) NOT NULL,
  `id_tripulante_fk` int(11) NOT NULL,
  `servicio` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`id_solicitud`, `id_turista_fk`, `id_tripulante_fk`, `servicio`) VALUES
(1, 1, 1, 'Comida'),
(2, 2, 2, 'Limpieza'),
(3, 3, 3, 'Mantenimiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tripulacion`
--

CREATE TABLE `tripulacion` (
  `id_tripulante` int(11) NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `id_crucero_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tripulacion`
--

INSERT INTO `tripulacion` (`id_tripulante`, `departamento`, `nombre`, `apellidos`, `dni`, `id_crucero_fk`) VALUES
(1, 'Seguridad', 'Juan', 'Pérez López', '111A', 1),
(2, 'Cocina', 'Ana', 'García Ruiz', '222B', 1),
(3, 'Recepción', 'Luis', 'Martín Díaz', '333C', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turistas`
--

CREATE TABLE `turistas` (
  `id_turista` int(11) NOT NULL,
  `id_crucero_fk` int(11) NOT NULL,
  `id_habitacion_fk` int(11) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `origen` varchar(100) NOT NULL,
  `destino` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `turistas`
--

INSERT INTO `turistas` (`id_turista`, `id_crucero_fk`, `id_habitacion_fk`, `nombre`, `apellidos`, `dni`, `categoria`, `origen`, `destino`) VALUES
(1, 1, 1, 'Carlos', 'Sánchez', '444D', 'VIP', 'Madrid', 'Palma'),
(2, 1, 2, 'Lucía', 'Fernández', '555E', 'Normal', 'Sevilla', 'Génova'),
(3, 1, 3, 'Pedro', 'López', '666F', 'VIP', 'Valencia', 'Nápoles');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `crucero`
--
ALTER TABLE `crucero`
  ADD PRIMARY KEY (`id_crucero`);

--
-- Indices de la tabla `estancia`
--
ALTER TABLE `estancia`
  ADD PRIMARY KEY (`id_crucero`,`id_puerto`),
  ADD KEY `id_puerto` (`id_puerto`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `id_crucero_fk` (`id_crucero_fk`);

--
-- Indices de la tabla `gestion`
--
ALTER TABLE `gestion`
  ADD PRIMARY KEY (`id_tripulante`,`id_solicitud`),
  ADD KEY `id_solicitud` (`id_solicitud`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`id_habitacion`),
  ADD UNIQUE KEY `planta` (`planta`,`numero`),
  ADD KEY `id_tripulante_fk` (`id_tripulante_fk`),
  ADD KEY `id_turista_fk` (`id_turista_fk`);

--
-- Indices de la tabla `incidencias`
--
ALTER TABLE `incidencias`
  ADD PRIMARY KEY (`id_incidencia`),
  ADD KEY `id_turista_fk` (`id_turista_fk`),
  ADD KEY `id_tripulante_fk` (`id_tripulante_fk`);

--
-- Indices de la tabla `puerto`
--
ALTER TABLE `puerto`
  ADD PRIMARY KEY (`id_puerto`),
  ADD KEY `id_crucero_fk` (`id_crucero_fk`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_turista`,`id_habitacion`),
  ADD KEY `id_habitacion` (`id_habitacion`);

--
-- Indices de la tabla `resolucion`
--
ALTER TABLE `resolucion`
  ADD PRIMARY KEY (`id_tripulante`,`id_incidencia`),
  ADD KEY `id_incidencia` (`id_incidencia`);

--
-- Indices de la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`id_ruta`),
  ADD KEY `id_puerto_fk` (`id_puerto_fk`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`id_solicitud`),
  ADD KEY `id_turista_fk` (`id_turista_fk`),
  ADD KEY `id_tripulante_fk` (`id_tripulante_fk`);

--
-- Indices de la tabla `tripulacion`
--
ALTER TABLE `tripulacion`
  ADD PRIMARY KEY (`id_tripulante`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `id_crucero_fk` (`id_crucero_fk`);

--
-- Indices de la tabla `turistas`
--
ALTER TABLE `turistas`
  ADD PRIMARY KEY (`id_turista`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `id_crucero_fk` (`id_crucero_fk`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `crucero`
--
ALTER TABLE `crucero`
  MODIFY `id_crucero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  MODIFY `id_habitacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `incidencias`
--
ALTER TABLE `incidencias`
  MODIFY `id_incidencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `puerto`
--
ALTER TABLE `puerto`
  MODIFY `id_puerto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ruta`
--
ALTER TABLE `ruta`
  MODIFY `id_ruta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `id_solicitud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tripulacion`
--
ALTER TABLE `tripulacion`
  MODIFY `id_tripulante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `turistas`
--
ALTER TABLE `turistas`
  MODIFY `id_turista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estancia`
--
ALTER TABLE `estancia`
  ADD CONSTRAINT `estancia_ibfk_1` FOREIGN KEY (`id_crucero`) REFERENCES `crucero` (`id_crucero`),
  ADD CONSTRAINT `estancia_ibfk_2` FOREIGN KEY (`id_puerto`) REFERENCES `puerto` (`id_puerto`);

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`id_crucero_fk`) REFERENCES `crucero` (`id_crucero`);

--
-- Filtros para la tabla `gestion`
--
ALTER TABLE `gestion`
  ADD CONSTRAINT `gestion_ibfk_1` FOREIGN KEY (`id_tripulante`) REFERENCES `tripulacion` (`id_tripulante`),
  ADD CONSTRAINT `gestion_ibfk_2` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitudes` (`id_solicitud`);

--
-- Filtros para la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD CONSTRAINT `habitacion_ibfk_1` FOREIGN KEY (`id_tripulante_fk`) REFERENCES `tripulacion` (`id_tripulante`),
  ADD CONSTRAINT `habitacion_ibfk_2` FOREIGN KEY (`id_turista_fk`) REFERENCES `turistas` (`id_turista`);

--
-- Filtros para la tabla `incidencias`
--
ALTER TABLE `incidencias`
  ADD CONSTRAINT `incidencias_ibfk_1` FOREIGN KEY (`id_turista_fk`) REFERENCES `turistas` (`id_turista`),
  ADD CONSTRAINT `incidencias_ibfk_2` FOREIGN KEY (`id_tripulante_fk`) REFERENCES `tripulacion` (`id_tripulante`);

--
-- Filtros para la tabla `puerto`
--
ALTER TABLE `puerto`
  ADD CONSTRAINT `puerto_ibfk_1` FOREIGN KEY (`id_crucero_fk`) REFERENCES `crucero` (`id_crucero`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_turista`) REFERENCES `turistas` (`id_turista`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`id_habitacion`) REFERENCES `habitacion` (`id_habitacion`);

--
-- Filtros para la tabla `resolucion`
--
ALTER TABLE `resolucion`
  ADD CONSTRAINT `resolucion_ibfk_1` FOREIGN KEY (`id_tripulante`) REFERENCES `tripulacion` (`id_tripulante`),
  ADD CONSTRAINT `resolucion_ibfk_2` FOREIGN KEY (`id_incidencia`) REFERENCES `incidencias` (`id_incidencia`);

--
-- Filtros para la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD CONSTRAINT `ruta_ibfk_1` FOREIGN KEY (`id_puerto_fk`) REFERENCES `puerto` (`id_puerto`);

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `solicitudes_ibfk_1` FOREIGN KEY (`id_turista_fk`) REFERENCES `turistas` (`id_turista`),
  ADD CONSTRAINT `solicitudes_ibfk_2` FOREIGN KEY (`id_tripulante_fk`) REFERENCES `tripulacion` (`id_tripulante`);

--
-- Filtros para la tabla `tripulacion`
--
ALTER TABLE `tripulacion`
  ADD CONSTRAINT `tripulacion_ibfk_1` FOREIGN KEY (`id_crucero_fk`) REFERENCES `crucero` (`id_crucero`);

--
-- Filtros para la tabla `turistas`
--
ALTER TABLE `turistas`
  ADD CONSTRAINT `turistas_ibfk_1` FOREIGN KEY (`id_crucero_fk`) REFERENCES `crucero` (`id_crucero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
