-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 19-12-2023 a las 13:33:33
-- Versión del servidor: 8.2.0
-- Versión de PHP: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clinica_odonto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

DROP TABLE IF EXISTS `horario`;
CREATE TABLE IF NOT EXISTS `horario` (
  `IDHORARIO` int NOT NULL AUTO_INCREMENT,
  `FIN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `INICIO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`IDHORARIO`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`IDHORARIO`, `FIN`, `INICIO`) VALUES
(1, '15:00', '7:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `odontologo`
--

DROP TABLE IF EXISTS `odontologo`;
CREATE TABLE IF NOT EXISTS `odontologo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `APELLIDO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DIRECCION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DNI` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ESPECIALIDAD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FECHANAC` date DEFAULT NULL,
  `NOMBRE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `TELEFONO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UNHORARIO_IDHORARIO` int DEFAULT NULL,
  `UNUSUARIO_IDUSUARIO` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ODONTOLOGO_UNHORARIO_IDHORARIO` (`UNHORARIO_IDHORARIO`),
  KEY `FK_ODONTOLOGO_UNUSUARIO_IDUSUARIO` (`UNUSUARIO_IDUSUARIO`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `odontologo`
--

INSERT INTO `odontologo` (`ID`, `APELLIDO`, `DIRECCION`, `DNI`, `ESPECIALIDAD`, `FECHANAC`, `NOMBRE`, `TELEFONO`, `UNHORARIO_IDHORARIO`, `UNUSUARIO_IDUSUARIO`) VALUES
(1, 'Cordero', 'Abrazo de Maipu 1228', '34173750', 'Extracciones', '1984-12-11', 'Martin', '02994219185', NULL, 8),
(2, 'Contini', 'Lanuz 45', '30752495', 'Belleza Dental', '1962-12-11', 'Laura', '02994219185', 1, 9),
(3, 'Amuchástegui', 'Castello 278', '25666555', 'Ortodoncia', '1954-10-17', 'Javier', '2994564878', NULL, NULL),
(4, 'García', 'Lainez 235', '18752495', 'Cirugía Dental', '1958-04-18', 'Luis', '2994563212', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE IF NOT EXISTS `paciente` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `APELLIDO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DIRECCION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DNI` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FECHANAC` date DEFAULT NULL,
  `NOMBRE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `TELEFONO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `TIENEOS` tinyint(1) DEFAULT '0',
  `TIPOSANGRE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UNRESPONSABLE_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PACIENTE_UNRESPONSABLE_ID` (`UNRESPONSABLE_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`ID`, `APELLIDO`, `DIRECCION`, `DNI`, `FECHANAC`, `NOMBRE`, `TELEFONO`, `TIENEOS`, `TIPOSANGRE`, `UNRESPONSABLE_ID`) VALUES
(1, 'Vasquez', 'Lanuz 345', '30752495', '1962-10-17', 'Omar', '02994102233', 1, 'A+', NULL),
(2, 'Vasquez', 'Lanuz 12', '34173750', '1988-10-17', 'Juan Jose', '02994219185', 1, '0+', 2),
(3, 'García', 'San Antonio 189', '30142536', '1980-10-17', 'Facundo', '2994568978', 0, 'B-', NULL),
(4, 'Perez', 'Mendoza 354', '12555666', '1960-11-18', 'Carlos', '2995695847', 0, 'A+', NULL),
(5, 'Vasquez', 'S. Ortiz 1285', '43556669', '2016-12-19', 'Ian', '2994562312', 0, 'AB+', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `APELLIDO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DIRECCION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DNI` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FECHANAC` date DEFAULT NULL,
  `NOMBRE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `TELEFONO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsable`
--

DROP TABLE IF EXISTS `responsable`;
CREATE TABLE IF NOT EXISTS `responsable` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `APELLIDO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DIRECCION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DNI` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FECHANAC` date DEFAULT NULL,
  `NOMBRE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `TELEFONO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `TIPORESPONSABLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `responsable`
--

INSERT INTO `responsable` (`ID`, `APELLIDO`, `DIRECCION`, `DNI`, `FECHANAC`, `NOMBRE`, `TELEFONO`, `TIPORESPONSABLE`) VALUES
(1, 'Castillo', 'Castelli 278', '30752495', '1984-04-29', 'Mariela', '2994182960', 'Otro'),
(2, 'Castillo', 'Castelli 278', '30752495', '1984-04-29', 'Marita', '2994182960', 'Otro'),
(3, 'Vera', 'S. Ortiz 1285', '34565689', '1985-04-24', 'Anahí', '2994521023', 'Madre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secretario`
--

DROP TABLE IF EXISTS `secretario`;
CREATE TABLE IF NOT EXISTS `secretario` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `APELLIDO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DIRECCION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `DNI` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FECHANAC` date DEFAULT NULL,
  `NOMBRE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `SECTOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `TELEFONO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UNUSUARIO_IDUSUARIO` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SECRETARIO_UNUSUARIO_IDUSUARIO` (`UNUSUARIO_IDUSUARIO`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `secretario`
--

INSERT INTO `secretario` (`ID`, `APELLIDO`, `DIRECCION`, `DNI`, `FECHANAC`, `NOMBRE`, `SECTOR`, `TELEFONO`, `UNUSUARIO_IDUSUARIO`) VALUES
(1, 'Oria', 'Lanuz 12345', '30752495', '1960-01-18', 'Susana', 'Administración', '02994219185', 4),
(2, 'Sandoval', 'Godoy 1200', '30999888', '1984-10-17', 'Julio', 'Administración', '2994223344', NULL),
(3, 'Dominguez', 'Godoy 1250', '30999777', '2023-12-14', 'Julia', 'Administración', '2994223344', NULL),
(4, 'Borrajo', 'Brown 123', '30222555', '1980-10-17', 'Roberto', 'Administración', '2994556677', NULL),
(5, 'Vasquez', 'Bowdler 2280', '31240774', '1984-11-30', 'José', 'Informática', '2994594861', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

DROP TABLE IF EXISTS `turno`;
CREATE TABLE IF NOT EXISTS `turno` (
  `IDTURNO` int NOT NULL AUTO_INCREMENT,
  `AFECCION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FECHATURNO` datetime DEFAULT NULL,
  `HORATURNO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `id_odonto` int DEFAULT NULL,
  `id_pacien` int DEFAULT NULL,
  PRIMARY KEY (`IDTURNO`),
  KEY `FK_TURNO_id_odonto` (`id_odonto`),
  KEY `FK_TURNO_id_pacien` (`id_pacien`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`IDTURNO`, `AFECCION`, `FECHATURNO`, `HORATURNO`, `id_odonto`, `id_pacien`) VALUES
(3, 'Dolor de Muelas Cronico', '2023-12-18 03:00:00', '20:00', 3, 5),
(4, 'Extracción Muelita', '2023-12-18 03:00:00', '20:30', 4, 1),
(5, 'Dolor intenso premolar', '2023-12-18 03:00:00', '15:00', 2, 4),
(6, 'Dolor Incisivo Superior Izquierdo', '2023-12-19 03:00:00', '7:00', 1, 2),
(7, 'Dolor Intenso Molar Inferior', '2023-12-19 03:00:00', '20:00', 4, 4),
(8, 'Dolor Intenso Molar Inferior', '2023-12-19 03:00:00', '20:00', 1, 1),
(9, 'Dolor Intenso Molar Inferior', '2023-12-19 03:00:00', '20:30', 1, 2),
(10, 'Dolor Incisivo Superior Izquierdo', '2023-12-19 03:00:00', '7:00', 1, 3),
(11, 'Dolor de Muelas Cronico', '2023-12-19 03:00:00', '15:00', 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `IDUSUARIO` int NOT NULL AUTO_INCREMENT,
  `NOMBREUSUARIO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `PASS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ROL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`IDUSUARIO`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IDUSUARIO`, `NOMBREUSUARIO`, `PASS`, `ROL`) VALUES
(1, 'Juan', '81dc9bdb52d04dc20036dbd8313ed055', 'Administrador'),
(2, 'Mariela', '81dc9bdb52d04dc20036dbd8313ed055', 'Secretario'),
(7, 'Auditor', 'e10adc3949ba59abbe56e057f20f883e', 'Auditor'),
(6, 'Lorena', '81dc9bdb52d04dc20036dbd8313ed055', 'Administrador'),
(8, 'martcord', '81dc9bdb52d04dc20036dbd8313ed055', 'Profesional'),
(9, 'laurcont', '1234', 'Profesional'),
(10, 'josevasq', '81dc9bdb52d04dc20036dbd8313ed055', 'Secretario');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
