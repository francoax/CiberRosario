CREATE DATABASE  IF NOT EXISTS `ciber_rosario` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ciber_rosario`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: ciber_rosario
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `computadoras`
--

DROP TABLE IF EXISTS `computadoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `computadoras` (
  `idComputadora` int NOT NULL AUTO_INCREMENT,
  `placa_madre` varchar(45) NOT NULL,
  `placa_de_video` varchar(45) NOT NULL,
  `ram` varchar(45) NOT NULL,
  `procesador` varchar(45) NOT NULL,
  `storage` varchar(45) NOT NULL,
  `idTipoComputadora` varchar(10) NOT NULL,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idComputadora`),
  KEY `compuTipo_idx` (`idTipoComputadora`),
  CONSTRAINT `compuTipo` FOREIGN KEY (`idTipoComputadora`) REFERENCES `tipo_computadora` (`idTipoComputadora`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computadoras`
--

LOCK TABLES `computadoras` WRITE;
/*!40000 ALTER TABLE `computadoras` DISABLE KEYS */;
/*!40000 ALTER TABLE `computadoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computadoras_torneos`
--

DROP TABLE IF EXISTS `computadoras_torneos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `computadoras_torneos` (
  `idComputadora` int NOT NULL,
  `idTorneo` int NOT NULL,
  PRIMARY KEY (`idComputadora`,`idTorneo`),
  KEY `comptorTorneo_idx` (`idTorneo`),
  CONSTRAINT `comptorCompu` FOREIGN KEY (`idComputadora`) REFERENCES `computadoras` (`idComputadora`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `comptorTorneo` FOREIGN KEY (`idTorneo`) REFERENCES `torneos` (`idTorneo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computadoras_torneos`
--

LOCK TABLES `computadoras_torneos` WRITE;
/*!40000 ALTER TABLE `computadoras_torneos` DISABLE KEYS */;
/*!40000 ALTER TABLE `computadoras_torneos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantes_torneos`
--

DROP TABLE IF EXISTS `participantes_torneos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participantes_torneos` (
  `idUsuario` varchar(45) NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `idTorneo` int NOT NULL,
  PRIMARY KEY (`idUsuario`,`fecha_inscripcion`),
  KEY `partorTorneo_idx` (`idTorneo`),
  CONSTRAINT `partorTorneo` FOREIGN KEY (`idTorneo`) REFERENCES `torneos` (`idTorneo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantes_torneos`
--

LOCK TABLES `participantes_torneos` WRITE;
/*!40000 ALTER TABLE `participantes_torneos` DISABLE KEYS */;
/*!40000 ALTER TABLE `participantes_torneos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precios`
--

DROP TABLE IF EXISTS `precios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `precios` (
  `idTipoComputadora` varchar(10) NOT NULL,
  `fecha_precio` date NOT NULL,
  `precio` int NOT NULL,
  PRIMARY KEY (`idTipoComputadora`,`fecha_precio`),
  CONSTRAINT `precioIdTipoC` FOREIGN KEY (`idTipoComputadora`) REFERENCES `tipo_computadora` (`idTipoComputadora`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precios`
--

LOCK TABLES `precios` WRITE;
/*!40000 ALTER TABLE `precios` DISABLE KEYS */;
/*!40000 ALTER TABLE `precios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `idReserva` int NOT NULL AUTO_INCREMENT,
  `fecha_de_reserva` date NOT NULL,
  `fecha_a_reservar` date NOT NULL,
  `horaDesde` time NOT NULL,
  `horaHasta` time NOT NULL,
  `idUsuario` int NOT NULL,
  `idComputadora` int NOT NULL,
  `importe` int NOT NULL,
  PRIMARY KEY (`idReserva`),
  KEY `rsvaCompu_idx` (`idComputadora`),
  KEY `rsvaUser_idx` (`idUsuario`),
  CONSTRAINT `rsvaCompu` FOREIGN KEY (`idComputadora`) REFERENCES `computadoras` (`idComputadora`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rsvaUser` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'user'),(2,'admin');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_computadora`
--

DROP TABLE IF EXISTS `tipo_computadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_computadora` (
  `idTipoComputadora` varchar(10) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoComputadora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_computadora`
--

LOCK TABLES `tipo_computadora` WRITE;
/*!40000 ALTER TABLE `tipo_computadora` DISABLE KEYS */;
INSERT INTO `tipo_computadora` VALUES ('GPC','gamer'),('SPC','streamer'),('WPC','workstation');
/*!40000 ALTER TABLE `tipo_computadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneos`
--

DROP TABLE IF EXISTS `torneos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `torneos` (
  `idTorneo` int NOT NULL,
  `fecha_inicio_torneo` date NOT NULL,
  `fecha_fin_torneo` date NOT NULL,
  `juego` varchar(45) NOT NULL,
  `descripcion_premio` varchar(45) NOT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`idTorneo`),
  CONSTRAINT `torUser` FOREIGN KEY (`idTorneo`) REFERENCES `usuarios` (`idUsuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneos`
--

LOCK TABLES `torneos` WRITE;
/*!40000 ALTER TABLE `torneos` DISABLE KEYS */;
/*!40000 ALTER TABLE `torneos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `dni` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `fecha_de_nacimiento` date NOT NULL,
  `telefono` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'asd','asd','asd','asd','asd','asd@asd.com','2001-03-17','123123123'),(2,'frankox','asd123','duarte','43285451','franco','francoa.duarte2001@gmail.com','2001-03-17','3412767803'),(3,'qwe','qwe','b','14b','b','asd@asd.com','2001-03-03','asd'),(4,'b','b','b','b','b','b@gmai.com','2001-03-03','b'),(5,'asd','asd','a','asd','a','asd@asd.com','2002-02-12','d123123'),(6,'qwe','qwe','s','2','s','asd@asd.com','2022-02-01','123123'),(7,'dolphin','123','delfi','pelfi','43434343','delfipelfi@gmail.com','2001-12-21','43434343'),(8,'pepe','pape','pepe','pape','12123','123123@13.com','2002-12-31','qw123123'),(9,'2','2','s','s','2','2@gmail.com','2222-02-02','2'),(10,'232','3332','qwe','qwe','121221321','213a@gmail.com','2222-02-23','12312312'),(11,'232','ddwd','qwe','qwe','121221321','213a@gmail.com','2222-02-23','12312312'),(12,'232','2323','qwe','qwe','121221321','213a@gmail.com','2222-02-23','12312312'),(13,'23232','232323','d','d','123123','123123@13.com','2111-03-03','232323'),(14,'pepe','pepa','pepe','pepito','123123','pepe@gmail.com','2002-12-13','123123123'),(15,'juancito','123','juan','perez','12312312','asd@asd.com','2001-12-23','12313123');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_roles`
--

DROP TABLE IF EXISTS `usuarios_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_roles` (
  `idRol` int NOT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`idRol`,`idUsuario`),
  KEY `usroUser_idx` (`idUsuario`),
  CONSTRAINT `usroRol` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `usroUser` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_roles`
--

LOCK TABLES `usuarios_roles` WRITE;
/*!40000 ALTER TABLE `usuarios_roles` DISABLE KEYS */;
INSERT INTO `usuarios_roles` VALUES (2,2),(1,4),(1,5),(1,6),(1,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(1,14),(1,15);
/*!40000 ALTER TABLE `usuarios_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-14 14:30:39
