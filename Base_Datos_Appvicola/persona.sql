-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-05-2023 a las 04:48:11
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `appvicola`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `documento` int(11) NOT NULL,
  `habilitado` varchar(1) NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `primer_nombre` varchar(10) DEFAULT NULL,
  `segundo_nombre` varchar(10) DEFAULT NULL,
  `primer_apellido` varchar(10) DEFAULT NULL,
  `segundo_apellido` varchar(10) DEFAULT NULL,
  `correo` varchar(40) DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `tipo_vehiculo` varchar(40) DEFAULT NULL,
  `rut` varchar(40) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `n_registro` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`documento`, `habilitado`, `tipo_documento`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `correo`, `telefono`, `direccion`, `tipo_vehiculo`, `rut`, `fecha_registro`, `id_rol`, `n_registro`) VALUES
(1001077496, 'S', 'CC', 'Daniela', 'Valentina', 'Perez', 'Martinez', 'DanielaValentinaPerez@gmail.co', 7266237, 'Calle 27 d sur # 27 c 51', 'null', '79547305', '0000-00-00', 1, '1'),
(79546872, 'S', 'CC', 'Valentina', 'Marcela', 'Caceres', 'Martinez', 'ValentinaMarcelaCaceres@gmail.co', 1234125, 'AV 6 A # 20 NORTE - 20', 'na', 'na', '0000-00-00', 2, '10'),
(78965232, 'S', 'CC', 'Harrison', 'Stiven', 'Sierra', 'Rodriguez', 'HarrisonStivenSierra@gmail.co', 8297372, 'Circular 76 # 39b 80', 'MOTO', 'na', '0000-00-00', 3, '11'),
(2147483647, 'S', 'CC', 'Andrea', 'Esperanza', 'Bueno', 'Camargo', 'AndreaEsperanzaBueno@gmail.co', 5164070, 'Cra 8 # 9 -83, Bogotá ', 'na', 'na', '0000-00-00', 2, '12'),
(764521036, 'S', 'CC', 'Jean', 'Carlos', 'Prieto', 'Martinez', 'JeanCarlosPrieto@gmail.co', 6199346, 'CARRERA 15 BIS # 7-80', 'na', 'na', '0000-00-00', 2, '13'),
(84963251, 'S', 'CC', 'Juan', 'Felipe', 'Tellez', 'Vega', 'JuanFelipeTellez@gmail.co', 30897, 'Calle 11 No. 8-17', 'na', 'na', '0000-00-00', 2, '14'),
(92658132, 'S', 'CC', 'Jerson', 'Duvan', 'Stick', 'Sanchez', 'JersonDuvanStick@gmail.co', 7091900, 'Carrera 30 # 25 - 90 Piso 15', 'na', 'na', '0000-00-00', 2, '15'),
(1002365478, 'S', 'CC', 'Alejandro', 'Stiven', 'Rodriguez', 'Rodriguez', 'AlejandroStivenRodriguez@gmail.co', 2426339, 'Diagonal 40 # 41 61', 'MOTO', 'na', '0000-00-00', 3, '2'),
(1013215478, 'S', 'CC', 'Manuel', 'Alejandro', 'Mora', 'Garcia', 'ManuelAlejandroMora@gmail.co', 5462196, 'KR 23 # 35 - 48', 'na', 'na', '0000-00-00', 2, '3'),
(1000036598, 'S', 'CC', 'Cindy', 'Juan', 'Bedoya', 'Mejia', 'CindyLorenaBedoya@gmail.co', 1741197, 'CALLE 35 # 33-09', 'na', 'na', '0000-00-00', 2, '4'),
(1000107462, 'S', 'CC', 'David', 'Manuel', 'Perez', 'Garcia', 'DavidManuelPerez@gmail.co', 4010713, 'Carrera 53 # 70 - 86', 'na', 'na', '0000-00-00', 2, '5'),
(1001741963, 'S', 'CC', 'Jonathan', 'Alejandro', 'Dueñas', 'Velasquez', 'JonathanAlejandroDueñas@gmail.co', 1733333, 'AC 13 # 21 - 91', 'MOTO', 'na', '0000-00-00', 3, '6'),
(1002124578, 'S', 'CC', 'Johana', 'Stefania', 'Puerta', 'Niño', 'JohanaStefaniaPuerta@gmail.co', 5567780, 'avenida carrera 19 # 127 d -55', 'na', 'na', '0000-00-00', 2, '7'),
(1001236598, 'S', 'CC', 'Lorena', 'Stefanya', 'Rodriguez', 'Guaqueta', 'LorenaStefanyaRodriguez@gmail.co', 7436177, 'Avenida el dorado # 68D - 35', 'na', 'na', '0000-00-00', 2, '8'),
(1000003265, 'S', 'CC', 'Laura', 'Daniela', 'Rodriguez', 'Rodriguez', 'LauraDanielaRodriguez@gmail.co', 5882761, 'TRANSVERSAL 78 I BIS # 41 A 16 SUR', 'na', 'na', '0000-00-00', 2, '9');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`n_registro`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_rol_2` (`id_rol`),
  ADD KEY `id_rol_3` (`id_rol`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_persona_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
