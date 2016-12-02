CREATE DATABASE  IF NOT EXISTS `BJKomputer` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `BJKomputer`;
-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: BJKomputer
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.04.1

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
-- Table structure for table `BJ_Menu`
--

DROP TABLE IF EXISTS `BJ_Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BJ_Menu` (
  `BJ_menuID` int(11) NOT NULL,
  `BJ_menuName` varchar(50) DEFAULT NULL,
  `BJ_menuLink` varchar(50) DEFAULT NULL,
  `BJ_menuRoleID` int(11) NOT NULL,
  `BJ_menuStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`BJ_menuID`,`BJ_menuRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BJ_Menu`
--

LOCK TABLES `BJ_Menu` WRITE;
/*!40000 ALTER TABLE `BJ_Menu` DISABLE KEYS */;
INSERT INTO `BJ_Menu` VALUES (1,'Home','index.jsp',1,1),(2,'Product','pages/product.jsp',1,1),(3,'Member','pages/member.jsp',1,1),(4,'Transaction','pages/transaction.jsp',1,1),(5,'Home','index.jsp',2,1),(6,'Product','pages/product.jsp',2,1),(7,'Profile','pages/profile.jsp',2,1),(8,'Cart','pages/cart.jsp',2,1),(9,'Transaction','pages/transaction.jsp',2,1),(10,'Home','index.jsp',3,1),(11,'Product','pages/product.jsp',3,1);
/*!40000 ALTER TABLE `BJ_Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BJ_Role`
--

DROP TABLE IF EXISTS `BJ_Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BJ_Role` (
  `BJ_roleID` int(11) NOT NULL,
  `BJ_roleName` varchar(50) DEFAULT NULL,
  `BJ_roleDescription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BJ_roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BJ_Role`
--

LOCK TABLES `BJ_Role` WRITE;
/*!40000 ALTER TABLE `BJ_Role` DISABLE KEYS */;
INSERT INTO `BJ_Role` VALUES (1,'admin','Admin'),(2,'member','Member'),(3,'guest','Guest');
/*!40000 ALTER TABLE `BJ_Role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-02 21:04:16
