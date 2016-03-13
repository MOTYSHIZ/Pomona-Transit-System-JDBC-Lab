-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: pomona_transit
-- ------------------------------------------------------
-- Server version	5.7.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tripstopinfo`
--

DROP TABLE IF EXISTS `tripstopinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tripstopinfo` (
  `TripNumber` int(11) NOT NULL,
  `StopNumber` int(11) NOT NULL,
  `SequenceNumber` int(11) DEFAULT NULL,
  `DrivingTime` time DEFAULT NULL,
  PRIMARY KEY (`TripNumber`,`StopNumber`),
  UNIQUE KEY `StopNumber_UNIQUE` (`StopNumber`),
  UNIQUE KEY `TripNumber_UNIQUE` (`TripNumber`),
  KEY `StopNumber_idx` (`StopNumber`),
  CONSTRAINT `StopNum` FOREIGN KEY (`StopNumber`) REFERENCES `stop` (`StopNumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TripNum` FOREIGN KEY (`TripNumber`) REFERENCES `trip` (`TripNumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tripstopinfo`
--

LOCK TABLES `tripstopinfo` WRITE;
/*!40000 ALTER TABLE `tripstopinfo` DISABLE KEYS */;
INSERT INTO `tripstopinfo` VALUES (1,5,1,'01:00:00'),(2,2,1,'00:30:00'),(3,4,2,'00:30:00'),(4,3,2,'02:30:00'),(5,1,3,'01:00:00'),(6,6,3,'01:00:00');
/*!40000 ALTER TABLE `tripstopinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-12 20:34:04
