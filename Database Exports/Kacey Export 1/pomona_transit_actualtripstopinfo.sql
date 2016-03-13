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
-- Table structure for table `actualtripstopinfo`
--

DROP TABLE IF EXISTS `actualtripstopinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actualtripstopinfo` (
  `TripNumber` int(11) NOT NULL,
  `Date` date NOT NULL,
  `ScheduledStartTime` time NOT NULL,
  `StopNumber` int(11) NOT NULL,
  `ScheduledArrivalTime` time DEFAULT NULL,
  `ActualStartTime` time DEFAULT NULL,
  `ActualArrivalTime` time DEFAULT NULL,
  `NumberofPassengerIn` int(10) unsigned zerofill DEFAULT NULL,
  `NumberOfPassengerOut` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`TripNumber`,`Date`,`ScheduledStartTime`,`StopNumber`),
  UNIQUE KEY `TripNumber_UNIQUE` (`TripNumber`),
  UNIQUE KEY `StopNumber_UNIQUE` (`StopNumber`),
  CONSTRAINT `StopNumber` FOREIGN KEY (`StopNumber`) REFERENCES `stop` (`StopNumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TOffer` FOREIGN KEY (`TripNumber`) REFERENCES `tripoffering` (`TripNumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actualtripstopinfo`
--

LOCK TABLES `actualtripstopinfo` WRITE;
/*!40000 ALTER TABLE `actualtripstopinfo` DISABLE KEYS */;
INSERT INTO `actualtripstopinfo` VALUES (1,'0003-03-16','06:00:00',5,'07:00:00','06:10:00','07:30:00',0000000002,0000000000),(2,'0003-04-16','08:00:00',2,'08:30:00','08:05:00','08:25:00',0000000003,0000000000),(3,'0003-03-16','07:00:00',4,'07:30:00','07:35:00','08:00:00',0000000004,0000000001),(4,'0003-04-16','08:30:00',3,'11:00:00','08:30:00','10:57:00',0000000005,0000000003),(5,'0003-03-16','07:30:00',1,'08:30:00','08:05:00','08:55:00',0000000001,0000000004),(6,'0003-04-16','11:00:00',6,'13:00:00','11:00:00','12:49:00',0000000002,0000000004);
/*!40000 ALTER TABLE `actualtripstopinfo` ENABLE KEYS */;
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
