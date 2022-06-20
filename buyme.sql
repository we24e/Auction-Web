-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: buyme
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `userID` varchar(20) NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('1','1','1','1','2019-05-06','1'),('2','2','2','2','2019-05-05','2'),('3','3','3','3','2019-05-06','3'),('4','4','4','4','2019-05-05','4'),('admin','admin','admin','admin','2019-05-05','admin');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `userID` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','admin','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert` (
  `al` int NOT NULL AUTO_INCREMENT,
  `userID` varchar(20) NOT NULL,
  `auctionID` int NOT NULL,
  `message` int DEFAULT NULL,
  PRIMARY KEY (`al`,`userID`,`auctionID`),
  KEY `userID` (`userID`),
  KEY `auctionID` (`auctionID`),
  CONSTRAINT `alert_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `account` (`userID`) ON DELETE CASCADE,
  CONSTRAINT `alert_ibfk_2` FOREIGN KEY (`auctionID`) REFERENCES `auction` (`auctionID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
INSERT INTO `alert` VALUES (1,'1',5,1),(2,'4',5,1),(3,'4',6,1),(4,'3',6,1),(5,'4',6,1),(7,'4',6,1),(8,'4',6,1),(12,'3',8,1),(13,'3',8,1),(14,'1',8,1),(15,'1',8,1),(16,'1',8,1),(17,'1',8,1),(18,'1',8,1),(20,'1',8,1),(21,'4',8,1),(22,'2',10,1),(23,'2',10,1),(24,'3',10,1),(25,'3',10,1),(26,'2',10,1),(27,'4',10,1),(28,'3',10,1),(29,'3',10,1),(30,'3',10,1),(33,'4',10,2);
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auction` (
  `auctionID` int NOT NULL AUTO_INCREMENT,
  `userID` varchar(20) NOT NULL,
  `min_price` float DEFAULT NULL,
  `initial_price` float DEFAULT NULL,
  `close_time` datetime DEFAULT NULL,
  `pid` int NOT NULL,
  `cb` varchar(20) DEFAULT NULL,
  `cbval` float DEFAULT NULL,
  `sold` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`auctionID`,`userID`,`pid`),
  KEY `userID` (`userID`),
  KEY `pid` (`pid`),
  CONSTRAINT `auction_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `account` (`userID`) ON DELETE CASCADE,
  CONSTRAINT `auction_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `wintercloth` (`pid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (1,'1',50,50,'2021-04-15 14:42:00',1,'0',0,0),(2,'1',55,60,'2021-04-11 22:51:00',2,'0',0,0),(3,'1',95,90,'2021-03-30 22:54:00',3,'0',0,0),(4,'1',100,100,'2021-04-15 22:55:00',4,'0',0,0),(5,'2',100,100,'2021-05-19 20:57:00',5,'3',103,0),(6,'1',260,250,'2021-04-25 21:05:00',6,'john',500,1),(7,'1',400,200,'2021-04-25 21:07:00',7,'0',0,0),(8,'2',900,100,'2021-04-25 21:24:00',8,'1',141,0),(10,'1',100,100,'2021-04-25 23:40:00',10,'4',141,1);
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid` (
  `Bid_ID` int NOT NULL AUTO_INCREMENT,
  `userID` varchar(20) NOT NULL,
  `auctionID` int NOT NULL,
  `bid` float DEFAULT NULL,
  `upper_limit` float DEFAULT NULL,
  `increment` float DEFAULT NULL,
  PRIMARY KEY (`Bid_ID`,`userID`,`auctionID`),
  KEY `userID` (`userID`),
  KEY `auctionID` (`auctionID`),
  CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `account` (`userID`) ON DELETE CASCADE,
  CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`auctionID`) REFERENCES `auction` (`auctionID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (2,'3',5,142,180,1),(3,'4',5,401,180,0),(4,'4',6,401,500,1),(5,'3',6,142,400,0),(11,'3',8,142,500,0),(13,'1',8,141,500,1),(14,'4',8,140,300,0),(15,'2',10,100,150,0),(16,'3',10,142,140,1),(17,'2',10,102,200,0),(18,'4',10,141,200,0);
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemalert`
--

DROP TABLE IF EXISTS `itemalert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemalert` (
  `alert` int NOT NULL AUTO_INCREMENT,
  `userID` varchar(20) DEFAULT NULL,
  `pid` int DEFAULT NULL,
  PRIMARY KEY (`alert`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemalert`
--

LOCK TABLES `itemalert` WRITE;
/*!40000 ALTER TABLE `itemalert` DISABLE KEYS */;
INSERT INTO `itemalert` VALUES (1,'1',10),(2,'john',20);
/*!40000 ALTER TABLE `itemalert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `userID` varchar(20) DEFAULT NULL,
  `questionID` int NOT NULL AUTO_INCREMENT,
  `questions` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `reply` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`questionID`),
  KEY `userID` (`userID`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `account` (`userID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES ('1',1,'How to bid?','my question','click bid in auctionlist'),('1',2,'Can i have a jacket-hat?','question regarding cloth type','nope'),('2',3,'How to use this bidding system?','How','1');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `representative`
--

DROP TABLE IF EXISTS `representative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `representative` (
  `userID` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `representative`
--

LOCK TABLES `representative` WRITE;
/*!40000 ALTER TABLE `representative` DISABLE KEYS */;
INSERT INTO `representative` VALUES ('rep','rep','rep'),('rept','rept','rept'),('reptt','reptt','reptt');
/*!40000 ALTER TABLE `representative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wintercloth`
--

DROP TABLE IF EXISTS `wintercloth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wintercloth` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `des` varchar(30) DEFAULT NULL,
  `userID` varchar(20) DEFAULT NULL,
  `brand` varchar(30) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `size` varchar(5) DEFAULT NULL,
  `clothtype` enum('sweater','jacket','hat') DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `userID` (`userID`),
  CONSTRAINT `wintercloth_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `account` (`userID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wintercloth`
--

LOCK TABLES `wintercloth` WRITE;
/*!40000 ALTER TABLE `wintercloth` DISABLE KEYS */;
INSERT INTO `wintercloth` VALUES (1,'beret','1','nike','black','one','hat',0),(2,'fedora','1','nike','grey','one','hat',0),(3,'Beanie','1','New Era','black','m','hat',0),(4,'Jacket','1','Nike','black','m','jacket',0),(5,'Limited','2','Nike','blue','s','sweater',0),(6,'Limited','1','Burberry','black','one','hat',500),(7,'new','1','sandro','yellow','m','sweater',0),(8,'sweater','2','sandro','yellow','m','sweater',0),(9,'hat','4','New Era','black','one','hat',0),(10,'Jacket','1','nike','blue','one','hat',141);
/*!40000 ALTER TABLE `wintercloth` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-25 23:49:21
