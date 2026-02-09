-- MySQL dump 10.13  Distrib 8.3.0, for macos12.6 (arm64)
--
-- Host: localhost    Database: adas_one
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `cato_settings`
--

DROP TABLE IF EXISTS `cato_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cato_settings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contractNo` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `connectionType` varchar(100) NOT NULL,
  `siteType` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `nativeNetworkRange` varchar(100) NOT NULL,
  `vlan` int NOT NULL,
  `country` varchar(100) NOT NULL,
  `countryCode` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `terminatedDate` datetime DEFAULT NULL,
  `creator` varchar(50) NOT NULL DEFAULT '',
  `updator` varchar(50) NOT NULL DEFAULT '',
  `deleter` varchar(50) NOT NULL DEFAULT '',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cato_settings`
--

LOCK TABLES `cato_settings` WRITE;
/*!40000 ALTER TABLE `cato_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cato_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloudflare_dns`
--

DROP TABLE IF EXISTS `cloudflare_dns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloudflare_dns` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contractNo` varchar(20) NOT NULL,
  `recordId` varchar(100) NOT NULL,
  `domainName` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `type` varchar(20) NOT NULL,
  `proxied` tinyint(1) DEFAULT '0',
  `ttl` int DEFAULT '1',
  `zone` varchar(100) NOT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `tags` text,
  `action` varchar(10) NOT NULL DEFAULT 'pass',
  `terminatedDate` datetime DEFAULT NULL,
  `blackIp` longtext,
  `whiteIp` longtext,
  `blockGeolocation` longtext,
  `geolocationType` varchar(20) DEFAULT NULL,
  `cacheOn` tinyint(1) NOT NULL DEFAULT '1',
  `browserTtlMode` varchar(50) DEFAULT NULL,
  `browserTtlDefault` int DEFAULT NULL,
  `edgeTtlMode` varchar(50) DEFAULT NULL,
  `edgeTtlDefault` int DEFAULT NULL,
  `creator` varchar(50) NOT NULL DEFAULT '',
  `updator` varchar(50) NOT NULL DEFAULT '',
  `deleter` varchar(50) NOT NULL DEFAULT '',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloudflare_dns`
--

LOCK TABLES `cloudflare_dns` WRITE;
/*!40000 ALTER TABLE `cloudflare_dns` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloudflare_dns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloudflare_zones`
--

DROP TABLE IF EXISTS `cloudflare_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloudflare_zones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `zone` varchar(100) NOT NULL,
  `contractNo` varchar(20) NOT NULL,
  `sensitivityLevel` varchar(10) NOT NULL DEFAULT 'default',
  `terminatedDate` datetime DEFAULT NULL,
  `creator` varchar(50) NOT NULL DEFAULT '',
  `updator` varchar(50) NOT NULL DEFAULT '',
  `deleter` varchar(50) NOT NULL DEFAULT '',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloudflare_zones`
--

LOCK TABLES `cloudflare_zones` WRITE;
/*!40000 ALTER TABLE `cloudflare_zones` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloudflare_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_resellers`
--

DROP TABLE IF EXISTS `contract_resellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_resellers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contractNo` varchar(20) NOT NULL,
  `userId` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `creator` varchar(50) NOT NULL DEFAULT '',
  `updator` varchar(50) NOT NULL DEFAULT '',
  `deleter` varchar(50) NOT NULL DEFAULT '',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_resellers`
--

LOCK TABLES `contract_resellers` WRITE;
/*!40000 ALTER TABLE `contract_resellers` DISABLE KEYS */;
INSERT INTO `contract_resellers` VALUES (1,'1234567890','reseller','reseller@gmail.com','2025-11-17 01:57:13',NULL,'','','',NULL,NULL,NULL);
/*!40000 ALTER TABLE `contract_resellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_users`
--

DROP TABLE IF EXISTS `contract_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contractNo` varchar(20) NOT NULL,
  `userId` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `creator` varchar(50) NOT NULL DEFAULT '',
  `updator` varchar(50) NOT NULL DEFAULT '',
  `deleter` varchar(50) NOT NULL DEFAULT '',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contract_users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_users`
--

LOCK TABLES `contract_users` WRITE;
/*!40000 ALTER TABLE `contract_users` DISABLE KEYS */;
INSERT INTO `contract_users` VALUES (1,'1234567890','user1','user1@gmail.com','','','',NULL,NULL,NULL);
/*!40000 ALTER TABLE `contract_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contractNo` varchar(20) NOT NULL,
  `plan` longtext NOT NULL,
  `price` int DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `serviceCount` int DEFAULT '0',
  `creator` varchar(50) NOT NULL DEFAULT '',
  `updator` varchar(50) NOT NULL DEFAULT '',
  `deleter` varchar(50) NOT NULL DEFAULT '',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contracts_contract_no` (`contractNo`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
INSERT INTO `contracts` VALUES (1,'1234567890','ALL',100000,'AAAA','2026-01-19 16:00:00','2026-01-26 16:00:00','ACTIVE',2,'','','','2025-11-17 01:57:13','2026-01-21 06:58:39',NULL);
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f5_waf_settings`
--

DROP TABLE IF EXISTS `f5_waf_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `f5_waf_settings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contractNo` varchar(20) NOT NULL,
  `domainName` varchar(100) NOT NULL,
  `virtualServerIp` varchar(100) NOT NULL,
  `nodeIp` varchar(100) NOT NULL,
  `ports` varchar(100) NOT NULL,
  `sslPorts` varchar(100) NOT NULL,
  `terminatedDate` datetime DEFAULT NULL,
  `creator` varchar(50) NOT NULL DEFAULT '',
  `updator` varchar(50) NOT NULL DEFAULT '',
  `deleter` varchar(50) NOT NULL DEFAULT '',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f5_waf_settings`
--

LOCK TABLES `f5_waf_settings` WRITE;
/*!40000 ALTER TABLE `f5_waf_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `f5_waf_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geolocation`
--

DROP TABLE IF EXISTS `geolocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geolocation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `country` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT '',
  `opsOnlyForDisallowed` tinyint(1) NOT NULL DEFAULT '0',
  `creator` varchar(50) NOT NULL DEFAULT '',
  `updator` varchar(50) NOT NULL DEFAULT '',
  `deleter` varchar(50) NOT NULL DEFAULT '',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geolocation`
--

LOCK TABLES `geolocation` WRITE;
/*!40000 ALTER TABLE `geolocation` DISABLE KEYS */;
INSERT INTO `geolocation` VALUES (1,'Afghanistan','AF','阿富汗',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:50',NULL),(2,'Åland Islands','AX','奧蘭群島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(3,'Albania','AL','阿爾巴尼亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(4,'Algeria','DZ','阿爾及利亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(5,'American Samoa','AS','美屬薩摩亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(6,'Andorra','AD','安道爾',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(7,'Angola','AO','安哥拉',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(8,'Anguilla','AI','安圭拉',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(9,'Antarctica','AQ','南極洲',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(10,'Antigua and Barbuda','AG','安地卡及巴布達',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(11,'Argentina','AR','阿根廷',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(12,'Armenia','AM','亞美尼亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(13,'Aruba','AW','阿魯巴',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(14,'Australia','AU','澳大利亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(15,'Austria','AT','奧地利',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(16,'Azerbaijan','AZ','亞塞拜然',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(17,'Bahamas','BS','巴哈馬',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(18,'Bahrain','BH','巴林',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(19,'Bangladesh','BD','孟加拉',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(20,'Barbados','BB','巴貝多',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(21,'Belarus','BY','白俄羅斯',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(22,'Belgium','BE','比利時',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(23,'Belize','BZ','貝里斯',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(24,'Benin','BJ','貝南',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(25,'Bermuda','BM','百慕達',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(26,'Bhutan','BT','不丹',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(27,'Bolivia','BO','玻利維亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(28,'Bonaire, Sint Eustatius and Saba','BQ','博奈爾、聖尤斯特歇斯與薩巴',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(29,'Bosnia and Herzegovina','BA','波士尼亞與赫塞哥維納',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(30,'Botswana','BW','波札那',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(31,'Bouvet Island','BV','布維島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(32,'Brazil','BR','巴西',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(33,'British Indian Ocean Territory','IO','英屬印度洋領地',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(34,'Brunei Darussalam','BN','汶萊',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(35,'Bulgaria','BG','保加利亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(36,'Burkina Faso','BF','布吉納法索',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(37,'Burundi','BI','蒲隆地',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(38,'Cabo Verde','CV','維德角',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(39,'Cambodia','KH','柬埔寨',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(40,'Cameroon','CM','喀麥隆',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(41,'Canada','CA','加拿大',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(42,'Cayman Islands','KY','開曼群島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(43,'Central African Republic','CF','中非共和國',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(44,'Chad','TD','查德',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(45,'Chile','CL','智利',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(46,'China','CN','中國',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(47,'Christmas Island','CX','聖誕島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(48,'Cocos (Keeling) Islands','CC','科科斯（基林）群島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(49,'Colombia','CO','哥倫比亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(50,'Comoros','KM','葛摩',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(51,'Congo','CG','剛果共和國',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(52,'Congo, The Democratic Republic of the','CD','剛果民主共和國',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(53,'Cook Islands','CK','庫克群島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(54,'Costa Rica','CR','哥斯大黎加',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(55,'Croatia','HR','克羅埃西亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(56,'Cuba','CU','古巴',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(57,'Curaçao','CW','庫拉索',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:51',NULL),(58,'Cyprus','CY','賽普勒斯',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(59,'Czechia','CZ','捷克',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(60,'Côte d\'Ivoire','CI','象牙海岸',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(61,'Denmark','DK','丹麥',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(62,'Djibouti','DJ','吉布地',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(63,'Dominica','DM','多米尼克',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(64,'Dominican Republic','DO','多明尼加',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(65,'Ecuador','EC','厄瓜多',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(66,'Egypt','EG','埃及',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(67,'El Salvador','SV','薩爾瓦多',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(68,'Equatorial Guinea','GQ','赤道幾內亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(69,'Eritrea','ER','厄利垂亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(70,'Estonia','EE','愛沙尼亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(71,'Eswatini','SZ','史瓦帝尼',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(72,'Ethiopia','ET','衣索比亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(73,'Falkland Islands (Malvinas)','FK','福克蘭群島（馬爾維納斯）	',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(74,'Faroe Islands','FO','法羅群島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(75,'Fiji','FJ','斐濟',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(76,'Finland','FI','芬蘭',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(77,'France','FR','法國',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(78,'French Guiana','GF','法屬圭亞那',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(79,'French Polynesia','PF','法屬波里尼西亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(80,'French Southern Territories','TF','法屬南部和南極領地',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(81,'Gabon','GA','加彭',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(82,'Gambia','GM','甘比亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(83,'Georgia','GE','喬治亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(84,'Germany','DE','德國',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(85,'Ghana','GH','迦納',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(86,'Gibraltar','GI','直布羅陀',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(87,'Greece','GR','希臘',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(88,'Greenland','GL','格陵蘭',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(89,'Grenada','GD','格瑞那達（格林納達）',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(90,'Guadeloupe','GP','瓜地洛普',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(91,'Guam','GU','關島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(92,'Guatemala','GT','瓜地馬拉',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(93,'Guernsey','GG','根西島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(94,'Guinea','GN','幾內亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(95,'Guinea-Bissau','GW','幾內亞比索',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(96,'Guyana','GY','蓋亞那',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(97,'Haiti','HT','海地',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(98,'Heard Island and McDonald Islands','HM','赫德島與麥當勞群島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(99,'Holy See (Vatican City State)','VA','教廷（梵蒂岡城國）',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(100,'Honduras','HN','宏都拉斯',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(101,'Hong Kong','HK','香港',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(102,'Hungary','HU','匈牙利',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(103,'Iceland','IS','冰島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(104,'India','IN','印度',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(105,'Indonesia','ID','印尼',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(106,'Iran, Islamic Republic of','IR','伊朗',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(107,'Iraq','IQ','伊拉克',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(108,'Ireland','IE','愛爾蘭',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(109,'Isle of Man','IM','曼島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(110,'Israel','IL','以色列',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(111,'Italy','IT','義大利',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(112,'Jamaica','JM','牙買加',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(113,'Japan','JP','日本',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(114,'Jersey','JE','澤西島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(115,'Jordan','JO','約旦',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(116,'Kazakhstan','KZ','哈薩克',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(117,'Kenya','KE','肯亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(118,'Kiribati','KI','吉里巴斯',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(119,'Korea, Democratic People\'s Republic of','KP','北韓',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(120,'Korea, Republic of','KR','南韓',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(121,'Kuwait','KW','科威特',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(122,'Kyrgyzstan','KG','吉爾吉斯',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(123,'Lao People\'s Democratic Republic','LA','寮國',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(124,'Latvia','LV','拉脫維亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(125,'Lebanon','LB','黎巴嫩',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(126,'Lesotho','LS','賴索托',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(127,'Liberia','LR','賴比瑞亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(128,'Libya','LY','利比亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(129,'Liechtenstein','LI','列支敦斯登',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(130,'Lithuania','LT','立陶宛',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(131,'Luxembourg','LU','盧森堡',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(132,'Macao','MO','澳門',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(133,'Madagascar','MG','馬達加斯加',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(134,'Malawi','MW','馬拉威',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(135,'Malaysia','MY','馬來西亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(136,'Maldives','MV','馬爾地夫',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(137,'Mali','ML','馬利',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(138,'Malta','MT','馬爾他',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(139,'Marshall Islands','MH','馬紹爾群島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(140,'Martinique','MQ','馬提尼克',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(141,'Mauritania','MR','茅利塔尼亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(142,'Mauritius','MU','模里西斯',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(143,'Mayotte','YT','馬約特',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(144,'Mexico','MX','墨西哥',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(145,'Micronesia, Federated States of','FM','密克羅尼西亞聯邦',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(146,'Moldova, Republic of','MD','摩爾多瓦',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(147,'Monaco','MC','摩納哥',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(148,'Mongolia','MN','蒙古',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(149,'Montenegro','ME','蒙特內哥羅',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(150,'Montserrat','MS','蒙特色拉特',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(151,'Morocco','MA','摩洛哥',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(152,'Mozambique','MZ','莫三比克',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(153,'Myanmar','MM','緬甸',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(154,'Namibia','NA','納米比亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(155,'Nauru','NR','諾魯',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(156,'Nepal','NP','尼泊爾',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(157,'Netherlands','NL','荷蘭',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(158,'New Caledonia','NC','新喀里多尼亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(159,'New Zealand','NZ','紐西蘭',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(160,'Nicaragua','NI','尼加拉瓜',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(161,'Niger','NE','尼日',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(162,'Nigeria','NG','奈及利亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(163,'Niue','NU','紐埃',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(164,'Norfolk Island','NF','諾福克島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(165,'North Macedonia','MK','北馬其頓',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(166,'Northern Mariana Islands','MP','北馬里亞納群島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(167,'Norway','NO','挪威',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(168,'Oman','OM','阿曼',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(169,'Pakistan','PK','巴基斯坦',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(170,'Palau','PW','帛琉',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(171,'Palestine, State of','PS','巴勒斯坦',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(172,'Panama','PA','巴拿馬',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(173,'Papua New Guinea','PG','巴布亞紐幾內亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(174,'Paraguay','PY','巴拉圭',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(175,'Peru','PE','秘魯',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(176,'Philippines','PH','菲律賓',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(177,'Pitcairn','PN','皮特凱恩群島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(178,'Poland','PL','波蘭',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(179,'Portugal','PT','葡萄牙',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(180,'Puerto Rico','PR','波多黎各',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(181,'Qatar','QA','卡達',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(182,'Romania','RO','羅馬尼亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(183,'Russian Federation','RU','俄羅斯',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(184,'Rwanda','RW','盧安達',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(185,'Réunion','RE','留尼旺',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(186,'Saint Barthélemy','BL','聖巴泰勒米島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(187,'Saint Helena, Ascension and Tristan da Cunha','SH','聖赫勒拿、阿森松與特里斯坦達庫尼亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(188,'Saint Kitts and Nevis','KN','聖基茨與尼維斯',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(189,'Saint Lucia','LC','聖露西亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(190,'Saint Martin (French part)','MF','聖馬丁（法屬部分）',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(191,'Saint Pierre and Miquelon','PM','聖皮埃爾和密克隆',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(192,'Saint Vincent and the Grenadines','VC','聖文森及格瑞那丁',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(193,'Samoa','WS','薩摩亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(194,'San Marino','SM','聖馬利諾',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(195,'Sao Tome and Principe','ST','聖多美和普林西比',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(196,'Saudi Arabia','SA','沙烏地阿拉伯',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(197,'Senegal','SN','塞內加爾',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(198,'Serbia','RS','塞爾維亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(199,'Seychelles','SC','塞舌爾',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(200,'Sierra Leone','SL','獅子山',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(201,'Singapore','SG','新加坡',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(202,'Sint Maarten (Dutch part)','SX','聖馬丁（荷屬部分）',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(203,'Slovakia','SK','斯洛伐克',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(204,'Slovenia','SI','斯洛維尼亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(205,'Solomon Islands','SB','所羅門群島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(206,'Somalia','SO','索馬利亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(207,'South Africa','ZA','南非',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(208,'South Georgia and the South Sandwich Islands','GS','南喬治亞島與南桑威奇群島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(209,'South Sudan','SS','南蘇丹',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(210,'Spain','ES','西班牙',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(211,'Sri Lanka','LK','斯里蘭卡',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(212,'Sudan','SD','蘇丹',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(213,'Suriname','SR','蘇利南',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(214,'Svalbard and Jan Mayen','SJ','斯瓦爾巴和揚馬延',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(215,'Sweden','SE','瑞典',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(216,'Switzerland','CH','瑞士',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(217,'Syrian Arab Republic','SY','敘利亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(218,'Taiwan','TW','台灣',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(219,'Tajikistan','TJ','塔吉克',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(220,'Tanzania, United Republic of','TZ','坦尚尼亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(221,'Thailand','TH','泰國',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(222,'Timor-Leste','TL','東帝汶',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(223,'Togo','TG','多哥',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(224,'Tokelau','TK','托克勞群島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(225,'Tonga','TO','東加',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(226,'Trinidad and Tobago','TT','千里達及托巴哥',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(227,'Tunisia','TN','突尼西亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(228,'Turkey','TR','土耳其',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(229,'Turkmenistan','TM','土庫曼',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(230,'Turks and Caicos Islands','TC','特克斯和凱科斯群島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(231,'Tuvalu','TV','圖瓦盧',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(232,'Uganda','UG','烏干達',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(233,'Ukraine','UA','烏克蘭',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(234,'United Arab Emirates','AE','阿聯',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(235,'United Kingdom','GB','英國',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(236,'United States','US','美國',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(237,'United States Minor Outlying Islands','UM','美國本土外小島嶼群',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(238,'Uruguay','UY','烏拉圭',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(239,'Uzbekistan','UZ','烏茲別克',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(240,'Vanuatu','VU','瓦努阿圖',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(241,'Venezuela, Bolivarian Republic of','VE','委內瑞拉',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(242,'Viet Nam','VN','越南',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(243,'Virgin Islands, British','VG','英屬維京群島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(244,'Virgin Islands, U.S.','VI','美屬維京群島',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(245,'Wallis and Futuna','WF','瓦利斯與富圖納',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(246,'Western Sahara','EH','西撒哈拉',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(247,'Yemen','YE','葉門',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(248,'Zambia','ZM','尚比亞',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL),(249,'Zimbabwe','ZW','辛巴威',0,'','','','2025-05-19 02:54:57','2025-07-25 08:02:52',NULL);
/*!40000 ALTER TABLE `geolocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userId` varchar(100) NOT NULL,
  `contractNo` varchar(20) DEFAULT NULL,
  `action` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `track` longtext,
  `creator` varchar(50) NOT NULL DEFAULT '',
  `updator` varchar(50) NOT NULL DEFAULT '',
  `deleter` varchar(50) NOT NULL DEFAULT '',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `permission_key` varchar(30) NOT NULL,
  `label` varchar(100) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `type` enum('management','reseller','user') DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `creator` varchar(50) NOT NULL DEFAULT '',
  `updator` varchar(50) NOT NULL DEFAULT '',
  `deleter` varchar(50) NOT NULL DEFAULT '',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (11,'users','用戶帳號管理','Account','reseller',NULL,'','','',NULL,NULL),(12,'resellers','經銷商帳號管理','Account','reseller',NULL,'','','',NULL,NULL),(13,'reseller_contract','訂單管理','Contract','reseller',NULL,'','','',NULL,NULL),(14,'plans','訂單方案管理','Contract','reseller',NULL,'','','',NULL,NULL),(15,'user_log','訂單操作歷史紀錄','Contract','reseller',NULL,'','','',NULL,NULL),(16,'account','用戶帳號管理','Account','user',NULL,'','','',NULL,NULL),(17,'dns_settings','DNS 設定','Cloudflare','user',NULL,'','','',NULL,NULL),(18,'waf_settings','WAF 設定','Cloudflare','user',NULL,'','','',NULL,NULL),(19,'ddos_settings','DDoS 設定','Cloudflare','user',NULL,'','','',NULL,NULL),(20,'cdn_settings','CDN 設定','Cloudflare','user',NULL,'','','',NULL,NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_services`
--

DROP TABLE IF EXISTS `plan_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_services` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `serviceId` varchar(100) NOT NULL,
  `serviceName` varchar(200) NOT NULL,
  `description` longtext,
  `creator` varchar(50) NOT NULL DEFAULT '',
  `updator` varchar(50) NOT NULL DEFAULT '',
  `deleter` varchar(50) NOT NULL DEFAULT '',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_services`
--

LOCK TABLES `plan_services` WRITE;
/*!40000 ALTER TABLE `plan_services` DISABLE KEYS */;
INSERT INTO `plan_services` VALUES (1,'across','ACross服務平台',NULL,'','','',NULL,NULL,NULL),(2,'dns','DNS轉址服務',NULL,'','','',NULL,NULL,NULL),(3,'waf','智能型WAF防護',NULL,'','','',NULL,NULL,NULL),(4,'l7_ddos','L7 DDoS防禦',NULL,'','','',NULL,NULL,NULL),(5,'cdn','CDN加速服務',NULL,'','','',NULL,NULL,NULL);
/*!40000 ALTER TABLE `plan_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plan_code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `module` varchar(45) DEFAULT NULL,
  `count` int DEFAULT NULL,
  `description` longtext,
  `price` int DEFAULT NULL,
  `creator` varchar(50) NOT NULL DEFAULT '',
  `updator` varchar(50) NOT NULL DEFAULT '',
  `deleter` varchar(50) NOT NULL DEFAULT '',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plans_plan_code` (`plan_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (1,'ALL','全包方案','across,waf,cdn,dns,l7_ddos',3,'ACross服務平台+DNS轉址服務+智能型WAF防護+L7 DDoS防禦+CDN加速服務',100000,'','','',NULL,'2026-01-20 06:54:20',NULL),(2,'PLAN_DISCOUNT','優惠方案','across,dns,waf',2,'ACross服務平台+DNS轉址服務+智能型WAF防護',50000,'','','','2026-01-20 06:34:26','2026-01-20 06:35:01',NULL);
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contractNo` varchar(20) DEFAULT NULL,
  `dashboardIds` longtext,
  `to` varchar(2000) DEFAULT NULL,
  `cc` varchar(2000) DEFAULT NULL,
  `bcc` varchar(2000) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `text` varchar(6000) DEFAULT NULL,
  `customDate` datetime DEFAULT NULL,
  `lastSent` datetime DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `creator` varchar(50) NOT NULL DEFAULT '',
  `updator` varchar(50) NOT NULL DEFAULT '',
  `deleter` varchar(50) NOT NULL DEFAULT '',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `roleId` int NOT NULL,
  `permissionId` int NOT NULL,
  `access_level` varchar(10) NOT NULL DEFAULT '0',
  `creator` varchar(50) NOT NULL DEFAULT '',
  `updator` varchar(50) NOT NULL DEFAULT '',
  `deleter` varchar(50) NOT NULL DEFAULT '',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
INSERT INTO `role_permissions` VALUES (61,14,16,'2','','','','2026-01-15 08:55:45','2026-01-15 08:57:05',NULL),(62,14,17,'2','','','','2026-01-15 08:55:45','2026-01-15 08:55:45',NULL),(63,14,18,'2','','','','2026-01-15 08:55:45','2026-01-15 08:55:45',NULL),(64,14,19,'2','','','','2026-01-15 08:55:45','2026-01-15 08:55:45',NULL),(65,14,20,'2','','','','2026-01-15 08:55:45','2026-01-15 08:55:45',NULL),(81,17,16,'0','','','','2026-01-16 02:02:55','2026-01-16 02:02:55',NULL),(82,17,17,'0','','','','2026-01-16 02:02:55','2026-01-23 05:54:59',NULL),(83,17,18,'1','','','','2026-01-16 02:02:55','2026-01-16 02:02:55',NULL),(84,17,19,'1','','','','2026-01-16 02:02:55','2026-01-16 02:02:55',NULL),(85,17,20,'1','','','','2026-01-16 02:02:55','2026-01-16 02:02:55',NULL),(86,18,11,'1','','','','2026-01-20 11:17:06','2026-01-20 11:17:06',NULL),(87,18,12,'0','','','','2026-01-20 11:17:06','2026-01-20 11:17:06',NULL),(88,18,13,'1','','','','2026-01-20 11:17:06','2026-01-20 11:17:06',NULL),(89,18,14,'1','','','','2026-01-20 11:17:06','2026-01-20 11:17:06',NULL),(90,18,15,'1','','','','2026-01-20 11:17:06','2026-01-20 11:17:06',NULL);
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `type` enum('management','reseller','user') NOT NULL,
  `description` longtext,
  `creator` varchar(50) NOT NULL DEFAULT '',
  `updator` varchar(50) NOT NULL DEFAULT '',
  `deleter` varchar(50) NOT NULL DEFAULT '',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','management','最高管理員','','','',NULL,NULL,NULL),(2,'admin','reseller','最高管理員','','','',NULL,NULL,NULL),(3,'admin','user','最高管理員','','','',NULL,NULL,NULL),(14,'manage','user','','','','','2026-01-15 08:55:45','2026-01-15 08:55:45',NULL),(17,'唯讀','user','','','','','2026-01-16 02:02:55','2026-01-16 02:02:55',NULL),(18,'readOnly','reseller','','','','','2026-01-20 11:17:06','2026-01-20 11:17:06',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SequelizeMeta`
--

DROP TABLE IF EXISTS `SequelizeMeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SequelizeMeta`
--

LOCK TABLES `SequelizeMeta` WRITE;
/*!40000 ALTER TABLE `SequelizeMeta` DISABLE KEYS */;
INSERT INTO `SequelizeMeta` VALUES ('20250711084821-create-user.js'),('20250716055540-create-contracts.js'),('20250716064330-create-plans.js'),('20250716064637-create-contract-resellers.js'),('20250716064815-create-contract-users.js'),('20250717064507-create-cloudflare-zones.js'),('20250717064705-create-cloudflare-dns.js'),('20250724084646-create-geolocation.js'),('20250804034228-zone-traffic.js'),('20250804093212-logs.js'),('20250811093514-create-reports.js'),('20250822085258-add-field-into-logs.js'),('20251022155158-create-f5-waf-settings.js'),('20251023060916-create-cato-settings.js'),('20251128092006-create-ticket.js.js'),('20260114060817-create-roles.js'),('20260114061110-create-permissions.js'),('20260114061227-create-role-permissions.js'),('20260114061227-role-permissions.js'),('20260120034426-create-plan-services.js');
/*!40000 ALTER TABLE `SequelizeMeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ticket_no` varchar(30) NOT NULL COMMENT '案件編號',
  `subject` varchar(255) NOT NULL COMMENT '主題，例如：我的db被鎖住',
  `description` longtext NOT NULL COMMENT '詳細描述內容',
  `severity` enum('LOW','MEDIUM','HIGH','CRITICAL') NOT NULL COMMENT '嚴重層級',
  `status` enum('PENDING','IN_PROGRESS','RESOLVED','CLOSED') NOT NULL DEFAULT 'PENDING' COMMENT '工單目前狀態',
  `contact_name` varchar(100) NOT NULL COMMENT '聯絡人名稱，例如 an',
  `account` varchar(200) NOT NULL COMMENT '登入的帳號，例如 an@gmail.com',
  `incident_date` date NOT NULL COMMENT '產生日（只有日期）',
  `last_action_date` date DEFAULT NULL COMMENT '更動日：最後處理日期（例如轉為處理中那一天）',
  `last_action_at` datetime DEFAULT NULL COMMENT '更動時間：最後處理時間（精確到秒）',
  `created_at` datetime DEFAULT NULL COMMENT '資料建立時間（工單建立時間／案件日期）',
  `updated_at` datetime DEFAULT NULL COMMENT '資料庫列最後變更時間（技術層，含維運修改）',
  `creator` varchar(50) NOT NULL DEFAULT '',
  `updator` varchar(50) NOT NULL DEFAULT '',
  `deleter` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userId` varchar(100) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `roleId` int NOT NULL,
  `creator` varchar(50) NOT NULL DEFAULT '',
  `updator` varchar(50) NOT NULL DEFAULT '',
  `deleter` varchar(50) NOT NULL DEFAULT '',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `resetPasswordExpires` datetime DEFAULT NULL,
  `lastPasswordReset` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'root','root@gmail.com','$2b$10$VCXKQawEUrWjKn0OfOgfRe4SS7mHgZRnoLj85RR0vPAX9ibDe5/DO','Twister5','管理員',NULL,'management',1,'','','',NULL,NULL,NULL,NULL,NULL,NULL),(2,'user1','user1@gmail.com','$2a$10$O/8jmrmlCcap6hn2duaqF.SJXIlysP/yVmg9ahG86dq3fCkRnFvw.','Twister5','Sharon',NULL,'user',3,'','user1','',NULL,'2026-01-19 10:03:44',NULL,NULL,NULL,'2026-01-19 09:55:29'),(3,'reseller','reseller@gmail.com','$2a$10$T/FvpOu6duxjah/tov7ugO0v0zBaRt6yEID6x1W7q0q5Rs5Ee/NiC','Twister5','reseller',NULL,'reseller',2,'','','','2025-08-05 04:06:30','2026-01-15 07:32:25',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone_traffic`
--

DROP TABLE IF EXISTS `zone_traffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zone_traffic` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `zone` varchar(100) NOT NULL,
  `requests` bigint DEFAULT NULL,
  `bytes` bigint DEFAULT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `creator` varchar(50) NOT NULL DEFAULT '',
  `updator` varchar(50) NOT NULL DEFAULT '',
  `deleter` varchar(50) NOT NULL DEFAULT '',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone_traffic`
--

LOCK TABLES `zone_traffic` WRITE;
/*!40000 ALTER TABLE `zone_traffic` DISABLE KEYS */;
/*!40000 ALTER TABLE `zone_traffic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-06 14:49:48
