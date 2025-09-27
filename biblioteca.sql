-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-09-2025 a las 20:17:28
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
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `ID_LIBRO` int(11) NOT NULL,
  `TITULO` varchar(150) NOT NULL,
  `AUTOR` varchar(100) NOT NULL,
  `ANIO_PUBLICACION` year(4) NOT NULL,
  `DISPONIBILIDAD` char(1) NOT NULL DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`ID_LIBRO`, `TITULO`, `AUTOR`, `ANIO_PUBLICACION`, `DISPONIBILIDAD`) VALUES
(1, 'Cien Años de Soledad', 'Gabriel García Márquez', '0000', 'N'),
(2, 'Rayuela', 'Julio Cortázar', '0000', 'S'),
(3, 'El Quijote', 'Miguel de Cervantes', '0000', 'S'),
(4, 'Crimen y Castigo', 'Fiódor Dostoievski', '0000', 'N'),
(5, 'Orgullo y Prejuicio', 'Jane Austen', '0000', 'S'),
(6, '1984', 'George Orwell', '0000', 'N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `ID_PRESTAMO` int(11) NOT NULL,
  `ID_LIBRO` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  `FECHA_DE_PRESTAMO` date NOT NULL,
  `FECHA_DE_DEVOLUCION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`ID_PRESTAMO`, `ID_LIBRO`, `ID_USUARIO`, `FECHA_DE_PRESTAMO`, `FECHA_DE_DEVOLUCION`) VALUES
(1001, 1, 101, '2025-09-20', NULL),
(1002, 4, 102, '2025-09-27', NULL),
(1003, 6, 101, '2025-09-01', NULL),
(1004, 3, 103, '2025-09-15', '2025-09-25'),
(1005, 5, 104, '2025-09-05', '2025-09-27'),
(1006, 2, 105, '2025-09-10', '2025-09-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_USUARIO` int(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `APELLIDOS` varchar(50) NOT NULL,
  `CORREO_INSTITUCION` varchar(100) NOT NULL,
  `TELEFONO` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_USUARIO`, `NOMBRE`, `APELLIDOS`, `CORREO_INSTITUCION`, `TELEFONO`) VALUES
(101, 'Ana', 'García Pérez', 'ana.garcia@conalepmex.edu.mx', '5512345670'),
(102, 'Luis', 'Martínez Díaz', 'luis.martinez@conalepmex.edu.mx', '5576543210'),
(103, 'Sofía', 'Rodríguez López', 'sofia.rodriguez@conalepmex.edu.mx', '5523456781'),
(104, 'Javier', 'Hernández Mora', 'javier.hdez@conalepmex.edu.mx', '5534567892'),
(105, 'Elena', 'Sánchez Castro', 'elena.sanchez@conalepmex.edu.mx', '5545678903');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`ID_LIBRO`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`ID_PRESTAMO`),
  ADD KEY `ID_LIBRO` (`ID_LIBRO`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_USUARIO`),
  ADD UNIQUE KEY `CORREO_INSTITUCION` (`CORREO_INSTITUCION`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `ID_LIBRO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `ID_PRESTAMO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1007;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`ID_LIBRO`) REFERENCES `libro` (`ID_LIBRO`),
  ADD CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
