-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-05-2023 a las 04:50:05
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
-- Estructura de tabla para la tabla `alarma`
--

CREATE TABLE `alarma` (
  `referencia_alarma` varchar(40) NOT NULL,
  `tipo_alarma` varchar(30) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `limite_cantidad` int(11) DEFAULT NULL,
  `limite_tiempo` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `balance`
--

CREATE TABLE `balance` (
  `referencia_balance` varchar(40) NOT NULL,
  `fecha_consulta` date DEFAULT NULL,
  `tipo_balance` varchar(40) DEFAULT NULL,
  `ganancias` decimal(10,0) DEFAULT NULL,
  `perdidas` decimal(10,0) DEFAULT NULL,
  `n_registro` varchar(6) DEFAULT NULL,
  `n_ingreso` int(11) UNSIGNED DEFAULT NULL,
  `n_egreso` int(11) DEFAULT NULL,
  `habilitado` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `despacho`
--

CREATE TABLE `despacho` (
  `n_despacho` int(11) NOT NULL,
  `fecha_entrega` date NOT NULL,
  `observaciones` varchar(40) DEFAULT NULL,
  `n_registro` varchar(6) DEFAULT NULL,
  `estado_entrega` int(11) DEFAULT NULL,
  `n_ruta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos`
--

CREATE TABLE `egresos` (
  `n_egresos` int(11) NOT NULL,
  `fecha_egreso` date DEFAULT NULL,
  `tipo_egreso` varchar(40) DEFAULT NULL,
  `valor` decimal(10,0) DEFAULT NULL,
  `n_recibo` int(11) DEFAULT NULL,
  `habilitado` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_entrega`
--

CREATE TABLE `estado_entrega` (
  `n_estado` int(11) NOT NULL,
  `nombre_estado` varchar(40) NOT NULL,
  `habilitado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `estado_entrega`
--

INSERT INTO `estado_entrega` (`n_estado`, `nombre_estado`, `habilitado`) VALUES
(1, 'ENTREGADO', 'S'),
(2, 'CANCELADO', 'S'),
(3, 'MODIFICADO', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flujo_inventario`
--

CREATE TABLE `flujo_inventario` (
  `n_lote` varchar(8) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `saldo` int(11) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `tipo_flujo` varchar(20) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `n_registro` varchar(6) DEFAULT NULL,
  `habilitado` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `n_ingresos` int(11) UNSIGNED NOT NULL,
  `deduccion_impuestos` decimal(10,0) DEFAULT NULL,
  `n_estado` int(11) DEFAULT NULL,
  `n_orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `n_pago` int(11) NOT NULL,
  `tipo_pago` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`n_pago`, `tipo_pago`) VALUES
(1, 'EFECTIVO'),
(2, 'TRANSACCION'),
(3, 'PSE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `codigo_notificacion` int(11) NOT NULL,
  `tipo_notificacion` varchar(40) NOT NULL,
  `respuesta_notificacion` varchar(10) DEFAULT NULL,
  `nombre_notificacion` varchar(40) DEFAULT NULL,
  `tiempo_notificacion` time DEFAULT NULL,
  `n_despacho` int(11) DEFAULT NULL,
  `fecha_notificacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_venta`
--

CREATE TABLE `orden_venta` (
  `n_orden` int(11) NOT NULL,
  `cantidad` smallint(6) DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL,
  `total_impuesto` decimal(10,0) DEFAULT NULL,
  `total_venta` decimal(10,0) DEFAULT NULL,
  `n_pedidos` int(11) DEFAULT NULL,
  `n_registro` varchar(6) DEFAULT NULL,
  `n_producto` int(11) DEFAULT NULL,
  `habilitado` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `orden_venta`
--

INSERT INTO `orden_venta` (`n_orden`, `cantidad`, `fecha_venta`, `total_impuesto`, `total_venta`, `n_pedidos`, `n_registro`, `n_producto`, `habilitado`) VALUES
(16, 5, '0000-00-00', 19000, 100000, 16, '2', 14, 'S'),
(23, 1, '0000-00-00', 19000, 100000, 23, '2', 15, 'S'),
(165, 8, '0000-00-00', 19000, 100000, 165, '2', 12, 'S'),
(179, 13, '0000-00-00', 19000, 100000, 179, '2', 10, 'S'),
(185, 7, '0000-00-00', 19000, 100000, 185, '2', 11, 'S'),
(205, 12, '0000-00-00', 19000, 100000, 205, '2', 9, 'S'),
(215, 6, '0000-00-00', 19000, 100000, 215, '2', 13, 'S'),
(615, 11, '0000-00-00', 19000, 100000, 615, '2', 8, 'S'),
(700, 7, '0000-00-00', 19000, 100000, 700, '2', 7, 'S'),
(716, 3, '2000-01-01', 19000, 100000, 716, '2', 5, 'S'),
(815, 4, '0000-00-00', 19000, 100000, 815, '2', 4, 'S'),
(825, 8, '2000-01-01', 19000, 100000, 825, '2', 6, 'S'),
(1001, 10, '2023-04-02', 19000, 100000, 1001, '2', 1, 'S'),
(1015, 15, '2023-04-02', 19000, 100000, 1015, '2', 2, 'S'),
(1030, 6, '0000-00-00', 19000, 100000, 1030, '2', 3, 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `n_pedido` int(11) NOT NULL,
  `estado` int(10) DEFAULT NULL,
  `valor_envio` decimal(10,0) DEFAULT NULL,
  `n_registro` varchar(6) DEFAULT NULL,
  `habilitado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`n_pedido`, `estado`, `valor_envio`, `n_registro`, `habilitado`) VALUES
(16, 2, 2000, '2', 'S'),
(23, 1, 4000, '2', 'S'),
(165, 3, 10000, '2', 'S'),
(179, 1, 5000, '9', 'S'),
(185, 1, 8000, '2', 'S'),
(205, 1, 4000, '2', 'S'),
(215, 2, 6000, '2', 'S'),
(615, 1, 3000, '2', 'S'),
(700, 3, 2000, '2', 'S'),
(716, 1, 10000, '2', 'S'),
(815, 1, 8000, '8', 'S'),
(825, 2, 6000, '2', 'S'),
(1001, 1, 3000, '2', 'S'),
(1015, 1, 4000, '2', 'S'),
(1030, 1, 5000, '2', 'S');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `n_producto` int(11) NOT NULL,
  `nombre_producto` varchar(40) NOT NULL,
  `tipo_producto` varchar(40) DEFAULT NULL,
  `precio_venta` decimal(10,0) DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `n_lote` varchar(8) DEFAULT NULL,
  `n_registro` char(1) DEFAULT NULL,
  `referencia_alarma` varchar(40) DEFAULT NULL,
  `habilitado` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`n_producto`, `nombre_producto`, `tipo_producto`, `precio_venta`, `fecha_caducidad`, `n_lote`, `n_registro`, `referencia_alarma`, `habilitado`) VALUES
(1, 'Hígado de pollo', 'pollo', 5000, '2020-04-23', '215', '7', '1', 'S'),
(2, 'Mollejas de pollo', 'pollo', 9000, '2030-05-23', '215', '7', '2', 'S'),
(3, 'Pechuga de pollo', 'pollo', 5000, '2001-05-23', '321', '8', '3', 'S'),
(4, 'Muslos de pollo', 'pollo', 16000, '0000-00-00', '54', '8', '4', 'S'),
(5, 'Pollo entero', 'pollo', 22000, '0000-00-00', '334', '8', '5', 'S'),
(6, 'pechuga de pavo', 'pavo', 10000, '0000-00-00', '5', '8', '6', 'S'),
(7, 'Cerdo en trozos', 'cerdo', 24000, '0000-00-00', '45', '8', '7', 'S'),
(8, 'Chorizo', 'cerdo', 16000, '0000-00-00', '613', '8', '8', 'S'),
(9, 'Salchichón', 'cerdo', 24000, '0000-00-00', '846', '8', '9', 'S'),
(10, 'Jamón de cerdo', 'cerdo', 20000, '0000-00-00', '87', '8', '10', 'S'),
(11, 'Queso campesino', 'lacteos', 30000, '0000-00-00', '248', '8', '11', 'S'),
(12, 'Queso doble crema', 'lacteos', 16000, '0000-00-00', '32', '8', '12', 'S'),
(13, 'Muslos de pavo', 'pavo', 20000, '0000-00-00', '781', '9', '13', 'S'),
(14, 'Jamon de pavo', 'pavo', 30000, '0000-00-00', '566', '9', '14', 'S'),
(15, 'Pavo entero', 'pavo', 10000, '0000-00-00', '146', '9', '15', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibo_obligaciones`
--

CREATE TABLE `recibo_obligaciones` (
  `n_recibo` int(11) NOT NULL,
  `concepto` varchar(40) NOT NULL,
  `sujeto_pasivo` varchar(40) DEFAULT NULL,
  `habilitado` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(20) NOT NULL,
  `habilitado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`, `habilitado`) VALUES
(1, 'GERENTE', 'S'),
(2, 'CLIENTE', 'S'),
(3, 'DOMICILIARIO', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE `ruta` (
  `n_ruta` int(11) NOT NULL,
  `fecha_ruta` date DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `hora_llegada` time DEFAULT NULL,
  `distancia` float DEFAULT NULL,
  `n_orden` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alarma`
--
ALTER TABLE `alarma`
  ADD PRIMARY KEY (`referencia_alarma`);

--
-- Indices de la tabla `balance`
--
ALTER TABLE `balance`
  ADD PRIMARY KEY (`referencia_balance`),
  ADD KEY `fk_persona_balance` (`n_registro`),
  ADD KEY `fk_ingreso_balance` (`n_ingreso`),
  ADD KEY `fk_egresos_balance` (`n_egreso`);

--
-- Indices de la tabla `despacho`
--
ALTER TABLE `despacho`
  ADD PRIMARY KEY (`n_despacho`),
  ADD KEY `estado_entrega` (`estado_entrega`),
  ADD KEY `estado_entrega_2` (`estado_entrega`,`n_ruta`),
  ADD KEY `fk_ruta_despacho` (`n_ruta`),
  ADD KEY `fk_persona_despacho` (`n_registro`);

--
-- Indices de la tabla `egresos`
--
ALTER TABLE `egresos`
  ADD PRIMARY KEY (`n_egresos`),
  ADD KEY `fk_recibo_egresos` (`n_recibo`);

--
-- Indices de la tabla `estado_entrega`
--
ALTER TABLE `estado_entrega`
  ADD PRIMARY KEY (`n_estado`);

--
-- Indices de la tabla `flujo_inventario`
--
ALTER TABLE `flujo_inventario`
  ADD PRIMARY KEY (`n_lote`),
  ADD KEY `fk_persona_flujo` (`n_registro`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`n_ingresos`),
  ADD KEY `fk_estado_ingreso` (`n_estado`),
  ADD KEY `fk_orden_ingresos` (`n_orden`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`n_pago`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`codigo_notificacion`),
  ADD KEY `fk_despacho_notificacion` (`n_despacho`);

--
-- Indices de la tabla `orden_venta`
--
ALTER TABLE `orden_venta`
  ADD PRIMARY KEY (`n_orden`),
  ADD KEY `n_pedidos` (`n_pedidos`,`n_producto`),
  ADD KEY `fk_persona_orden` (`n_registro`),
  ADD KEY `fk_producto_orden` (`n_producto`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`n_pedido`),
  ADD KEY `n_registro` (`n_registro`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`n_registro`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_rol_2` (`id_rol`),
  ADD KEY `id_rol_3` (`id_rol`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`n_producto`),
  ADD KEY `fk_persona_producto` (`n_registro`),
  ADD KEY `fk_flujo_producto` (`n_lote`),
  ADD KEY `fk_alarma_producto` (`referencia_alarma`);

--
-- Indices de la tabla `recibo_obligaciones`
--
ALTER TABLE `recibo_obligaciones`
  ADD PRIMARY KEY (`n_recibo`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`n_ruta`),
  ADD KEY `n_orden` (`n_orden`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `balance`
--
ALTER TABLE `balance`
  ADD CONSTRAINT `fk_egresos_balance` FOREIGN KEY (`n_egreso`) REFERENCES `egresos` (`n_egresos`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ingreso_balance` FOREIGN KEY (`n_ingreso`) REFERENCES `ingresos` (`n_ingresos`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_persona_balance` FOREIGN KEY (`n_registro`) REFERENCES `persona` (`n_registro`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `despacho`
--
ALTER TABLE `despacho`
  ADD CONSTRAINT `fk_estado_despacho` FOREIGN KEY (`estado_entrega`) REFERENCES `estado_entrega` (`n_estado`),
  ADD CONSTRAINT `fk_persona_despacho` FOREIGN KEY (`n_registro`) REFERENCES `persona` (`n_registro`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ruta_despacho` FOREIGN KEY (`n_ruta`) REFERENCES `ruta` (`n_ruta`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `egresos`
--
ALTER TABLE `egresos`
  ADD CONSTRAINT `fk_recibo_egresos` FOREIGN KEY (`n_recibo`) REFERENCES `recibo_obligaciones` (`n_recibo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `flujo_inventario`
--
ALTER TABLE `flujo_inventario`
  ADD CONSTRAINT `fk_persona_flujo` FOREIGN KEY (`n_registro`) REFERENCES `persona` (`n_registro`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `fk_estado_ingreso` FOREIGN KEY (`n_estado`) REFERENCES `estado_entrega` (`n_estado`),
  ADD CONSTRAINT `fk_orden_ingresos` FOREIGN KEY (`n_orden`) REFERENCES `orden_venta` (`n_orden`);

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `fk_despacho_notificacion` FOREIGN KEY (`n_despacho`) REFERENCES `despacho` (`n_despacho`);

--
-- Filtros para la tabla `orden_venta`
--
ALTER TABLE `orden_venta`
  ADD CONSTRAINT `fk_pedido_orden` FOREIGN KEY (`n_pedidos`) REFERENCES `pedido` (`n_pedido`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_persona_orden` FOREIGN KEY (`n_registro`) REFERENCES `persona` (`n_registro`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_producto_orden` FOREIGN KEY (`n_producto`) REFERENCES `producto` (`n_producto`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_persona_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_persona_producto` FOREIGN KEY (`n_registro`) REFERENCES `persona` (`n_registro`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
