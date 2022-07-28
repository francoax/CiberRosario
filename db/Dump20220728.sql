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
  `estado` varchar(45) NOT NULL,
  `idTipoComputadora` varchar(45) NOT NULL,
  PRIMARY KEY (`idComputadora`),
  KEY `pcTipo_idx` (`idTipoComputadora`),
  CONSTRAINT `pcTipo` FOREIGN KEY (`idTipoComputadora`) REFERENCES `tipo_computadora` (`idTipoComputadora`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computadoras`
--

LOCK TABLES `computadoras` WRITE;
/*!40000 ALTER TABLE `computadoras` DISABLE KEYS */;
INSERT INTO `computadoras` VALUES (1,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','seleccionada','GPC'),(2,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','seleccionada','SPC'),(3,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','seleccionada','WPC'),(4,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','seleccionada','GPC'),(5,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','seleccionada','GPC'),(6,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','seleccionada','GPC'),(7,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(8,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(9,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(10,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(11,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(12,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(13,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(14,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(15,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(16,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(17,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(18,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(19,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(20,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(21,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(22,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(23,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','seleccionada','SPC'),(24,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(25,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(26,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(27,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(28,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(29,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(30,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(31,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(32,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(33,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(34,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(35,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(36,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(37,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(38,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(39,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(40,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(41,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(42,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(43,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(44,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(45,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(46,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(47,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(48,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(49,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(50,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(51,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(52,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(53,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(54,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(55,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(56,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(57,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(58,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(59,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(60,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC');
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
-- Table structure for table `descuentos`
--

DROP TABLE IF EXISTS `descuentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descuentos` (
  `horaMin` int NOT NULL,
  `porcentaje` double NOT NULL,
  `horaMax` int NOT NULL,
  PRIMARY KEY (`horaMin`,`horaMax`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descuentos`
--

LOCK TABLES `descuentos` WRITE;
/*!40000 ALTER TABLE `descuentos` DISABLE KEYS */;
INSERT INTO `descuentos` VALUES (2,5,4),(4,10,6),(6,15,8);
/*!40000 ALTER TABLE `descuentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantes_torneos`
--

DROP TABLE IF EXISTS `participantes_torneos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participantes_torneos` (
  `idUsuario` int NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `idTorneo` int NOT NULL,
  PRIMARY KEY (`idUsuario`,`fecha_inscripcion`),
  KEY `partorTorneo_idx` (`idTorneo`),
  CONSTRAINT `partorTorneo` FOREIGN KEY (`idTorneo`) REFERENCES `torneos` (`idTorneo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `partorUser` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
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
  CONSTRAINT `precioTipopc` FOREIGN KEY (`idTipoComputadora`) REFERENCES `tipo_computadora` (`idTipoComputadora`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precios`
--

LOCK TABLES `precios` WRITE;
/*!40000 ALTER TABLE `precios` DISABLE KEYS */;
INSERT INTO `precios` VALUES ('GPC','2022-05-23',100),('GPC','2022-07-27',120),('SPC','2022-06-25',105),('SPC','2022-07-27',150),('WPC','2022-06-25',110),('WPC','2022-07-27',200);
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
  `plataforma_stream` varchar(45) DEFAULT NULL,
  `name_stream` varchar(45) DEFAULT NULL,
  `link_stream` varchar(60) DEFAULT NULL,
  `rubro_work` varchar(45) DEFAULT NULL,
  `empresa_work` varchar(45) DEFAULT NULL,
  `descripcion_work` text,
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
  KEY `torUser_idx` (`idUsuario`),
  CONSTRAINT `torUser` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE RESTRICT ON UPDATE CASCADE
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
  `idRol` int NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `userRol_idx` (`idRol`),
  CONSTRAINT `userRol` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'frankox','asd123','franco','duarte','43285451','francoa.duarte2001@gmail.com','2001-03-17','3412767803',2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-28  0:44:02
