-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
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
/*!40000 ALTER TABLE `actualtripstopinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus` (
  `BusID` int(3) NOT NULL,
  `Model` varchar(45) DEFAULT NULL,
  `Year` char(4) DEFAULT NULL,
  PRIMARY KEY (`BusID`),
  UNIQUE KEY `BusID_UNIQUE` (`BusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver` (
  `DriverName` varchar(30) NOT NULL,
  `DriverTelephoneNumber` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`DriverName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stop`
--

DROP TABLE IF EXISTS `stop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stop` (
  `StopNumber` int(11) NOT NULL,
  `StopAddress` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`StopNumber`),
  UNIQUE KEY `StopNumber_UNIQUE` (`StopNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stop`
--

LOCK TABLES `stop` WRITE;
/*!40000 ALTER TABLE `stop` DISABLE KEYS */;
/*!40000 ALTER TABLE `stop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trip` (
  `TripNumber` int(11) NOT NULL,
  `StartLocationName` varchar(45) DEFAULT NULL,
  `DestinationName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TripNumber`),
  UNIQUE KEY `TripNumber_UNIQUE` (`TripNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tripoffering`
--

DROP TABLE IF EXISTS `tripoffering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tripoffering` (
  `TripNumber` int(11) NOT NULL,
  `Date` datetime NOT NULL,
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
/*!40000 ALTER TABLE `tripoffering` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2016-03-12 13:39:15
