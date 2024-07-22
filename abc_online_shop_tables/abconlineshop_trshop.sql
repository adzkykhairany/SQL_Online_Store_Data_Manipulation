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
-- Table structure for table `trshop`
--

DROP TABLE IF EXISTS `trshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trshop` (
  `IDShop` char(7) NOT NULL,
  `ShopName` varchar(50) DEFAULT NULL,
  `Owner` varchar(50) DEFAULT NULL,
  `isOfficial` tinyint(1) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDShop`),
  CONSTRAINT `CheckShop1` CHECK (regexp_like(`IDShop`,_utf8mb4'SH[0-9][0-9][0-9][A-Z]'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trshop`
--

LOCK TABLES `trshop` WRITE;
/*!40000 ALTER TABLE `trshop` DISABLE KEYS */;
INSERT INTO `trshop` VALUES ('SH102Y','Fushion Shop','Alex Fish',1,'89068 Fir Butte Rd, Eugene, OR, 97402'),('SH145N','Fortune Shop','Clarke Platt',0,'204 Peed Smith Rd, Hamilton, GA, 31811'),('SH223Y','Jaya Shop','Fred Wilson',1,'4932 Reuter St, Dearborn, MI, 48126'),('SH359Y','Surya Shop','Naomi Rockatansky',1,'4971 Good Luck Rd, Aynor, SC, 29511'),('SH483N','Sinar Shop','Jenna Vader',0,'5401 A Tech Cir, Moorpark, CA, 93021'),('SH592Y','Terang Shop','Mary Parkes',1,'7120 Crestwood Ave, Jenison, MI, 49428'),('SH673N','Parlor Shop','Sophia Willis',0,'185 Red Maple Dr, Hampton, GA, 30228'),('SH778N','Inn Shop','Suzanne Ball',0,'106 Southwind Dr, Pleasant Hill, CA, 94523'),('SH832N','Deli Shop','Alex Barker',0,'2337 School House Rd, Fairmont, WV, 26554'),('SH912Y','Buzz Shop','Sandie Doop',1,'5544 East Torino, Port Saint Lucie, FL, 34986');
/*!40000 ALTER TABLE `trshop` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-07 13:59:28
