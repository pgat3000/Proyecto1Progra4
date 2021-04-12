-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: cursos_db
-- ------------------------------------------------------
-- Server version	8.0.21


drop database if exists proyecto1;
create database proyecto1;

use proyecto1;

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` varchar(9)  NOT NULL,
  `nombre` varchar(50) NOT NULL ,
  `contrasenna` varchar(16) NOT NULL ,
  `telefono` varchar(8) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `rol` int NOT NULL  ,
  `especialidad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;


DROP TABLE IF EXISTS `clases`;

CREATE TABLE `clases` (
  `id` int NOT NULL,
  `tematica` varchar(50) NOT NULL ,
  `estado` tinyint,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `grupos`;

CREATE TABLE `grupos` (
  `num_grupo` int NOT NULL,
  `id_clase` int DEFAULT NULL,
  `prof_titular` varchar(9) DEFAULT NULL,
  `dias` varchar(9) COLLATE utf8_bin NOT NULL,
  `horario` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`num_grupo`),
  CONSTRAINT `clase_fk` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`),
  CONSTRAINT `profe_fk` FOREIGN KEY (`prof_titular`) REFERENCES `usuarios` (`id`)
);

DROP TABLE IF EXISTS `matriculas`;

CREATE TABLE `matriculas` (
  `id_grupo` int NOT NULL,
  `id_est` varchar(9) NOT NULL,
  `fec_matricula` date NOT NULL ,
  `calificacion` double DEFAULT NULL,
  PRIMARY KEY (`id_grupo`,`id_est`),
  CONSTRAINT `estmatriculado_fk` FOREIGN KEY (`id_est`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `grupo_fk` FOREIGN KEY (`id_grupo`) REFERENCES `grupos` (`num_grupo`)
);



