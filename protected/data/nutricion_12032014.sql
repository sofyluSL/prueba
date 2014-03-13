-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 13-03-2014 a las 03:24:18
-- Versión del servidor: 5.6.12-log
-- Versión de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `nutricion`
--
CREATE DATABASE IF NOT EXISTS `nutricion` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `nutricion`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alimentos`
--

CREATE TABLE IF NOT EXISTS `alimentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) NOT NULL,
  `valores_nutricionales_id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `medida` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_alimentos_categoria1_idx` (`categoria_id`),
  KEY `fk_alimentos_valores_nutricionales1_idx` (`valores_nutricionales_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_antropomorficos`
--

CREATE TABLE IF NOT EXISTS `datos_antropomorficos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ninios_id` int(11) NOT NULL,
  `talla` decimal(3,2) DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `genero` char(1) NOT NULL,
  `imc` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_datos_antropomorficos_ninios1_idx` (`ninios_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha_nutricional`
--

CREATE TABLE IF NOT EXISTS `ficha_nutricional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ninios_id` int(11) NOT NULL,
  `institucion_id` int(11) NOT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ficha_nutricional_ninios_idx` (`ninios_id`),
  KEY `fk_ficha_nutricional_institucion1_idx` (`institucion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucion`
--

CREATE TABLE IF NOT EXISTS `institucion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `director` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `tipo_menu_id` int(11) NOT NULL,
  `alimentos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu_tipo_menu1_idx` (`tipo_menu_id`),
  KEY `fk_menu_alimentos1_idx` (`alimentos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_ninio`
--

CREATE TABLE IF NOT EXISTS `menu_ninio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `ninios_id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_menu_ninio_menu1_idx` (`menu_id`),
  KEY `fk_menu_ninio_ninios1_idx` (`ninios_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ninios`
--

CREATE TABLE IF NOT EXISTS `ninios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` datetime DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `representante_nombre` varchar(45) DEFAULT NULL,
  `representante_apellido` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patologias`
--

CREATE TABLE IF NOT EXISTS `patologias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ninios_id` int(11) NOT NULL,
  `pregunta1` varchar(45) DEFAULT NULL,
  `pregunta2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_patologias_ninios1_idx` (`ninios_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategoria`
--

CREATE TABLE IF NOT EXISTS `subcategoria` (
  `id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_subcategoria_categoria1_idx` (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_menu`
--

CREATE TABLE IF NOT EXISTS `tipo_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valores_nutricionales`
--

CREATE TABLE IF NOT EXISTS `valores_nutricionales` (
  `id` int(11) NOT NULL,
  `porcentaje_agua` decimal(5,2) DEFAULT NULL,
  `agua_g` decimal(5,2) DEFAULT NULL,
  `energia_kcal` decimal(5,2) DEFAULT NULL,
  `energia_kj` decimal(6,2) DEFAULT NULL,
  `proteinas_g` decimal(4,2) DEFAULT NULL,
  `grasa_total_g` decimal(5,2) DEFAULT NULL,
  `carbohidratos_g` decimal(5,2) DEFAULT NULL,
  `carbohidratos_disp_g` decimal(5,2) DEFAULT NULL,
  `fibra_dietetica_g` decimal(4,2) DEFAULT NULL,
  `fibra_cruda_g` decimal(4,2) DEFAULT NULL,
  `fibra_dietaria_g` decimal(4,2) DEFAULT NULL,
  `ceniza_g` decimal(4,2) DEFAULT NULL,
  `calcio_mg` decimal(5,2) DEFAULT NULL,
  `fosforo_mg` decimal(5,2) DEFAULT NULL,
  `hierro_mg` decimal(4,2) DEFAULT NULL,
  `tiamina_mg` decimal(3,2) DEFAULT NULL,
  `riboflavina_mg` decimal(3,2) DEFAULT NULL,
  `niacina_mg` decimal(4,2) DEFAULT NULL,
  `vitamina_c_mg` decimal(4,2) DEFAULT NULL,
  `vitamina_a_eqiv_retinol_mcg` decimal(5,2) DEFAULT NULL,
  `acidos_grasos_monoinsat_g` decimal(4,2) DEFAULT NULL,
  `acidos_grasos_poliinsaturad_g` decimal(4,2) DEFAULT NULL,
  `acidos_grasos_saturados_g` decimal(4,2) DEFAULT NULL,
  `colesterol_mg` decimal(5,2) DEFAULT NULL,
  `potasio_mg` decimal(6,2) DEFAULT NULL,
  `sodio_mg` decimal(5,2) DEFAULT NULL,
  `zinc_mg` decimal(4,2) DEFAULT NULL,
  `magnesio_mg` decimal(5,2) DEFAULT NULL,
  `vitamina_b6_mg` decimal(4,2) DEFAULT NULL,
  `vitamina_b12_mcg` decimal(4,2) DEFAULT NULL,
  `acido_folico_mcg` decimal(4,2) DEFAULT NULL,
  `folato_eqiv_fd_mcg` decimal(4,2) DEFAULT NULL,
  `porcentaje_fracc_comestible` decimal(5,2) DEFAULT NULL,
  `b_caroteno_equiv_totales_ug` decimal(5,2) DEFAULT NULL,
  `retinol_ug` decimal(6,2) DEFAULT NULL,
  `asct_mg` decimal(3,2) DEFAULT NULL,
  `ch2o_g` decimal(5,2) DEFAULT NULL,
  `equivalentes_totales` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alimentos`
--
ALTER TABLE `alimentos`
  ADD CONSTRAINT `fk_alimentos_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_alimentos_valores_nutricionales1` FOREIGN KEY (`valores_nutricionales_id`) REFERENCES `valores_nutricionales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `datos_antropomorficos`
--
ALTER TABLE `datos_antropomorficos`
  ADD CONSTRAINT `fk_datos_antropomorficos_ninios1` FOREIGN KEY (`ninios_id`) REFERENCES `ninios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ficha_nutricional`
--
ALTER TABLE `ficha_nutricional`
  ADD CONSTRAINT `fk_ficha_nutricional_institucion1` FOREIGN KEY (`institucion_id`) REFERENCES `institucion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ficha_nutricional_ninios` FOREIGN KEY (`ninios_id`) REFERENCES `ninios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_menu_alimentos1` FOREIGN KEY (`alimentos_id`) REFERENCES `alimentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_menu_tipo_menu1` FOREIGN KEY (`tipo_menu_id`) REFERENCES `tipo_menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `menu_ninio`
--
ALTER TABLE `menu_ninio`
  ADD CONSTRAINT `fk_menu_ninio_menu1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_menu_ninio_ninios1` FOREIGN KEY (`ninios_id`) REFERENCES `ninios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `patologias`
--
ALTER TABLE `patologias`
  ADD CONSTRAINT `fk_patologias_ninios1` FOREIGN KEY (`ninios_id`) REFERENCES `ninios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD CONSTRAINT `fk_subcategoria_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
