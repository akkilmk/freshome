-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: freshome
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts_account`
--

DROP TABLE IF EXISTS `accounts_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `secondname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `create_superuser` varchar(100) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account`
--

LOCK TABLES `accounts_account` WRITE;
/*!40000 ALTER TABLE `accounts_account` DISABLE KEYS */;
INSERT INTO `accounts_account` VALUES (1,'pbkdf2_sha256$260000$SobH6alulik0WRSoudu6tx$/IDTbj7FOuU+hgTQTm8u+sv9tu5iBOhsPQGMt4+xN3I=','vishnu','dinesh','vishnu@gmail.com','9645653414','2021-12-17 07:53:45.655266','2021-12-17 07:53:45.655329',1,0,'True',0,0),(2,'!gmaGhj1TYX1ee0kazcGzaTpBmJgnU4XrraEg1M8v','abhishek','pvm','abhishek@gmail.com','9526091463','2021-12-17 07:55:07.070186','2021-12-17 07:55:07.070261',1,0,'True',0,0),(3,'pbkdf2_sha256$260000$64WXNnClnd9ozBogVVNm7H$09sb3GZfdkVeCzxCvYXj/PjN3+NlyXPdHvTIRqwQyOw=','','','admin@gmail.com','','2021-12-17 08:03:37.360944','2022-01-11 10:19:38.842050',1,1,'True',1,0),(4,'!Vi5yyGsjZ0v6dkSLjTSH3IHXNiX7EWvhyTdZClcw','Akhil','Mohanan','akhilmk125@gmail.com','7025464177','2021-12-17 09:55:32.650860','2021-12-17 09:55:32.650921',1,0,'True',0,0),(6,'pbkdf2_sha256$260000$sW1MVzZNkD1itEsoWEAtYV$ef3XEeO/mpvTB0KFx64iNCyszIP5qya6BhBRwhommVE=','','','admin@admin','9865321470','2021-12-17 11:04:28.346761','2021-12-17 11:05:57.288269',1,0,'True',1,1),(7,'pbkdf2_sha256$260000$p7Rahedsv7iMomfrOr4vAk$h30DA7oXsbr9CwjAaa3JDhsxu2M21LhFNCeJxnRyaE4=','','','akhil@admin','1','2021-12-17 11:39:08.410598','2021-12-17 11:39:52.620895',1,0,'True',1,1),(8,'pbkdf2_sha256$260000$0tSFV4CaLX4O3w4pSxc4ZU$0Zf3AxibQgQJf8ri5SMwvwZGZmSQDKOZKT6DprZvTP0=','Mansoor','ali','mansoor@gmail.com','7558967627','2021-12-20 12:51:46.306811','2021-12-20 12:51:46.306856',1,0,'True',0,0),(11,'!OWVe9OOZFXPJihDT1UQc8Rbkg3r6xjfvhQim7S4C','adhil','abbas','adhil123@gmail.com','6282441936','2021-12-24 05:01:11.094388','2021-12-24 05:01:11.094431',1,0,'True',0,0),(12,'pbkdf2_sha256$260000$7eg0x12ke7Rb94VNoERGKs$xqt9+GBA4rmn49RNds8Tx7vgcHKQm77bo4IHpysW0pA=','abhishek','av','abhishekav@gmail.com','9526091466','2021-12-25 06:27:57.698856','2021-12-25 06:27:57.698921',1,0,'True',0,0),(13,'pbkdf2_sha256$260000$LByDbNqftIDEC6Iei5ZuYT$1c17piU6VUh8Sum4ouvofKSRe6Q3l0lH9Jh84teK3Zk=','arif','muhammad','arif@gmail.com','73066882706','2021-12-25 06:31:36.186862','2021-12-25 06:31:36.186918',1,0,'True',0,0),(14,'pbkdf2_sha256$260000$bIG14Cci4dwXRa5SKTmKGm$/TMg9Fsz58zDhkC9Oa4Edjlox/qKjzEMvOFxkKK4pcw=','john','doe','john@gmail.com','9876543211','2021-12-25 06:56:23.420047','2021-12-25 06:56:23.420098',1,0,'True',0,0),(15,'pbkdf2_sha256$260000$nAvWbYGoTwbg3u1BaXRrKI$kRL6lJqWy7GsGLABu6NJw00YvSK4tkvQg2leF61oOjg=','abhijith','c','abhijith@gmail.com','7306641726','2021-12-25 07:12:57.602206','2021-12-25 07:12:57.602257',1,0,'True',0,0),(16,'pbkdf2_sha256$260000$G5vb7d3f92muWOjqa3TO4L$b2WmACWrK0pvjmeipvOOATKnMvfgFrm8QyOLeBOOHQk=','Ajil','ashok','ajil@gmail.com','9207323060','2021-12-27 15:36:48.600563','2021-12-27 15:36:48.600612',1,0,'True',0,0),(17,'pbkdf2_sha256$260000$RiXiJAPj1sHgqXJGvIYGgd$QF/OR6+Twq3EdbrnesRTcLKjntI/CubtQWP0aOmNpvE=','joe','shajan','joe@gmail.com','9074955635','2021-12-30 09:36:51.994523','2021-12-30 09:36:51.994674',1,0,'True',0,0),(18,'pbkdf2_sha256$260000$LXExmNDlpel5ItB4hU7BCr$8xggaELVV2bMiaznX0o2NKbXuOubsriKud2MzCEGxyM=','rafeeq','whitefeet','rafeeq@gmail.com','9653214789','2022-01-02 09:26:26.523307','2022-01-02 09:26:26.523411',1,0,'True',0,0),(19,'pbkdf2_sha256$260000$Q2MPkAQdkEafb4NZsapGdW$wH6KSB9XQgiX1O83axupHPh1+JkoLs7YcQWdHnx2g40=','Abhijith','m','abhi12@gmail.com','8593035173','2022-01-07 07:49:32.241127','2022-01-07 07:49:32.241184',1,0,'True',0,0),(20,'pbkdf2_sha256$260000$guXycXAHKTbHrljDCYPnl0$h+G1pd8WjSLKJsR3FtswqXGCojqApztCBhejFAKFruU=','Shreehari','sasi','sree@gmail.com','8075871460','2022-01-07 12:42:10.032725','2022-01-07 12:42:10.032771',1,0,'True',0,0),(21,'pbkdf2_sha256$260000$jKuqhEM5qgZ3zLzfebzmko$vkfxNOLovx+n/yGdlA+CynTiuvJoYVBRGrl5qlwKFok=','Akhil','mohanan','akhil@gmail.com','+917025464177','2022-01-09 12:49:56.040320','2022-01-09 12:49:56.040363',1,0,'True',0,0),(22,'pbkdf2_sha256$260000$PseyCSLQ6ijGNNQAqcx8NV$JO6LhvkUXzXugDV6bu+nEfZODgVDxtxXQhDTqnvCIzg=','ajmeer','haridas','ajmeer@gmail.com','9632581470','2022-01-09 12:51:53.951141','2022-01-09 12:51:53.951205',1,0,'True',0,0),(23,'pbkdf2_sha256$260000$hokCqQUwu8wjz89uYNvRta$z3pe5UP+zuxfFf+9X0mkT9YJ9VQskF+xlZh3tUrmWMM=','ajmeer','harilal','ajmeer123@gmail.com','9632514780','2022-01-09 12:53:17.308591','2022-01-09 12:53:17.308803',1,0,'True',0,0),(24,'pbkdf2_sha256$260000$x9RKwdRikBRK8IpCToO1it$B76noCm9X9Hml/+IJBjgskZtxqD2ZU5tQ82AkL4i6JE=','ajmeer','harilal','ajmeer12@gmail.com','9632514784','2022-01-09 12:54:21.190523','2022-01-09 12:54:21.190562',1,0,'True',0,0),(25,'pbkdf2_sha256$260000$FlkamYtjhrsTjCM97jBy2l$7avvC5v+YoArr52APqMlYabT+nn2csa3QwfDxZu1MVM=','ajmeer','harilal','ajmeer110@gmail.com','1235611890','2022-01-09 12:56:35.222205','2022-01-09 12:56:35.222262',1,0,'True',0,0),(26,'pbkdf2_sha256$260000$plzTcT0CZ7hw12da5go2xi$taUdPFbxt0zS2n3WSFLsqdl2c1VXcHVsWYg8kbEd8/A=','noor','sha','noor@gmail.com','1236523652','2022-01-09 12:58:03.770250','2022-01-09 12:58:03.770290',1,0,'True',0,0),(27,'pbkdf2_sha256$260000$Dy49PcpwaL2JLl9DezdTEd$QhqdpBNu37YqITvBK9TFtNmIxMPbd22yHZX3n7hWbOE=','Akhil','mohanan','akhilmk00@gmail.com','+917025464133','2022-01-09 13:03:52.437030','2022-01-09 13:03:52.437108',1,0,'True',0,0),(28,'pbkdf2_sha256$260000$hIGUADNddNx6cLQkexziQs$upugqsmy2MtDOI/ktuelqdL4jx0Zr2N3yjS78hRbBzQ=','Akhil','mohanan','thhhh@gmail.com','4563217890','2022-01-09 13:05:44.283339','2022-01-09 13:05:44.283380',1,0,'True',0,0),(29,'pbkdf2_sha256$260000$15VF3DtdWYsNxh8kiWFKGm$P/kWqPQgYmusFhQ2RUu2iz8VBY33CslMEj/m3OavYvs=','anu','sree','anu@gmail.com','7894561230','2022-01-09 13:09:17.428135','2022-01-09 13:09:17.428183',1,0,'True',0,0),(30,'pbkdf2_sha256$260000$alE4z0IwgNycpmtcmJZLNU$kHfqIzFCt4rTSYhzzJ1e8gQtzzr+YGj9YEd53Kx0wEE=','jom','har','jom@gmail.com','5689741230','2022-01-09 13:11:41.353917','2022-01-09 13:11:41.353976',1,0,'True',0,0),(31,'pbkdf2_sha256$260000$wNNroIvcan8e22c8DIr2wq$e0nY+Nj4RYJZsd8SFL8x3gawB8mrNSeCSit4YH9Meq4=','sujjj','sad','samdd@sam.com','9632587410','2022-01-09 13:13:43.127039','2022-01-09 13:13:43.127079',1,0,'True',0,0),(32,'pbkdf2_sha256$260000$1epmiUmTrfYwTO8rSWa9Jc$jdzhD2g9borWviP/q+TeINJhu0xfjXt07Yod4Eg345w=','fdfgdfg','dffa','aaa@gmail.com','8956231470','2022-01-09 13:54:33.927930','2022-01-09 13:54:33.927970',1,0,'True',0,0),(33,'pbkdf2_sha256$260000$apgWI3JAJ5DCVjujaq6kMl$tmy5wpBcOTRsHyfMsEF+w4Bk91BFa39tiCWFNDSV+wI=','jjjjj','jjjj','jjjj@gmail.com','562314780','2022-01-09 13:55:52.877381','2022-01-09 13:55:52.877429',1,0,'True',0,0),(34,'pbkdf2_sha256$260000$DIwN0uS8VObAdsnajoKNAn$g8KD5HUo6K0WoibVc8+Nt7Hh8xN+EE41dfWbPo22pu0=','ashok','pk','ashok@gmail.com','9632587710','2022-01-11 05:27:25.671534','2022-01-11 05:27:25.671574',1,0,'True',0,0);
/*!40000 ALTER TABLE `accounts_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_account_groups`
--

DROP TABLE IF EXISTS `accounts_account_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_account_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_account_groups_account_id_group_id_f64165b0_uniq` (`account_id`,`group_id`),
  KEY `accounts_account_groups_group_id_7c6a6bd1_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_account_gro_account_id_52f14852_fk_accounts_` FOREIGN KEY (`account_id`) REFERENCES `accounts_account` (`id`),
  CONSTRAINT `accounts_account_groups_group_id_7c6a6bd1_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account_groups`
--

LOCK TABLES `accounts_account_groups` WRITE;
/*!40000 ALTER TABLE `accounts_account_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_account_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_account_user_permissions`
--

DROP TABLE IF EXISTS `accounts_account_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_account_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_account_user_pe_account_id_permission_id_9af93c14_uniq` (`account_id`,`permission_id`),
  KEY `accounts_account_use_permission_id_24620205_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_account_use_account_id_816f9bde_fk_accounts_` FOREIGN KEY (`account_id`) REFERENCES `accounts_account` (`id`),
  CONSTRAINT `accounts_account_use_permission_id_24620205_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account_user_permissions`
--

LOCK TABLES `accounts_account_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_account_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_account_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_address`
--

DROP TABLE IF EXISTS `accounts_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip_code` int NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` bigint NOT NULL,
  `user_id` int NOT NULL,
  `is_active` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_address_user_id_c8c74ddf_fk_accounts_account_id` (`user_id`),
  CONSTRAINT `accounts_address_user_id_c8c74ddf_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_address`
--

LOCK TABLES `accounts_address` WRITE;
/*!40000 ALTER TABLE `accounts_address` DISABLE KEYS */;
INSERT INTO `accounts_address` VALUES (9,'Akhil mohanan','pathanamthitta',686511,'kavumkal house vechoochira p.o pathanamthitta',7025464177,4,0),(12,'mansoor ','thiroor angadi',684511,'mansoor manzil thiruroor angadi p.o malapuram',7558967627,8,1),(14,'mansoor ali','thiroor',686511,'kunnath house kanmanam p.o thiroor malayapuram',7558967627,8,0),(16,'mansoor ali shazz','thiroor',671314,'mansoor manzil thiruroor angadi p.o malapuram',7558967627,8,0),(20,'Abhishek','kasargod',674516,' Padamugal - Palachuvadu Rd, Satellite Twp, Padamughal, Kakkanad, Kerala 682037',9539115577,2,0),(22,'Adhil abbas ','muvattupuzha',686511,'thazhathuveedu muvattupuzha p.o eranakulam',6282441936,11,0),(23,'Adhil abbas','kakkanadu',698511,'kubz information technology kakkandadu',6282441936,11,0),(25,'Abhijith c','kottarakara',642132,'chandrasadhanam house ariyoor kottarakara',7306641726,15,0),(26,'Ajil ashok','aluva',685211,'aluva manapuram aluva ernakulam p.o ',720897652,16,0),(27,'joe shajan','Adimali',682211,' Padamugal - Palachuvadu Rd, Satellite Twp, Padamughal, Kakkanad, Kerala 682037',7605466312,17,0),(29,'rafeeq whitefeet','kasargod',659832,' Padamugal - Palachuvadu Rd, Satellite Twp, Padamughal, Kakkanad, Kerala 682037d',9865321470,18,0),(30,'Ajil ashok','Aluva',687411,'manapuram house aluva p.o aluva3',9207323060,16,0),(31,'Ajil ashok','Aluva',687411,'manapuram house aluva p.o aluva',9207323060,16,0),(32,'Akhil mohanan','pathanamthitta',686511,'kavumkal house vechoochira p.o',91702546417,19,0),(66,'Akhil mohanan','pathanamthitta',686511,'kavumkal house vechoochira p.o',917025464177,20,0),(67,'Akhil mohanan','pathanamthitta',686511,'kavumkal house vechoochira p.o',917025464177,28,0);
/*!40000 ALTER TABLE `accounts_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add account',1,'add_account'),(2,'Can change account',1,'change_account'),(3,'Can delete account',1,'delete_account'),(4,'Can view account',1,'view_account'),(5,'Can add log entry',2,'add_logentry'),(6,'Can change log entry',2,'change_logentry'),(7,'Can delete log entry',2,'delete_logentry'),(8,'Can view log entry',2,'view_logentry'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add user',5,'add_user'),(18,'Can change user',5,'change_user'),(19,'Can delete user',5,'delete_user'),(20,'Can view user',5,'view_user'),(21,'Can add content type',6,'add_contenttype'),(22,'Can change content type',6,'change_contenttype'),(23,'Can delete content type',6,'delete_contenttype'),(24,'Can view content type',6,'view_contenttype'),(25,'Can add session',7,'add_session'),(26,'Can change session',7,'change_session'),(27,'Can delete session',7,'delete_session'),(28,'Can view session',7,'view_session'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add products',9,'add_products'),(34,'Can change products',9,'change_products'),(35,'Can delete products',9,'delete_products'),(36,'Can view products',9,'view_products'),(37,'Can add wishlist',10,'add_wishlist'),(38,'Can change wishlist',10,'change_wishlist'),(39,'Can delete wishlist',10,'delete_wishlist'),(40,'Can view wishlist',10,'view_wishlist'),(41,'Can add wlist',11,'add_wlist'),(42,'Can change wlist',11,'change_wlist'),(43,'Can delete wlist',11,'delete_wlist'),(44,'Can view wlist',11,'view_wlist'),(45,'Can add address',12,'add_address'),(46,'Can change address',12,'change_address'),(47,'Can delete address',12,'delete_address'),(48,'Can view address',12,'view_address'),(49,'Can add mycart',13,'add_mycart'),(50,'Can change mycart',13,'change_mycart'),(51,'Can delete mycart',13,'delete_mycart'),(52,'Can view mycart',13,'view_mycart'),(53,'Can add order_details',14,'add_order_details'),(54,'Can change order_details',14,'change_order_details'),(55,'Can delete order_details',14,'delete_order_details'),(56,'Can view order_details',14,'view_order_details'),(57,'Can add order',15,'add_order'),(58,'Can change order',15,'change_order'),(59,'Can delete order',15,'delete_order'),(60,'Can view order',15,'view_order'),(61,'Can add orderitems',16,'add_orderitems'),(62,'Can change orderitems',16,'change_orderitems'),(63,'Can delete orderitems',16,'delete_orderitems'),(64,'Can view orderitems',16,'view_orderitems'),(65,'Can add coupon',17,'add_coupon'),(66,'Can change coupon',17,'change_coupon'),(67,'Can delete coupon',17,'delete_coupon'),(68,'Can view coupon',17,'view_coupon'),(69,'Can add couopon_list',18,'add_couopon_list'),(70,'Can change couopon_list',18,'change_couopon_list'),(71,'Can delete couopon_list',18,'delete_couopon_list'),(72,'Can view couopon_list',18,'view_couopon_list'),(73,'Can add coupon_list',18,'add_coupon_list'),(74,'Can change coupon_list',18,'change_coupon_list'),(75,'Can delete coupon_list',18,'delete_coupon_list'),(76,'Can view coupon_list',18,'view_coupon_list');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'accounts','account'),(12,'accounts','address'),(2,'admin','logentry'),(4,'auth','group'),(3,'auth','permission'),(5,'auth','user'),(6,'contenttypes','contenttype'),(8,'products','category'),(17,'products','coupon'),(18,'products','coupon_list'),(13,'products','mycart'),(15,'products','order'),(14,'products','order_details'),(16,'products','orderitems'),(9,'products','products'),(10,'products','wishlist'),(11,'products','wlist'),(7,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'accounts','0001_initial','2021-12-13 06:57:51.070265'),(2,'contenttypes','0001_initial','2021-12-13 06:57:52.629376'),(3,'auth','0001_initial','2021-12-13 06:57:58.029075'),(4,'admin','0001_initial','2021-12-13 06:58:16.255825'),(5,'admin','0002_logentry_remove_auto_add','2021-12-13 06:58:20.572669'),(6,'admin','0003_logentry_add_action_flag_choices','2021-12-13 06:58:20.726217'),(7,'contenttypes','0002_remove_content_type_name','2021-12-13 06:58:25.097316'),(8,'auth','0002_alter_permission_name_max_length','2021-12-13 06:58:27.540591'),(9,'auth','0003_alter_user_email_max_length','2021-12-13 06:58:27.885103'),(10,'auth','0004_alter_user_username_opts','2021-12-13 06:58:28.047884'),(11,'auth','0005_alter_user_last_login_null','2021-12-13 06:58:30.348825'),(12,'auth','0006_require_contenttypes_0002','2021-12-13 06:58:30.604060'),(13,'auth','0007_alter_validators_add_error_messages','2021-12-13 06:58:30.721466'),(14,'auth','0008_alter_user_username_max_length','2021-12-13 06:58:33.130390'),(15,'auth','0009_alter_user_last_name_max_length','2021-12-13 06:58:35.972418'),(16,'auth','0010_alter_group_name_max_length','2021-12-13 06:58:36.403573'),(17,'auth','0011_update_proxy_permissions','2021-12-13 06:58:36.574548'),(18,'sessions','0001_initial','2021-12-13 06:58:37.581699'),(19,'products','0001_initial','2021-12-13 07:00:38.685237'),(20,'products','0002_products_category','2021-12-13 07:02:14.491691'),(21,'accounts','0002_auto_20211213_1607','2021-12-13 16:07:37.225451'),(22,'accounts','0003_account_is_staff','2021-12-13 16:26:31.480465'),(23,'accounts','0004_auto_20211214_0219','2021-12-14 02:19:43.787435'),(24,'products','0003_wishlist','2021-12-14 10:21:58.745271'),(25,'products','0003_wlist','2021-12-14 11:20:32.647371'),(26,'products','0004_auto_20211214_1127','2021-12-14 11:27:43.345475'),(27,'accounts','0005_address','2021-12-14 15:29:54.471029'),(28,'accounts','0006_auto_20211215_1207','2021-12-15 12:07:56.548644'),(29,'accounts','0007_auto_20211215_1229','2021-12-15 12:29:08.008710'),(30,'accounts','0008_auto_20211215_1237','2021-12-15 12:37:17.203027'),(31,'accounts','0009_auto_20211215_1244','2021-12-15 12:44:10.959369'),(32,'products','0005_wlist_user','2021-12-15 15:28:54.258767'),(33,'products','0006_mycart','2021-12-16 05:08:17.801459'),(34,'auth','0012_alter_user_first_name_max_length','2021-12-17 05:24:31.256622'),(35,'accounts','0010_auto_20211217_0937','2021-12-17 09:37:15.118813'),(36,'accounts','0011_alter_account_is_active','2021-12-17 09:53:57.710422'),(37,'accounts','0012_auto_20211217_1056','2021-12-17 10:56:54.569249'),(38,'products','0007_order_details','2021-12-19 04:27:20.895706'),(39,'accounts','0013_address_address_name','2021-12-20 13:47:02.461030'),(40,'accounts','0014_remove_address_address_name','2021-12-21 05:38:07.814480'),(41,'accounts','0015_address_is_active','2021-12-21 06:01:39.222755'),(42,'products','0008_order','2021-12-21 09:49:28.205121'),(43,'products','0009_orderitems','2021-12-21 09:52:16.472567'),(44,'products','0010_auto_20211221_1039','2021-12-21 10:39:16.720731'),(45,'products','0011_remove_order_products','2021-12-21 10:54:24.777777'),(46,'products','0012_category_discount','2021-12-25 13:27:34.224003'),(47,'products','0013_products_offer_price','2021-12-25 14:01:14.578663'),(48,'products','0014_coupon','2021-12-26 12:34:49.233281'),(49,'products','0015_alter_coupon_coupon_is_active','2021-12-26 13:12:06.398582'),(50,'products','0016_couopon_list','2021-12-27 08:56:05.976981'),(51,'products','0017_rename_couopon_list_coupon_list','2021-12-27 09:04:46.274553'),(52,'products','0018_mycart_grand_total','2021-12-27 10:22:49.580925'),(53,'products','0019_auto_20211227_1204','2021-12-27 12:04:45.253767'),(54,'products','0020_auto_20211227_1205','2021-12-27 12:05:47.829802'),(55,'products','0021_alter_mycart_discount_total','2021-12-27 12:15:18.925128'),(56,'products','0022_alter_mycart_coupon_discount','2021-12-27 12:42:32.650306'),(57,'products','0023_auto_20211227_1511','2021-12-27 15:12:06.322017'),(58,'products','0024_auto_20211227_1550','2021-12-27 15:51:12.010152'),(59,'products','0025_coupon_list_coupon','2021-12-28 05:13:06.971248'),(60,'products','0026_rename_coupon_coupon_list_coupons','2021-12-28 05:13:10.450515'),(61,'products','0027_remove_coupon_list_coupons','2021-12-28 05:13:12.824749'),(62,'products','0028_coupon_list_ok','2021-12-28 05:13:13.975719'),(63,'products','0029_remove_coupon_list_ok','2021-12-28 05:13:15.967854'),(64,'products','0030_coupon_list_coupon','2021-12-28 05:13:19.159034'),(65,'products','0031_remove_coupon_list_coupon','2021-12-28 05:13:21.350521'),(66,'products','0032_remove_coupon_list_user','2021-12-28 05:13:23.376315'),(67,'products','0033_auto_20211228_0355','2021-12-28 05:13:28.508290'),(68,'products','0034_remove_coupon_list_coupons','2021-12-28 05:13:30.800314'),(69,'products','0035_coupon_list_price','2021-12-28 05:13:31.784831'),(70,'products','0036_auto_20211228_0514','2021-12-28 05:14:33.197666'),(71,'products','0037_remove_coupon_list_coupons','2021-12-28 05:21:12.727912'),(72,'products','0038_coupon_list_coupon_use','2021-12-28 05:36:59.701001'),(73,'products','0039_remove_coupon_list_coupon_use','2021-12-28 05:39:35.861645'),(74,'products','0040_coupon_user','2021-12-28 05:40:08.519884'),(75,'products','0041_auto_20211228_0544','2021-12-28 05:44:28.657656'),(76,'products','0042_orderitems_date','2022-01-03 10:40:30.281000'),(77,'products','0043_remove_orderitems_date','2022-01-05 08:50:50.258823'),(78,'products','0044_alter_order_status','2022-01-07 09:40:32.920332'),(79,'products','0045_products_special_offer','2022-01-07 17:01:46.526467'),(80,'products','0046_mycart_guest_user','2022-01-09 08:28:35.334999'),(81,'products','0047_wlist_guest_user','2022-01-09 13:30:33.218773');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('14fu63cu5ow4s9v2ne5draymwktshftd','eyJkZXZpY2UiOiJmMWRkOWUyMC02ODI5LTQyODctYWNmNC0yZWY4ZDBlY2MwMzAifQ:1n6TaE:qpPmH-vFR1tfJ_Q-_S6xaj2xaBHHyTqCTotANfUOWLk','2022-01-23 08:29:46.783843'),('14w9n7ik726by5gzpa19st59g56tz7ea','YTFmY2QyY2NjYmFiZjFmNjhkZGVhYTY4MDIyY2Y3ZmYyYTQ3MGZlMTp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmQ1OGQzMDJjNjYxNTc5YjJiYTJmNjdmOWIxYTIyYzkyNzZmNTAxMiJ9','2021-12-29 03:38:51.690377'),('2ul5tf9h9dlsch8habmwwg0u9bev0d9b','ZjI3YzQ5ZTM5MjdlZTFmZThhY2JiNjdhODE1ZTA5NDljMGYyMzFiNTp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDhlNzM0ZGYyMGY5NTBlOWY3Njk1YWFkNmQxNzgxMTg1ZjhkNWM5MCJ9','2021-12-28 06:40:39.859508'),('4fve0ol3u1sfqhfdkowqjo4xc27mmc8b','YTFmY2QyY2NjYmFiZjFmNjhkZGVhYTY4MDIyY2Y3ZmYyYTQ3MGZlMTp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmQ1OGQzMDJjNjYxNTc5YjJiYTJmNjdmOWIxYTIyYzkyNzZmNTAxMiJ9','2021-12-29 03:43:15.720666'),('6r4bidhb738j8xvh66pygyo7u3yrnmeb','.eJxVzEsOwyAMBNC7sK5QMSGQrqruewZkwE7S5qPms6p694KUTZaeeeOv2FdaRuwHcRMLMtHn3pZTxnkUF-Fx3zpfjO9TJvqcBYxvmkqRXji1c15N29IHWYg82lU-50TD47CnBx2uXV47RUpFto0GqBw5ZIvQWGWjAwJXoTGQmqtG4Exq4ooDBR2htkax1eL3B3VwQc8:1n3zQ3:NHtfuZVjkfIob6KvTE-y4mX8fLulUMaNu8bCkqR98zI','2022-01-16 11:52:59.155591'),('akxrk2qbp8h3niu5ibw9v12ipvhdgxow','eyJ1c2VybWFpbCI6ImFkaGlsMTIzQGdtYWlsLmNvbSJ9:1n0cT7:H_CrcmTXagFgBaRwz2ixIixgafT6YOIhjtaVTaN4kTY','2022-01-07 04:46:13.308622'),('gv2znf8s6aqw8cnc4fosja5pwb2e9gdg','YmMyZTkzODU2MmU2YjUxY2E2NGRjYjI4NzM2N2ZjZTFmZDFmYjJlMzp7fQ==','2021-12-29 03:29:17.131612'),('hllofphwqltqxknat93j6ppj7zgmhyyj','eyJ1c2VybWFpbCI6ImFraGlsbWsxMjVAZ21haWwuY29tIn0:1n0PpO:lfRHwUtFi-igf_ZYUD6dc8EzqWLx9qQwyPjXd3mdHf0','2022-01-06 15:16:22.806283'),('idcq97o3japlfbbn4xhzymsjcfbj7g5z','.eJxVzDsOwyAQBNC7UEcoLMbgVFH6nMFaYDHEHyR_qih3D0hu3M68mS87NlpnTBN7MBxjmuZRgHoONeIuz-zGejz22FfXJ1-YvGYW3UhLLfwHlyGX1bKvyfJK-Nlu_J09Ta_TXg4ibrGsjSAhXNCdBGgMGQwaodNCOwMEpkGlwHd3iRAKaSk0wZKVDlqtRNCS_f5Nn0LU:1n0Itj:CLgVWclHcVMFsjFD2Z7HrStlJlGSszWjrtES9S3lkZk','2022-01-06 07:52:23.798411'),('k3jb7ed8c6eghr1tp7mporm1x6hcj0r8','.eJxVjktuxCAQRO_CemyZBgyeVZR9zmA1TTMmtnHkz2yi3D0gzWa2Ve-V6lf8TFvmMV-r513che3A6F5La8VNpGN88p5i4iDu537xTVwH7yumpaA4T2lZZwnm41Gjlra1SCNe5zRWbkxFE-o980gz51qEb8yPrVj53JNvK9K-2qP92gIvny_2bWDCYyq2kywlRTsoAO3YYbQIg5WWHDA4jcZAGDqFEAvSc9TRs1cEvTUy2voq8DMR14tO6YFDaJDYN9oiNgNB1yjqLIWOfO-M-PsHSflfHg:1n7Wcq:4ctYXE30iWIl_OTmOU6ZdWRjsq6NihCxdPSD8qPCHws','2022-01-26 05:56:48.888084'),('lrhp8g2c7qb7qaqxi1v7j0yx0zq2m3ml','eyJ1c2VybWFpbCI6ImFiaGlqaXRoQGdtYWlsLmNvbSJ9:1n11GD:1KNYzqZa1nIX9qwtBZQueb7Xx1eUFFHqd810g6fmghw','2022-01-08 07:14:33.105377'),('oicn5xeia0rvlp1avwaxz1jxlrp2y7ov','eyJkZXZpY2UiOiJmMzE2ODY0ZC1iOGM1LTRlMDQtOTQ4Yy02Yzg4M2YwZjZkNWUifQ:1n6UPg:1kw4vujbpl0oJxv3jTpL2FKnqwJzST7AUMa2hFGAhqE','2022-01-23 09:22:56.590201'),('shx1fo45abqxce8gjaqfpmvkgfyjrdx5','.eJxVjEEOwiAQRe_C2hAZoIBL956BDDAjVUOT0q6Md7dNutDtf-_9t4i4LjWuneY4FnERWpx-t4T5SW0H5YHtPsk8tWUek9wVedAub1Oh1_Vw_w4q9rrVXpFSmV3QAMaTR3YIwSmXPRB4g9ZCCWeNwJsyEBtOlHSGwVnFTovPF8qdN1Q:1n0Pfd:OWmItafZwj65pBRwQDETzk95AfYpo5iYFXsbOQyZKLU','2022-01-06 15:06:17.923738'),('tgxt5221zsujnkcqb1cxy4bs6kfe09fx','.eJxVjDsOwyAQRO9CHaGw2AanitLnDNYCi8GxQfKninL3gOTG3Wjem_myY6N1wTizB5syPceauc0Lu7EBjz0MVRiiK1xeO4P2Q6kCN2Eac1mlfY2GV4WfdOPv7Gh-ne7lIOAWyloLEsJ61UuARpNGrxB6JZTVQKAbbFtw_V0i-KJ05BtvyEgLnWqFV5L9_oVxQJk:1n2xAm:d1o8j1PkxQStmzQA_rUeORmv81ok0hhdyugdmtm2jTo','2022-01-13 15:16:56.509519'),('uyg4lxh14cg80fbujc08njaeootvpjcw','eyJ1c2VybWFpbCI6ImFqaWxAZ21haWwuY29tIn0:1n2wyI:N87O4qyseATJnF-9F0UUJBqUHW-7Y55nYAXKeX-5XtA','2022-01-13 15:04:02.618429'),('xagbln1ic1zuceckpgnyarfys01j9pm7','eyJkZXZpY2UiOiJmMWRkOWUyMC02ODI5LTQyODctYWNmNC0yZWY4ZDBlY2MwMzAiLCJ1c2VybWFpbCI6InNhbWRkQHNhbS5jb20ifQ:1n6Y11:XRteljEhdPBj50O2jmzjVKujtUG6GJSIm8o7IV8WMzo','2022-01-23 13:13:43.332279'),('xjp5p2qi1glzfwcttgzv7dmdwdjcst3z','YmMyZTkzODU2MmU2YjUxY2E2NGRjYjI4NzM2N2ZjZTFmZDFmYjJlMzp7fQ==','2021-12-29 03:16:55.419705');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_category`
--

DROP TABLE IF EXISTS `products_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(200) NOT NULL,
  `discount` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_category`
--

LOCK TABLES `products_category` WRITE;
/*!40000 ALTER TABLE `products_category` DISABLE KEYS */;
INSERT INTO `products_category` VALUES (7,'fruits',0),(8,'vegetables',0),(9,'Fish',0);
/*!40000 ALTER TABLE `products_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_coupon`
--

DROP TABLE IF EXISTS `products_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_coupon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(50) NOT NULL,
  `coupon_discount` double NOT NULL,
  `coupon_is_active` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_coupon`
--

LOCK TABLES `products_coupon` WRITE;
/*!40000 ALTER TABLE `products_coupon` DISABLE KEYS */;
INSERT INTO `products_coupon` VALUES (1,'fresh100',10,1),(17,'fresh2021',20,1),(18,'fresh2022',20,1),(19,'20fresh',20,1),(20,'10fresh',10,1),(21,'30fresh',30,1),(22,'freshome20',20,1),(23,'freshome30',30,1),(24,'fresh2020',20,1),(25,'fresh2030',30,1);
/*!40000 ALTER TABLE `products_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_coupon_list`
--

DROP TABLE IF EXISTS `products_coupon_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_coupon_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart_sum` varchar(50) NOT NULL,
  `coupon_discount` varchar(50) NOT NULL,
  `grand_total` varchar(50) NOT NULL,
  `status` int NOT NULL,
  `user_id` int NOT NULL,
  `coupon_use_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_coupon_list_user_id_8f85136c_fk_accounts_account_id` (`user_id`),
  KEY `products_coupon_list_coupon_use_id_6fbece88_fk_products_` (`coupon_use_id`),
  CONSTRAINT `products_coupon_list_coupon_use_id_6fbece88_fk_products_` FOREIGN KEY (`coupon_use_id`) REFERENCES `products_coupon` (`id`),
  CONSTRAINT `products_coupon_list_user_id_8f85136c_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=516 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_coupon_list`
--

LOCK TABLES `products_coupon_list` WRITE;
/*!40000 ALTER TABLE `products_coupon_list` DISABLE KEYS */;
INSERT INTO `products_coupon_list` VALUES (7,'504.0','0','504.0',1,1,1),(8,'1283.0','0','1283.0',1,1,1),(9,'','128.3','1283.0',0,16,1),(10,'1721.0','0','1721.0',1,1,1),(12,'1351.0','0','1351.0',1,1,1),(14,'1386.0','0','1386.0',1,1,1),(15,'1470.0','0','1470.0',1,1,1),(16,'1470.0','0','1470.0',1,1,1),(17,'1470.0','0','1470.0',1,1,1),(18,'1470.0','0','1470.0',1,1,1),(19,'1470.0','0','1470.0',1,1,1),(20,'1470.0','0','1470.0',1,1,1),(21,'1470.0','0','1470.0',1,1,1),(22,'1470.0','0','1470.0',1,1,1),(23,'1470.0','0','1470.0',1,1,1),(24,'1470.0','0','1470.0',1,1,1),(25,'1470.0','0','1470.0',1,1,1),(26,'1470.0','0','1470.0',1,1,1),(27,'1470.0','0','1470.0',1,1,1),(28,'1470.0','0','1470.0',1,1,1),(29,'1470.0','0','1470.0',1,1,1),(30,'1470.0','0','1470.0',1,1,1),(31,'1470.0','0','1470.0',1,1,1),(32,'1470.0','0','1470.0',1,1,1),(33,'1470.0','0','1470.0',1,1,1),(34,'1470.0','0','1470.0',1,1,1),(35,'1470.0','0','1470.0',1,1,1),(36,'1470.0','0','1470.0',1,1,1),(37,'1470.0','0','1470.0',1,1,1),(38,'1470.0','0','1470.0',1,1,1),(39,'1470.0','0','1470.0',1,1,1),(40,'48.0','0','48.0',1,1,1),(41,'132.0','0','132.0',1,1,1),(42,'1380.0','0','1380.0',1,1,1),(44,'1290.0','0','1290.0',1,1,1),(45,'1290.0','0','1290.0',1,1,1),(46,'1290.0','0','1290.0',1,1,1),(47,'1290.0','0','1290.0',1,1,1),(48,'1374.0','0','1374.0',1,1,1),(49,'228.0','0','228.0',1,1,1),(50,'1040.0','0','1040.0',1,1,1),(51,'48.0','0','48.0',1,1,1),(52,'48.0','0','48.0',1,1,1),(53,'48.0','0','48.0',1,1,1),(54,'1889.0','0','1889.0',1,1,1),(55,'1889.0','0','1889.0',1,1,1),(56,'1889.0','0','1889.0',1,1,1),(57,'1889.0','0','1889.0',1,1,1),(58,'1889.0','0','1889.0',1,1,1),(59,'1889.0','0','1889.0',1,1,1),(60,'1889.0','0','1889.0',1,1,1),(61,'1889.0','0','1889.0',1,1,1),(62,'1889.0','0','1889.0',1,1,1),(64,'1511.2','0','1511.2',1,1,1),(65,'1710.0','0','1710.0',1,1,1),(67,'1368.0','0','1368.0',1,1,1),(68,'1368.0','0','1368.0',1,1,1),(69,'202.0','0','202.0',1,1,1),(70,'181.0','0','181.0',1,1,1),(71,'181.0','0','181.0',1,1,1),(72,'97.0','0','97.0',1,1,1),(73,'84.0','0','84.0',1,1,1),(74,'1565.0','0','1565.0',1,1,1),(76,'313.0','0','313.0',1,1,1),(77,'313.0','0','313.0',1,1,1),(78,'516.0','0','516.0',1,1,1),(79,'1494.0','0','1494.0',1,1,1),(81,'1195.2','0','1195.2',1,1,1),(83,'1344.6','0','1344.6',1,1,1),(85,'1195.2','0','1195.2',1,1,1),(86,'1195.2','0','1195.2',1,1,1),(88,'1344.6','0','1344.6',1,1,1),(89,'1031.0','0','1031.0',1,1,1),(91,'48.0','0','48.0',1,1,1),(92,'1223.0','0','1223.0',1,1,1),(94,'1432.4','0','1432.4',1,1,1),(96,'1040.0','0','1040.0',1,1,1),(98,'832.0','0','832.0',1,1,1),(100,'1336.0','0','1336.0',1,1,1),(101,'1336.0','0','1336.0',1,1,1),(102,'1131.0','0','1131.0',1,1,1),(103,'1183.0','0','1183.0',1,1,1),(104,'1183.0','0','1183.0',1,1,1),(105,'538.0','0','538.0',1,1,1),(106,'538.0','0','538.0',1,1,1),(107,'538.0','0','538.0',1,1,1),(108,'538.0','0','538.0',1,1,1),(109,'538.0','0','538.0',1,1,1),(110,'538.0','0','538.0',1,1,1),(111,'538.0','0','538.0',1,1,1),(112,'538.0','0','538.0',1,1,1),(113,'538.0','0','538.0',1,1,1),(114,'538.0','0','538.0',1,1,1),(115,'538.0','0','538.0',1,1,1),(116,'1828.0','0','1828.0',1,1,1),(117,'2199.0','0','2199.0',1,1,1),(118,'2199.0','0','2199.0',1,1,1),(119,'2199.0','0','2199.0',1,1,1),(120,'2199.0','0','2199.0',1,1,1),(121,'2199.0','0','2199.0',1,1,1),(122,'2199.0','0','2199.0',1,1,1),(123,'2199.0','0','2199.0',1,1,1),(124,'2199.0','0','2199.0',1,1,1),(125,'2199.0','0','2199.0',1,1,1),(126,'2199.0','0','2199.0',1,1,1),(127,'1745.0','0','1745.0',1,1,1),(128,'1745.0','0','1745.0',1,1,1),(129,'1745.0','0','1745.0',1,1,1),(130,'1745.0','0','1745.0',1,1,1),(131,'1745.0','0','1745.0',1,1,1),(132,'381.0','0','381.0',1,1,1),(133,'381.0','0','381.0',1,1,1),(134,'381.0','0','381.0',1,1,1),(135,'689.0','0','689.0',1,1,1),(136,'689.0','0','689.0',1,17,1),(137,'689.0','0','689.0',1,17,1),(138,'689.0','0','689.0',1,17,1),(139,'689.0','0','689.0',1,17,1),(140,'689.0','0','689.0',1,17,1),(141,'462.0','0','462.0',1,17,1),(142,'238.0','0','238.0',1,17,1),(143,'238.0','0','238.0',1,17,1),(144,'279.0','0','279.0',1,17,1),(145,'279.0','0','279.0',1,17,1),(146,'279.0','0','279.0',1,17,1),(147,'1541.0','0','1541.0',1,17,1),(149,'359.0','0','359.0',1,16,1),(150,'','','227',1,1,1),(151,'','','227',1,1,1),(152,'','','84',1,1,1),(153,'','','97',1,16,1),(154,'','','48',1,17,1),(155,'359.0','0','359.0',1,16,1),(156,'359.0','0','359.0',1,16,1),(157,'1721.0','0','1721.0',1,16,1),(159,'1376.8','0','1376.8',1,16,1),(160,'14.800000000000011','0','14.800000000000011',1,16,1),(161,'','','48',1,16,1),(162,'98.80000000000001','0','98.80000000000001',1,16,1),(163,'325.8','0','670',1,16,1),(164,'1233.8','0','1578',1,16,1),(165,'','315.6','1262.4',0,16,17),(166,'1262.4','0','1578',1,16,1),(167,'1262.4','0','1578',1,16,1),(168,'','','97',1,16,1),(169,'','','97',1,16,1),(170,'1262.4','0','1578',1,16,1),(171,'','315.6','1262.4',0,16,18),(172,'1262.4','0','1578',1,16,1),(173,'','','48',1,16,1),(174,'1262.4','0','1578',1,16,1),(175,'808.4','0','1124',1,16,1),(176,'359.0','0','359',1,16,1),(177,'','','84',1,16,1),(178,'','','84',1,16,1),(179,'132.0','0','132',1,16,1),(180,'132.0','0','132',1,16,1),(181,'48.0','0','48',1,16,1),(182,'97.0','0','97',1,16,1),(183,'48.0','0','48',1,16,1),(184,'84.0','0','84',1,16,1),(185,'48.0','0','48',1,16,1),(186,'84.0','0','84',1,16,1),(187,'84.0','0','84',1,16,1),(188,'84.0','0','84',1,16,1),(189,'48.0','0','48',1,16,1),(190,'311.0','0','311',1,16,1),(191,'132.0','0','132',1,16,1),(192,'132.0','0','132',1,16,1),(193,'132.0','0','132',1,16,1),(194,'132.0','0','132',1,16,1),(195,'311.0','0','311',1,16,1),(196,'','','84',1,16,1),(197,'45.0','0','45',1,16,1),(198,'','','48',1,16,1),(199,'','','48',1,16,1),(200,'','','48',1,16,1),(201,'132.0','0','132',1,16,1),(202,'','','48',1,16,1),(203,'','','154',1,16,1),(204,'','','105',1,16,1),(205,'132.0','0','132',1,16,1),(206,'','','84',1,16,1),(207,'','','105',1,16,1),(208,'132.0','0','132',1,16,1),(209,'1232.8','0','1541',1,17,1),(210,'','','292',1,17,1),(211,'','','292',1,17,1),(212,'','','292',1,17,1),(213,'','','292',1,17,1),(214,'','','292',1,17,1),(215,'','','292',1,17,1),(216,'','','292',1,17,1),(217,'1232.8','0','1541',1,17,1),(218,'170.0','0','170',1,17,1),(219,'170.0','0','170',1,17,1),(220,'1096.0','0','1096',1,16,1),(221,'1096.0','0','1096',1,16,1),(222,'1221.0','0','1221',1,16,1),(223,'','244.2','976.8',0,16,22),(224,'1174.8','0','1419',1,16,1),(225,'','','176',1,16,1),(226,'1873.0','0','1873',1,16,1),(227,'','374.6','1498.4',1,16,24),(228,'1539.4','0','1914',1,16,1),(229,'','382.8','1531.2',1,16,24),(230,'2886.2','0','3269',1,16,1),(231,'','653.8','2615.2',1,16,24),(232,'1667.0','0','1667',1,16,1),(233,'','333.4','1333.6',1,16,24),(234,'1333.6','0','1667',1,16,1),(235,'','333.4','1333.6',1,16,24),(236,'','','',0,1,1),(237,'1191.0','0','1191',1,16,1),(238,'','238.2','952.8',1,16,24),(239,'','238.2','952.8',1,16,24),(240,'','238.2','952.8',1,16,24),(241,'1388.8','0','1627',1,16,1),(242,'','325.4','1301.6',1,1,1),(243,'','','',0,16,1),(244,'1547.0','0','1547',1,16,1),(245,'','309.4','1237.6',1,1,1),(246,'1292.6','0','1602',1,16,1),(247,'','320.4','1281.6',1,16,1),(248,'1326.6','0','1647',1,16,1),(249,'1326.6','0','1647',1,16,1),(250,'','329.4','1317.6',1,16,1),(251,'1643.6','0','1973',1,16,1),(252,'','394.6','1578.4',1,16,1),(253,'1639.4','0','2034',1,16,1),(254,'','406.8','1627.2',1,16,24),(255,'','406.8','1627.2',1,16,24),(256,'','','',0,16,1),(257,'2327.0','0','2327',1,16,1),(258,'','465.4','1861.6',1,16,24),(259,'','','',0,16,24),(260,'1407.0','0','1407',1,16,1),(261,'','422.1','984.9',1,16,25),(262,'1476.9','0','1899',1,16,1),(263,'','569.7','1329.3',1,16,25),(264,'','','',0,16,25),(265,'55.0','0','55',1,16,1),(266,'','','',0,16,1),(267,'1451.0','0','1451',1,16,1),(268,'1451.0','0','1451',1,18,1),(269,'','290.2','1160.8',1,18,24),(270,'1271.8','0','1562',1,18,1),(271,'','312.4','1249.6',1,18,24),(272,'','','',0,18,24),(273,'96.0','0','96',1,18,1),(274,'','','',0,18,1),(275,'2012.0','0','2012',1,18,1),(276,'2576.0','0','2576',1,18,1),(277,'','772.8','1803.2',1,18,25),(278,'','772.8','1803.2',1,18,25),(279,'','772.8','1803.2',1,18,25),(280,'1864.2','0','2637',1,18,1),(281,'','791.1','1845.9',1,18,25),(282,'','','',0,18,25),(283,'2001.0','0','2001',1,18,1),(284,'2001.0','0','2001',1,18,1),(285,'','','',0,18,1),(286,'','','55',1,18,1),(287,'','','32',1,18,1),(288,'','','176',1,18,1),(289,'1451.0','0','1451',1,16,1),(290,'','','',0,16,1),(291,'411.0','0','411',1,16,1),(292,'','','',0,16,1),(293,'32.0','0','32',1,16,1),(294,'320.0','0','320',1,16,1),(295,'','','',0,16,1),(296,'440.0','0','440',1,16,1),(297,'','','',0,16,1),(298,'550.0','0','550',1,16,1),(299,'','','',0,16,1),(300,'1850.0','0','1850',1,16,1),(301,'','','',0,16,1),(302,'984.0','0','984',1,16,1),(303,'','','',0,16,1),(304,'1155.0','0','1155',1,18,1),(305,'','','',0,18,1),(306,'550.0','0','550',1,18,1),(307,'','','',0,18,1),(308,'1305.0','0','1305',1,16,1),(309,'','','',0,16,1),(310,'660.0','0','660',1,18,1),(311,'660.0','0','660',1,18,1),(312,'1430.0','0','1430',1,18,1),(313,'1990.0','0','1990',1,16,1),(314,'','','',0,16,1),(315,'550.0','0','550',1,18,1),(316,'','','',0,18,1),(317,'550.0','0','550',1,16,1),(318,'','','',0,16,1),(319,'550.0','0','550',1,18,1),(320,'','','',0,18,1),(321,'4680.0','0','4680',1,18,1),(322,'','','',0,18,1),(323,'5520.0','0','5520',1,16,1),(324,'','','',0,16,1),(325,'','','111',1,16,1),(326,'440.0','0','440',1,16,1),(327,'','','',0,16,1),(328,'110.0','0','110',1,16,1),(329,'','','',0,16,1),(330,'782.0','0','782',1,16,1),(331,'','','',0,16,1),(332,'2346.0','0','2346',1,16,1),(333,'','','',0,16,1),(334,'3167.0','0','3167',1,16,1),(335,'','','',0,16,1),(336,'2880.0','0','2880',1,16,1),(337,'','','',0,16,1),(338,'3080.0','0','3080',1,16,1),(339,'','','',0,16,1),(340,'441.0','0','441',1,16,1),(341,'','','',0,16,1),(342,'3870.0','0','3870',1,16,1),(343,'','','',0,16,1),(344,'4407.0','0','4407',1,16,1),(345,'','','',0,16,1),(346,'1830.0','0','1830',1,16,1),(347,'','','',0,16,1),(348,'1227.0','0','1227',1,16,1),(349,'','','',0,16,1),(350,'322.0','0','322',1,16,1),(351,'','','',0,16,1),(352,'393.0','0','393',1,16,1),(353,'','','',0,16,1),(354,'568.0','0','568',1,16,1),(355,'','','',0,16,1),(356,'305.0','0','305',1,16,1),(357,'','','',0,16,1),(358,'846.0','0','846',1,16,1),(359,'','','',0,16,1),(360,'','','260',1,16,1),(361,'436.0','0','436',1,4,1),(362,'','','',0,4,1),(363,'2223.0','0','2223',1,4,1),(364,'','666.9','1556.1',1,4,23),(365,'','','',0,4,23),(366,'','','111',1,4,1),(367,'','','44',1,4,1),(368,'111.0','0','111',1,4,1),(369,'111.0','0','111',1,4,1),(370,'782.0','0','782',1,16,1),(371,'','','',0,16,1),(372,'1307.0','0','1307',1,16,1),(373,'','','',0,16,1),(374,'411.0','0','411',1,16,1),(375,'411.0','0','411',1,16,1),(376,'','','111',1,16,1),(377,'522.0','0','522',1,16,1),(378,'','','',0,16,1),(379,'','','176',1,16,1),(380,'819.0','0','819',1,4,1),(381,'','','',0,4,1),(382,'346.0','0','346',1,4,1),(383,'','','',0,4,1),(384,'1375.0','0','1375',1,4,1),(385,'','','',0,4,1),(386,'1160.0','0','1160',1,16,1),(388,'1108.0','0','1340',1,16,1),(391,'','','176',1,16,1),(392,'288.0','0','288',1,19,1),(393,'288.0','0','288',1,19,1),(394,'','','',0,19,1),(395,'1371.0','0','1371',1,19,1),(398,'','','260',1,16,1),(399,'690.0','0','690',1,16,1),(400,'','','',0,16,1),(401,'371.0','0','371',1,16,1),(402,'','','',0,16,1),(403,'956.0','0','956',1,16,1),(404,'','','',0,16,1),(405,'','','176',1,16,1),(406,'176.0','0','176',1,20,1),(407,'176.0','0','176',1,20,1),(408,'176.0','0','176',1,20,1),(409,'176.0','0','176',1,20,1),(410,'176.0','0','176',1,20,1),(411,'176.0','0','176',1,20,1),(412,'176.0','0','176',1,20,1),(413,'176.0','0','176',1,20,1),(414,'176.0','0','176',1,20,1),(415,'176.0','0','176',1,20,1),(416,'176.0','0','176',1,20,1),(417,'176.0','0','176',1,20,1),(418,'176.0','0','176',1,20,1),(419,'176.0','0','176',1,20,1),(420,'176.0','0','176',1,20,1),(421,'176.0','0','176',1,20,1),(422,'176.0','0','176',1,20,1),(423,'176.0','0','176',1,20,1),(424,'176.0','0','176',1,20,1),(425,'176.0','0','176',1,20,1),(426,'176.0','0','176',1,20,1),(427,'176.0','0','176',1,20,1),(428,'176.0','0','176',1,20,1),(429,'176.0','0','176',1,20,1),(430,'176.0','0','176',1,20,1),(431,'176.0','0','176',1,20,1),(432,'176.0','0','176',1,20,1),(433,'176.0','0','176',1,20,1),(434,'176.0','0','176',1,20,1),(435,'176.0','0','176',1,20,1),(436,'176.0','0','176',1,20,1),(437,'176.0','0','176',1,20,1),(438,'880.0','0','880',1,20,1),(439,'880.0','0','880',1,20,1),(440,'','','',0,20,1),(441,'','','176',1,20,1),(442,'','','176',1,20,1),(443,'','','176',1,20,1),(444,'','','176',1,20,1),(445,'411.0','0','411',1,20,1),(446,'','','176',1,20,1),(447,'','','105',1,20,1),(448,'','','260',1,20,1),(449,'','','176',1,20,1),(450,'','','61',1,20,1),(451,'','','176',1,20,1),(452,'','','176',1,20,1),(453,'','','260',1,20,1),(454,'','','260',1,20,1),(455,'','','176',1,20,1),(456,'','','176',1,20,1),(457,'','','260',1,20,1),(458,'','','260',1,20,1),(459,'','','111',1,20,1),(460,'','','260',1,20,1),(461,'','','111',1,20,1),(462,'','','176',1,20,1),(463,'','','176',1,20,1),(464,'','','176',1,20,1),(465,'','','260',1,20,1),(466,'','','45',1,20,1),(467,'','','41',1,20,1),(468,'','','260',1,20,1),(469,'','','235',1,20,1),(470,'','','235',1,20,1),(471,'','','235',1,20,1),(472,'','','176',1,20,1),(473,'','','176',1,20,1),(474,'','','41',1,20,1),(475,'357.0','0','357',1,20,1),(476,'814.0','0','814',1,20,1),(477,'814.0','0','814',1,20,1),(478,'1491.0','0','1491',1,16,1),(479,'','','',0,16,1),(480,'529.0','0','529',1,16,1),(481,'','','165',1,16,1),(482,'','','220',1,16,1),(483,'','','48',1,16,1),(484,'','','48',1,16,1),(485,'','','165',1,16,1),(486,'','','82',1,16,1),(487,'111.0','0','111',1,4,1),(488,'','','220',1,16,1),(489,'3271.0','0','3271',1,16,1),(490,'3271.0','0','3271',1,16,1),(491,'4416.0','0','4416',1,16,1),(492,'1053.0','0','1053',1,16,1),(493,'','','',0,16,1),(494,'662.0','0','662',1,28,1),(495,'662.0','0','662',1,28,1),(496,'','','',0,28,1),(497,'','','243',1,33,1),(498,'','','243',1,33,1),(499,'','','90',1,16,1),(500,'1770.0','0','1770',1,34,1),(501,'1770.0','0','1770',1,34,1),(502,'1770.0','0','1770',1,34,1),(503,'1770.0','0','1770',1,34,1),(504,'1770.0','0','1770',1,34,1),(505,'1770.0','0','1770',1,34,1),(506,'1770.0','0','1770',1,34,1),(507,'','354.0','1416.0',1,34,24),(508,'','354.0','1416.0',1,34,24),(509,'1416.0','0','1770',1,34,1),(510,'1416.0','0','1770',1,34,1),(511,'1670.0','0','1670',1,16,1),(512,'','','',0,16,1),(513,'','','225',1,16,1),(514,'7013.0','0','7013',1,16,1),(515,'','','',0,16,1);
/*!40000 ALTER TABLE `products_coupon_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_mycart`
--

DROP TABLE IF EXISTS `products_mycart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_mycart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total` int NOT NULL,
  `quantity` int NOT NULL,
  `products_id` int NOT NULL,
  `user_id` int NOT NULL,
  `grand_total` double NOT NULL,
  `coupon_discount` varchar(50) NOT NULL,
  `discount_total` varchar(50) NOT NULL,
  `guest_user` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_mycart_products_id_b8d03937_fk_products_products_id` (`products_id`),
  KEY `products_mycart_user_id_c56d17f1_fk_accounts_account_id` (`user_id`),
  CONSTRAINT `products_mycart_products_id_b8d03937_fk_products_products_id` FOREIGN KEY (`products_id`) REFERENCES `products_products` (`id`),
  CONSTRAINT `products_mycart_user_id_c56d17f1_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_mycart`
--

LOCK TABLES `products_mycart` WRITE;
/*!40000 ALTER TABLE `products_mycart` DISABLE KEYS */;
INSERT INTO `products_mycart` VALUES (6,120,1,17,33,1,'0','0','True'),(7,325,1,18,33,1,'0','0','True'),(8,1215,5,18,34,1770,'354.0','1416.0','38349edd-aceb-47aa-9c20-3c07cd0cb685'),(9,330,2,29,34,1770,'354.0','1416.0','38349edd-aceb-47aa-9c20-3c07cd0cb685'),(10,225,1,38,34,1770,'354.0','1416.0','38349edd-aceb-47aa-9c20-3c07cd0cb685'),(24,104,1,19,4,1,'0','0','True'),(25,55,1,20,4,1,'0','0','True');
/*!40000 ALTER TABLE `products_mycart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_order`
--

DROP TABLE IF EXISTS `products_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_mode` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `total` double NOT NULL,
  `date` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_order_user_id_dfb540d8_fk_accounts_account_id` (`user_id`),
  KEY `products_order_address_id_10a144ef_fk_accounts_address_id` (`address_id`),
  CONSTRAINT `products_order_address_id_10a144ef_fk_accounts_address_id` FOREIGN KEY (`address_id`) REFERENCES `accounts_address` (`id`),
  CONSTRAINT `products_order_user_id_dfb540d8_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_order`
--

LOCK TABLES `products_order` WRITE;
/*!40000 ALTER TABLE `products_order` DISABLE KEYS */;
INSERT INTO `products_order` VALUES (1,'CASHONDELIVERY ','Delivered',522,'2022-01-05 16:09:16.587199',16,30),(2,'Razorpay','Delivered',176,'2022-01-06 07:59:47.306260',16,31),(3,'Razorpay','Delivered',819,'2022-01-07 06:18:42.091886',4,9),(4,'Razorpay','Delivered',346,'2022-01-07 06:19:36.328766',4,9),(5,'paypal','Delivered',1375,'2021-12-25 16:09:16.587199',4,9),(6,'Razorpay','Delivered',1072,'2022-01-07 06:44:26.173318',16,31),(7,'Razorpay','customer cancelled',288,'2022-01-07 07:54:55.584177',19,32),(8,'CASHONDELIVERY ','placed',1096.8,'2022-01-07 07:57:43.205290',19,32),(9,'CASHONDELIVERY ','Delivered',260,'2022-01-07 09:42:25.254342',16,31),(10,'CASHONDELIVERY ','customer cancelled',690,'2022-01-07 10:00:51.074249',16,31),(11,'CASHONDELIVERY ','Delivered',371,'2022-01-07 10:02:05.939137',16,30),(12,'CASHONDELIVERY ','Delivered',956,'2022-01-07 12:38:43.297316',16,31),(13,'Razorpay','placed',176,'2022-01-07 12:39:08.258789',16,31),(17,'CASHONDELIVERY ','Delivered',1491,'2021-12-26 16:09:16.587199',16,30),(18,'paypal','Delivered',165,'2022-01-08 13:22:40.354495',16,31),(19,'paypal','Dispatched',220,'2022-01-08 13:23:30.895059',16,31),(20,'Razorpay','placed',48,'2022-01-08 13:24:07.073431',16,31),(21,'Razorpay','Delivered',48,'2022-01-08 13:24:44.656181',16,31),(22,'Razorpay','placed',165,'2022-01-08 13:25:14.276427',16,31),(23,'Razorpay','Rejected',82,'2022-01-08 13:25:49.230473',16,31),(24,'CASHONDELIVERY ','Delivered',1053,'2022-01-09 11:43:21.813370',16,31),(25,'CASHONDELIVERY ','Delivered',662,'2022-01-09 13:07:04.683693',28,67),(26,'CASHONDELIVERY ','Delivered',90,'2022-01-10 05:50:42.334709',16,31),(27,'CASHONDELIVERY ','Delivered',1670,'2022-01-11 05:44:06.367353',16,31),(28,'CASHONDELIVERY ','Delivered',7013,'2022-01-11 05:56:06.643804',16,31);
/*!40000 ALTER TABLE `products_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_orderitems`
--

DROP TABLE IF EXISTS `products_orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_orderitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `order_id` int NOT NULL,
  `products_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_orderitems_order_id_4e93d267_fk_products_order_id` (`order_id`),
  KEY `products_orderitems_products_id_2dd87dd1_fk_products_products_id` (`products_id`),
  CONSTRAINT `products_orderitems_order_id_4e93d267_fk_products_order_id` FOREIGN KEY (`order_id`) REFERENCES `products_order` (`id`),
  CONSTRAINT `products_orderitems_products_id_2dd87dd1_fk_products_products_id` FOREIGN KEY (`products_id`) REFERENCES `products_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_orderitems`
--

LOCK TABLES `products_orderitems` WRITE;
/*!40000 ALTER TABLE `products_orderitems` DISABLE KEYS */;
INSERT INTO `products_orderitems` VALUES (1,1,176,1,29),(2,1,235,1,30),(3,1,111,1,19),(4,1,176,2,29),(5,1,111,3,19),(6,1,260,3,18),(7,1,176,3,29),(8,1,240,3,38),(9,1,32,3,41),(10,1,61,4,23),(11,1,180,4,24),(12,1,105,4,25),(13,5,880,5,29),(14,1,235,5,30),(15,1,260,5,18),(16,1,111,6,19),(17,5,205,6,20),(19,1,36,6,22),(20,3,528,6,29),(21,1,235,6,30),(22,1,180,6,24),(23,3,288,7,17),(24,1,176,8,29),(25,1,235,8,30),(26,4,960,8,38),(27,1,260,9,18),(28,1,284,10,39),(29,1,105,10,25),(30,1,41,10,20),(31,1,260,10,18),(32,1,260,11,18),(33,1,111,11,19),(34,8,888,12,19),(35,1,36,12,22),(36,1,32,12,41),(37,1,176,13,29),(41,1,35,17,35),(42,1,45,17,36),(43,5,1300,17,18),(44,1,111,17,19),(45,1,165,18,29),(46,1,220,19,30),(47,1,48,20,22),(48,1,48,21,22),(49,1,165,22,29),(50,1,82,23,23),(51,1,243,24,18),(52,9,810,24,17),(53,1,90,25,17),(54,1,243,25,18),(55,1,104,25,19),(56,1,225,25,38),(57,1,90,26,17),(58,1,108,27,17),(59,6,1458,27,18),(60,1,104,27,19),(61,5,825,28,29),(62,1,220,28,30),(63,1,104,28,19),(64,10,2430,28,18),(65,6,648,28,17),(66,1,48,28,22),(67,1,82,28,23),(68,8,1536,28,24),(69,8,1120,28,25);
/*!40000 ALTER TABLE `products_orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_products`
--

DROP TABLE IF EXISTS `products_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `product_price` int NOT NULL,
  `product_stock` int NOT NULL,
  `product_description` longtext NOT NULL,
  `product_img_1` varchar(100) NOT NULL,
  `product_img_2` varchar(100) NOT NULL,
  `product_img_3` varchar(100) NOT NULL,
  `product_img_4` varchar(100) NOT NULL,
  `product_img_5` varchar(100) NOT NULL,
  `category_id` int NOT NULL,
  `offer_price` int NOT NULL,
  `special_offer` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_products_category_id_0cfaa6ce_fk_products_category_id` (`category_id`),
  CONSTRAINT `products_products_category_id_0cfaa6ce_fk_products_category_id` FOREIGN KEY (`category_id`) REFERENCES `products_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_products`
--

LOCK TABLES `products_products` WRITE;
/*!40000 ALTER TABLE `products_products` DISABLE KEYS */;
INSERT INTO `products_products` VALUES (17,'watermelon',120,28,'    Touch & Taste:Watermelon has a spherical or oval shape and the thick smooth skin color is dark green with pale green cross lines. The water-filled red interior pulp is sweet, juicy, and sweet with many small black seeds.\r\nNutrients: Watermelon contains 70% of water and a good source of nutrients like vitamin C, potassium, copper, vitamin B5, and vitamin A.\r\nHealth Benefits:Watermelon helps you to stay hydrated, prevent muscular degeneration, relieve muscle soreness, lower inflammation, and oxidative stress.\r\n','20211216094918watermelon.png','20211216094918watermeko.jpeg','20211216094918watermelon.jpeg','','',7,90,25),(18,'Blue Burry',325,443,'  Plump, smooth-skinned and indigo coloured perfect little globes of juicy berries have mostly sweet and slightly tart flavour. We have imported this fine quality, delicious tasting variety of blueberries.','20220111034308Blue_Burry1.png','20220111034308Blue_Burry2.png','20220111034308Blue_Burry3.png','','',7,325,0),(19,'Kiwi',139,448,'Touch & Taste: Kiwi fruit has a thin fibrous brown skin and a light green edible flesh with tiny black seeds. The flesh is sweet and soft with a unique flavor and source of several nutrients.','20211216095440kiwi.jpeg','20211216095440kiwi3.jpeg','20211216095440kiwi4.jpeg','','',7,104,25),(20,'Tomato',55,475,'Having the size, colour and juiciness of cherries, cherry tomatoes are sweeter to taste than regular varieties. We pick these tomatoes from reputed farmers and store in hygienic conditions to maintain their freshness.','20211216100102cherry_tomato.png','20211216100102tomato2.jpeg','20211216100102tomato3.jpeg','','',8,55,0),(22,'Brinjal',48,495,'Touch & Taste: Brinjal is a round or oval-shaped vegetable which has a smooth green outer layer and cream-colored flesh is used along with the skin for dishes.\r\nNutrients: Eggplant/brinjal contains dietary fiber, carbohydrates, protein, iron, magnesium vitamin C, and vitamin B6.','20220111051906Brinjal1.png','20220111051906Brinjal2.png','20220111051906Brinjal3.png','','',8,48,0),(23,'Carrot',82,496,'Touch & Taste:Carrots are a smooth elongated vegetable with bright-orange color. It can be used raw or cooked for stews, soups, and salads.\r\n','20211216111406carrot1.jpeg','20211216111406carrot2.jpeg','20211216111406carrot3.jpeg','','',8,82,0),(24,'Red Capsicum',240,455,'Touch & Taste: Capsicum has four lobes and is shaped like a bell. Red capsicum is more mature and less hot compared to other capsicum varieties and used for salads, cooked or stir-fried dishes.\r\nNutrients: It contains vitamin C, iron, vitamin B6, magnesium, vitamin A, carbohydrates, and dietary fiber.','20211216111947capsicum_red.jpeg','20211216111947capsicum.jpeg','20211216111947capsicum2.jpeg','','',8,192,20),(25,'Pak choy',140,433,'Pak Choi is a chinese celery cabbage with crisp leaves and stalk. Its flavour is somewhat a mix of mild cabbage and spinach.','20211216112304pak_choy.png','20211216112304pakchoy1.jpeg','20211216112304pakchoy2.jpeg','','',8,140,0),(26,'Anchovy',139,98,'Anchovies are fish that belong to the kingdom Animalia and phylum Chordata. Their class is Actinopterygii and they come from order Clupeiformes. These small fishes belong to the family Engraulidae. They also go by the scientific name Engraulidae. However, different anchovy species have different scientific names to go by.','20211216115950anchovy.jpg','20211216115950anchovy1.jpeg','20211216115950anchovy2.jpeg','','',9,104,25),(27,'Black Pomfret',340,193,'The black pomfret has a slight \'fishy\' flavour, is slightly oily and has few bones. It is recommend for cooking to be steamed, poached, deep fried, pan fried, grilled, smoked, barbecued, pickled or served raw','20211216120458black_promfest.jpg','20211216120458blackpromfest2.jpeg','20211216120458black_promfret','','',9,340,0),(28,'Prawans',290,0,'Prawns contain vitamins and minerals like calcium, phosphorous, potassium, vitamin A, vitamin E, etc. They are packed with significant amounts of vitamin B12, B6 and niacin. They are also a rich source of iron that helps in boosting the production of red blood cells','20211216121001prawans3.jpeg','20211216121001prawans.jpg','20211216121001prawans4.jpeg','','',9,290,0),(29,'Grapes',220,399,'Velvety colored, deliciously sweet and juicy,black seedless grapes are individually handpicked everyday by our farmers and handled by very few, keeping the freshness intact. These are organically grown black grapes from the best farms.','20211222153551blackgrape_2.jpeg','20211222153551grapes1.jpg','20211222153551grapes2.jpg','','',7,220,0),(30,'Apple',294,461,'Touch & Taste: Red apples offer a creamy, soft feel in your mouth. The outer skin is bright red colored and heart-shaped. These are juicy sweet and the flesh is slightly yellowish and fat-free.\r\n\r\nNutrients: Red apples are a natural source of dietary fiber, antioxidants, poly nutrients, protein, vitamin A & C, and potassium.\r\n\r\n \r\n\r\nHealth Benefits: Eating red apples is incredibly good for your health. Nutrients in red apples lower the risk of many major diseases like diabetes, Alzheimer’s, cancer, etc. The soluble fiber content in apples provides gut health and promotes weight loss.','2021122215404620211209115543feature-8_Ooyv1uV.jpg','20211222154046redapple.jpg','20211222154046redapple2.png','','',7,294,0),(34,'Onion',62,0,'Onions are richer in antioxidants than other. High in Vitamin C, onions are a good source of dietary fiber, and folic acid. Onions also help to improve the functions of the digestive system; because it releases the digestive juices and cures any problem related to digestion.','20211231084544onion1.jpg','20211231084544onion2.png','20211231084544onion2.jpg','','',8,62,0),(35,'Pumpkin',35,299,'Every effort is made to maintain accuracy of all information. However, actual product, packaging, quantity, picture and ingredients may be different from the information provided on the App/Website.\r\nThus, it is recommended not to solely rely on the information presented.','20211231085416pumpkin1.png','20211231085416pumpkin2.jpeg','20211231085416pumpkin3.png','','',8,35,0),(36,'Ginger',45,200,'Farm Fresh Ginger (Adrak) contains Gingerol which is known for its medicinal value. While ginger can serve to be a solution for morning sickness, it helps to reduce muscle pain.','20211231085919ginger1.png','20211231085919ginger2.png','20211231085919ginger3.png','','',8,45,0),(37,'Mushroom',120,110,'Rich source of vitamins\r\nRaw mushrooms are naturally cholesterol, fat, and sodium free\r\nThey have anticancer benefits','20211231090211mushroom1.jpg','20211231090211mushroom2.jpg','20211231090211mushroom3.jpg','','',8,120,0),(38,'Dragon fruit',300,92,'\r\nDragon fruit is high in vitamin C and other antioxidants, which are good for your immune system. It can boost your iron levels. Iron is important for moving oxygen through your body and giving you energy, and dragon fruit has iron. And the vitamin C in dragon fruit helps your body take in and use the iron','20211231091840dragonfruit.jpg','20211231091840dragonfruit2.png','20211231091840dragonfruit3.png','','',7,300,0),(39,'Damson Plum',356,108,'The most important health benefits of damson plums include their ability to improve the digestive system, lower cholesterol, protect against heart disease, strengthen bones, increase energy, optimize sleeping patterns, decrease your risk of certain types of cancer, and boost the immune system.','20211231092224damson.jpeg','20211231092224damson2.png','20211231092224damson3.jpg','','',7,356,0),(40,'Gooseberry',56,99,' Gooseberries are rich in antioxidants, such as phytonutrients, and vitamins E and C, which may help protect your brain and fight aging, type 2 diabetes, cancer, and heart disease','20211231092706nellika.png','20211231092706nellika2.png','20211231092706nellika3.png','','',7,56,0),(41,'Lemon',40,438,'\r\nLemons contain a high amount of vitamin C, soluble fiber, and plant compounds that give them a number of health benefits. Lemons may aid weight loss and reduce your risk of heart disease, anemia, kidney stones, digestive issues, and cancer.','20211231093001lemon.png','20211231093001lemon2.png','20211231093002lemon3.png','','',7,40,0),(56,'Grapes',120,100,'Velvety colored, deliciously sweet and juicy,black seedless grapes are individually handpicked everyday by our farmers and handled by very few, keeping the freshness intact. These are organically grown black grapes from the best farms.','20220110084914Grapes1.png','20220110084914Grapes2.png','20220110084914Grapes3.png','','',7,120,0),(57,'Apple',150,450,'Touch & Taste: Red apples offer a creamy, soft feel in your mouth. The outer skin is bright red colored and heart-shaped. These are juicy sweet and the flesh is slightly yellowish and fat-free.\r\n\r\nNutrients: Red apples are a natural source of dietary fiber, antioxidants, poly nutrients, protein, vitamin A & C, and potassium.\r\n\r\n \r\n\r\nHealth Benefits: Eating red apples is incredibly good for your health. Nutrients in red apples lower the risk of many major diseases like diabetes, Alzheimer’s, cancer, etc. The soluble fiber content in apples provides gut health and promotes weight loss.','20220110085949Apple1.png','20220110085949Apple2.png','20220110085949Apple3.png','','',7,150,0),(58,'Damson Plum',360,110,'The most important health benefits of damson plums include their ability to improve the digestive system, lower cholesterol, protect against heart disease, strengthen bones, increase energy, optimize sleeping patterns, decrease your risk of certain types of cancer, and boost the immune system.','20220110090558Damson_Plum1.png','20220110090558Damson_Plum2.png','20220110090558Damson_Plum3.png','','',7,360,0),(59,'apple',12,110,'gjghjj','20220110091036apple1.png','20220110091036apple2.png','20220110091036apple3.png','','',7,12,0),(61,'Strawberry ',150,150,'Packed with vitamins, fiber, and particularly high levels of antioxidants known as polyphenols, strawberries are a sodium-free, fat-free, cholesterol-free, low-calorie food. They are among the top 20 fruits in antioxidant capacity and are a good source of manganese and potassium.','20220110130930Strawberry_1.png','20220110130930Strawberry_2.png','20220110130930Strawberry_3.png','','',7,150,0),(62,'Cherry',170,100,'\r\nCherries are low in calories and chock full of fiber, vitamins, minerals, nutrients, and other good-for-you ingredients. You\'ll get vitamins C, A, and K. Each long-stemmed fruit delivers potassium, magnesium, and calcium too. They also bring antioxidants, like beta-carotene, and the essential nutrient choline.','20220110131247Cherry1.png','20220110131247Cherry2.png','20220110131247Cherry3.png','','',7,170,0),(64,'Pineapple',90,110,'This popular fruit is packed with nutrients, antioxidants and other helpful compounds, such as enzymes that can fight inflammation and disease. Pineapple and its compounds have been linked to many health benefits, including aiding digestion, boosting immunity and speeding up recovery from surgery, among others.','20220110133402Pineapple1.png','20220110133402Pineapple2.png','20220110133402Pineapple3.png','','',7,90,0);
/*!40000 ALTER TABLE `products_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_wlist`
--

DROP TABLE IF EXISTS `products_wlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_wlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `products_id` int NOT NULL,
  `user_id` int NOT NULL,
  `guest_user` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_wlist_products_id_a7d960c0_fk_products_products_id` (`products_id`),
  KEY `products_wlist_user_id_a97cc093_fk_accounts_account_id` (`user_id`),
  CONSTRAINT `products_wlist_products_id_a7d960c0_fk_products_products_id` FOREIGN KEY (`products_id`) REFERENCES `products_products` (`id`),
  CONSTRAINT `products_wlist_user_id_a97cc093_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_wlist`
--

LOCK TABLES `products_wlist` WRITE;
/*!40000 ALTER TABLE `products_wlist` DISABLE KEYS */;
INSERT INTO `products_wlist` VALUES (83,29,4,'True'),(84,18,2,'True'),(114,17,16,'True'),(117,18,19,'True'),(118,27,16,'True'),(121,22,16,'True'),(122,26,16,'True'),(123,28,16,'True'),(124,19,16,'True'),(125,18,1,'<module \'accounts.guest_user\' from \'/home/akhil/Crossroads/main project/copy project/project1/accounts/guest_user.py\'>'),(126,19,1,'<module \'accounts.guest_user\' from \'/home/akhil/Crossroads/main project/copy project/project1/accounts/guest_user.py\'>'),(127,17,1,'<module \'accounts.guest_user\' from \'/home/akhil/Crossroads/main project/copy project/project1/accounts/guest_user.py\'>'),(128,29,1,'<module \'accounts.guest_user\' from \'/home/akhil/Crossroads/main project/copy project/project1/accounts/guest_user.py\'>'),(135,18,4,'True');
/*!40000 ALTER TABLE `products_wlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-12 19:26:54
