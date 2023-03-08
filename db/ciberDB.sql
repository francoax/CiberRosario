-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: ciber_rosario
-- ------------------------------------------------------
-- Server version	8.0.31

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
  `almacenamiento` varchar(45) NOT NULL,
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
INSERT INTO `computadoras` VALUES (1,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(2,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','seleccionada','SPC'),(3,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(4,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(5,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(6,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(7,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(8,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(9,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(10,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(11,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(12,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(13,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(14,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(15,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(16,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(17,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(18,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(19,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(20,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(21,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(22,'b550m aorus elite v2','NVIDIA RTX 3060ti','2x8GB DDR4 FURY BEAST 3200mhz','RYZEN 5 5600X','SSD 1TB','disponible','GPC'),(23,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','ocupada','SPC'),(24,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(25,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(26,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(27,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(28,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(29,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(30,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(31,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(32,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(33,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(34,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(35,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(36,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(37,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(38,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(39,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(40,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(41,'b550m-xe asus rog strix','NVIDIA RTX 3080','2x16GB CORSAIR VENGEANCE pro 3600mhz','RYZEN 7 5800X','M.2 1TB','disponible','SPC'),(42,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(43,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(44,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(45,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(46,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(47,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(48,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(49,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(50,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(51,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(52,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(53,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(54,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(55,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(56,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(57,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(58,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(59,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC'),(60,'Z690 aorus pro','nvidia rtx 3090','4x16gb xpg spectrix d50 xtreme 5000mhz','intel i9 12900kf','2xM.2 1TB','disponible','WPC');
/*!40000 ALTER TABLE `computadoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descuentos`
--

DROP TABLE IF EXISTS `descuentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descuentos` (
  `horas_minimas` int NOT NULL,
  `porcentaje` double NOT NULL,
  PRIMARY KEY (`horas_minimas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descuentos`
--

LOCK TABLES `descuentos` WRITE;
/*!40000 ALTER TABLE `descuentos` DISABLE KEYS */;
INSERT INTO `descuentos` VALUES (4,0.05),(6,0.1),(8,0.15),(15,0.25);
/*!40000 ALTER TABLE `descuentos` ENABLE KEYS */;
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
INSERT INTO `precios` VALUES ('GPC','2022-11-21',200),('GPC','2022-11-22',250),('SPC','2022-11-21',300),('WPC','2022-11-21',400);
/*!40000 ALTER TABLE `precios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `fecha_de_reserva` date NOT NULL,
  `idUsuario` int NOT NULL,
  `cod_reserva` varchar(10) NOT NULL,
  `fecha_a_reservar` date NOT NULL,
  `horaDesde` time NOT NULL,
  `horaHasta` time NOT NULL,
  `idComputadora` int NOT NULL,
  `importe` int NOT NULL,
  `plataforma_stream` varchar(45) DEFAULT NULL,
  `name_stream` varchar(45) DEFAULT NULL,
  `link_stream` varchar(60) DEFAULT NULL,
  `rubro_work` varchar(45) DEFAULT NULL,
  `empresa_work` varchar(45) DEFAULT NULL,
  `descripcion_work` text,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`fecha_a_reservar`,`idUsuario`),
  UNIQUE KEY `cod_reserva_UNIQUE` (`cod_reserva`),
  KEY `rsvaCompu_idx` (`idComputadora`),
  KEY `rsva-User_idx` (`idUsuario`),
  CONSTRAINT `rsva-User` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rsvaCompu` FOREIGN KEY (`idComputadora`) REFERENCES `computadoras` (`idComputadora`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES ('2022-11-24',1,'5cf19','2022-11-24','11:00:00','23:00:00',1,2550,NULL,NULL,NULL,NULL,NULL,NULL,'finalizada'),('2023-02-10',5,'256d4','2023-02-10','11:00:00','23:00:00',23,3060,'Facebook','walterzinh','https://www.facebook.com/walterin',NULL,NULL,NULL,'finalizada'),('2023-03-08',7,'26515','2023-03-08','10:00:00','15:00:00',1,1187,NULL,NULL,NULL,NULL,NULL,NULL,'finalizada'),('2023-03-08',7,'9e709','2023-03-09','08:00:00','15:00:00',23,1890,'Twitch','admin','https://www.twitch.tv',NULL,NULL,NULL,'confirmada');
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
  `email` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `idRol` int NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `user-rol_idx` (`idRol`),
  CONSTRAINT `user-rol` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'francoax','asd123','franco','duarte','francoa.duarte2001@gmail.com','2222222222',2),(2,'tester','test','test','tester','rulo_noob@hotmail.com.ar','0101010101',1),(3,'nahu.mrs','45490999yO','Nahuel ','Moras','nahuelmoras34@gmail.com','341 2819563',1),(4,'a','a','a','a','a@a.com','222',1),(5,'splashmvm@gmail.com','Manzana1984','CARLOS CARLENKE','CARLINHOS','splashmvm@gmail.com','3415104902',1),(6,'WarDevil','delfi13579','Delfina','Tomasino','tomasinodelfina@gmail.com','03416534443',1),(7,'admin','admin123','Administrador','Proyecto','admin@gmail.com','1231231231',2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ciber_rosario'
--
/*!50003 DROP PROCEDURE IF EXISTS `actual_last_price_for_pc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actual_last_price_for_pc`()
BEGIN
	drop temporary table if exists current_prices;
	create temporary table current_prices(with prices as (select p.idTipoComputadora, max(p.fecha_precio) fecha
    from precios p
    inner join tipo_computadora tpc
    on p.idTipoComputadora = tpc.idTipoComputadora
    where p.fecha_precio <= current_date()
    group by 1)
    select p.idTipoComputadora, p.precio, p.fecha_precio
    from precios p
    inner join prices cur
	on p.idTipoComputadora = cur.idTipoComputadora
    where p.fecha_precio = cur.fecha);

	drop temporary table if exists tobe_prices;
    create temporary table tobe_prices (with prices as (select p.idTipoComputadora, max(p.fecha_precio) fecha
    from precios p
    group by 1)
    select per.idTipoComputadora, per.fecha_precio, per.precio
    from precios per
    inner join prices tobe
    on per.idTipoComputadora = tobe.idTipoComputadora
    where per.fecha_precio = fecha);
    
    select tpc.descripcion , cur.fecha_precio fechaActual, cur.precio precioActual, tobe.fecha_precio fechaProxima, tobe.precio precioProximo
    from current_prices cur
    inner join tobe_prices tobe
    on cur.idTipoComputadora = tobe.idTipoComputadora
    inner join tipo_computadora tpc
    on tpc.idTipoComputadora = cur.idTipoComputadora;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_last_price_for_pc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_last_price_for_pc`(IN tipo varchar(20), OUT precio int)
BEGIN
	declare fecha Date;
	select max(p.fecha_precio) into fecha
    from precios p 
    inner join tipo_computadora tpc 
    on p.idTipoComputadora = tpc.idTipoComputadora 
    where tpc.descripcion = tipo and p.fecha_precio <= current_date();
    
    select p.precio into precio
    from precios p 
    inner join tipo_computadora tpc 
    on p.idTipoComputadora = tpc.idTipoComputadora 
    where tpc.descripcion = tipo and p.fecha_precio = fecha;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_userRol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_userRol`(in username varchar(45), in rol varchar(45))
BEGIN

	select u.username, u.nombre, u.apellido, r.descripcion
    from usuarios u
    inner join rol r
    on u.idRol = r.idRol
    where u.username = username;

	start transaction;
    UPDATE usuarios u inner join rol r set u.idRol = r.idRol where u.username = username and r.descripcion = rol;
    commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-08  2:59:42
