CREATE DATABASE  IF NOT EXISTS `ch8` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ch8`;
-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: ch8
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
-- Table structure for table `ASSIGNMENT`
--

DROP TABLE IF EXISTS `ASSIGNMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSIGNMENT` (
  `ASSIGN_NUM` int NOT NULL,
  `ASSIGN_DATE` datetime DEFAULT NULL,
  `PROJ_NUM` varchar(3) DEFAULT NULL,
  `EMP_NUM` varchar(3) DEFAULT NULL,
  `ASSIGN_JOB` varchar(3) DEFAULT NULL,
  `ASSIGN_CHG_HR` decimal(8,2) DEFAULT NULL,
  `ASSIGN_HOURS` decimal(8,2) DEFAULT NULL,
  `ASSIGN_CHARGE` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ASSIGN_NUM`),
  KEY `PROJ_NUM` (`PROJ_NUM`),
  KEY `EMP_NUM` (`EMP_NUM`),
  CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`PROJ_NUM`) REFERENCES `PROJECT` (`PROJ_NUM`),
  CONSTRAINT `assignment_ibfk_2` FOREIGN KEY (`EMP_NUM`) REFERENCES `EMPLOYEE` (`EMP_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSIGNMENT`
--

LOCK TABLES `ASSIGNMENT` WRITE;
/*!40000 ALTER TABLE `ASSIGNMENT` DISABLE KEYS */;
INSERT INTO `ASSIGNMENT` VALUES (1001,'2018-03-22 00:00:00','18','103','503',84.50,3.50,295.75),(1002,'2018-03-22 00:00:00','22','117','509',34.55,4.20,145.11),(1003,'2018-03-22 00:00:00','18','117','509',34.55,2.00,69.10),(1004,'2018-03-22 00:00:00','18','103','503',84.50,5.90,498.55),(1005,'2018-03-22 00:00:00','25','108','501',96.75,2.20,212.85),(1006,'2018-03-22 00:00:00','22','104','501',96.75,4.20,406.35),(1007,'2018-03-22 00:00:00','25','113','508',50.75,3.80,192.85),(1008,'2018-03-22 00:00:00','18','103','503',84.50,0.90,76.05),(1009,'2018-03-23 00:00:00','15','115','501',96.75,5.60,541.80),(1010,'2018-03-23 00:00:00','15','117','509',34.55,2.40,82.92),(1011,'2018-03-23 00:00:00','25','105','502',105.00,4.30,451.50),(1012,'2018-03-23 00:00:00','18','108','501',96.75,3.40,328.95),(1013,'2018-03-23 00:00:00','25','115','501',96.75,2.00,193.50),(1014,'2018-03-23 00:00:00','22','104','501',96.75,2.80,270.90),(1015,'2018-03-23 00:00:00','15','103','503',84.50,6.10,515.45),(1016,'2018-03-23 00:00:00','22','105','502',105.00,4.70,493.50),(1017,'2018-03-23 00:00:00','18','117','509',34.55,3.80,131.29),(1018,'2018-03-23 00:00:00','25','117','509',34.55,2.20,76.01),(1019,'2018-03-24 00:00:00','25','104','501',110.50,4.90,541.45),(1020,'2018-03-24 00:00:00','15','101','502',125.00,3.10,387.50),(1021,'2018-03-24 00:00:00','22','108','501',110.50,2.70,298.35),(1022,'2018-03-24 00:00:00','22','115','501',110.50,4.90,541.45),(1023,'2018-03-24 00:00:00','22','105','502',125.00,3.50,437.50),(1024,'2018-03-24 00:00:00','15','103','503',84.50,3.30,278.85),(1025,'2018-03-24 00:00:00','18','117','509',34.55,4.20,145.11);
/*!40000 ALTER TABLE `ASSIGNMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMP_1`
--

DROP TABLE IF EXISTS `EMP_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMP_1` (
  `EMP_NUM` varchar(3) NOT NULL,
  `EMP_LNAME` varchar(15) NOT NULL,
  `EMP_FNAME` varchar(15) NOT NULL,
  `EMP_INITIAL` varchar(1) DEFAULT NULL,
  `EMP_HIRE_DATE` date DEFAULT NULL,
  `JOB_CODE` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`EMP_NUM`),
  KEY `JOB_CODE` (`JOB_CODE`),
  CONSTRAINT `emp_1_ibfk_1` FOREIGN KEY (`JOB_CODE`) REFERENCES `JOB` (`JOB_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMP_1`
--

LOCK TABLES `EMP_1` WRITE;
/*!40000 ALTER TABLE `EMP_1` DISABLE KEYS */;
INSERT INTO `EMP_1` VALUES ('101','News','John','G','2000-11-08','502'),('102','Senior','David','H','1989-07-12','501'),('103','Arbough','June','E','1996-12-01','500'),('104','Ramoras','Anne','K','1987-11-15','501'),('105','Johnson','Alice','K','1993-02-01','502'),('107','Alonzo','Maria','D','1993-10-10','501'),('108','Washington','Ralph','B','1991-08-22','501'),('109','Smith','Larry','W','1997-07-18','501');
/*!40000 ALTER TABLE `EMP_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMP_2`
--

DROP TABLE IF EXISTS `EMP_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMP_2` (
  `EMP_NUM` varchar(3) NOT NULL,
  `EMP_LNAME` varchar(15) NOT NULL,
  `EMP_FNAME` varchar(15) NOT NULL,
  `EMP_INITIAL` varchar(1) DEFAULT NULL,
  `EMP_HIRE_DATE` date DEFAULT NULL,
  `JOB_CODE` varchar(3) DEFAULT NULL,
  `EMP_PCT` decimal(4,2) DEFAULT NULL,
  `PROJ_NUM` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMP_2`
--

LOCK TABLES `EMP_2` WRITE;
/*!40000 ALTER TABLE `EMP_2` DISABLE KEYS */;
INSERT INTO `EMP_2` VALUES ('101','News','John','G','2000-11-08','502',5.00,'25'),('102','Senior','David','H','1989-07-12','501',10.00,'14'),('103','Arbough','June','E','1996-12-01','500',3.85,'18'),('104','Ramoras','Anne','K','1987-11-15','501',10.00,'14'),('105','Johnson','Alice','K','1993-02-01','502',5.00,'14'),('107','Alonzo','Maria','D','1993-10-10','501',5.15,'14'),('108','Washington','Ralph','B','1991-08-22','501',10.00,'14'),('109','Smith','Larry','W','1997-07-18','501',10.00,NULL);
/*!40000 ALTER TABLE `EMP_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE`
--

DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYEE` (
  `EMP_NUM` varchar(3) NOT NULL,
  `EMP_LNAME` varchar(15) DEFAULT NULL,
  `EMP_FNAME` varchar(15) DEFAULT NULL,
  `EMP_INITIAL` varchar(1) DEFAULT NULL,
  `EMP_HIREDATE` datetime DEFAULT NULL,
  `JOB_CODE` varchar(3) DEFAULT NULL,
  `EMP_YEARS` int DEFAULT NULL,
  PRIMARY KEY (`EMP_NUM`),
  KEY `JOB_CODE` (`JOB_CODE`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`JOB_CODE`) REFERENCES `JOB` (`JOB_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE`
--

LOCK TABLES `EMPLOYEE` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;
INSERT INTO `EMPLOYEE` VALUES ('101','News','John','G','2000-11-08 00:00:00','502',4),('102','Senior','David','H','1989-07-12 00:00:00','501',15),('103','Arbough','June','E','1996-12-01 00:00:00','500',8),('104','Ramoras','Anne','K','1987-11-15 00:00:00','501',17),('105','Johnson','Alice','K','1993-02-01 00:00:00','502',12),('106','Smithfield','William',NULL,'2004-06-22 00:00:00','500',0),('107','Alonzo','Maria','D','1993-10-10 00:00:00','500',11),('108','Washington','Ralph','B','1991-08-22 00:00:00','501',13),('109','Smith','Larry','W','1997-07-18 00:00:00','501',7),('110','Olenko','Gerald','A','1995-12-11 00:00:00','505',9),('111','Wabash','Geoff','B','1991-04-04 00:00:00','506',14),('112','Smithson','Darlene','M','1994-10-23 00:00:00','507',10),('113','Joenbrood','Delbert','K','1996-11-15 00:00:00','508',8),('114','Jones','Annelise',NULL,'1993-08-20 00:00:00','508',11),('115','Bawangi','Travis','B','1992-01-25 00:00:00','501',13),('116','Pratt','Gerald','L','1997-03-05 00:00:00','510',8),('117','Williamson','Angie','H','1996-06-19 00:00:00','509',8),('118','Frommer','James','J','2005-01-04 00:00:00','510',0);
/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JOB`
--

DROP TABLE IF EXISTS `JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JOB` (
  `JOB_CODE` varchar(3) NOT NULL,
  `JOB_DESCRIPTION` varchar(25) DEFAULT NULL,
  `JOB_CHG_HOUR` decimal(8,2) DEFAULT NULL,
  `JOB_LAST_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`JOB_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JOB`
--

LOCK TABLES `JOB` WRITE;
/*!40000 ALTER TABLE `JOB` DISABLE KEYS */;
INSERT INTO `JOB` VALUES ('500','Programmer',35.75,'2017-11-20 00:00:00'),('501','Systems Analyst',96.75,'2017-11-20 00:00:00'),('502','Database Designer',125.00,'2018-03-24 00:00:00'),('503','Electrical Engineer',84.50,'2017-11-20 00:00:00'),('504','Mechanical Engineer',67.90,'2017-11-20 00:00:00'),('505','Civil Engineer',55.78,'2017-11-20 00:00:00'),('506','Clerical Support',26.87,'2017-11-20 00:00:00'),('507','DSS Analyst',45.95,'2017-11-20 00:00:00'),('508','Applications Designer',48.10,'2018-03-24 00:00:00'),('509','Bio Technician',34.55,'2017-11-20 00:00:00'),('510','General Support',18.36,'2017-11-20 00:00:00');
/*!40000 ALTER TABLE `JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJECT`
--

DROP TABLE IF EXISTS `PROJECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROJECT` (
  `PROJ_NUM` varchar(3) NOT NULL,
  `PROJ_NAME` varchar(25) DEFAULT NULL,
  `PROJ_VALUE` decimal(14,2) DEFAULT NULL,
  `PROJ_BALANCE` decimal(14,2) DEFAULT NULL,
  `EMP_NUM` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`PROJ_NUM`),
  KEY `EMP_NUM` (`EMP_NUM`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`EMP_NUM`) REFERENCES `EMPLOYEE` (`EMP_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECT`
--

LOCK TABLES `PROJECT` WRITE;
/*!40000 ALTER TABLE `PROJECT` DISABLE KEYS */;
INSERT INTO `PROJECT` VALUES ('15','Evergreen',1453500.00,1002350.00,'103'),('18','Amber Wave',3500500.00,2110346.00,'108'),('22','Rolling Tide',805000.00,500345.20,'102'),('25','Starflight',2650500.00,2309880.00,'107');
/*!40000 ALTER TABLE `PROJECT` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-20  1:13:31
