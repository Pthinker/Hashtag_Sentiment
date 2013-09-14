-- MySQL dump 10.13  Distrib 5.5.29, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sentiment
-- ------------------------------------------------------
-- Server version	5.5.29-0ubuntu1

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
-- Current Database: `sentiment`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sentiment` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sentiment`;

--
-- Table structure for table `tweets`
--

DROP TABLE IF EXISTS `tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hashtag` varchar(100) DEFAULT NULL,
  `handle` varchar(50) DEFAULT NULL,
  `profile_img` varchar(100) DEFAULT NULL,
  `text` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweets`
--

LOCK TABLES `tweets` WRITE;
/*!40000 ALTER TABLE `tweets` DISABLE KEYS */;
INSERT INTO `tweets` VALUES (13,'#wmata','drgridlock','https://si0.twimg.com/profile_images/3727775506/cd9254011ac7ee7007ef6e529fc8ba61_normal.jpeg','#Metro reports that Red Line trains are single-tracking between Takoma and Ft. Totten due ot a disabled train near Takoma. #wmata'),(14,'#wmata','washingtonpost','https://si0.twimg.com/profile_images/378800000252568100/7a366ac8d0f934b5318e721ba049e9b1_normal.png','Fewer people are riding #Metro and it\'s hitting their bottom line http://t.co/JSjtl71Lkv #WMATA'),(15,'#wmata','MetroDerp','https://si0.twimg.com/profile_images/344513261574327226/2accf4f2c652d0904e8ba6c3e998e416_normal.jpeg','@postmetrogirl National. It\'s Washington National Airport. #wmata'),(16,'#wmata','BrookeLynnDEi','https://si0.twimg.com/profile_images/378800000354109963/2ff286491cd884dc7e6a6e5bc4a277fc_normal.jpeg','Interesting. #WMATA\'s draft Joint Development Policy gave preferences to developers who allowed for affordable housing for Metro employees'),(17,'#wmata','In_the_sky_with','https://si0.twimg.com/profile_images/378800000189416036/e2f5dd187b0016e713caff113e52b8db_normal.jpeg','Since when does the blue line go to U Street? #wmata #greatidea http://t.co/YSbpBMFltu'),(18,'#wmata','KevinMorison','https://si0.twimg.com/profile_images/1197154289/49226_1660777686_5854_n_normal.jpg','#wmata #NextBus app just asked me \"Note: Do you love your bus stop?\" (In red, no less!) Well, it\'s OK. Don\'t know about \"love.\" #random'),(19,'#wmata','BasedJane','https://si0.twimg.com/profile_images/378800000430769908/552e7343e6a1e1dc9b3b3ae4b6c58b2f_normal.jpeg','RT @predictabus: New iOS app for #DC #wmata #metrobus riders! More info here: http://t.co/ADAVLkGZxZ Available on the @AppStore http://t.coâ€¦'),(20,'#wmata','mfillebrown','https://si0.twimg.com/profile_images/378800000432742428/18cc00dc80b6ed7fa221ace9308dd257_normal.jpeg','You know what\'s not funny? Jamming the metro doors open after they\'re closing so all your friends can jump on. #wmata'),(21,'#wmata','MetroHotCars','https://si0.twimg.com/profile_images/3747957764/b4653db153ea3717af480b19a3c8e6d3_normal.jpeg','@wmata @MetroRailInfo Yellow line car 5078 is a #wmata #hotcar HT @MetroDerp. Car reported 6 times. http://t.co/vXGhsjpCpB'),(22,'#wmata','JB252','https://si0.twimg.com/profile_images/553529533/avatar_normal.jpg','I swear this train operator keeps saying \"Red Line, Shitty Grove\" #wmata'),(23,'#wmata','unsuckdcmetro','https://si0.twimg.com/profile_images/1432770702/unsuckbutton_normal.jpg','RT @Cyndera: Got another one! I had a very amusing Friday on the metro, that\'s for sure! #wmata #funnypeople http://t.co/s5h2xGhGet'),(24,'#wmata','UVAlison','https://si0.twimg.com/profile_images/3076528398/668aec9f5acd7e363bda6046f3991cb9_normal.jpeg','Americans will not embrace public transportation until they are confident it will get them where they need to be... on time. #amtrak #wmata'),(25,'#dcmetro','PlaymymusikLOUD','https://si0.twimg.com/profile_images/3753140460/f9c3b459fd60687a1d54f9d986e7b148_normal.jpeg','#reallife #pic of #life on the #dcmetro #courtesy of the homie Whiteson #funny #toofunny http://t.co/9My10xO1b2'),(26,'#dcmetro','LuckyTorie','https://si0.twimg.com/profile_images/378800000417117410/7b445f508fcf7f717a4448f34af45342_normal.jpeg','There\'s a guy on the metro wearing a tartan kilt and pulling around a push scooter. You\'ve got to love public transportation #dcmetro'),(27,'#dcmetro','LadyLikeDC','https://si0.twimg.com/profile_images/378800000205533099/16b8b9f49bb37266a907a045d429e871_normal.jpeg','Of course I get stuck in the #dcmetro doors while wearing a white jacket #justhaditcleaned #ow'),(28,'#dcmetro','HMmilitary','https://si0.twimg.com/profile_images/378800000105441382/d40c5fa9088061a7811b499e28f7fb0b_normal.jpeg','We are honored to be a part of @OpHmDCMetro Star-Spangled Babies for #DCMetro on 9/26 #MilSpouses are you going? http://t.co/wunTt19aN2'),(29,'#dcmetro','grantrstevens','https://si0.twimg.com/profile_images/3720331243/05849a3cdd5e3125562bd019c12ee386_normal.jpeg','#Brutalism is beautiful. #dcmetro http://t.co/EPjHmGhXAI'),(30,'#dcmetro','tysonspartners','https://si0.twimg.com/profile_images/3383349214/a75b8a531cdb272514daa5275b6bcd06_normal.jpeg','Some folks still aren\'t sure where stops will be on #DCMetro #SilverLine. Please share this and help spread the word! http://t.co/5W2oSCSbVN'),(31,'#dcmetro','dougwendt','https://si0.twimg.com/profile_images/3023521134/28fa72c393a057f090dedace30588531_normal.jpeg','New @wmata Metro map with Silver Line is out. #dcmetro #dulles http://t.co/zUGONvhjiy'),(32,'#dcmetro','meche_martinez_','https://si0.twimg.com/profile_images/378800000161743689/5d50e2d6faaf04717a74e2d12f1698c7_normal.jpeg','holding at almost every stop. man the love/hate relationship I have with the redline is very intense. #dcmetro #redline #ugh #letsgo #vamos'),(33,'#dcmetro','wanderbelly','https://si0.twimg.com/profile_images/2713898434/77ee5765cfb458f4c2c2c0ed66b131bc_normal.png','Just learned of more daytime attacks on #DCMetro...gangs of teens beating up passengers &amp; stealing electronics. Where\'s the security @wmata?'),(34,'#dcmetro','mgstout','https://si0.twimg.com/profile_images/2873543699/81f36c1e363adaf32e0739eb0286d3ab_normal.jpeg','RT @BonittoStudio: #art news &amp; #events: current, upcoming free #exhibits @ @Studio4OldTown http://t.co/cQwEwyXWDQ #DMV #DCmetro #OldTown RT');
/*!40000 ALTER TABLE `tweets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-14 15:14:57
