-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: newspaper
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `delarea`
--

DROP TABLE IF EXISTS `delarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `delarea` (
  `idDelArea` int(11) NOT NULL AUTO_INCREMENT,
  `DelAreaName` varchar(45) DEFAULT NULL,
  `DelAreaPerson` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDelArea`),
  KEY `idUser_idx` (`DelAreaPerson`),
  CONSTRAINT `idUser_fk` FOREIGN KEY (`DelAreaPerson`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delarea`
--

LOCK TABLES `delarea` WRITE;
/*!40000 ALTER TABLE `delarea` DISABLE KEYS */;
/*!40000 ALTER TABLE `delarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `delivery` (
  `idDelivery` int(11) NOT NULL AUTO_INCREMENT,
  `idOrder` int(11) DEFAULT NULL,
  `DeliveryDate` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `idProduct` int(11) DEFAULT NULL,
  `idDelArea` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDelivery`),
  KEY `idOrder_idx` (`idOrder`),
  KEY `idProduct_idx` (`idProduct`),
  KEY `idDelArea_idx` (`idDelArea`),
  CONSTRAINT `idDelArea` FOREIGN KEY (`idDelArea`) REFERENCES `delarea` (`idDelArea`),
  CONSTRAINT `idOrder` FOREIGN KEY (`idOrder`) REFERENCES `order` (`idOrder`),
  CONSTRAINT `idProduct` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `invoice` (
  `idInvoice` int(11) NOT NULL AUTO_INCREMENT,
  `InvoiceUserId` int(11) DEFAULT NULL,
  `InvoiceOrder` int(11) DEFAULT NULL,
  `InvoiceDate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idInvoice`),
  KEY `idUser_idx` (`InvoiceUserId`),
  CONSTRAINT `Customer` FOREIGN KEY (`InvoiceUserId`) REFERENCES `user` (`idUser`),
  CONSTRAINT `Order` FOREIGN KEY (`idInvoice`) REFERENCES `order` (`idOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order` (
  `idOrder` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `OrderStart` varchar(45) NOT NULL,
  `OrderSuspend` varchar(45) DEFAULT NULL,
  `OrderFrequency` varchar(45) NOT NULL,
  `idProduct` varchar(200) NOT NULL,
  `PaidStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idOrder`),
  KEY `Customer_fk_idx` (`idUser`),
  CONSTRAINT `Customer_fk` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `idProduct` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(45) NOT NULL,
  `ProductPrice` varchar(45) NOT NULL,
  PRIMARY KEY (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(45) NOT NULL,
  `UserEmail` varchar(45) NOT NULL,
  `UserMobile` varchar(45) NOT NULL,
  `UserPass` binary(64) DEFAULT NULL,
  `UserType` varchar(45) NOT NULL,
  `UserAddress` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Admin','admin@admin.com','0000000000',_binary '$2a$12$q3BBGGOH1sfXNq8jyI0mjOr7G25YjltaBl8KHVVEEpkKWEtqsLpMm\0\0\0\0','admin',''),(2,'Shubham','shubham@gmail.com','987654321',_binary '$2a$12$c.pV6wLlp.ImOVGcH.emGOnFAO.DqFjL2yby5jEKFqt0M9uXTvLFK\0\0\0\0','customer','12 Willow'),(3,'Tarun','tarun@gmail.com','0894444054',_binary '$2a$12$q8f37SlLuPKXQ1E/WCY/peKqCr/hKkpjakSy9P5TI3CFMh0DQlqzK\0\0\0\0','delivery','Thornbury Drive'),(4,'Meet','meet@gmail.com','9876543210',_binary '$2a$12$ZQEHIyvf3zlEvk42wqVaD.Zg/u3ymCXf6pRVM5KyTxO6Yrd3gC0z2\0\0\0\0','manager','Croi Oige'),(9,'Simon','simon@mail.com','9823412345',_binary '$2a$12$4nzg/cfBIRzhJI4nlp5Pn.T61pHjPq7md12RROj6Vx.jpXfd7v0Ae\0\0\0\0','customer','12 Willow'),(10,'Shubham','sj@gmail.com','0894444051',_binary '$2a$12$i6cbBpmUIbkJcDoef6jRjeKyY6RsH2mQoiTaJXLVQIBmNZhQzql3S\0\0\0\0','storemanager','12 Willow'),(11,'null','null','null',_binary '$2a$12$Hd6laFQQa4Tb/8yx9vukYuE1FrgkINjru6MGCyoOvKGSXHgc7wolq\0\0\0\0','null','null'),(12,'null','null','null',_binary '$2a$12$WM1vBCLFcVHrRNDGmeoVduxPJvkayExG8mpc/tjV3kX7O0pUt7t06\0\0\0\0','null','null'),(13,'null','null','null',_binary '$2a$12$PoNwdizG6ffr..jK7og3XOXMWoybMTl2f5OZXcR28xTcBojkYGzIi\0\0\0\0','null','null'),(14,'Shubham','shubham@gmail.com','987654321',_binary '$2a$12$lcWmnJuHhe0bVjWqwFFNr.QYIzntKIPb20HR7woa2ewtRPSkN/vaq\0\0\0\0','customer','12 Willow');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-25 16:34:05
