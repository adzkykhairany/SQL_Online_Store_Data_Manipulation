-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: abconlineshop
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `trcart`
--

DROP TABLE IF EXISTS `trcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trcart` (
  `IDCart` int NOT NULL AUTO_INCREMENT,
  `IDProduct` int DEFAULT NULL,
  `IDCustomer` int DEFAULT NULL,
  PRIMARY KEY (`IDCart`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trcart`
--

LOCK TABLES `trcart` WRITE;
/*!40000 ALTER TABLE `trcart` DISABLE KEYS */;
INSERT INTO `trcart` VALUES (1,1,1),(2,3,1),(3,4,1),(4,5,1),(5,7,1),(6,12,1),(7,33,1),(8,44,1),(9,25,1),(10,17,1),(11,21,2),(12,33,2),(13,45,2),(14,50,2),(15,37,2),(16,31,2),(17,32,2),(18,45,2),(19,50,2),(20,37,2),(21,23,3),(22,13,3),(23,25,3),(24,40,3),(25,36,3),(26,21,3),(27,33,3),(28,45,3),(29,50,3),(30,37,3),(31,25,4),(32,38,4),(33,47,4),(34,50,4),(35,32,4),(36,21,4),(37,31,4),(38,41,4),(39,45,4),(40,33,4),(41,1,5),(42,13,5),(43,25,5),(44,30,5),(45,47,5),(46,50,5),(47,23,5),(48,15,5),(49,10,5),(50,17,5),(51,11,6),(52,23,6),(53,35,6),(54,40,6),(55,50,6),(56,29,6),(57,38,6),(58,47,6),(59,16,6),(60,31,6),(61,11,7),(62,12,7),(63,13,7),(64,14,7),(65,15,7),(66,16,7),(67,17,7),(68,18,7),(69,19,7),(70,20,7),(71,21,8),(72,33,8),(73,25,8),(74,30,8),(75,47,8),(76,11,8),(77,23,8),(78,15,8),(79,10,8),(80,27,8),(81,21,9),(82,22,9),(83,23,9),(84,24,9),(85,25,9),(86,26,9),(87,27,9),(88,28,9),(89,29,9),(90,30,9),(91,31,10),(92,32,10),(93,33,10),(94,34,10),(95,35,10),(96,36,10),(97,37,10),(98,38,10),(99,39,10),(100,40,10);
/*!40000 ALTER TABLE `trcart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-07 13:59:27