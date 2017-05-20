-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: crm
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `ccode` varchar(6) NOT NULL,
  `cname` varchar(30) DEFAULT NULL,
  `credits` decimal(10,0) DEFAULT NULL,
  `dno` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ccode`),
  KEY `dno` (`dno`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `department` (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('CSE115','Digital Logics',3,2),('CSE120','Data Mining',4,2),('CSE125','Cloud Computing',3,2),('CSE145','Data Structure & Design',3,2),('CSE152','Programming with C',3,2),('ECE102','Basic Communication System',3,5),('ECE105','Modern Physics',4,5),('ECE110','Wireless Communication',3,5),('ECE115','Electric Circuit Design',3,5),('ECE125','Circuit Management & Design',3,5),('EEE101','Basic Electrical Machine',3,4),('EEE105','Digital Electronics',4,4),('EEE110','Electric Circuit & Design',3,4),('EEE120','Power Sources',3,4),('EEE125','Induction & Register Design',3,4),('SWE101','Programming in C',3,1),('SWE102','Programming in C++',4,1),('SWE103','Programming in Java',4,1),('SWE105','Android ',4,1),('SWE108','Internet Of Things',4,1),('SWE150','Big Data Analysis',3,3),('SWE155','Database Management',3,3),('SWE160','Object Design & Analysis',4,3),('SWE188','IOS Development',3,3),('SWE521','Web Development',4,3);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dno` decimal(10,0) NOT NULL,
  `dept` varchar(10) DEFAULT NULL,
  `school` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'MSSE','SCSE'),(2,'CSE','SCSE'),(3,'MCA','SCSE'),(4,'EEE','SENSE'),(5,'ECE','SENSE');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `fid` varchar(6) NOT NULL,
  `ccode` varchar(6) NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  `dno` decimal(10,0) DEFAULT NULL,
  `slot` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`fid`,`ccode`),
  KEY `dno` (`dno`),
  KEY `faculty_ibfk_2` (`ccode`),
  CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `department` (`dno`),
  CONSTRAINT `faculty_ibfk_2` FOREIGN KEY (`ccode`) REFERENCES `course` (`ccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES ('111','SWE101','Ram',1,'A1'),('112','SWE101','Yogesh',1,'A1'),('113','SWE101','Sundar',1,'A2'),('114','CSE125','Justin',1,'E2'),('114','SWE102','Justin ',1,'B2'),('114','SWE103','Justin',1,'C1'),('115','SWE102','Ronnie',1,'B1'),('116','SWE102','Rusty',1,'B1'),('117','SWE103','Larry',1,'C2'),('118','CSE125','Ranjith',1,'E1'),('118','SWE103','Ranjith',1,'C1'),('119','SWE105','Shekar',1,'D1'),('120','CSE145','Ravi',1,'B1'),('120','SWE108','Ravi',1,'E1'),('121','SWE108','Duke',2,'E2'),('122','CSE120','Ajay',1,'D1'),('122','SWE105','Ajay',2,'D2'),('123','CSE115','Geetha',2,'A1'),('124','CSE115','Rajesh',2,'A2'),('125','CSE120','selvam',2,'D2'),('125','CSE125','selvam',2,'E1'),('126','CSE145','Bala',2,'B2'),('126','CSE152','Bala',2,'C1'),('127','CSE145','Geethan',2,'B1'),('127','CSE152','Geethan',2,'C1'),('128','CSE152','David',2,'C2'),('129','EEE101','Bajali',4,'A1'),('130','EEE101','Vivek',4,'A1'),('130','EEE105','Vivek',4,'B1'),('131','EEE105','Kumar',4,'B2'),('131','EEE120','Kumar',4,'C1'),('132','EEE110','Magesh',4,'D1'),('133','EEE110','Hari',4,'D1'),('134','CSE115','Jana',2,'A1'),('134','CSE120','Jana',2,'D1'),('135','EEE110','Manashi',4,'D2'),('136','EEE120','Kanish',4,'C1'),('137','EEE120','Kanek',4,'C2'),('138','EEE101','Jagan',4,'A2'),('138','EEE125','Jagan',4,'E2'),('139','EEE105','Jagadesh',4,'B1'),('139','EEE125','Jagadesh',4,'E1'),('140','EEE125','Tannur',4,'E1'),('141','SWE108','Monica',1,'E1'),('142','SWE105','Naran',1,'D1');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registered`
--

DROP TABLE IF EXISTS `registered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registered` (
  `regno` varchar(10) NOT NULL DEFAULT '',
  `ccode` varchar(6) NOT NULL DEFAULT '',
  `fid` varchar(6) DEFAULT NULL,
  `slot` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`regno`,`ccode`),
  KEY `ccode` (`ccode`),
  KEY `fid` (`fid`),
  CONSTRAINT `registered_ibfk_1` FOREIGN KEY (`regno`) REFERENCES `student` (`regno`),
  CONSTRAINT `registered_ibfk_2` FOREIGN KEY (`ccode`) REFERENCES `course` (`ccode`),
  CONSTRAINT `registered_ibfk_3` FOREIGN KEY (`fid`) REFERENCES `faculty` (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registered`
--

LOCK TABLES `registered` WRITE;
/*!40000 ALTER TABLE `registered` DISABLE KEYS */;
INSERT INTO `registered` VALUES ('14MSE1063','SWE101','113','A2'),('14MSE1063','SWE102','115','B1'),('14MSE1063','SWE105','122','D2');
/*!40000 ALTER TABLE `registered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `regno` varchar(10) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `dno` decimal(10,0) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`regno`),
  KEY `dno` (`dno`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `department` (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('14CSE1101','Kishore',2,'kis'),('14CSE1125','Dhanush',2,'dhan'),('14ECE1087','Kajol',4,'kaj'),('14ECE1098','Rithvik',4,'rith'),('14EEE1024','Ravirajan',4,'ravi'),('14EEE1101','Sanjay',4,'san'),('14MSE1063','Akshath',1,'ashi'),('14MSE1072','Shantosh',1,'sun'),('14MSE1095','Achirava',1,'achi');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'crm'
--

--
-- Dumping routines for database 'crm'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-20 17:29:20
