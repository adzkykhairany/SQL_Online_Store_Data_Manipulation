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
-- Table structure for table `trreview`
--

DROP TABLE IF EXISTS `trreview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trreview` (
  `IDReview` int NOT NULL AUTO_INCREMENT,
  `IDProduct` int DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `Star` int DEFAULT NULL,
  PRIMARY KEY (`IDReview`),
  CONSTRAINT `CheckRev1` CHECK (regexp_like(`Star`,_utf8mb4'[1-5]'))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trreview`
--

LOCK TABLES `trreview` WRITE;
/*!40000 ALTER TABLE `trreview` DISABLE KEYS */;
INSERT INTO `trreview` VALUES (1,1,'Good',5),(2,1,'Nice',4),(3,2,'I dont like it',2),(4,2,'Best product',5),(5,3,'Not really..',3),(6,3,'Never buy this item again',1),(7,4,'Good job',5),(8,4,'Awesome',5),(9,5,'Terrible',2),(10,5,'OK',3),(11,6,'Good',5),(12,6,'Nice',4),(13,7,'Best product',5),(14,7,'Not really..',3),(15,8,'Never buy this item again',1),(16,8,'Good job',5),(17,9,'Awesome',5),(18,9,'Terrible',2),(19,10,'OK',3),(20,10,'Nice',4),(21,11,'Never buy this item again',1),(22,11,'Nice',3),(23,12,'Never buy this item again',5),(24,12,'Good job',1),(25,13,'Not really..',3),(26,13,'est product',5),(27,14,'Not really..',3),(28,14,'Awesome',4),(29,15,'Terrible',1),(30,15,'OK',3),(31,16,'Good',5),(32,16,'Nice',3),(33,17,'Best product',3),(34,17,'Not really..',3),(35,18,'Awesome',4),(36,18,'Good job',5),(37,19,'Bad',1),(38,19,'Terrible',2),(39,20,'Best',5),(40,20,'Nice',4),(41,21,'Terrible',1),(42,21,'Bad',2),(43,22,'I dont like it',3),(44,22,'Thank you',5),(45,23,'Nice',5),(46,23,'Best Product',5),(47,24,'Not Really...',2),(48,24,'OK',3),(49,25,'Best',4),(50,25,'OK',4),(51,26,'So Bad',1),(52,26,'Bad',2),(53,27,'Best product',5),(54,27,'OK',4),(55,28,'Terrible',2),(56,28,'OK',3),(57,29,'Awesome',5),(58,29,'Good',4),(59,30,'OK',3),(60,30,'Nice',4),(61,31,'Terrible',1),(62,31,'Terrible',2),(63,32,'Good',3),(64,32,'Best product',5),(65,33,'Nice',4),(66,33,'Terrible',2),(67,34,'Good job',4),(68,34,'Awesome',1),(69,35,'Terrible',2),(70,35,'Terrible',2),(71,36,'Good',3),(72,36,'Nice',4),(73,37,'Best product',5),(74,37,'Not really..',3),(75,38,'Never buy this item again',1),(76,38,'Good job',4),(77,39,'Best product',5),(78,39,'Good',3),(79,40,'OK',3),(80,40,'Nice',4),(81,41,'Nice',4),(82,41,'Nice',4),(83,42,'Best product',5),(84,42,'Best product',5),(85,43,'Terrible',1),(86,43,'Never buy this item again',2),(87,44,'Not really..',3),(88,44,'Terrible',1),(89,45,'Nice',4),(90,45,'Good',5),(91,46,'Good',5),(92,46,'Nice',4),(93,47,'Nice',4),(94,47,'Not really..',3),(95,48,'Never buy this item again',2),(96,48,'Good job',5),(97,49,'Awesome',4),(98,49,'Never buy this item again',2),(99,50,'Never buy this item again',2),(100,50,'Nice',4);
/*!40000 ALTER TABLE `trreview` ENABLE KEYS */;
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
