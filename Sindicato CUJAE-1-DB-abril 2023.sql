-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-04-2023 a las 03:54:59
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_portal_sindical`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_sindicato_arealaboral`
--

DROP TABLE IF EXISTS `api_sindicato_arealaboral`;
CREATE TABLE IF NOT EXISTS `api_sindicato_arealaboral` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `api_sindicato_arealaboral`
--

INSERT INTO `api_sindicato_arealaboral` (`id`, `nombre`) VALUES
(1, 'Informatica'),
(2, 'Quimica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_sindicato_cargo`
--

DROP TABLE IF EXISTS `api_sindicato_cargo`;
CREATE TABLE IF NOT EXISTS `api_sindicato_cargo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `api_sindicato_cargo`
--

INSERT INTO `api_sindicato_cargo` (`id`, `nombre`) VALUES
(1, 'Jefe'),
(2, 'Especialista'),
(3, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_sindicato_compromisoafiliacion`
--

DROP TABLE IF EXISTS `api_sindicato_compromisoafiliacion`;
CREATE TABLE IF NOT EXISTS `api_sindicato_compromisoafiliacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comprometido` tinyint(1) NOT NULL,
  `fecha_alta` date NOT NULL,
  `fecha_baja` date NOT NULL,
  `cuota_sindical` double NOT NULL,
  `salario` double NOT NULL,
  `motivo` varchar(100) NOT NULL,
  `cargo_id` bigint(20) NOT NULL,
  `id_seccion_sindical_id` bigint(20) NOT NULL,
  `id_trabajador_comprometido_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_trabajador_comprometido_id` (`id_trabajador_comprometido_id`),
  KEY `api_sindicato_compromisoafiliacion_cargo_id_0a884a3e` (`cargo_id`),
  KEY `api_sindicato_compromisoafi_id_seccion_sindical_id_8e3d0e5d` (`id_seccion_sindical_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `api_sindicato_compromisoafiliacion`
--

INSERT INTO `api_sindicato_compromisoafiliacion` (`id`, `comprometido`, `fecha_alta`, `fecha_baja`, `cuota_sindical`, `salario`, `motivo`, `cargo_id`, `id_seccion_sindical_id`, `id_trabajador_comprometido_id`) VALUES
(1, 1, '2023-04-05', '2023-05-13', 4, 3434, '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_sindicato_seccionsindical`
--

DROP TABLE IF EXISTS `api_sindicato_seccionsindical`;
CREATE TABLE IF NOT EXISTS `api_sindicato_seccionsindical` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `api_sindicato_seccionsindical`
--

INSERT INTO `api_sindicato_seccionsindical` (`id`, `nombre`) VALUES
(1, 'Informatica'),
(2, 'Quimica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_sindicato_trabajador`
--

DROP TABLE IF EXISTS `api_sindicato_trabajador`;
CREATE TABLE IF NOT EXISTS `api_sindicato_trabajador` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `carnet_ID` varchar(11) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `salario` double NOT NULL,
  `area_laboral_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_sindicato_trabajador_area_laboral_id_70cb0834` (`area_laboral_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `api_sindicato_trabajador`
--

INSERT INTO `api_sindicato_trabajador` (`id`, `nombre`, `carnet_ID`, `correo`, `salario`, `area_laboral_id`) VALUES
(1, 'Carlos', '3442', 'carlos@gmail.com', 5000, 2),
(2, 'Heyhgtdis', '3444dfd232', 'heeydis@gmail.com', 2000, 1),
(3, 'fsfsfsfs', '3444dfd232', 'heeydis@gmail.com', 2000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add trabajador', 7, 'add_trabajador'),
(26, 'Can change trabajador', 7, 'change_trabajador'),
(27, 'Can delete trabajador', 7, 'delete_trabajador'),
(28, 'Can view trabajador', 7, 'view_trabajador'),
(29, 'Can add worker', 8, 'add_worker'),
(30, 'Can change worker', 8, 'change_worker'),
(31, 'Can delete worker', 8, 'delete_worker'),
(32, 'Can view worker', 8, 'view_worker'),
(33, 'Can add seccion sindical', 9, 'add_seccionsindical'),
(34, 'Can change seccion sindical', 9, 'change_seccionsindical'),
(35, 'Can delete seccion sindical', 9, 'delete_seccionsindical'),
(36, 'Can view seccion sindical', 9, 'view_seccionsindical'),
(37, 'Can add area laboral', 10, 'add_arealaboral'),
(38, 'Can change area laboral', 10, 'change_arealaboral'),
(39, 'Can delete area laboral', 10, 'delete_arealaboral'),
(40, 'Can view area laboral', 10, 'view_arealaboral'),
(41, 'Can add compromiso afiliacion', 11, 'add_compromisoafiliacion'),
(42, 'Can change compromiso afiliacion', 11, 'change_compromisoafiliacion'),
(43, 'Can delete compromiso afiliacion', 11, 'delete_compromisoafiliacion'),
(44, 'Can view compromiso afiliacion', 11, 'view_compromisoafiliacion'),
(45, 'Can add seccion sindical', 12, 'add_seccionsindical'),
(46, 'Can change seccion sindical', 12, 'change_seccionsindical'),
(47, 'Can delete seccion sindical', 12, 'delete_seccionsindical'),
(48, 'Can view seccion sindical', 12, 'view_seccionsindical'),
(49, 'Can add trabajador', 13, 'add_trabajador'),
(50, 'Can change trabajador', 13, 'change_trabajador'),
(51, 'Can delete trabajador', 13, 'delete_trabajador'),
(52, 'Can view trabajador', 13, 'view_trabajador'),
(53, 'Can add area laboral', 14, 'add_arealaboral'),
(54, 'Can change area laboral', 14, 'change_arealaboral'),
(55, 'Can delete area laboral', 14, 'delete_arealaboral'),
(56, 'Can view area laboral', 14, 'view_arealaboral'),
(57, 'Can add compromiso afiliacion', 15, 'add_compromisoafiliacion'),
(58, 'Can change compromiso afiliacion', 15, 'change_compromisoafiliacion'),
(59, 'Can delete compromiso afiliacion', 15, 'delete_compromisoafiliacion'),
(60, 'Can view compromiso afiliacion', 15, 'view_compromisoafiliacion'),
(61, 'Can add cargo', 16, 'add_cargo'),
(62, 'Can change cargo', 16, 'change_cargo'),
(63, 'Can delete cargo', 16, 'delete_cargo'),
(64, 'Can view cargo', 16, 'view_cargo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$7hL8DSTl7IegudaOQHNerx$ATf4mgIo65Olc/oTowj3e72jO/D2Ho/eHFAJSuT6SVA=', '2023-04-12 00:18:36.630863', 1, 'admin', '', '', 'heydissosamartinez@gmail.com', 1, 1, '2023-03-22 21:28:56.359721');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-03-22 21:57:50.255103', '1', 'Carlos', 1, '[{\"added\": {}}]', 7, 1),
(2, '2023-03-22 21:58:33.560283', '2', 'Pedro', 1, '[{\"added\": {}}]', 7, 1),
(3, '2023-03-22 22:33:03.068925', '3', 'Carlos', 1, '[{\"added\": {}}]', 8, 1),
(4, '2023-03-22 22:33:24.515934', '4', 'Pedro', 1, '[{\"added\": {}}]', 8, 1),
(5, '2023-03-22 22:33:54.661146', '1', 'Carlos', 3, '', 8, 1),
(6, '2023-03-22 22:33:57.731393', '2', 'Carlos', 3, '', 8, 1),
(7, '2023-03-22 23:15:40.756852', '5', 'Susana', 1, '[{\"added\": {}}]', 8, 1),
(8, '2023-03-29 04:23:36.475376', '1', 'AreaLaboral object (1)', 1, '[{\"added\": {}}]', 14, 1),
(9, '2023-03-29 04:24:10.200712', '2', 'AreaLaboral object (2)', 1, '[{\"added\": {}}]', 14, 1),
(10, '2023-03-29 04:26:33.489845', '1', 'Trabajador object (1)', 1, '[{\"added\": {}}]', 13, 1),
(11, '2023-03-29 04:29:19.782164', '1', 'SeccionSindical object (1)', 1, '[{\"added\": {}}]', 12, 1),
(12, '2023-03-29 04:30:28.414041', '1', 'CompromisoAfiliacion object (1)', 1, '[{\"added\": {}}]', 15, 1),
(13, '2023-03-30 16:45:31.113393', '1', 'Cargo object (1)', 1, '[{\"added\": {}}]', 16, 1),
(14, '2023-03-30 16:45:43.838399', '2', 'Cargo object (2)', 1, '[{\"added\": {}}]', 16, 1),
(15, '2023-04-12 02:32:41.067695', '1', 'Cargo object (1)', 1, '[{\"added\": {}}]', 16, 1),
(16, '2023-04-12 02:32:48.452984', '2', 'Cargo object (2)', 1, '[{\"added\": {}}]', 16, 1),
(17, '2023-04-12 02:32:58.284005', '1', 'AreaLaboral object (1)', 1, '[{\"added\": {}}]', 14, 1),
(18, '2023-04-12 02:33:03.796248', '2', 'AreaLaboral object (2)', 1, '[{\"added\": {}}]', 14, 1),
(19, '2023-04-12 02:33:11.095100', '3', 'AreaLaboral object (3)', 1, '[{\"added\": {}}]', 14, 1),
(20, '2023-04-12 02:33:50.465385', '1', 'Trabajador object (1)', 1, '[{\"added\": {}}]', 13, 1),
(21, '2023-04-12 02:34:56.544413', '1', 'CompromisoAfiliacion object (1)', 1, '[{\"added\": {}}]', 15, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'api', 'trabajador'),
(8, 'api', 'worker'),
(9, 'api', 'seccionsindical'),
(10, 'api', 'arealaboral'),
(11, 'api', 'compromisoafiliacion'),
(12, 'api_sindicato', 'seccionsindical'),
(13, 'api_sindicato', 'trabajador'),
(14, 'api_sindicato', 'arealaboral'),
(15, 'api_sindicato', 'compromisoafiliacion'),
(16, 'api_sindicato', 'cargo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-03-22 21:26:11.068086'),
(2, 'auth', '0001_initial', '2023-03-22 21:26:11.770421'),
(3, 'admin', '0001_initial', '2023-03-22 21:26:11.870726'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-03-22 21:26:11.892842'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-03-22 21:26:11.908474'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-03-22 21:26:11.970982'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-03-22 21:26:11.993154'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-03-22 21:26:12.024409'),
(9, 'auth', '0004_alter_user_username_opts', '2023-03-22 21:26:12.024409'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-03-22 21:26:12.055674'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-03-22 21:26:12.055674'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-03-22 21:26:12.071278'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-03-22 21:26:12.093525'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-03-22 21:26:12.124778'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-03-22 21:26:12.156773'),
(16, 'auth', '0011_update_proxy_permissions', '2023-03-22 21:26:12.172401'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-03-22 21:26:12.193648'),
(18, 'sessions', '0001_initial', '2023-03-22 21:26:12.224902'),
(19, 'api', '0001_initial', '2023-03-22 21:31:37.050068'),
(20, 'api', '0002_worker_delete_trabajador', '2023-03-22 22:24:27.544225'),
(28, 'api_sindicato', '0001_initial', '2023-04-12 00:15:47.070748');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5zlmqwpfdi6u7cmowuxdea1apdc8tsf6', '.eJxVjMsOgjAQRf-la9M4hU7BpXu-oZlHa1EDCYWV8d-VhIVu7znnvkykbS1xq2mJo5qLAXP63ZjkkaYd6J2m22xlntZlZLsr9qDVDrOm5_Vw_w4K1fKt2YkiKgD1vffYsBCHpg0sqDk75jMAqnjqwGFoCMh3qc0h986hIzHvD_KROCM:1pf6Rn:fbKpE_RLr1EPtFX6yZNwEiG4Y8JK7xk-it128YImfFk', '2023-04-05 21:56:43.515194'),
('dargx5nt05k98y4h2pl1pbhj9nor7f1a', '.eJxVjMsOgjAQRf-la9M4hU7BpXu-oZlHa1EDCYWV8d-VhIVu7znnvkykbS1xq2mJo5qLAXP63ZjkkaYd6J2m22xlntZlZLsr9qDVDrOm5_Vw_w4K1fKt2YkiKgD1vffYsBCHpg0sqDk75jMAqnjqwGFoCMh3qc0h986hIzHvD_KROCM:1pmOC4:SBTcnl7-dccc5l5PLZQUKkzJq-BdkPFtsyJItDwjGsw', '2023-04-26 00:18:36.631863');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
