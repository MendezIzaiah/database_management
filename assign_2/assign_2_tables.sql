-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: ch07_saleco_mysql_demo_test
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOMER` (
  `CUS_CODE` int NOT NULL,
  `CUS_LNAME` varchar(15) NOT NULL,
  `CUS_FNAME` varchar(15) NOT NULL,
  `CUS_INITIAL` char(1) DEFAULT NULL,
  `CUS_AREACODE` char(3) DEFAULT NULL,
  `CUS_PHONE` char(8) NOT NULL,
  `CUS_BALANCE` decimal(9,2) DEFAULT '0.00',
  PRIMARY KEY (`CUS_CODE`),
  UNIQUE KEY `CUS_UI1` (`CUS_LNAME`,`CUS_FNAME`,`CUS_PHONE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMP`
--

DROP TABLE IF EXISTS `EMP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMP` (
  `EMP_NUM` int NOT NULL,
  `EMP_TITLE` char(10) DEFAULT NULL,
  `EMP_LNAME` varchar(15) NOT NULL,
  `EMP_FNAME` varchar(15) NOT NULL,
  `EMP_INITIAL` char(1) DEFAULT NULL,
  `EMP_DOB` datetime DEFAULT NULL,
  `EMP_HIRE_DATE` datetime DEFAULT NULL,
  `EMP_AREACODE` char(3) DEFAULT NULL,
  `EMP_PHONE` char(8) DEFAULT NULL,
  `EMP_MGR` int DEFAULT NULL,
  PRIMARY KEY (`EMP_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMP`
--

LOCK TABLES `EMP` WRITE;
/*!40000 ALTER TABLE `EMP` DISABLE KEYS */;
/*!40000 ALTER TABLE `EMP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE`
--

DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYEE` (
  `EMP_NUM` int NOT NULL,
  `EMP_TITLE` char(10) DEFAULT NULL,
  `EMP_LNAME` varchar(15) NOT NULL,
  `EMP_FNAME` varchar(15) NOT NULL,
  `EMP_INITIAL` char(1) DEFAULT NULL,
  `EMP_DOB` datetime DEFAULT NULL,
  `EMP_HIRE_DATE` datetime DEFAULT NULL,
  `EMP_YEARS` int DEFAULT NULL,
  `EMP_AREACODE` char(3) DEFAULT NULL,
  `EMP_PHONE` char(8) DEFAULT NULL,
  PRIMARY KEY (`EMP_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE`
--

LOCK TABLES `EMPLOYEE` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;
/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INVOICE`
--

DROP TABLE IF EXISTS `INVOICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INVOICE` (
  `INV_NUMBER` int NOT NULL,
  `CUS_CODE` int NOT NULL,
  `INV_DATE` datetime NOT NULL,
  PRIMARY KEY (`INV_NUMBER`),
  KEY `INVOICE_CUS_CODE_FK` (`CUS_CODE`),
  CONSTRAINT `INVOICE_CUS_CODE_FK` FOREIGN KEY (`CUS_CODE`) REFERENCES `CUSTOMER` (`CUS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVOICE`
--

LOCK TABLES `INVOICE` WRITE;
/*!40000 ALTER TABLE `INVOICE` DISABLE KEYS */;
/*!40000 ALTER TABLE `INVOICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LINE`
--

DROP TABLE IF EXISTS `LINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LINE` (
  `INV_NUMBER` int NOT NULL,
  `LINE_NUMBER` decimal(2,0) NOT NULL,
  `P_CODE` varchar(10) NOT NULL,
  `LINE_UNITS` decimal(9,2) NOT NULL DEFAULT '0.00',
  `LINE_PRICE` decimal(9,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`INV_NUMBER`,`LINE_NUMBER`),
  UNIQUE KEY `LINE_UI1` (`INV_NUMBER`,`P_CODE`),
  KEY `P_CODE` (`P_CODE`),
  CONSTRAINT `line_ibfk_1` FOREIGN KEY (`INV_NUMBER`) REFERENCES `INVOICE` (`INV_NUMBER`) ON DELETE CASCADE,
  CONSTRAINT `line_ibfk_2` FOREIGN KEY (`P_CODE`) REFERENCES `PRODUCT` (`P_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LINE`
--

LOCK TABLES `LINE` WRITE;
/*!40000 ALTER TABLE `LINE` DISABLE KEYS */;
/*!40000 ALTER TABLE `LINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT`
--

DROP TABLE IF EXISTS `PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUCT` (
  `P_CODE` varchar(10) NOT NULL,
  `P_DESCRIPT` varchar(35) NOT NULL,
  `P_INDATE` datetime NOT NULL,
  `P_QOH` int NOT NULL,
  `P_MIN` int NOT NULL,
  `P_PRICE` decimal(8,2) NOT NULL,
  `P_DISCOUNT` decimal(4,2) NOT NULL,
  `V_CODE` int DEFAULT NULL,
  PRIMARY KEY (`P_CODE`),
  KEY `PRODUCT_V_CODE_FK` (`V_CODE`),
  CONSTRAINT `PRODUCT_V_CODE_FK` FOREIGN KEY (`V_CODE`) REFERENCES `VENDOR` (`V_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT`
--

LOCK TABLES `PRODUCT` WRITE;
/*!40000 ALTER TABLE `PRODUCT` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VENDOR`
--

DROP TABLE IF EXISTS `VENDOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VENDOR` (
  `V_CODE` int NOT NULL,
  `V_NAME` varchar(35) NOT NULL,
  `V_CONTACT` varchar(15) NOT NULL,
  `V_AREACODE` char(3) NOT NULL,
  `V_PHONE` char(8) NOT NULL,
  `V_STATE` char(2) NOT NULL,
  `V_ORDER` char(1) NOT NULL,
  PRIMARY KEY (`V_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VENDOR`
--

LOCK TABLES `VENDOR` WRITE;
/*!40000 ALTER TABLE `VENDOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `VENDOR` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-25 21:28:09
