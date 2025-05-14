/*M!999999\- enable the sandbox mode */
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: papchat
-- ------------------------------------------------------
-- Server version       10.11.11-MariaDB-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `papchat`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `papchat` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `papchat`;

--
-- Table structure for table `Add_On`
--

DROP TABLE IF EXISTS `Add_On`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Add_On` (
  `user_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `sent_order` int(10) unsigned NOT NULL,
  `addon_idx` int(10) unsigned NOT NULL,
  `x_start` double DEFAULT NULL,
  `x_end` double DEFAULT NULL,
  `y_start` double DEFAULT NULL,
  `y_end` double DEFAULT NULL,
  PRIMARY KEY (`user_id`,`room_id`,`sent_order`,`addon_idx`),
  CONSTRAINT `Add_On_ibfk_1` FOREIGN KEY (`user_id`, `room_id`, `sent_order`) REFERENCES `Pap` (`user_id`, `room_id`, `sent_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Add_On`
--

LOCK TABLES `Add_On` WRITE;
/*!40000 ALTER TABLE `Add_On` DISABLE KEYS */;
/*!40000 ALTER TABLE `Add_On` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Caption`
--

DROP TABLE IF EXISTS `Caption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Caption` (
  `user_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `sent_order` int(10) unsigned NOT NULL,
  `addon_idx` int(10) unsigned NOT NULL,
  `font_style` varchar(50) DEFAULT NULL,
  `text` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`room_id`,`sent_order`,`addon_idx`),
  CONSTRAINT `Caption_ibfk_1` FOREIGN KEY (`user_id`, `room_id`, `sent_order`, `addon_idx`) REFERENCES `Add_On` (`user_id`, `room_id`, `sent_order`, `addon_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Caption`
--

LOCK TABLES `Caption` WRITE;
/*!40000 ALTER TABLE `Caption` DISABLE KEYS */;
/*!40000 ALTER TABLE `Caption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Chat`
--

DROP TABLE IF EXISTS `Chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Chat` (
  `user_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `sent_order` int(10) unsigned NOT NULL,
  `message` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`room_id`,`sent_order`),
  CONSTRAINT `Chat_ibfk_1` FOREIGN KEY (`user_id`, `room_id`, `sent_order`) REFERENCES `Content` (`user_id`, `room_id`, `sent_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chat`
--

LOCK TABLES `Chat` WRITE;
/*!40000 ALTER TABLE `Chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `Chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Content`
--

DROP TABLE IF EXISTS `Content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Content` (
  `user_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `sent_order` int(10) unsigned NOT NULL,
  `send_time` time DEFAULT NULL,
  `is_exists` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`room_id`,`sent_order`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `Content_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Room_Join` (`user_id`),
  CONSTRAINT `Content_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `Room_Join` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Content`
--

LOCK TABLES `Content` WRITE;
/*!40000 ALTER TABLE `Content` DISABLE KEYS */;
/*!40000 ALTER TABLE `Content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Friend`
--

DROP TABLE IF EXISTS `Friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Friend` (
  `user_id` int(10) unsigned NOT NULL,
  `friend_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`friend_id`),
  KEY `friend_id` (`friend_id`),
  CONSTRAINT `Friend_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
  CONSTRAINT `Friend_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Friend`
--

LOCK TABLES `Friend` WRITE;
/*!40000 ALTER TABLE `Friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `Friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Image`
--

DROP TABLE IF EXISTS `Image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Image` (
  `user_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `sent_order` int(10) unsigned NOT NULL,
  `addon_idx` int(10) unsigned NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`room_id`,`sent_order`,`addon_idx`),
  CONSTRAINT `Image_ibfk_1` FOREIGN KEY (`user_id`, `room_id`, `sent_order`, `addon_idx`) REFERENCES `Add_On` (`user_id`, `room_id`, `sent_order`, `addon_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Image`
--

LOCK TABLES `Image` WRITE;
/*!40000 ALTER TABLE `Image` DISABLE KEYS */;
/*!40000 ALTER TABLE `Image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lens`
--

DROP TABLE IF EXISTS `Lens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lens` (
  `lens_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  PRIMARY KEY (`lens_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Lens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lens`
--

LOCK TABLES `Lens` WRITE;
/*!40000 ALTER TABLE `Lens` DISABLE KEYS */;
/*!40000 ALTER TABLE `Lens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lens_Level`
--

DROP TABLE IF EXISTS `Lens_Level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lens_Level` (
  `level_id` int(10) unsigned NOT NULL,
  `level_name` varchar(50) DEFAULT NULL,
  `incentive` int(11) DEFAULT NULL,
  `n_min_lens_created` int(11) DEFAULT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lens_Level`
--

LOCK TABLES `Lens_Level` WRITE;
/*!40000 ALTER TABLE `Lens_Level` DISABLE KEYS */;
/*!40000 ALTER TABLE `Lens_Level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lens_Type`
--

DROP TABLE IF EXISTS `Lens_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lens_Type` (
  `lens_id` int(10) unsigned NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`lens_id`),
  CONSTRAINT `Lens_Type_ibfk_1` FOREIGN KEY (`lens_id`) REFERENCES `Lens` (`lens_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lens_Type`
--

LOCK TABLES `Lens_Type` WRITE;
/*!40000 ALTER TABLE `Lens_Type` DISABLE KEYS */;
/*!40000 ALTER TABLE `Lens_Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Location` (
  `user_id` int(10) unsigned NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time DEFAULT NULL,
  `latitude` int(11) DEFAULT NULL,
  `longitude` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`start_time`),
  CONSTRAINT `Location_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pap`
--

DROP TABLE IF EXISTS `Pap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pap` (
  `user_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `sent_order` int(10) unsigned NOT NULL,
  `lens_id` int(10) unsigned DEFAULT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`,`room_id`,`sent_order`),
  KEY `lens_id` (`lens_id`),
  CONSTRAINT `Pap_ibfk_1` FOREIGN KEY (`user_id`, `room_id`, `sent_order`) REFERENCES `Content` (`user_id`, `room_id`, `sent_order`),
  CONSTRAINT `Pap_ibfk_2` FOREIGN KEY (`lens_id`) REFERENCES `Lens` (`lens_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pap`
--

LOCK TABLES `Pap` WRITE;
/*!40000 ALTER TABLE `Pap` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room_Chat`
--

DROP TABLE IF EXISTS `Room_Chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Room_Chat` (
  `room_id` int(10) unsigned NOT NULL,
  `created_date` date DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room_Chat`
--

LOCK TABLES `Room_Chat` WRITE;
/*!40000 ALTER TABLE `Room_Chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `Room_Chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room_Join`
--

DROP TABLE IF EXISTS `Room_Join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Room_Join` (
  `room_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `join_date` date DEFAULT NULL,
  PRIMARY KEY (`room_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Room_Join_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `Room_Chat` (`room_id`),
  CONSTRAINT `Room_Join_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room_Join`
--

LOCK TABLES `Room_Join` WRITE;
/*!40000 ALTER TABLE `Room_Join` DISABLE KEYS */;
/*!40000 ALTER TABLE `Room_Join` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `user_id` int(10) unsigned NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `telp_num` int(10) unsigned DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `level_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `level_id` (`level_id`),
  CONSTRAINT `User_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `Lens_Level` (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
