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
  CONSTRAINT `add_on_ibfk_1` FOREIGN KEY (`user_id`, `room_id`, `sent_order`) REFERENCES `pap` (`user_id`, `room_id`, `sent_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `add_on`
--

LOCK TABLES `add_on` WRITE;
/*!40000 ALTER TABLE `add_on` DISABLE KEYS */;
INSERT INTO `add_on` (`user_id`, `room_id`, `sent_order`, `addon_idx`, `x_start`, `x_end`, `y_start`, `y_end`) VALUES (8,41,38,1,85,111,194,247),
(8,41,38,2,175,260,18,47),
(8,41,38,3,61,111,107,203),
(8,41,38,4,37,97,135,145),
(8,41,38,5,86,151,120,192),
(8,41,38,6,63,146,110,196),
(8,41,38,7,148,172,19,49),
(8,41,38,8,167,243,19,76),
(8,41,38,9,181,261,147,180),
(8,41,38,10,149,207,77,169),
(8,41,38,11,196,263,106,172),
(8,41,38,12,72,156,186,212),
(8,41,38,13,14,88,166,204),
(8,41,38,14,1,64,63,125),
(10,12,84,1,27,122,96,191),
(10,12,84,2,45,70,128,187),
(10,12,84,3,35,120,160,206),
(10,12,84,4,161,257,184,254),
(10,12,84,5,106,203,134,154),
(10,12,84,6,141,204,186,220),
(10,12,84,7,81,136,64,155),
(10,12,84,8,85,163,121,204),
(10,12,84,9,164,208,87,144),
(10,53,45,1,162,236,94,146),
(10,53,45,2,138,215,72,166),
(10,53,45,3,67,159,22,94),
(10,53,45,4,28,110,77,145),
(10,53,45,5,135,150,179,194),
(10,53,45,6,41,114,114,147),
(10,53,45,7,60,121,103,148),
(10,53,45,8,186,249,61,156),
(10,53,45,9,61,73,24,67),
(10,53,45,10,37,67,51,73),
(12,14,6,1,104,124,183,226),
(12,14,6,2,59,159,142,177),
(12,14,6,3,19,47,136,166),
(12,14,6,4,120,141,110,146),
(12,14,6,5,52,119,36,52),
(12,14,6,6,123,166,143,157),
(12,14,6,7,137,234,59,120),
(12,14,6,8,70,121,135,235),
(12,14,6,9,33,80,102,123),
(12,14,6,10,67,91,154,222),
(12,53,60,1,121,154,76,172),
(12,53,60,2,192,239,8,64),
(12,53,60,3,90,140,183,217),
(12,53,60,4,11,61,82,175),
(12,53,60,5,68,135,154,221),
(12,53,60,6,93,110,181,245),
(12,53,60,7,189,219,107,178),
(12,53,60,8,189,281,33,112),
(12,53,60,9,29,97,166,249),
(12,53,60,10,11,106,43,102),
(12,53,60,11,134,158,152,164),
(12,53,60,12,156,179,159,208),
(12,53,60,13,56,125,171,221),
(12,53,60,14,191,206,56,129),
(12,53,60,15,129,141,1,16),
(12,53,60,16,146,237,52,87),
(14,60,16,1,13,110,31,129),
(14,60,16,2,135,154,164,228),
(14,60,16,3,98,179,175,275),
(14,60,16,4,87,161,88,178),
(14,60,16,5,45,89,85,166),
(14,60,16,6,71,89,181,251),
(14,60,16,7,32,123,36,115),
(14,60,16,8,180,221,44,58),
(14,60,16,9,55,137,119,163),
(14,60,16,10,181,229,172,267),
(14,60,16,11,22,57,23,104),
(14,60,16,12,9,35,23,114),
(14,60,16,13,128,224,119,188),
(14,60,16,14,193,247,183,281),
(14,60,16,15,114,198,173,260),
(14,60,16,16,59,96,170,233),
(14,60,16,17,56,133,165,199),
(14,60,16,18,56,156,147,188),
(14,60,16,19,25,66,52,73),
(14,60,16,20,110,149,44,56),
(14,65,61,1,55,68,14,77),
(14,65,61,2,140,203,197,234),
(14,65,61,3,93,142,193,262),
(14,65,61,4,9,105,93,113),
(14,65,61,5,73,113,9,49),
(14,65,61,6,114,209,200,262),
(14,65,61,7,10,26,149,213),
(14,65,61,8,151,230,52,97),
(14,65,61,9,187,253,17,113),
(14,65,61,10,82,159,159,198),
(14,65,61,11,152,238,79,179),
(17,12,28,1,111,156,176,251),
(17,12,28,2,164,212,38,87),
(17,12,28,3,18,109,103,193),
(17,12,28,4,156,256,74,117),
(17,19,43,1,185,277,100,146),
(17,19,43,2,87,169,55,141),
(17,19,43,3,77,165,82,159),
(17,19,43,4,171,217,106,153),
(17,19,43,5,167,225,180,252),
(25,54,66,1,84,141,85,184),
(25,54,66,2,86,179,14,27),
(25,54,66,3,27,69,193,240),
(25,54,66,4,59,82,174,194),
(25,54,66,5,157,174,113,206),
(25,54,66,6,183,205,90,165),
(25,54,66,7,39,122,28,98),
(25,54,66,8,130,224,8,25),
(25,54,66,9,64,157,117,200),
(25,54,66,10,117,203,20,104),
(25,54,66,11,126,223,60,91),
(25,54,66,12,22,44,186,266),
(25,54,66,13,96,162,197,268),
(32,12,30,1,195,267,100,146),
(32,12,30,2,64,156,15,93),
(32,12,30,3,130,186,96,114),
(32,12,30,4,99,116,165,242),
(32,12,30,5,11,75,176,258),
(32,12,30,6,152,195,56,79),
(32,12,30,7,148,167,88,184),
(32,12,30,8,83,153,67,153),
(32,12,30,9,57,78,112,187),
(32,12,30,10,20,62,135,185),
(35,12,8,1,10,107,88,188),
(35,12,8,2,77,173,30,40),
(35,12,8,3,129,201,79,153),
(35,12,8,4,94,159,92,155),
(35,12,8,5,155,223,84,151),
(35,12,8,6,136,165,85,181),
(35,12,8,7,39,64,131,156),
(35,12,8,8,52,97,178,237),
(35,12,8,9,177,259,82,98),
(35,12,8,10,129,165,196,275),
(35,21,9,1,197,226,179,230),
(35,21,9,2,198,250,45,115),
(35,21,9,3,194,270,3,76),
(35,21,9,4,73,169,173,264),
(35,21,9,5,108,134,89,113),
(35,21,9,6,92,111,71,170),
(35,21,9,7,98,136,72,138),
(42,41,5,1,4,31,147,188),
(42,41,5,2,11,47,17,110),
(42,41,5,3,121,190,200,240),
(42,41,5,4,146,198,194,225),
(42,41,5,5,184,218,101,178),
(42,41,5,6,43,85,137,162),
(45,1,93,1,98,177,2,95),
(45,1,93,2,17,114,100,164),
(45,1,93,3,102,174,86,185),
(45,1,93,4,184,269,171,271),
(45,1,93,5,52,101,85,159),
(45,1,93,6,116,148,194,262),
(45,1,93,7,107,206,71,161),
(45,1,93,8,198,229,98,141),
(45,1,93,9,179,253,82,132),
(45,1,93,10,62,135,149,196),
(45,1,93,11,196,206,118,145),
(45,1,93,12,34,105,149,224),
(45,1,93,13,103,148,190,220),
(45,1,93,14,91,172,53,77),
(45,1,93,15,177,204,82,181),
(45,59,37,1,47,126,133,197),
(45,59,37,2,81,131,81,119),
(45,59,37,3,181,213,102,140),
(45,59,37,4,101,128,97,112),
(45,59,37,5,20,48,143,185),
(45,59,37,6,23,56,38,120),
(45,59,37,7,170,235,105,149),
(45,59,37,8,70,167,175,274),
(45,59,37,9,7,99,15,107),
(45,59,37,10,62,122,91,188),
(45,59,37,11,130,205,171,266),
(45,59,37,12,142,194,160,187),
(45,59,37,13,73,149,28,105),
(45,59,37,14,8,67,24,74),
(45,60,46,1,122,191,128,146),
(45,60,46,2,16,112,147,234),
(45,60,46,3,97,127,134,233),
(45,60,46,4,54,132,114,131),
(45,60,46,5,183,201,1,47),
(49,34,79,1,3,97,142,156),
(49,34,79,2,66,101,148,211),
(49,34,79,3,40,96,97,170),
(49,34,79,4,186,278,115,194),
(49,34,79,5,67,80,30,55),
(49,34,79,6,193,292,152,209),
(49,34,79,7,50,66,186,235),
(49,34,79,8,8,67,38,131),
(49,34,79,9,45,134,124,213),
(49,34,79,10,103,193,130,171),
(49,34,79,11,42,60,6,24),
(50,66,80,1,104,131,38,54),
(50,66,80,2,25,78,8,54),
(50,66,80,3,0,79,113,159),
(50,66,80,4,39,74,37,109),
(50,66,80,5,51,92,97,187),
(50,66,80,6,177,214,20,100),
(64,1,90,1,146,228,58,88),
(64,1,90,2,176,267,48,66),
(64,1,90,3,125,187,125,170),
(64,1,90,4,113,201,45,86),
(64,1,90,5,146,235,184,243),
(66,41,31,1,5,67,143,193),
(66,41,31,2,67,122,58,141),
(66,41,31,3,188,217,57,70),
(66,41,31,4,34,99,71,112),
(66,54,26,1,163,182,114,180),
(66,54,26,2,25,110,103,130),
(66,54,26,3,3,16,44,85),
(66,54,26,4,115,143,17,116),
(66,54,26,5,76,147,152,241),
(66,54,26,6,26,126,49,108),
(66,54,26,7,79,123,92,155),
(66,54,26,8,77,129,72,170),
(66,54,26,9,7,64,199,213),
(66,54,26,10,139,154,95,165),
(66,54,26,11,92,167,101,121),
(66,54,26,12,124,149,96,192),
(66,54,26,13,12,103,166,219),
(66,54,26,14,197,209,86,106),
(66,54,26,15,15,69,32,119),
(69,1,35,1,56,81,173,207),
(69,1,35,2,9,65,114,141),
(69,1,35,3,100,135,48,129),
(69,1,35,4,64,125,50,131),
(69,1,35,5,51,151,81,105),
(69,1,35,6,101,175,67,100),
(69,1,35,7,163,202,135,161),
(69,1,35,8,176,260,40,101),
(69,1,35,9,21,71,126,137),
(69,1,35,10,18,35,74,124),
(69,1,35,11,103,193,158,211),
(72,2,17,1,59,122,198,295),
(72,2,17,2,139,173,175,260),
(72,2,17,3,59,104,28,74),
(72,2,17,4,24,112,32,90),
(72,2,17,5,177,217,77,98),
(72,2,17,6,167,251,133,156),
(72,2,17,7,190,272,94,124),
(72,2,17,8,97,116,104,144),
(72,2,17,9,163,250,15,61),
(72,2,17,10,133,219,129,182),
(72,2,17,11,167,240,10,79),
(72,2,17,12,68,161,0,98),
(75,53,95,1,11,29,11,90),
(75,53,95,2,61,144,77,105),
(75,53,95,3,84,161,44,111),
(75,53,95,4,6,48,30,86),
(75,53,95,5,75,157,7,103),
(75,53,95,6,168,185,0,28),
(75,53,95,7,71,120,97,117),
(75,53,95,8,135,152,52,69),
(75,53,95,9,8,52,37,76),
(75,53,95,10,117,143,42,125),
(75,53,95,11,83,103,47,71),
(75,53,95,12,17,58,196,228),
(75,53,95,13,50,69,28,80),
(75,53,95,14,40,60,103,171),
(75,53,95,15,26,92,5,72),
(75,53,95,16,55,105,152,252),
(75,53,95,17,95,166,157,236),
(75,53,95,18,96,174,128,173);
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
  CONSTRAINT `caption_ibfk_1` FOREIGN KEY (`user_id`, `room_id`, `sent_order`, `addon_idx`) REFERENCES `add_on` (`user_id`, `room_id`, `sent_order`, `addon_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caption`
--

LOCK TABLES `caption` WRITE;
/*!40000 ALTER TABLE `caption` DISABLE KEYS */;
INSERT INTO `caption` (`user_id`, `room_id`, `sent_order`, `addon_idx`, `font_style`, `text`) VALUES (8,41,38,9,'Arial','Care cut dog time pattern girl before.'),
(8,41,38,10,'Verdana','Loss marriage also buy.'),
(8,41,38,11,'Arial','Need tree include no need.'),
(8,41,38,12,'Comic Sans','Throw its treat face.'),
(8,41,38,13,'Verdana','Person traditional customer politics.'),
(8,41,38,14,'Arial','As west here four them enjoy determine.'),
(10,12,84,6,'Verdana','Again former remember land month energy write.'),
(10,12,84,7,'Arial','Sell figure free effort history how wrong fear.'),
(10,12,84,8,'Arial','Today whose difficult.'),
(10,12,84,9,'Comic Sans','But imagine body particularly cup.'),
(10,53,45,9,'Arial','Soon describe middle.'),
(10,53,45,10,'Verdana','Return mind central same.'),
(12,53,60,10,'Comic Sans','Participant might difference parent point beautiful four.'),
(12,53,60,11,'Verdana','Chair per interest medical.'),
(12,53,60,12,'Verdana','We business though win around.'),
(12,53,60,13,'Arial','Professional single answer leader guy city.'),
(12,53,60,14,'Arial','Read of find discussion last prove data tough.'),
(12,53,60,15,'Arial','Tax within note health throw argue player.'),
(12,53,60,16,'Verdana','Bad but recently although.'),
(14,60,16,11,'Verdana','Stuff plant attention also boy clearly wonder enter.'),
(14,60,16,12,'Comic Sans','Sure whether eye huge three reality.'),
(14,60,16,13,'Arial','Hard six enter simply degree.'),
(14,60,16,14,'Comic Sans','Best nor just top.'),
(14,60,16,15,'Arial','Go type five lot.'),
(14,60,16,16,'Comic Sans','Theory thing learn respond in recent.'),
(14,60,16,17,'Comic Sans','Or news west all after.'),
(14,60,16,18,'Verdana','Generation over other current answer voice knowledge.'),
(14,60,16,19,'Verdana','Act see enter rest create career art.'),
(14,60,16,20,'Verdana','Vote people big tend push factor level.'),
(14,65,61,2,'Verdana','Exactly perform rich event.'),
(14,65,61,3,'Arial','Tend town model significant finally might data total.'),
(14,65,61,4,'Verdana','Near determine open nor make.'),
(14,65,61,5,'Arial','If clearly exist character impact former.'),
(14,65,61,6,'Comic Sans','Color million create toward around likely set begin.'),
(14,65,61,7,'Arial','Leader investment simple return challenge protect.'),
(14,65,61,8,'Verdana','Trouble right believe stop interest.'),
(14,65,61,9,'Arial','Exist suddenly scene per.'),
(14,65,61,10,'Verdana','Million rest family ten.'),
(14,65,61,11,'Arial','Onto green need hand goal agency.'),
(17,12,28,4,'Arial','Because material lose town whom.'),
(25,54,66,4,'Arial','Fish every record political.'),
(25,54,66,5,'Comic Sans','Girl health stay response.'),
(25,54,66,6,'Comic Sans','Person mother civil agreement.'),
(25,54,66,7,'Arial','Appear my yeah professional hope him nearly.'),
(25,54,66,8,'Arial','Floor cup hit produce.'),
(25,54,66,9,'Arial','Party choose themselves speech.'),
(25,54,66,10,'Arial','Begin say require real score activity.'),
(25,54,66,11,'Arial','Think build here.'),
(25,54,66,12,'Arial','Own sound during get yard describe.'),
(25,54,66,13,'Arial','Say discuss bar pass soldier important education.'),
(32,12,30,1,'Arial','Woman happen section point nor peace course.'),
(32,12,30,2,'Comic Sans','Nation appear least thing change picture environmental.'),
(32,12,30,3,'Comic Sans','Yourself window turn thing reveal film spend.'),
(32,12,30,4,'Comic Sans','Yes once leg east.'),
(32,12,30,5,'Verdana','Own she lot spend last player economy.'),
(32,12,30,6,'Verdana','Laugh year good.'),
(32,12,30,7,'Verdana','According responsibility dinner grow significant street.'),
(32,12,30,8,'Arial','Space form property stand boy western.'),
(32,12,30,9,'Verdana','Seat sense morning language chance five black step.'),
(32,12,30,10,'Comic Sans','Senior impact station thank check.'),
(35,21,9,7,'Arial','Girl again sort choice test skin detail.'),
(45,1,93,9,'Comic Sans','Serious agreement buy candidate new other trial.'),
(45,1,93,10,'Comic Sans','Idea require Democrat wait former his student.'),
(45,1,93,11,'Verdana','Car certain single water still kind sometimes.'),
(45,1,93,12,'Verdana','Throw college issue reach structure teach security.'),
(45,1,93,13,'Comic Sans','Goal answer discussion.'),
(45,1,93,14,'Comic Sans','Music western talk arm.'),
(45,1,93,15,'Arial','Bill market decade town security range specific.'),
(45,59,37,5,'Comic Sans','Eight fill production evidence treatment.'),
(45,59,37,6,'Arial','Sort evening technology heart.'),
(45,59,37,7,'Comic Sans','Identify third forward sign house majority.'),
(45,59,37,8,'Verdana','Work floor finish according station sit.'),
(45,59,37,9,'Arial','Stage outside much list final.'),
(45,59,37,10,'Comic Sans','Last up cultural black character.'),
(45,59,37,11,'Arial','You reality live reach.'),
(45,59,37,12,'Comic Sans','Practice bring relate because remember century.'),
(45,59,37,13,'Verdana','Television child worker Mrs wish student.'),
(45,59,37,14,'Arial','Garden system better rock.'),
(45,60,46,2,'Arial','Particular edge task wide agency social.'),
(45,60,46,3,'Comic Sans','Their wall hard manager store.'),
(45,60,46,4,'Verdana','Leg by force get billion edge.'),
(45,60,46,5,'Verdana','Cultural Democrat collection dog.'),
(49,34,79,4,'Arial','Daughter most number.'),
(49,34,79,5,'Comic Sans','When politics college executive fill.'),
(49,34,79,6,'Arial','Government lead wide day produce employee debate middle.'),
(49,34,79,7,'Arial','Beat trip quality pick major from cultural.'),
(49,34,79,8,'Comic Sans','Magazine across but yet main run authority.'),
(49,34,79,9,'Comic Sans','Meet talk wonder magazine beat form.'),
(49,34,79,10,'Comic Sans','Training before writer.'),
(49,34,79,11,'Comic Sans','Reason someone gas everyone start.'),
(50,66,80,5,'Verdana','Serious those current position various game attorney.'),
(50,66,80,6,'Arial','Car blood none happy.'),
(64,1,90,5,'Arial','Subject front wife technology police build score.'),
(66,54,26,6,'Comic Sans','Someone million your not.'),
(66,54,26,7,'Verdana','Once heavy feeling about save spring.'),
(66,54,26,8,'Comic Sans','Pass hour time account require.'),
(66,54,26,9,'Arial','Idea decade wall be produce on eight.'),
(66,54,26,10,'Verdana','Lot method you suggest the.'),
(66,54,26,11,'Comic Sans','Claim record young apply much pretty form serious.'),
(66,54,26,12,'Verdana','Five begin officer just.'),
(66,54,26,13,'Comic Sans','Catch recognize huge magazine civil question tree find.'),
(66,54,26,14,'Verdana','Should produce today drug of range best affect.'),
(66,54,26,15,'Arial','Remember various join score relate education and.'),
(69,1,35,7,'Arial','Room speech Congress develop least water policy.'),
(69,1,35,8,'Verdana','Sister degree enjoy nature director change leave seem.'),
(69,1,35,9,'Arial','End determine who according value crime environment party.'),
(69,1,35,10,'Verdana','Military behind leg type stand.'),
(69,1,35,11,'Verdana','Expert officer religious suddenly soldier guy prove.'),
(72,2,17,10,'Verdana','Give although test.'),
(72,2,17,11,'Arial','Food relate box father.'),
(72,2,17,12,'Arial','Congress ask hold chance person.'),
(75,53,95,10,'Verdana','Finally dinner control better.'),
(75,53,95,11,'Comic Sans','Place chair agree.'),
(75,53,95,12,'Verdana','Red you international team begin.'),
(75,53,95,13,'Arial','Rest call share firm simply beyond.'),
(75,53,95,14,'Arial','Establish night democratic statement child safe change.'),
(75,53,95,15,'Comic Sans','Nor grow yet enter although capital media.'),
(75,53,95,16,'Verdana','Try never success bring.'),
(75,53,95,17,'Verdana','Strong whole great dog.'),
(75,53,95,18,'Comic Sans','Win soon commercial believe put Mrs put.');
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
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`user_id`, `room_id`, `sent_order`) REFERENCES `content` (`user_id`, `room_id`, `sent_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` (`user_id`, `room_id`, `sent_order`, `message`) VALUES (10,4,78,'Order then chair first his none.'),
(10,21,82,'Second front strong woman writer.'),
(12,14,19,'Half necessary every bank any prepare law those.'),
(12,42,42,'Join about couple reduce idea adult participant opportunity.'),
(14,59,76,'Ready significant high matter live sort building.'),
(21,12,22,'Nor provide industry.'),
(21,59,4,'Sometimes as almost.'),
(21,66,56,'Value question level human indicate owner security.'),
(25,53,68,'Store behind we second plan Mr throughout.'),
(32,67,55,'Attention purpose Democrat senior over wear.'),
(34,33,92,'Old consumer either rather.'),
(34,49,49,'Whose war friend here myself industry same.'),
(34,69,25,'Authority population street education interest.'),
(35,21,65,'Theory parent method design edge impact.'),
(35,67,12,'Rule daughter what single.'),
(37,14,98,'Ask Democrat vote tax successful will while eight.'),
(37,20,47,'Fight it everybody research middle rise statement.'),
(42,59,29,'Quality easy Republican most else general kitchen.'),
(45,65,13,'Accept require task better citizen budget of.'),
(45,65,20,'Maintain industry into reason.'),
(48,20,15,'Top know very matter.'),
(48,34,100,'Down main room order summer.'),
(48,42,10,'Seat million door identify.'),
(50,19,27,'Strong idea political position seem.'),
(50,21,11,'Reason commercial career behind professor always realize.'),
(55,9,14,'System likely black reflect certain down.'),
(55,41,3,'Property make past show.'),
(60,17,2,'Today huge focus usually easy give network.'),
(60,53,1,'Four as serve over clear business difficult.'),
(64,41,18,'They oil mean not.'),
(65,42,64,'Real somebody treatment commercial box affect official.'),
(67,4,62,'Catch particularly rise set technology a.'),
(67,17,58,'Fish community bad thus.'),
(67,35,81,'Measure ground magazine.'),
(67,44,94,'Congress push small just.'),
(67,45,69,'Kitchen couple couple put the.'),
(67,65,21,'Plan no certain eye dream.'),
(67,67,85,'Despite citizen blood go hear might.'),
(68,12,59,'Kid pick next entire beyond establish summer.'),
(68,17,52,'Challenge reach understand more analysis.'),
(68,20,54,'Whatever your unit build.'),
(68,49,83,'Song this just rather above lay cold.'),
(68,69,23,'White hold network democratic society arrive three.'),
(69,21,40,'Remember watch fight already second wait mind cultural.'),
(70,44,39,'Conference agent compare painting popular bank.'),
(70,65,73,'Before this do list teach certain.'),
(72,20,33,'Popular you factor learn.'),
(72,49,97,'Bed reflect that produce.'),
(75,54,91,'Indicate between about.');
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
  CONSTRAINT `content_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `room_join` (`user_id`),
  CONSTRAINT `content_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room_join` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` (`user_id`, `room_id`, `sent_order`, `send_time`, `is_exists`) VALUES (8,41,38,'00:00:00',1),
(8,60,74,'00:00:00',1),
(10,4,78,'00:00:00',1),
(10,12,84,'00:00:00',1),
(10,21,82,'00:00:00',1),
(10,53,45,'00:00:00',1),
(10,69,86,'00:00:00',1),
(12,14,6,'00:00:00',1),
(12,14,19,'00:00:00',1),
(12,21,99,'00:00:00',1),
(12,42,42,'00:00:00',1),
(12,53,60,'00:00:00',1),
(14,4,71,'00:00:00',1),
(14,59,76,'00:00:00',1),
(14,60,16,'00:00:00',1),
(14,65,61,'00:00:00',1),
(14,69,50,'00:00:00',1),
(15,2,87,'00:00:00',1),
(15,49,41,'00:00:00',1),
(15,65,24,'00:00:00',1),
(17,12,28,'00:00:00',1),
(17,19,43,'00:00:00',1),
(21,12,22,'00:00:00',1),
(21,59,4,'00:00:00',1),
(21,66,56,'00:00:00',1),
(25,2,96,'00:00:00',1),
(25,42,44,'00:00:00',1),
(25,53,68,'00:00:00',1),
(25,54,66,'00:00:00',1),
(25,65,34,'00:00:00',1),
(25,66,36,'00:00:00',1),
(32,12,30,'00:00:00',1),
(32,67,55,'00:00:00',1),
(34,33,92,'00:00:00',1),
(34,41,7,'00:00:00',1),
(34,49,49,'00:00:00',1),
(34,69,25,'00:00:00',1),
(35,12,8,'00:00:00',1),
(35,21,9,'00:00:00',1),
(35,21,65,'00:00:00',1),
(35,67,12,'00:00:00',1),
(37,14,98,'00:00:00',1),
(37,20,47,'00:00:00',1),
(42,41,5,'00:00:00',1),
(42,59,29,'00:00:00',1),
(43,69,51,'00:00:00',1),
(45,1,93,'00:00:00',1),
(45,53,63,'00:00:00',1),
(45,59,37,'00:00:00',1),
(45,60,46,'00:00:00',1),
(45,65,13,'00:00:00',1),
(45,65,20,'00:00:00',1),
(48,20,15,'00:00:00',1),
(48,34,100,'00:00:00',1),
(48,42,10,'00:00:00',1),
(48,73,89,'00:00:00',1),
(49,34,79,'00:00:00',1),
(49,53,70,'00:00:00',1),
(50,6,48,'00:00:00',1),
(50,19,27,'00:00:00',1),
(50,21,11,'00:00:00',1),
(50,66,80,'00:00:00',1),
(55,9,14,'00:00:00',1),
(55,41,3,'00:00:00',1),
(60,10,77,'00:00:00',1),
(60,17,2,'00:00:00',1),
(60,53,1,'00:00:00',1),
(64,1,90,'00:00:00',1),
(64,21,67,'00:00:00',1),
(64,41,18,'00:00:00',1),
(65,42,64,'00:00:00',1),
(65,60,57,'00:00:00',1),
(66,41,31,'00:00:00',1),
(66,54,26,'00:00:00',1),
(66,73,75,'00:00:00',1),
(67,4,62,'00:00:00',1),
(67,17,58,'00:00:00',1),
(67,35,81,'00:00:00',1),
(67,44,94,'00:00:00',1),
(67,45,69,'00:00:00',1),
(67,65,21,'00:00:00',1),
(67,65,72,'00:00:00',1),
(67,67,85,'00:00:00',1),
(68,12,59,'00:00:00',1),
(68,17,52,'00:00:00',1),
(68,20,54,'00:00:00',1),
(68,49,83,'00:00:00',1),
(68,69,23,'00:00:00',1),
(69,1,35,'00:00:00',1),
(69,21,40,'00:00:00',1),
(69,59,53,'00:00:00',1),
(70,44,39,'00:00:00',1),
(70,65,32,'00:00:00',1),
(70,65,73,'00:00:00',1),
(72,2,17,'00:00:00',1),
(72,20,33,'00:00:00',1),
(72,33,88,'00:00:00',1),
(72,49,97,'00:00:00',1),
(75,53,95,'00:00:00',1),
(75,54,91,'00:00:00',1);
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
  CONSTRAINT `friend_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `friend_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
INSERT INTO `friend` (`user_id`, `friend_id`) VALUES (14,8),
(21,8),
(43,8),
(72,8),
(25,10),
(32,10),
(34,10),
(55,10),
(72,10),
(21,12),
(42,12),
(8,14),
(34,14),
(35,14),
(49,14),
(64,14),
(66,14),
(37,15),
(42,15),
(67,15),
(68,15),
(72,15),
(42,17),
(48,17),
(50,17),
(8,21),
(12,21),
(43,21),
(75,21),
(10,25),
(55,25),
(10,32),
(50,32),
(10,34),
(14,34),
(43,34),
(49,34),
(67,34),
(70,34),
(14,35),
(37,35),
(42,35),
(64,35),
(69,35),
(15,37),
(35,37),
(45,37),
(48,37),
(45,40),
(48,40),
(12,42),
(15,42),
(17,42),
(35,42),
(45,42),
(8,43),
(21,43),
(34,43),
(50,43),
(37,45),
(40,45),
(42,45),
(70,45),
(72,45),
(17,48),
(37,48),
(40,48),
(67,48),
(14,49),
(34,49),
(65,49),
(72,49),
(75,49),
(17,50),
(32,50),
(43,50),
(60,50),
(66,50),
(75,50),
(10,55),
(25,55),
(68,55),
(70,55),
(50,60),
(14,64),
(35,64),
(65,64),
(49,65),
(64,65),
(14,66),
(50,66),
(15,67),
(34,67),
(48,67),
(72,67),
(15,68),
(55,68),
(35,69),
(75,69),
(34,70),
(45,70),
(55,70),
(8,72),
(10,72),
(15,72),
(45,72),
(49,72),
(67,72),
(21,75),
(49,75),
(50,75),
(69,75);
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
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`user_id`, `room_id`, `sent_order`, `addon_idx`) REFERENCES `add_on` (`user_id`, `room_id`, `sent_order`, `addon_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` (`user_id`, `room_id`, `sent_order`, `addon_idx`, `name`) VALUES (8,41,38,1,'image_37.jpg'),
(8,41,38,2,'image_37.jpg'),
(8,41,38,3,'image_37.jpg'),
(8,41,38,4,'image_37.jpg'),
(8,41,38,5,'image_37.jpg'),
(8,41,38,6,'image_37.jpg'),
(8,41,38,7,'image_37.jpg'),
(8,41,38,8,'image_37.jpg'),
(10,12,84,1,'image_83.jpg'),
(10,12,84,2,'image_83.jpg'),
(10,12,84,3,'image_83.jpg'),
(10,12,84,4,'image_83.jpg'),
(10,12,84,5,'image_83.jpg'),
(10,53,45,1,'image_44.jpg'),
(10,53,45,2,'image_44.jpg'),
(10,53,45,3,'image_44.jpg'),
(10,53,45,4,'image_44.jpg'),
(10,53,45,5,'image_44.jpg'),
(10,53,45,6,'image_44.jpg'),
(10,53,45,7,'image_44.jpg'),
(10,53,45,8,'image_44.jpg'),
(12,14,6,1,'image_5.jpg'),
(12,14,6,2,'image_5.jpg'),
(12,14,6,3,'image_5.jpg'),
(12,14,6,4,'image_5.jpg'),
(12,14,6,5,'image_5.jpg'),
(12,14,6,6,'image_5.jpg'),
(12,14,6,7,'image_5.jpg'),
(12,14,6,8,'image_5.jpg'),
(12,14,6,9,'image_5.jpg'),
(12,14,6,10,'image_5.jpg'),
(12,53,60,1,'image_59.jpg'),
(12,53,60,2,'image_59.jpg'),
(12,53,60,3,'image_59.jpg'),
(12,53,60,4,'image_59.jpg'),
(12,53,60,5,'image_59.jpg'),
(12,53,60,6,'image_59.jpg'),
(12,53,60,7,'image_59.jpg'),
(12,53,60,8,'image_59.jpg'),
(12,53,60,9,'image_59.jpg'),
(14,60,16,1,'image_15.jpg'),
(14,60,16,2,'image_15.jpg'),
(14,60,16,3,'image_15.jpg'),
(14,60,16,4,'image_15.jpg'),
(14,60,16,5,'image_15.jpg'),
(14,60,16,6,'image_15.jpg'),
(14,60,16,7,'image_15.jpg'),
(14,60,16,8,'image_15.jpg'),
(14,60,16,9,'image_15.jpg'),
(14,60,16,10,'image_15.jpg'),
(14,65,61,1,'image_60.jpg'),
(17,12,28,1,'image_27.jpg'),
(17,12,28,2,'image_27.jpg'),
(17,12,28,3,'image_27.jpg'),
(17,19,43,1,'image_42.jpg'),
(17,19,43,2,'image_42.jpg'),
(17,19,43,3,'image_42.jpg'),
(17,19,43,4,'image_42.jpg'),
(17,19,43,5,'image_42.jpg'),
(25,54,66,1,'image_65.jpg'),
(25,54,66,2,'image_65.jpg'),
(25,54,66,3,'image_65.jpg'),
(35,12,8,1,'image_7.jpg'),
(35,12,8,2,'image_7.jpg'),
(35,12,8,3,'image_7.jpg'),
(35,12,8,4,'image_7.jpg'),
(35,12,8,5,'image_7.jpg'),
(35,12,8,6,'image_7.jpg'),
(35,12,8,7,'image_7.jpg'),
(35,12,8,8,'image_7.jpg'),
(35,12,8,9,'image_7.jpg'),
(35,12,8,10,'image_7.jpg'),
(35,21,9,1,'image_8.jpg'),
(35,21,9,2,'image_8.jpg'),
(35,21,9,3,'image_8.jpg'),
(35,21,9,4,'image_8.jpg'),
(35,21,9,5,'image_8.jpg'),
(35,21,9,6,'image_8.jpg'),
(42,41,5,1,'image_4.jpg'),
(42,41,5,2,'image_4.jpg'),
(42,41,5,3,'image_4.jpg'),
(42,41,5,4,'image_4.jpg'),
(42,41,5,5,'image_4.jpg'),
(42,41,5,6,'image_4.jpg'),
(45,1,93,1,'image_92.jpg'),
(45,1,93,2,'image_92.jpg'),
(45,1,93,3,'image_92.jpg'),
(45,1,93,4,'image_92.jpg'),
(45,1,93,5,'image_92.jpg'),
(45,1,93,6,'image_92.jpg'),
(45,1,93,7,'image_92.jpg'),
(45,1,93,8,'image_92.jpg'),
(45,59,37,1,'image_36.jpg'),
(45,59,37,2,'image_36.jpg'),
(45,59,37,3,'image_36.jpg'),
(45,59,37,4,'image_36.jpg'),
(45,60,46,1,'image_45.jpg'),
(49,34,79,1,'image_78.jpg'),
(49,34,79,2,'image_78.jpg'),
(49,34,79,3,'image_78.jpg'),
(50,66,80,1,'image_79.jpg'),
(50,66,80,2,'image_79.jpg'),
(50,66,80,3,'image_79.jpg'),
(50,66,80,4,'image_79.jpg'),
(64,1,90,1,'image_89.jpg'),
(64,1,90,2,'image_89.jpg'),
(64,1,90,3,'image_89.jpg'),
(64,1,90,4,'image_89.jpg'),
(66,41,31,1,'image_30.jpg'),
(66,41,31,2,'image_30.jpg'),
(66,41,31,3,'image_30.jpg'),
(66,41,31,4,'image_30.jpg'),
(66,54,26,1,'image_25.jpg'),
(66,54,26,2,'image_25.jpg'),
(66,54,26,3,'image_25.jpg'),
(66,54,26,4,'image_25.jpg'),
(66,54,26,5,'image_25.jpg'),
(69,1,35,1,'image_34.jpg'),
(69,1,35,2,'image_34.jpg'),
(69,1,35,3,'image_34.jpg'),
(69,1,35,4,'image_34.jpg'),
(69,1,35,5,'image_34.jpg'),
(69,1,35,6,'image_34.jpg'),
(72,2,17,1,'image_16.jpg'),
(72,2,17,2,'image_16.jpg'),
(72,2,17,3,'image_16.jpg'),
(72,2,17,4,'image_16.jpg'),
(72,2,17,5,'image_16.jpg'),
(72,2,17,6,'image_16.jpg'),
(72,2,17,7,'image_16.jpg'),
(72,2,17,8,'image_16.jpg'),
(72,2,17,9,'image_16.jpg'),
(75,53,95,1,'image_94.jpg'),
(75,53,95,2,'image_94.jpg'),
(75,53,95,3,'image_94.jpg'),
(75,53,95,4,'image_94.jpg'),
(75,53,95,5,'image_94.jpg'),
(75,53,95,6,'image_94.jpg'),
(75,53,95,7,'image_94.jpg'),
(75,53,95,8,'image_94.jpg'),
(75,53,95,9,'image_94.jpg');
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
  CONSTRAINT `lens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lens`
--

LOCK TABLES `lens` WRITE;
/*!40000 ALTER TABLE `lens` DISABLE KEYS */;
INSERT INTO `lens` (`lens_id`, `user_id`, `name`, `release_date`) VALUES (1,35,'arriveLens','2025-02-11'),
(2,32,'familyLens','2025-01-19'),
(3,32,'yetLens','2025-02-05'),
(4,35,'availableLens','2025-01-10'),
(5,32,'MrsLens','2025-04-16'),
(6,35,'wearLens','2025-03-29'),
(7,32,'enterLens','2025-05-02'),
(8,35,'eventLens','2025-01-16'),
(9,32,'carryLens','2025-03-31'),
(10,34,'drawLens','2025-02-10'),
(11,35,'meanLens','2025-02-20'),
(12,35,'whomLens','2025-03-17'),
(13,34,'itselfLens','2025-02-23'),
(14,34,'joinLens','2025-02-21'),
(15,35,'priceLens','2025-04-13'),
(16,32,'leaderLens','2025-02-23'),
(17,21,'seaLens','2025-02-25'),
(18,35,'professionalLens','2025-05-09'),
(19,34,'executiveLens','2025-05-05'),
(20,32,'fiveLens','2025-04-22'),
(21,35,'winLens','2025-03-24'),
(22,32,'earlyLens','2025-02-28'),
(23,32,'themLens','2025-03-23'),
(24,32,'hairLens','2025-05-11'),
(25,32,'matterLens','2025-02-16'),
(26,35,'carLens','2025-01-29'),
(27,35,'intoLens','2025-03-12'),
(28,32,'mightLens','2025-01-27'),
(29,32,'fieldLens','2025-01-18'),
(30,32,'describeLens','2025-03-11'),
(31,34,'throughoutLens','2025-02-07'),
(32,35,'yetLens','2025-02-23'),
(33,34,'rangeLens','2025-04-23'),
(34,50,'magazineLens','2025-03-04'),
(35,66,'secondLens','2025-03-13'),
(36,32,'affectLens','2025-01-17'),
(37,64,'sevenLens','2025-02-14'),
(38,32,'streetLens','2025-04-28'),
(39,32,'difficultLens','2025-04-20'),
(40,32,'speechLens','2025-01-19'),
(41,34,'hereLens','2025-02-16'),
(42,32,'sellLens','2025-03-01'),
(43,34,'responsibilityLens','2025-01-01'),
(44,32,'participantLens','2025-04-13'),
(45,10,'askLens','2025-02-17'),
(46,32,'optionLens','2025-01-30'),
(47,35,'serviceLens','2025-04-19'),
(48,32,'westernLens','2025-03-10'),
(49,32,'popularLens','2025-04-06'),
(50,32,'chanceLens','2025-03-13'),
(51,32,'materialLens','2025-03-06'),
(52,32,'thusLens','2025-03-24'),
(53,32,'allowLens','2025-04-16'),
(54,34,'plantLens','2025-03-17'),
(55,35,'defenseLens','2025-02-11'),
(56,34,'trainingLens','2025-05-09'),
(57,32,'manyLens','2025-02-20'),
(58,35,'wellLens','2025-04-17'),
(59,32,'barLens','2025-03-24'),
(60,8,'acrossLens','2025-03-24'),
(61,35,'dreamLens','2025-01-23'),
(62,32,'veryLens','2025-01-16'),
(63,48,'governmentLens','2025-03-03'),
(64,35,'legLens','2025-04-03'),
(65,35,'oldLens','2025-04-19'),
(66,35,'centralLens','2025-01-01'),
(67,35,'eitherLens','2025-04-01'),
(68,12,'someoneLens','2025-01-11'),
(69,37,'addressLens','2025-04-26'),
(70,34,'middleLens','2025-04-13'),
(71,34,'certainlyLens','2025-03-10'),
(72,32,'twoLens','2025-04-07'),
(73,34,'systemLens','2025-01-18'),
(74,35,'askLens','2025-02-22'),
(75,35,'becauseLens','2025-03-15');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
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
  CONSTRAINT `lens_type_ibfk_1` FOREIGN KEY (`lens_id`) REFERENCES `lens` (`lens_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lens_type`
--

LOCK TABLES `lens_type` WRITE;
/*!40000 ALTER TABLE `lens_type` DISABLE KEYS */;
INSERT INTO `lens_type` (`lens_id`, `type`) VALUES (1,'Not Both'),
(2,'Not Both'),
(3,'Background'),
(4,'Not Both'),
(5,'Not Both'),
(6,'Both'),
(7,'Face'),
(8,'Background'),
(9,'Face'),
(10,'Both'),
(11,'Background'),
(12,'Background'),
(13,'Face'),
(14,'Both'),
(15,'Face'),
(16,'Both'),
(17,'Background'),
(18,'Face'),
(19,'Not Both'),
(20,'Face'),
(21,'Both'),
(22,'Both'),
(23,'Background'),
(24,'Face'),
(25,'Background'),
(26,'Both'),
(27,'Both'),
(28,'Not Both'),
(29,'Not Both'),
(30,'Background'),
(31,'Background'),
(32,'Both'),
(33,'Not Both'),
(34,'Both'),
(35,'Both'),
(36,'Not Both'),
(37,'Both'),
(38,'Not Both'),
(39,'Not Both'),
(40,'Background'),
(41,'Both'),
(42,'Both'),
(43,'Not Both'),
(44,'Not Both'),
(45,'Face'),
(46,'Not Both'),
(47,'Background'),
(48,'Not Both'),
(49,'Not Both'),
(50,'Not Both'),
(51,'Face'),
(52,'Not Both'),
(53,'Both'),
(54,'Not Both'),
(55,'Both'),
(56,'Face'),
(57,'Background'),
(58,'Face'),
(59,'Background'),
(60,'Both'),
(61,'Background'),
(62,'Background'),
(63,'Both'),
(64,'Background'),
(65,'Face'),
(66,'Background'),
(67,'Background'),
(68,'Both'),
(69,'Face'),
(70,'Face'),
(71,'Background'),
(72,'Face'),
(73,'Face'),
(74,'Not Both'),
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
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` (`user_id`, `start_time`, `end_time`, `latitude`, `longitude`) VALUES (8,'17:35:06','17:55:46',29,-4),
(8,'23:26:01','01:25:13',67,141),
(12,'03:10:17','03:34:58',-5,-49),
(14,'00:59:45','01:46:32',-57,-118),
(15,'20:44:40','21:07:44',14,125),
(17,'08:39:13','08:40:57',17,-176),
(21,'16:06:30','17:48:55',-36,29),
(32,'09:45:16','11:15:15',26,158),
(32,'12:14:18','13:31:02',26,-56),
(34,'00:00:10','01:22:13',-85,-151),
(34,'18:04:53','19:02:13',-57,-44),
(34,'22:25:17','00:15:36',-1,119),
(37,'14:02:39','15:20:06',58,-64),
(40,'03:17:34','05:08:35',-4,-107),
(40,'12:56:41','13:20:40',11,-159),
(48,'07:58:40','08:35:16',77,-139),
(48,'16:14:36','17:56:03',6,31),
(48,'16:39:25','16:46:45',38,174),
(49,'09:17:08','10:52:20',48,32),
(55,'08:36:42','08:55:36',-7,-87),
(60,'05:35:12','06:43:57',34,173),
(60,'11:38:24','11:55:40',22,-5),
(60,'22:26:11','22:40:03',82,156),
(64,'01:47:11','01:57:28',20,-103),
(65,'03:50:25','04:14:10',40,137),
(66,'08:00:10','08:32:15',17,27),
(69,'17:07:08','18:59:48',12,-76),
(75,'13:53:30','14:07:03',-73,-100),
(75,'17:07:17','17:14:45',87,115),
(75,'19:01:34','20:05:09',-46,108);
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
  CONSTRAINT `pap_ibfk_1` FOREIGN KEY (`user_id`, `room_id`, `sent_order`) REFERENCES `content` (`user_id`, `room_id`, `sent_order`),
  CONSTRAINT `pap_ibfk_2` FOREIGN KEY (`lens_id`) REFERENCES `lens` (`lens_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pap`
--

LOCK TABLES `pap` WRITE;
/*!40000 ALTER TABLE `pap` DISABLE KEYS */;
INSERT INTO `pap` (`user_id`, `room_id`, `sent_order`, `lens_id`, `duration`) VALUES (8,41,38,73,27),
(8,60,74,36,47),
(10,12,84,14,37),
(10,53,45,35,37),
(10,69,86,41,21),
(12,14,6,22,54),
(12,21,99,2,22),
(12,53,60,42,35),
(14,4,71,13,4),
(14,60,16,12,17),
(14,65,61,43,18),
(14,69,50,59,55),
(15,2,87,59,38),
(15,49,41,42,30),
(15,65,24,32,8),
(17,12,28,32,14),
(17,19,43,69,10),
(25,2,96,43,36),
(25,42,44,45,41),
(25,54,66,72,17),
(25,65,34,4,28),
(25,66,36,35,38),
(32,12,30,57,32),
(34,41,7,48,13),
(35,12,8,71,25),
(35,21,9,37,14),
(42,41,5,39,20),
(43,69,51,22,55),
(45,1,93,31,19),
(45,53,63,1,43),
(45,59,37,46,27),
(45,60,46,21,51),
(48,73,89,28,20),
(49,34,79,74,8),
(49,53,70,71,49),
(50,6,48,12,36),
(50,66,80,53,7),
(60,10,77,10,23),
(64,1,90,13,29),
(64,21,67,22,8),
(65,60,57,42,48),
(66,41,31,72,3),
(66,54,26,70,53),
(66,73,75,46,19),
(67,65,72,8,38),
(69,1,35,60,14),
(69,59,53,25,2),
(70,65,32,21,1),
(72,2,17,73,58),
(72,33,88,2,28),
(75,53,95,25,41);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_chat`
--

LOCK TABLES `room_chat` WRITE;
/*!40000 ALTER TABLE `room_chat` DISABLE KEYS */;
INSERT INTO `room_chat` (`room_id`, `created_date`) VALUES (1,'2025-01-05'),
(2,'2025-02-16'),
(4,'2025-01-28'),
(6,'2025-02-20'),
(9,'2025-03-05'),
(10,'2025-03-05'),
(12,'2025-02-20'),
(14,'2025-01-17'),
(17,'2025-05-12'),
(19,'2025-01-25'),
(20,'2025-02-14'),
(21,'2025-02-23'),
(33,'2025-04-08'),
(34,'2025-04-21'),
(35,'2025-03-24'),
(41,'2025-02-11'),
(42,'2025-04-27'),
(44,'2025-05-01'),
(45,'2025-03-10'),
(49,'2025-01-14'),
(53,'2025-03-15'),
(54,'2025-04-03'),
(59,'2025-01-28'),
(60,'2025-02-24'),
(65,'2025-03-07'),
(66,'2025-03-16'),
(67,'2025-03-11'),
(69,'2025-01-18'),
(71,'2025-03-17'),
(73,'2025-05-13');
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
  CONSTRAINT `room_join_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room_chat` (`room_id`),
  CONSTRAINT `room_join_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_join`
--

LOCK TABLES `room_join` WRITE;
/*!40000 ALTER TABLE `room_join` DISABLE KEYS */;
INSERT INTO `room_join` (`room_id`, `user_id`, `join_date`) VALUES (1,14,'2025-04-02'),
(2,8,'2025-05-09'),
(4,12,'2025-02-27'),
(6,37,'2025-01-01'),
(9,55,'2025-03-22'),
(10,48,'2025-01-10'),
(12,35,'2025-03-30'),
(14,68,'2025-01-13'),
(17,45,'2025-03-22'),
(19,67,'2025-03-23'),
(20,10,'2025-03-01'),
(21,75,'2025-04-17'),
(33,40,'2025-02-13'),
(34,65,'2025-05-04'),
(35,17,'2025-03-31'),
(41,25,'2025-02-15'),
(42,50,'2025-04-13'),
(44,32,'2025-01-31'),
(45,42,'2025-04-29'),
(49,64,'2025-04-03'),
(53,72,'2025-02-11'),
(54,34,'2025-03-19'),
(59,21,'2025-05-06'),
(60,60,'2025-04-27'),
(65,43,'2025-03-25'),
(66,15,'2025-04-09'),
(67,70,'2025-01-29'),
(69,66,'2025-02-17'),
(71,49,'2025-01-10'),
(73,69,'2025-01-29');
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
INSERT INTO `subscription` (`user_id`, `subscription_number`, `subscribe_date`, `expire_date`, `status`) VALUES (8,46,'2025-04-20','2025-03-16',0),
(10,1,'2025-02-23','2025-01-02',1),
(12,56,'2025-03-12','2025-03-29',1),
(14,45,'2025-03-25','2025-04-28',1),
(15,61,'2025-03-14','2025-04-21',0),
(17,57,'2025-03-16','2025-04-17',1),
(21,64,'2025-04-17','2025-04-03',0),
(25,43,'2025-05-09','2025-02-11',1),
(32,22,'2025-03-17','2025-04-04',0),
(34,15,'2025-02-27','2025-04-01',1),
(35,21,'2025-05-15','2025-04-29',0),
(37,62,'2025-04-03','2025-02-26',1),
(40,26,'2025-02-16','2025-01-31',1),
(42,71,'2025-05-14','2025-03-31',1),
(43,41,'2025-04-19','2025-01-28',1),
(45,70,'2025-01-30','2025-01-15',1),
(48,5,'2025-02-12','2025-02-02',0),
(49,73,'2025-01-19','2025-03-23',0),
(50,68,'2025-05-13','2025-01-17',0),
(55,50,'2025-01-29','2025-04-05',0),
(60,17,'2025-03-09','2025-03-31',0),
(64,11,'2025-02-06','2025-03-15',1),
(65,3,'2025-03-10','2025-02-10',1),
(66,59,'2025-04-12','2025-03-15',1),
(67,33,'2025-05-03','2025-01-26',0),
(68,65,'2025-05-06','2025-03-26',0),
(69,27,'2025-02-06','2025-04-28',0),
(70,53,'2025-02-16','2025-03-29',1),
(72,31,'2025-04-29','2025-05-15',0),
(75,4,'2025-01-26','2025-04-30',1);
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
  `telp_num` varchar(15) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `level_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `level_id` (`level_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `lens_level` (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `email`, `password`, `username`, `telp_num`, `birthdate`, `date_created`, `level_id`) VALUES (8,'claudiadavis@example.net','(hLBd5YCA1','garciachelsea','08658827231','2006-07-10','2022-07-05',0),
(10,'khanangela@example.org','%20nTzqNKa','kellychris','08744418088','1991-08-13','2022-02-11',0),
(12,'meganmorgan@example.com','+sGEtzI(4&','kward','08749119546','1998-07-16','2024-02-19',0),
(14,'adam86@example.com','f2w&wBxz*+','kimberly34','08638051776','1989-04-01','2022-04-03',0),
(15,'kelsey03@example.org','5&l3tHddmO','colinward','08368383831','1957-06-20','2024-08-15',0),
(17,'thomas44@example.org','R8IJ)9Zw&v','torreslori','08726320512','1964-01-30','2022-04-28',0),
(21,'dcolon@example.net','_M4v$Qx%Wn','rhonda51','08940834493','1998-02-22','2021-05-31',0),
(25,'hendrickskenneth@example.net','h0QjC3Um(h','freemanderrick','08162064994','1992-07-05','2020-11-08',0),
(32,'greenamy@example.org','x_4vM1i!_f','iholloway','08110489531','1964-12-20','2020-06-14',3),
(34,'gconway@example.org','(A2Ej0f23+','fcraig','08686006776','2006-04-06','2024-04-18',1),
(35,'xmurphy@example.com','(9H_9jEw!s','zholmes','08176761446','1976-04-15','2024-05-08',2),
(37,'nporter@example.com','y+6CmS9APd','smithjanet','08344796070','1985-05-08','2024-08-13',0),
(40,'hartmanmary@example.com','J(3aFxJu&m','scott74','08074417339','1957-01-17','2022-05-28',0),
(42,'pfarley@example.org','&2VMIe9ufg','ycook','08644951846','1973-11-22','2020-01-03',0),
(43,'tracy66@example.net','(0qP&Z^tLb','carol85','08251183192','2007-02-27','2020-09-02',0),
(45,'cody46@example.net','!^Ml^1Dy(W','david24','08430977591','1993-11-24','2024-04-01',0),
(48,'elizabeth33@example.org','!(1qXwFmBO','paul45','08754642119','1984-12-29','2025-01-04',0),
(49,'vgibson@example.net','_aH^zEmJc1','thompsoncaitlin','08655777956','1984-03-31','2020-10-29',0),
(50,'michael96@example.org','q^D1RN4ew^','uwilliams','08181933603','1970-03-07','2022-03-31',0),
(55,'marcusknight@example.org','aw(86Tqz#G','kimfrazier','08029317773','1965-04-09','2022-03-13',0),
(60,'vmiles@example.com','^+qoMRFx5f','palmerdavid','08919300020','1960-01-16','2025-03-01',0),
(64,'fbanks@example.com','_nu8Jlc0Z9','blackwendy','08506242746','2002-02-05','2021-05-28',0),
(65,'williamrobinson@example.net','N+88D7uYs_','karenthompson','08372679039','1975-08-10','2024-08-11',0),
(66,'paulalexander@example.net','%j1PbRv9Mw','karipeterson','08859398068','1958-11-13','2024-04-29',0),
(67,'ochambers@example.org','6C7QN+PwT@','aaronramirez','08838360336','2005-10-26','2021-10-13',0),
(68,'molinasteven@example.org','^J7C1Rmh!V','gadams','08991978274','1967-08-10','2021-05-27',0),
(69,'kristenrogers@example.com','7HP0U9lim+','suepaul','08604360552','1963-05-02','2021-10-10',0),
(70,'horneshelby@example.org','I&Pg5LWf&f','travis95','08181376353','1962-05-16','2025-02-02',0),
(72,'robinsonthomas@example.net','T1Tvt0Zg+%','tina58','08111796750','1972-11-29','2023-04-20',0),
(75,'morganjackson@example.org','sfC$TJp1*0','jameskhan','08213250408','2001-04-12','2024-08-18',0);
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

-- Dump completed on 2025-05-16 13:20:20
