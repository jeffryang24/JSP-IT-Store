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
-- Table structure for table `BJ_Cart`
--

DROP TABLE IF EXISTS `BJ_Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BJ_Cart` (
  `BJ_cartID` varchar(50) NOT NULL,
  `BJ_cartProductID` varchar(50) NOT NULL,
  `BJ_cartUserID` varchar(50) NOT NULL,
  `BJ_cartQty` int(11) DEFAULT NULL,
  `BJ_cartSubPrice` int(11) DEFAULT NULL,
  `BJ_cartStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`BJ_cartID`,`BJ_cartProductID`,`BJ_cartUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BJ_Cart`
--

LOCK TABLES `BJ_Cart` WRITE;
/*!40000 ALTER TABLE `BJ_Cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `BJ_Cart` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Table structure for table `BJ_Product`
--

DROP TABLE IF EXISTS `BJ_Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BJ_Product` (
  `BJ_productID` varchar(50) NOT NULL,
  `BJ_productName` varchar(150) DEFAULT NULL,
  `BJ_productImage` varchar(150) DEFAULT NULL,
  `BJ_productPrice` int(11) DEFAULT NULL,
  `BJ_productStock` int(11) DEFAULT NULL,
  `BJ_productDesc` text,
  `BJ_productStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`BJ_productID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BJ_Product`
--

LOCK TABLES `BJ_Product` WRITE;
/*!40000 ALTER TABLE `BJ_Product` DISABLE KEYS */;
INSERT INTO `BJ_Product` VALUES ('PR001','Cooler Master IC Essential E2 Thermal Compound','/assets/images/icessentiale2.jpg',95000,9,'Best quality thermal compound from Cooler Master',1),('PR002','Corsair DDR4 Vengeance LPX PC19200 8GB','/assets/images/corsairvengeance.png',735000,0,'High performance DDR4 RAM',1),('PR003','Logitech G403 Gaming Mice','/assets/images/g403mice.png',1335000,2,'Change your mouse now! Logitech G403 is back!',1),('PR004','nVidia GeForce GTX 1080 8 GB GDDR5X - Founder Edition','/assets/images/gtx1080.png',10000000,3,'NVidia new Pascal architecture GTX 10 series!',1),('PR005','ROG SWIFT PG278Q','/assets/images/rogmonitor.png',10000000,6,'ROG Swift PG278Q 27\'\', G-SYNC',1),('PR006','Samsung SSD 850 EVO M.2 500 GB','/assets/images/ssd850m2500g.png',2300000,7,'First 3D VNAND Technology SSD',1),('PR007','Samsung 950 PRO NVMe M.2 SSD 512 GB','/assets/images/ssd950pro512.png',4180000,5,'First 3D VNAND Technology SSD with PCI-E 3.0',1),('PR008','Aorus X7 DT v6','/assets/uploaded_images/aorusx7v6.png',10000000,15,'World\'s Most Powerful 17.3\'\' Laptop',1),('PR009','Aorus X3 v6','/assets/uploaded_images/aorusx3v6.png',10000000,10,'World\'s Most Powerful 13.9\'\' Laptop',1),('PR010','HP Spectre','/assets/uploaded_images/hpspectre.jpg',8750000,5,'HP Spectre Gold Edition',1),('PR011','Dell Pandora 15','/assets/uploaded_images/dellpandora15.jpg',10000000,3,'Dell Pandora - Inspiron 7559',1),('PR012','Dell XPS 13','/assets/uploaded_images/newxps13.jpg',9780000,5,'New Dell XPS 13',1),('PR013','Alienware 13','/assets/uploaded_images/newalienware13.jpg',9950000,3,'New Alienware 13 - New Design',1);
/*!40000 ALTER TABLE `BJ_Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BJ_Review`
--

DROP TABLE IF EXISTS `BJ_Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BJ_Review` (
  `BJ_reviewID` varchar(50) NOT NULL,
  `BJ_reviewerID` varchar(50) NOT NULL,
  `BJ_productID` varchar(50) NOT NULL,
  `BJ_reviewDesc` text,
  PRIMARY KEY (`BJ_reviewID`,`BJ_reviewerID`,`BJ_productID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BJ_Review`
--

LOCK TABLES `BJ_Review` WRITE;
/*!40000 ALTER TABLE `BJ_Review` DISABLE KEYS */;
INSERT INTO `BJ_Review` VALUES ('1481099572031','US002','PR006','Kenceng sekali!!!'),('1481104098372','US001','PR006','Iklan gak bohong!!!'),('1481172956088','US001','PR014','Aorus is coming to Indonesia!!!'),('1481180853100','US001','PR005','GSync Bro!!! ');
/*!40000 ALTER TABLE `BJ_Review` ENABLE KEYS */;
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

--
-- Table structure for table `BJ_TransactionDetail`
--

DROP TABLE IF EXISTS `BJ_TransactionDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BJ_TransactionDetail` (
  `BJ_transID` int(11) NOT NULL,
  `BJ_transProductID` varchar(50) NOT NULL,
  `BJ_transProductQty` int(11) DEFAULT NULL,
  PRIMARY KEY (`BJ_transID`,`BJ_transProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BJ_TransactionDetail`
--

LOCK TABLES `BJ_TransactionDetail` WRITE;
/*!40000 ALTER TABLE `BJ_TransactionDetail` DISABLE KEYS */;
INSERT INTO `BJ_TransactionDetail` VALUES (1,'PR002',3),(1,'PR013',2);
/*!40000 ALTER TABLE `BJ_TransactionDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BJ_TransactionHeader`
--

DROP TABLE IF EXISTS `BJ_TransactionHeader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BJ_TransactionHeader` (
  `BJ_transID` int(11) NOT NULL,
  `BJ_transDate` datetime DEFAULT NULL,
  `BJ_transUserID` varchar(45) NOT NULL,
  `BJ_transStatusID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BJ_transID`,`BJ_transUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BJ_TransactionHeader`
--

LOCK TABLES `BJ_TransactionHeader` WRITE;
/*!40000 ALTER TABLE `BJ_TransactionHeader` DISABLE KEYS */;
INSERT INTO `BJ_TransactionHeader` VALUES (1,'2016-12-12 16:47:50','US001','1');
/*!40000 ALTER TABLE `BJ_TransactionHeader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BJ_TransactionStatus`
--

DROP TABLE IF EXISTS `BJ_TransactionStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BJ_TransactionStatus` (
  `BJ_transStatusID` int(11) NOT NULL,
  `BJ_transStatusDesc` varchar(50) DEFAULT NULL,
  `BJ_transStatusName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BJ_transStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BJ_TransactionStatus`
--

LOCK TABLES `BJ_TransactionStatus` WRITE;
/*!40000 ALTER TABLE `BJ_TransactionStatus` DISABLE KEYS */;
INSERT INTO `BJ_TransactionStatus` VALUES (1,'Pending','pending'),(2,'Approved','approved'),(3,'Expired','expired');
/*!40000 ALTER TABLE `BJ_TransactionStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BJ_User`
--

DROP TABLE IF EXISTS `BJ_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BJ_User` (
  `BJ_userID` varchar(50) NOT NULL COMMENT '	',
  `BJ_userName` varchar(20) DEFAULT NULL,
  `BJ_userPWD` varchar(50) DEFAULT NULL,
  `BJ_userFullName` varchar(50) DEFAULT NULL,
  `BJ_userPhone` varchar(20) DEFAULT NULL,
  `BJ_userAddr` varchar(50) DEFAULT NULL,
  `BJ_userEmail` varchar(50) DEFAULT NULL,
  `BJ_userRole` int(11) DEFAULT NULL,
  `BJ_userStatus` int(11) DEFAULT NULL,
  `BJ_userRegisterDate` datetime DEFAULT NULL,
  PRIMARY KEY (`BJ_userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BJ_User`
--

LOCK TABLES `BJ_User` WRITE;
/*!40000 ALTER TABLE `BJ_User` DISABLE KEYS */;
INSERT INTO `BJ_User` VALUES ('US001','jeffryang24','jeffryang24','Jeffry Angtoni','081919666603','Budi Raya Street','jeffryangtoni24@gmail.com',2,1,'2016-12-03 17:20:33'),('US002','johnny12','johnny','Johnny McMahon','08776655442','Huta Ni Roha Street','johnny.kalbe@hutaniroha.co.id',2,1,'2016-12-03 18:02:24'),('US003','admin','administrator','Administrator','081919666603','Budi Raya Street','admin@bjkomputer.com',1,1,'2016-12-05 17:50:35'),('US004','admin2','administrator','Staff Administrator','081919666603','Budi Raya Street','admin2@bjkomputer.com',2,1,'2016-12-11 21:53:54');
/*!40000 ALTER TABLE `BJ_User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-12 16:48:59
