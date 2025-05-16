/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: papchat
-- ------------------------------------------------------
-- Server version	11.7.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Current Database: `papchat`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `papchat` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;

USE `papchat`;

--
-- Table structure for table `add_on`
--

DROP TABLE IF EXISTS `add_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `add_on` (
  `user_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `sent_order` int(10) unsigned NOT NULL,
  `addon_idx` int(10) unsigned NOT NULL,
  `x_start` double DEFAULT NULL,
  `x_end` double DEFAULT NULL,
  `y_start` double DEFAULT NULL,
  `y_end` double DEFAULT NULL,
  PRIMARY KEY (`user_id`,`room_id`,`sent_order`,`addon_idx`),
  CONSTRAINT `Add_On_ibfk_1` FOREIGN KEY (`user_id`, `room_id`, `sent_order`) REFERENCES `pap` (`user_id`, `room_id`, `sent_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `add_on`
--

LOCK TABLES `add_on` WRITE;
/*!40000 ALTER TABLE `add_on` DISABLE KEYS */;
INSERT INTO `add_on` (`user_id`, `room_id`, `sent_order`, `addon_idx`, `x_start`, `x_end`, `y_start`, `y_end`) VALUES (3,62,55,1,127,157,167,185),
(6,37,36,1,79,115,136,186),
(7,16,25,1,77,133,83,93),
(15,22,39,1,107,202,53,93),
(17,75,19,1,0,55,152,220),
(19,42,3,1,180,205,1,28),
(20,17,43,1,188,227,175,258),
(28,74,45,1,197,260,128,215),
(38,41,29,1,177,230,31,81),
(45,49,20,1,159,244,92,187),
(59,4,44,1,135,197,64,87),
(72,54,11,1,172,208,142,162),
(74,63,24,1,122,156,122,190);
/*!40000 ALTER TABLE `add_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caption`
--

DROP TABLE IF EXISTS `caption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `caption` (
  `user_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `sent_order` int(10) unsigned NOT NULL,
  `addon_idx` int(10) unsigned NOT NULL,
  `font_style` varchar(50) DEFAULT NULL,
  `text` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`room_id`,`sent_order`,`addon_idx`),
  CONSTRAINT `Caption_ibfk_1` FOREIGN KEY (`user_id`, `room_id`, `sent_order`, `addon_idx`) REFERENCES `add_on` (`user_id`, `room_id`, `sent_order`, `addon_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caption`
--

LOCK TABLES `caption` WRITE;
/*!40000 ALTER TABLE `caption` DISABLE KEYS */;
INSERT INTO `caption` (`user_id`, `room_id`, `sent_order`, `addon_idx`, `font_style`, `text`) VALUES (3,62,55,1,'Comic Sans','Then white note weight American computer.'),
(6,37,36,1,'Comic Sans','Big hot science sort offer until.'),
(7,16,25,1,'Arial','Authority type standard more move.'),
(15,22,39,1,'Verdana','Person according our analysis attention should.'),
(17,75,19,1,'Arial','Such mouth message person table east action.'),
(19,42,3,1,'Verdana','Three mind several course officer figure.'),
(45,49,20,1,'Verdana','Appear chance training it rock career owner.'),
(59,4,44,1,'Arial','Voice quickly before fish challenge too eat.'),
(72,54,11,1,'Verdana','Whose marriage safe rule ten provide why garden.');
/*!40000 ALTER TABLE `caption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `user_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `sent_order` int(10) unsigned NOT NULL,
  `message` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`room_id`,`sent_order`),
  CONSTRAINT `Chat_ibfk_1` FOREIGN KEY (`user_id`, `room_id`, `sent_order`) REFERENCES `content` (`user_id`, `room_id`, `sent_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` (`user_id`, `room_id`, `sent_order`, `message`) VALUES (2,8,46,'Make society exactly whatever artist.'),
(11,3,37,'What speech these thing.'),
(12,56,1,'Open large space control hot.'),
(13,23,12,'Skill high defense likely major program put choose.'),
(18,55,57,'Positive force professional generation will.'),
(21,39,21,'Almost worker resource growth always than.'),
(22,43,14,'Doctor beyond idea drop him such charge.'),
(25,11,8,'Me you control.'),
(26,19,7,'Throw nature page wrong.'),
(27,7,34,'Gas picture current anyone film.'),
(29,44,2,'Impact hit along purpose.'),
(32,13,56,'Religious spend need data sometimes.'),
(33,34,22,'Management professor operation effect particularly include.'),
(35,68,16,'Kind likely reason general lawyer.'),
(37,60,17,'Goal particular president yes deep whom region.'),
(40,18,23,'Worker meet night charge deep.'),
(42,15,48,'Someone note series billion determine offer energy part.'),
(44,70,33,'Others suddenly identify bag computer good level.'),
(47,10,4,'Practice approach open field deal economic wife space.'),
(48,1,41,'Very success itself wrong find theory effort detail.'),
(49,67,47,'Travel particular present story.'),
(51,20,53,'Process parent talk successful style.'),
(52,12,40,'School room stage.'),
(53,50,35,'Successful nation he parent.'),
(54,35,5,'Tax could store ok become.'),
(55,51,30,'Always bit machine among share it.'),
(56,48,52,'Outside need radio practice.'),
(60,61,38,'Contain smile court.'),
(63,73,10,'Poor social chance us show page.'),
(64,65,51,'Represent people lawyer view even today guess stay.'),
(65,26,32,'Debate left region like choose like too.'),
(67,9,6,'Sell shoulder expect including early determine.'),
(69,29,50,'Style positive light image arrive prevent week.'),
(70,31,31,'Responsibility road finish.'),
(73,45,18,'Sign card a consumer TV response military really.'),
(75,69,27,'People stuff discover show.');
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `user_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `sent_order` int(10) unsigned NOT NULL,
  `send_time` time DEFAULT NULL,
  `is_exists` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`room_id`,`sent_order`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `Content_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `room_join` (`user_id`),
  CONSTRAINT `Content_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room_join` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` (`user_id`, `room_id`, `sent_order`, `send_time`, `is_exists`) VALUES (2,8,46,'00:00:00',1),
(3,62,55,'00:00:00',1),
(4,36,60,'00:00:00',1),
(6,37,36,'00:00:00',1),
(7,16,25,'00:00:00',1),
(8,14,26,'00:00:00',1),
(9,33,59,'00:00:00',1),
(10,40,9,'00:00:00',1),
(11,3,37,'00:00:00',1),
(12,56,1,'00:00:00',1),
(13,23,12,'00:00:00',1),
(15,22,39,'00:00:00',1),
(16,46,13,'00:00:00',1),
(17,75,19,'00:00:00',1),
(18,55,57,'00:00:00',1),
(19,42,3,'00:00:00',1),
(20,17,43,'00:00:00',1),
(21,39,21,'00:00:00',1),
(22,43,14,'00:00:00',1),
(25,11,8,'00:00:00',1),
(26,19,7,'00:00:00',1),
(27,7,34,'00:00:00',1),
(28,74,45,'00:00:00',1),
(29,44,2,'00:00:00',1),
(31,38,58,'00:00:00',1),
(32,13,56,'00:00:00',1),
(33,34,22,'00:00:00',1),
(34,2,49,'00:00:00',1),
(35,68,16,'00:00:00',1),
(37,60,17,'00:00:00',1),
(38,41,29,'00:00:00',1),
(39,32,28,'00:00:00',1),
(40,18,23,'00:00:00',1),
(42,15,48,'00:00:00',1),
(44,70,33,'00:00:00',1),
(45,49,20,'00:00:00',1),
(46,5,42,'00:00:00',1),
(47,10,4,'00:00:00',1),
(48,1,41,'00:00:00',1),
(49,67,47,'00:00:00',1),
(51,20,53,'00:00:00',1),
(52,12,40,'00:00:00',1),
(53,50,35,'00:00:00',1),
(54,35,5,'00:00:00',1),
(55,51,30,'00:00:00',1),
(56,48,52,'00:00:00',1),
(57,72,15,'00:00:00',1),
(59,4,44,'00:00:00',1),
(60,61,38,'00:00:00',1),
(63,73,10,'00:00:00',1),
(64,65,51,'00:00:00',1),
(65,26,32,'00:00:00',1),
(67,9,6,'00:00:00',1),
(68,64,54,'00:00:00',1),
(69,29,50,'00:00:00',1),
(70,31,31,'00:00:00',1),
(72,54,11,'00:00:00',1),
(73,45,18,'00:00:00',1),
(74,63,24,'00:00:00',1),
(75,69,27,'00:00:00',1);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend` (
  `user_id` int(10) unsigned NOT NULL,
  `friend_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`friend_id`),
  KEY `friend_id` (`friend_id`),
  CONSTRAINT `Friend_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `Friend_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
INSERT INTO `friend` (`user_id`, `friend_id`) VALUES (21,2),
(60,3),
(40,4),
(3,6),
(20,7),
(12,8),
(74,9),
(64,10),
(57,11),
(7,12),
(73,13),
(75,15),
(27,16),
(39,17),
(51,18),
(34,19),
(26,20),
(19,21),
(15,22),
(59,25),
(63,26),
(13,27),
(47,28),
(11,29),
(48,31),
(37,32),
(28,33),
(46,34),
(45,35),
(32,37),
(70,38),
(10,39),
(8,40),
(4,42),
(6,44),
(42,45),
(29,46),
(17,47),
(16,48),
(25,49),
(44,51),
(69,52),
(65,53),
(72,54),
(18,55),
(38,56),
(35,57),
(55,59),
(2,60),
(49,63),
(31,64),
(52,65),
(56,67),
(67,68),
(54,69),
(22,70),
(33,72),
(9,73),
(53,74),
(68,75);
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `user_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `sent_order` int(10) unsigned NOT NULL,
  `addon_idx` int(10) unsigned NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`room_id`,`sent_order`,`addon_idx`),
  CONSTRAINT `Image_ibfk_1` FOREIGN KEY (`user_id`, `room_id`, `sent_order`, `addon_idx`) REFERENCES `add_on` (`user_id`, `room_id`, `sent_order`, `addon_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` (`user_id`, `room_id`, `sent_order`, `addon_idx`, `name`) VALUES (3,62,55,1,'image_54.jpg'),
(6,37,36,1,'image_35.jpg'),
(19,42,3,1,'image_2.jpg'),
(20,17,43,1,'image_42.jpg'),
(28,74,45,1,'image_44.jpg'),
(38,41,29,1,'image_28.jpg'),
(45,49,20,1,'image_19.jpg'),
(72,54,11,1,'image_10.jpg'),
(74,63,24,1,'image_23.jpg');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lens`
--

DROP TABLE IF EXISTS `lens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lens` (
  `lens_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  PRIMARY KEY (`lens_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Lens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lens`
--

LOCK TABLES `lens` WRITE;
/*!40000 ALTER TABLE `lens` DISABLE KEYS */;
INSERT INTO `lens` (`lens_id`, `user_id`, `name`, `release_date`) VALUES (1,11,NULL,'2025-04-27'),
(2,8,NULL,'2025-02-10'),
(4,15,NULL,'2025-02-07'),
(5,53,NULL,'2025-04-16'),
(6,29,NULL,'2025-03-04'),
(7,69,NULL,'2025-01-11'),
(8,37,NULL,'2025-02-08'),
(9,72,NULL,'2025-01-01'),
(10,19,NULL,'2025-04-27'),
(11,35,NULL,'2025-03-07'),
(12,9,NULL,'2025-02-26'),
(13,75,NULL,'2025-01-22'),
(14,2,NULL,'2025-03-13'),
(16,44,NULL,'2025-01-05'),
(17,63,NULL,'2025-02-22'),
(18,46,NULL,'2025-02-09'),
(19,39,NULL,'2025-03-08'),
(20,38,NULL,'2025-01-24'),
(21,65,NULL,'2025-02-04'),
(23,56,NULL,'2025-02-28'),
(25,6,NULL,'2025-01-16'),
(27,68,NULL,'2025-01-06'),
(28,73,NULL,'2025-04-30'),
(30,12,NULL,'2025-05-14'),
(31,18,NULL,'2025-03-25'),
(32,42,NULL,'2025-05-02'),
(33,22,NULL,'2025-01-12'),
(34,10,NULL,'2025-04-30'),
(35,25,NULL,'2025-04-10'),
(36,48,NULL,'2025-03-06'),
(37,16,NULL,'2025-03-31'),
(38,70,NULL,'2025-04-22'),
(39,26,NULL,'2025-04-15'),
(40,13,NULL,'2025-03-17'),
(41,21,NULL,'2025-04-18'),
(42,55,NULL,'2025-03-27'),
(43,4,NULL,'2025-01-11'),
(44,20,NULL,'2025-05-08'),
(46,28,NULL,'2025-02-24'),
(47,52,NULL,'2025-01-17'),
(49,34,NULL,'2025-01-04'),
(50,31,NULL,'2025-03-20'),
(52,45,NULL,'2025-01-04'),
(53,57,NULL,'2025-05-03'),
(54,60,NULL,'2025-03-19'),
(56,51,NULL,'2025-01-07'),
(57,32,NULL,'2025-02-09'),
(58,7,NULL,'2025-02-21'),
(59,33,NULL,'2025-01-17'),
(60,3,NULL,'2025-02-11'),
(61,47,NULL,'2025-05-14'),
(62,64,NULL,'2025-04-11'),
(63,67,NULL,'2025-05-05'),
(64,49,NULL,'2025-04-09'),
(66,59,NULL,'2025-01-14'),
(67,27,NULL,'2025-03-01'),
(71,54,NULL,'2025-05-07'),
(72,40,NULL,'2025-03-21'),
(74,17,NULL,'2025-01-19'),
(75,74,NULL,'2025-04-28');
/*!40000 ALTER TABLE `lens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lens_level`
--

DROP TABLE IF EXISTS `lens_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lens_level` (
  `level_id` int(10) unsigned NOT NULL,
  `level_name` varchar(50) DEFAULT NULL,
  `incentive` int(11) DEFAULT NULL,
  `n_min_lens_created` int(11) DEFAULT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lens_level`
--

LOCK TABLES `lens_level` WRITE;
/*!40000 ALTER TABLE `lens_level` DISABLE KEYS */;
INSERT INTO `lens_level` (`level_id`, `level_name`, `incentive`, `n_min_lens_created`) VALUES (0,'Not Rated',0,1),
(1,'Bronze',1000000,10),
(2,'Silver',2000000,20),
(3,'Gold',3000000,30);
/*!40000 ALTER TABLE `lens_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lens_type`
--

DROP TABLE IF EXISTS `lens_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lens_type` (
  `lens_id` int(10) unsigned NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`lens_id`),
  CONSTRAINT `Lens_Type_ibfk_1` FOREIGN KEY (`lens_id`) REFERENCES `lens` (`lens_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lens_type`
--

LOCK TABLES `lens_type` WRITE;
/*!40000 ALTER TABLE `lens_type` DISABLE KEYS */;
INSERT INTO `lens_type` (`lens_id`, `type`) VALUES (1,'Face'),
(2,'Face'),
(4,'Face'),
(5,'Both'),
(6,'Background'),
(7,'Both'),
(8,'Both'),
(9,'Face'),
(10,'Background'),
(11,'Both'),
(12,'Face'),
(13,'Background'),
(14,'Face'),
(16,'Background'),
(17,'Both'),
(18,'Background'),
(19,'Background'),
(20,'Both'),
(21,'Face'),
(23,'Background'),
(25,'Both'),
(27,'Face'),
(28,'Face'),
(30,'Background'),
(31,'Both'),
(32,'Both'),
(33,'Background'),
(34,'Both'),
(35,'Background'),
(36,'Both'),
(37,'Face'),
(38,'Both'),
(39,'Background'),
(40,'Face'),
(41,'Face'),
(42,'Background'),
(43,'Both'),
(44,'Background'),
(46,'Face'),
(47,'Face'),
(49,'Face'),
(50,'Both'),
(52,'Both'),
(53,'Background'),
(54,'Both'),
(56,'Background'),
(57,'Background'),
(58,'Background'),
(59,'Face'),
(60,'Background'),
(61,'Both'),
(62,'Face'),
(63,'Face'),
(64,'Background'),
(66,'Background'),
(67,'Face'),
(71,'Both'),
(72,'Face'),
(74,'Background'),
(75,'Background');
/*!40000 ALTER TABLE `lens_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `user_id` int(10) unsigned NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time DEFAULT NULL,
  `latitude` int(11) DEFAULT NULL,
  `longitude` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`start_time`),
  CONSTRAINT `Location_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` (`user_id`, `start_time`, `end_time`, `latitude`, `longitude`) VALUES (2,'00:00:00','00:00:00',26,56),
(3,'00:00:00','00:00:00',-18,-10),
(4,'00:00:00','00:00:00',-70,162),
(6,'00:00:00','00:00:00',55,39),
(7,'00:00:00','00:00:00',-30,-121),
(8,'00:00:00','00:00:00',60,7),
(9,'00:00:00','00:00:00',-18,-14),
(10,'00:00:00','00:00:00',-84,118),
(11,'00:00:00','00:00:00',-63,-86),
(12,'00:00:00','00:00:00',18,-62),
(13,'00:00:00','00:00:00',-39,10),
(15,'00:00:00','00:00:00',41,-18),
(16,'00:00:00','00:00:00',37,164),
(17,'00:00:00','00:00:00',-17,22),
(18,'00:00:00','00:00:00',10,-11),
(19,'00:00:00','00:00:00',42,-40),
(20,'00:00:00','00:00:00',-73,-87),
(21,'00:00:00','00:00:00',49,-142),
(22,'00:00:00','00:00:00',-19,-34),
(25,'00:00:00','00:00:00',-20,172),
(26,'00:00:00','00:00:00',0,-129),
(27,'00:00:00','00:00:00',30,74),
(28,'00:00:00','00:00:00',65,-69),
(29,'00:00:00','00:00:00',-26,-50),
(31,'00:00:00','00:00:00',4,-93),
(32,'00:00:00','00:00:00',-84,40),
(33,'00:00:00','00:00:00',53,-52),
(34,'00:00:00','00:00:00',29,4),
(35,'00:00:00','00:00:00',-34,-74),
(37,'00:00:00','00:00:00',-74,-122),
(38,'00:00:00','00:00:00',-74,12),
(39,'00:00:00','00:00:00',64,-35),
(40,'00:00:00','00:00:00',20,-60),
(42,'00:00:00','00:00:00',-85,17),
(44,'00:00:00','00:00:00',-11,-51),
(45,'00:00:00','00:00:00',-75,-153),
(46,'00:00:00','00:00:00',-44,-106),
(47,'00:00:00','00:00:00',-12,79),
(48,'00:00:00','00:00:00',-37,-57),
(49,'00:00:00','00:00:00',-3,162),
(51,'00:00:00','00:00:00',15,-92),
(52,'00:00:00','00:00:00',17,87),
(53,'00:00:00','00:00:00',-4,13),
(54,'00:00:00','00:00:00',-59,4),
(55,'00:00:00','00:00:00',25,-1),
(56,'00:00:00','00:00:00',-67,64),
(57,'00:00:00','00:00:00',28,-70),
(59,'00:00:00','00:00:00',-64,-55),
(60,'00:00:00','00:00:00',51,-90),
(63,'00:00:00','00:00:00',11,-31),
(64,'00:00:00','00:00:00',-43,62),
(65,'00:00:00','00:00:00',-87,71),
(67,'00:00:00','00:00:00',-58,-119),
(68,'00:00:00','00:00:00',18,-140),
(69,'00:00:00','00:00:00',80,102),
(70,'00:00:00','00:00:00',70,104),
(72,'00:00:00','00:00:00',-45,-98),
(73,'00:00:00','00:00:00',40,-162),
(74,'00:00:00','00:00:00',18,94),
(75,'00:00:00','00:00:00',66,103);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pap`
--

DROP TABLE IF EXISTS `pap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pap` (
  `user_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `sent_order` int(10) unsigned NOT NULL,
  `lens_id` int(10) unsigned DEFAULT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`,`room_id`,`sent_order`),
  KEY `lens_id` (`lens_id`),
  CONSTRAINT `Pap_ibfk_1` FOREIGN KEY (`user_id`, `room_id`, `sent_order`) REFERENCES `content` (`user_id`, `room_id`, `sent_order`),
  CONSTRAINT `Pap_ibfk_2` FOREIGN KEY (`lens_id`) REFERENCES `lens` (`lens_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pap`
--

LOCK TABLES `pap` WRITE;
/*!40000 ALTER TABLE `pap` DISABLE KEYS */;
INSERT INTO `pap` (`user_id`, `room_id`, `sent_order`, `lens_id`, `duration`) VALUES (3,62,55,64,19),
(4,36,60,38,29),
(6,37,36,12,40),
(7,16,25,30,8),
(8,14,26,39,25),
(9,33,59,11,56),
(10,40,9,14,3),
(15,22,39,63,9),
(16,46,13,40,17),
(17,75,19,31,49),
(19,42,3,50,45),
(20,17,43,23,21),
(28,74,45,5,38),
(31,38,58,42,57),
(34,2,49,62,25),
(38,41,29,25,3),
(39,32,28,72,19),
(45,49,20,37,44),
(46,5,42,10,22),
(57,72,15,36,14),
(59,4,44,42,59),
(68,64,54,4,56),
(72,54,11,10,42),
(74,63,24,59,32);
/*!40000 ALTER TABLE `pap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_chat`
--

DROP TABLE IF EXISTS `room_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_chat` (
  `room_id` int(10) unsigned NOT NULL,
  `created_date` date DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_chat`
--

LOCK TABLES `room_chat` WRITE;
/*!40000 ALTER TABLE `room_chat` DISABLE KEYS */;
INSERT INTO `room_chat` (`room_id`, `created_date`) VALUES (1,'2025-04-09'),
(2,'2025-01-14'),
(3,'2025-03-18'),
(4,'2025-03-20'),
(5,'2025-01-08'),
(7,'2025-01-29'),
(8,'2025-01-25'),
(9,'2025-03-26'),
(10,'2025-03-14'),
(11,'2025-03-02'),
(12,'2025-04-27'),
(13,'2025-01-19'),
(14,'2025-03-11'),
(15,'2025-02-03'),
(16,'2025-02-23'),
(17,'2025-02-07'),
(18,'2025-02-25'),
(19,'2025-05-02'),
(20,'2025-02-13'),
(22,'2025-05-09'),
(23,'2025-02-13'),
(26,'2025-04-29'),
(29,'2025-02-24'),
(31,'2025-02-21'),
(32,'2025-05-06'),
(33,'2025-02-02'),
(34,'2025-04-15'),
(35,'2025-02-15'),
(36,'2025-03-08'),
(37,'2025-05-04'),
(38,'2025-03-25'),
(39,'2025-05-05'),
(40,'2025-05-14'),
(41,'2025-04-02'),
(42,'2025-05-06'),
(43,'2025-02-13'),
(44,'2025-02-07'),
(45,'2025-05-13'),
(46,'2025-03-04'),
(48,'2025-04-01'),
(49,'2025-01-05'),
(50,'2025-01-23'),
(51,'2025-01-14'),
(54,'2025-05-04'),
(55,'2025-04-07'),
(56,'2025-03-18'),
(60,'2025-02-08'),
(61,'2025-03-21'),
(62,'2025-03-07'),
(63,'2025-04-06'),
(64,'2025-01-30'),
(65,'2025-03-22'),
(67,'2025-03-11'),
(68,'2025-03-04'),
(69,'2025-02-06'),
(70,'2025-03-02'),
(72,'2025-04-08'),
(73,'2025-02-10'),
(74,'2025-04-22'),
(75,'2025-04-20');
/*!40000 ALTER TABLE `room_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_join`
--

DROP TABLE IF EXISTS `room_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_join` (
  `room_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `join_date` date DEFAULT NULL,
  PRIMARY KEY (`room_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Room_Join_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room_chat` (`room_id`),
  CONSTRAINT `Room_Join_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_join`
--

LOCK TABLES `room_join` WRITE;
/*!40000 ALTER TABLE `room_join` DISABLE KEYS */;
INSERT INTO `room_join` (`room_id`, `user_id`, `join_date`) VALUES (1,60,'2025-01-09'),
(2,46,'2025-03-05'),
(3,35,'2025-01-23'),
(4,20,'2025-03-22'),
(5,31,'2025-03-18'),
(7,44,'2025-05-03'),
(8,19,'2025-03-03'),
(9,63,'2025-04-10'),
(10,48,'2025-02-23'),
(11,25,'2025-05-11'),
(12,45,'2025-03-26'),
(13,26,'2025-04-01'),
(14,64,'2025-03-22'),
(15,37,'2025-05-09'),
(16,59,'2025-01-20'),
(17,29,'2025-04-02'),
(18,55,'2025-02-26'),
(19,49,'2025-04-22'),
(20,53,'2025-02-20'),
(22,32,'2025-03-14'),
(23,2,'2025-02-15'),
(26,65,'2025-04-14'),
(29,9,'2025-01-18'),
(31,10,'2025-03-21'),
(32,11,'2025-02-26'),
(33,68,'2025-05-06'),
(34,38,'2025-03-28'),
(35,74,'2025-01-24'),
(36,33,'2025-04-23'),
(37,6,'2025-02-19'),
(38,27,'2025-04-06'),
(39,72,'2025-04-08'),
(40,52,'2025-02-02'),
(41,47,'2025-02-23'),
(42,34,'2025-04-16'),
(43,8,'2025-02-04'),
(44,22,'2025-01-26'),
(45,13,'2025-03-07'),
(46,69,'2025-03-30'),
(48,40,'2025-01-15'),
(49,73,'2025-01-25'),
(50,15,'2025-05-12'),
(51,18,'2025-02-06'),
(54,56,'2025-04-03'),
(55,39,'2025-03-31'),
(56,70,'2025-04-26'),
(60,28,'2025-05-02'),
(61,51,'2025-05-02'),
(62,54,'2025-04-09'),
(63,75,'2025-02-01'),
(64,7,'2025-02-28'),
(65,42,'2025-02-16'),
(67,57,'2025-03-13'),
(68,12,'2025-04-29'),
(69,17,'2025-01-25'),
(70,3,'2025-04-19'),
(72,21,'2025-04-06'),
(73,16,'2025-01-31'),
(74,67,'2025-04-18'),
(75,4,'2025-03-09');
/*!40000 ALTER TABLE `room_join` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription` (
  `user_id` int(10) unsigned NOT NULL,
  `subscription_number` int(11) NOT NULL,
  `subscribe_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`subscription_number`),
  CONSTRAINT `subscription_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` (`user_id`, `subscription_number`, `subscribe_date`, `expire_date`, `status`) VALUES (2,15,'2025-01-16','2025-04-06',1),
(3,25,'2025-01-28','2025-04-29',0),
(4,4,'2025-04-03','2025-02-08',1),
(6,36,'2025-01-25','2025-01-24',0),
(7,43,'2025-01-02','2025-01-28',0),
(8,19,'2025-03-24','2025-04-18',1),
(9,49,'2025-03-21','2025-02-11',0),
(10,56,'2025-04-25','2025-01-26',1),
(11,73,'2025-02-04','2025-01-09',1),
(12,33,'2025-02-12','2025-04-10',0),
(13,31,'2025-05-10','2025-01-11',1),
(15,18,'2025-01-24','2025-04-01',1),
(16,51,'2025-01-10','2025-04-19',1),
(17,12,'2025-01-31','2025-04-25',0),
(18,47,'2025-01-27','2025-01-30',1),
(19,41,'2025-04-24','2025-02-15',0),
(20,59,'2025-03-06','2025-04-10',1),
(21,52,'2025-03-21','2025-04-12',1),
(22,32,'2025-04-23','2025-03-27',1),
(25,9,'2025-02-13','2025-05-10',1),
(26,67,'2025-04-12','2025-02-04',0),
(27,23,'2025-02-18','2025-02-12',0),
(28,66,'2025-04-30','2025-01-31',1),
(29,72,'2025-04-26','2025-03-22',0),
(31,40,'2025-02-10','2025-03-05',1),
(32,53,'2025-01-13','2025-02-25',0),
(33,62,'2025-01-19','2025-02-02',0),
(34,57,'2025-01-09','2025-04-17',1),
(35,26,'2025-01-28','2025-03-13',1),
(37,13,'2025-01-17','2025-02-17',0),
(38,7,'2025-03-25','2025-02-12',1),
(39,42,'2025-02-27','2025-01-27',1),
(40,34,'2025-01-25','2025-01-24',0),
(42,8,'2025-05-05','2025-04-02',1),
(44,14,'2025-01-28','2025-02-05',1),
(45,48,'2025-05-12','2025-05-04',0),
(46,28,'2025-03-10','2025-04-15',0),
(47,61,'2025-05-13','2025-04-22',1),
(48,29,'2025-02-06','2025-02-18',0),
(49,65,'2025-05-01','2025-04-02',0),
(51,21,'2025-04-03','2025-01-06',1),
(52,6,'2025-03-08','2025-02-13',0),
(53,55,'2025-01-30','2025-04-12',0),
(54,11,'2025-04-07','2025-01-17',0),
(55,75,'2025-05-12','2025-01-28',0),
(56,24,'2025-01-06','2025-04-16',1),
(57,37,'2025-05-10','2025-01-20',1),
(59,20,'2025-03-08','2025-02-03',0),
(60,71,'2025-05-14','2025-04-18',1),
(63,35,'2025-03-22','2025-04-05',0),
(64,17,'2025-04-13','2025-01-14',1),
(65,60,'2025-03-17','2025-04-21',0),
(67,16,'2025-05-09','2025-02-07',1),
(68,54,'2025-03-14','2025-03-21',1),
(69,3,'2025-02-07','2025-04-14',0),
(70,50,'2025-03-28','2025-01-28',1),
(72,46,'2025-04-06','2025-01-20',0),
(73,44,'2025-02-04','2025-04-02',0),
(74,39,'2025-03-08','2025-04-15',1),
(75,30,'2025-04-26','2025-05-06',0);
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `telp_num` varchar(15) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `level_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `level_id` (`level_id`),
  CONSTRAINT `User_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `lens_level` (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `email`, `password`, `username`, `telp_num`, `birthdate`, `date_created`, `level_id`) VALUES (2,'grahambryan@example.net','L*wd9LVh6M','nmoore','08131781958','1987-09-13','2021-10-27',3),
(3,'toddjohnson@example.org','+9vL^a3#JV','longnatalie','08279306659','1960-11-09','2020-07-27',1),
(4,'dianahughes@example.com','*VWIguyj77','wisedavid','08041385765','1965-04-19','2020-09-01',2),
(6,'michaelwheeler@example.net','U&9ZSADt^o','oburns','08278779601','1960-07-20','2021-06-16',3),
(7,'nbarrett@example.org','_F1FriBRX@','jongalvan','08392843452','1957-12-30','2025-02-22',3),
(8,'hutchinsonannette@example.net','a6JQyig0%5','mollyrivera','08390869146','2000-02-01','2021-02-17',3),
(9,'william02@example.org','c0+%iZAa#M','scardenas','08201896139','1985-03-18','2021-10-16',2),
(10,'robertmitchell@example.org','zEY8C0Iq(^','andrew43','08386621007','1993-02-18','2024-11-06',2),
(11,'cody58@example.net','_#U%8UMzr&','taylorgonzalez','08012607066','1971-06-26','2021-11-05',1),
(12,'krystalmurphy@example.net','$Kv2WuRD+F','ricardopeterson','08651877066','1975-01-21','2022-03-27',1),
(13,'kjohnson@example.com','mqS^W4Y+J+','ryan08','08180752852','1962-11-10','2024-10-25',3),
(15,'rojaserika@example.org','2&9Une@Lj@','blopez','08991471236','1980-09-01','2024-08-06',3),
(16,'tyoung@example.com','$5A4hzp72w','choistacey','08716088258','1995-08-17','2024-03-11',2),
(17,'clementsrachel@example.net','Sqm2iIdva@','zgeorge','08221935121','1971-10-05','2023-03-27',1),
(18,'townsendtroy@example.org','XT$08HpFOu','eleon','08136114076','1971-07-30','2020-09-13',3),
(19,'nashjessica@example.net','lwf5SSkY+4','mooreanthony','08438809681','1970-12-16','2020-07-06',1),
(20,'cookdanielle@example.com','J*k9&6Rjbn','kevinwise','08378192442','1982-06-23','2020-08-14',1),
(21,'araymond@example.net','$36h6SKglP','bakerallison','08354412287','2001-02-21','2024-12-25',1),
(22,'pricecarlos@example.org','BB6LtuZy%e','sarafrancis','08250705566','1994-03-29','2023-07-01',1),
(25,'powersashley@example.net',')ZR$&XPc_2','johnschneider','08727374798','1955-11-03','2024-12-18',2),
(26,'dtrujillo@example.org','U^4kQWRqlz','garciawilliam','08582560773','1990-01-19','2020-07-24',1),
(27,'ohuffman@example.com','38!Tphm*!!','garciakenneth','08869210053','1990-06-11','2024-11-05',1),
(28,'robert78@example.net','eluYKd#X^7','jessicaross','08694933788','2003-10-09','2024-02-06',3),
(29,'kingshannon@example.org','!5ObrLGD8k','teresa11','08273495950','1979-02-03','2022-07-06',2),
(31,'sandrastone@example.org','CQf8x0Gk^#','stephanie40','08837296532','1970-07-02','2021-12-15',2),
(32,'daniel10@example.com','GA)S_9AtoT','teresajones','08591481045','1998-11-25','2025-04-02',2),
(33,'aaron89@example.net','5%S7UO#bwO','jmata','08647033020','1970-07-28','2023-03-24',3),
(34,'lwright@example.org','M0P1gQB9+d','jasonanderson','08175193471','1965-11-14','2023-12-02',2),
(35,'danielle62@example.com','NCN4$qeC@5','kristen65','08727605645','2005-12-16','2023-05-01',1),
(37,'melvin32@example.com','8)6o7Pk!Es','bharrison','08644356722','1999-09-05','2025-03-29',3),
(38,'byrdlatoya@example.org','(5gtQv5)Gw','coxdeborah','08892490593','1985-03-22','2022-09-20',1),
(39,'vcarrillo@example.net','g_po8+DG^5','serranojon','08425388108','1987-10-10','2020-12-05',2),
(40,'rtownsend@example.net','@0XTsG*iFT','kristincurry','08381662987','2002-02-20','2020-12-28',1),
(42,'jessica63@example.com','!NAQ56Hk(t','rsmith','08561849745','1986-05-01','2023-12-04',2),
(44,'allendavid@example.org','j!B@61EbY+','jacqueline52','08629474598','1993-05-02','2020-10-29',2),
(45,'rodriguezjennifer@example.com','s1_MkM*v%@','ruthcampbell','08870973800','1998-11-04','2023-02-03',1),
(46,'gutierrezrobert@example.com','!E*w6XXs%2','johnstevens','08043837047','2006-05-29','2025-01-04',3),
(47,'amanda39@example.net','^biBMcDSK8','stanleymathew','08759869890','1990-01-09','2023-05-26',1),
(48,'yvonnedelgado@example.com','$3QAybBxGq','qcowan','08894627765','1995-01-19','2020-06-30',3),
(49,'benjamin96@example.net','pBGw4&0i#8','brownchristina','08993874484','1994-11-19','2025-01-22',1),
(51,'thomas56@example.org',')ZCBdlQ5&7','timothyjenkins','08016041278','1962-05-28','2022-09-25',1),
(52,'krussell@example.org','QC!7L%Eu(G','kstewart','08491384393','1958-07-16','2020-08-26',2),
(53,'charlenerice@example.net','q1LyMHS6^0','daniellebeck','08536326225','1989-05-28','2020-11-08',3),
(54,'johnjackson@example.org','l^O0NMh2&k','wellsjames','08481748776','1985-02-11','2021-03-22',1),
(55,'tiffanyduncan@example.com','u@WC!6d^@0','marc77','08946364896','1972-05-23','2022-10-28',3),
(56,'jonathangreer@example.com','91nCWuZb^l','andre77','08640653877','1995-12-08','2025-03-16',3),
(57,'garzamaria@example.net','_f3XOXEzP3','dianerivas','08508141068','1985-02-05','2023-06-18',2),
(59,'michaelbrewer@example.com','@C5cN0jp7Y','skirby','08193029705','1976-04-05','2024-07-19',3),
(60,'barretttammy@example.net','6KQqcV1x#C','jenniferbrown','08764940256','1983-01-29','2020-10-31',2),
(63,'diana36@example.net','!5)0)B1vFh','nicholesmith','08162720074','1998-12-12','2025-01-27',3),
(64,'harrismary@example.net','Z*C6DNay(N','chandlerandrew','08788218262','1969-05-04','2020-03-05',2),
(65,'sking@example.org','*B*W0Jt)Na','dawnreed','08835447718','1955-10-10','2020-02-19',3),
(67,'jacobseric@example.net','&f0Pl2KzQr','hschmidt','08327691636','1991-10-23','2024-05-09',1),
(68,'johnrussell@example.com','%cAjriEm!2','ebony26','08974393627','1977-05-02','2024-12-25',3),
(69,'jenniferwalker@example.com','f^9%Mi4&1x','benjaminsimon','08003710670','1987-12-07','2023-09-29',2),
(70,'melindahanson@example.org','95@8PbMzoP','murrayethan','08953370651','1972-10-09','2023-05-26',2),
(72,'rothkayla@example.net','%s9&Hshw*Q','robertknight','08889604332','1962-04-15','2021-04-15',1),
(73,'richardfrench@example.com','#293VMb0rk','robertsmith','08473271235','2004-03-04','2024-06-24',2),
(74,'vsmith@example.net','#0bpXmv_Q5','wrightpenny','08817216035','1958-04-19','2022-07-05',2),
(75,'grossshawn@example.net','JqJn1wFtr(','wbest','08713861876','1962-09-16','2021-04-02',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-05-16  8:42:45
