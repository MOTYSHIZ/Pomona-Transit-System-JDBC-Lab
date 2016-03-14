-- MySQL dump 10.13  Distrib 5.7.11, for Win64 (x86_64)
--
-- Host: localhost    Database: pomona_transit
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `tripoffering`
--

DROP TABLE IF EXISTS `tripoffering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tripoffering` (
  `TripNumber` int(11) NOT NULL,
  `Date` date NOT NULL,
  `ScheduledStartTime` time NOT NULL,
  `ScheduledArrivalTime` time DEFAULT NULL,
  `DriverName` varchar(30) DEFAULT NULL,
  `BusID` int(3) DEFAULT NULL,
  PRIMARY KEY (`TripNumber`,`Date`,`ScheduledStartTime`),
  KEY `BusID_idx` (`BusID`),
  KEY `Driver_idx` (`DriverName`),
  CONSTRAINT `Driver` FOREIGN KEY (`DriverName`) REFERENCES `driver` (`DriverName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TripNumber` FOREIGN KEY (`TripNumber`) REFERENCES `trip` (`TripNumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idBus` FOREIGN KEY (`BusID`) REFERENCES `bus` (`BusID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tripoffering`
--

LOCK TABLES `tripoffering` WRITE;
/*!40000 ALTER TABLE `tripoffering` DISABLE KEYS */;
INSERT INTO `tripoffering` VALUES (1,'2016-03-16','06:00:00','07:00:00','Paul',23),(2,'2016-03-04','08:00:00','08:30:00','Denise',54),(3,'2016-03-03','07:00:00','07:30:00','Paul',23),(4,'2016-03-04','08:30:00','11:00:00','Tyler',54),(5,'2016-03-03','07:30:00','08:30:00','Ralph',23),(6,'2016-03-04','11:00:00','12:00:00','Tyler',54);
/*!40000 ALTER TABLE `tripoffering` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-13 20:28:06
