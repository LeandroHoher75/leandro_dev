-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: db_Biblioteca
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Meus_Clientes`
--

DROP TABLE IF EXISTS `Meus_Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Meus_Clientes` (
  `ID_Cliente` smallint NOT NULL,
  `Nome_Cliente` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Meus_Clientes`
--

LOCK TABLES `Meus_Clientes` WRITE;
/*!40000 ALTER TABLE `Meus_Clientes` DISABLE KEYS */;
INSERT INTO `Meus_Clientes` VALUES (22,'Leandro'),(34,'Oliver'),(63,'Hoher');
/*!40000 ALTER TABLE `Meus_Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Autores`
--

DROP TABLE IF EXISTS `tbl_Autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_Autores` (
  `ID_Autor` smallint NOT NULL,
  `Nome_Autor` varchar(50) DEFAULT NULL,
  `Sobrenome_Autor` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_Autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Autores`
--

LOCK TABLES `tbl_Autores` WRITE;
/*!40000 ALTER TABLE `tbl_Autores` DISABLE KEYS */;
INSERT INTO `tbl_Autores` VALUES (1,'Daniel','barret'),(2,'Gerard','Carter'),(3,'Mark','Sobel'),(4,'Willian','Stanek'),(5,'Richard','Blum'),(6,'Hoher534','Ndiey'),(8,'Leandro','Oliver'),(9,'Blablabla','Mais'),(10,'Bla',NULL);
/*!40000 ALTER TABLE `tbl_Autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Livro`
--

DROP TABLE IF EXISTS `tbl_Livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_Livro` (
  `ID_Livro` smallint NOT NULL AUTO_INCREMENT,
  `Nome_Livro` varchar(50) NOT NULL,
  `ISBN` varchar(30) NOT NULL,
  `Data_Pub` date NOT NULL,
  `Preço_Livro` decimal(10,0) NOT NULL,
  `ID_Autor` smallint NOT NULL,
  `ID_Editoras` smallint NOT NULL,
  PRIMARY KEY (`ID_Livro`),
  KEY `fk_ID_Autor` (`ID_Autor`),
  KEY `fk_ID_Editoras` (`ID_Editoras`),
  CONSTRAINT `fk_ID_Autor` FOREIGN KEY (`ID_Autor`) REFERENCES `tbl_Autores` (`ID_Autor`),
  CONSTRAINT `fk_ID_Editoras` FOREIGN KEY (`ID_Editoras`) REFERENCES `tbl_editoras` (`ID_Editoras`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Livro`
--

LOCK TABLES `tbl_Livro` WRITE;
/*!40000 ALTER TABLE `tbl_Livro` DISABLE KEYS */;
INSERT INTO `tbl_Livro` VALUES (25,'Linux Command Line Shell Script','123456789','2009-12-21',68,5,4),(26,'SSH, o Shell Seguro','987654321','2009-12-21',61,2,2),(27,'Using Samba','147852369','2000-12-21',58,2,2),(28,'Fedora And Red Hat Linux','159357852','2010-11-01',62,3,1),(29,'Windows Server 2012 Inside Out','654321987','2004-05-17',67,4,3),(30,'Microsoft Exchange Server 2010','369852147','2000-12-21',45,4,3),(31,'Linux Command Line Shell Script','123456789','2009-12-21',68,5,4),(32,'SSH, The Secire Shell','987654321','2009-12-21',61,2,2),(33,'Using Samba','147852369','2000-12-21',58,2,2),(34,'Fedora And Red Hat Linux','159357852','2010-11-01',62,3,1),(35,'Windows Server 2012 Inside Out','654321987','2004-05-17',67,4,3),(36,'Microsoft Exchange Server 2010','369852147','2000-12-21',45,4,3);
/*!40000 ALTER TABLE `tbl_Livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_editoras`
--

DROP TABLE IF EXISTS `tbl_editoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_editoras` (
  `ID_Editoras` smallint NOT NULL AUTO_INCREMENT,
  `Nome_Editora` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Editoras`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_editoras`
--

LOCK TABLES `tbl_editoras` WRITE;
/*!40000 ALTER TABLE `tbl_editoras` DISABLE KEYS */;
INSERT INTO `tbl_editoras` VALUES (1,'Prentice Hall'),(2,'O´Reilly'),(3,'Microsoft Press'),(4,'WIley');
/*!40000 ALTER TABLE `tbl_editoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_teste_incremento`
--

DROP TABLE IF EXISTS `tbl_teste_incremento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_teste_incremento` (
  `Codigo` smallint NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_teste_incremento`
--

LOCK TABLES `tbl_teste_incremento` WRITE;
/*!40000 ALTER TABLE `tbl_teste_incremento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_teste_incremento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-30  4:42:54
