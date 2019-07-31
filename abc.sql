-- MySQL dump 10.13  Distrib 5.7.11, for Win64 (x86_64)
--
-- Host: localhost    Database: lms
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `AdminPk` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) DEFAULT NULL,
  `PasswordId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AdminPk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `attendanceIdPk` int(11) NOT NULL,
  `fromdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `todate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exitfromtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exittotime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `totalworkinghours` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`attendanceIdPk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `DepartmentIdFk` int(11) NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DepartmentIdFk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `EmpIdPk` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(50) DEFAULT NULL,
  `MobileNo` int(11) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `EmailId` varchar(50) DEFAULT NULL,
  `JoiningDate` varchar(50) DEFAULT NULL,
  `AdminIdFk` int(11) NOT NULL,
  `DepartmentIdFk` int(11) NOT NULL,
  PRIMARY KEY (`EmpIdPk`),
  KEY `AdminIdFk` (`AdminIdFk`),
  KEY `DepartmentIdFk` (`DepartmentIdFk`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`AdminIdFk`) REFERENCES `admin` (`AdminPk`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`DepartmentIdFk`) REFERENCES `department` (`DepartmentIdFk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `LeaveHisIdPk` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeeIdPk` int(11) DEFAULT NULL,
  `LeaveTempIdPk` int(11) DEFAULT NULL,
  `LeaveTaken` int(11) DEFAULT NULL,
  `LeaveType` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `AppliedDate` varchar(50) DEFAULT NULL,
  `DueLeaves` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LeaveHisIdPk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaverequest`
--

DROP TABLE IF EXISTS `leaverequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leaverequest` (
  `LeaveIdPk` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeeIdFk` int(11) NOT NULL,
  `LeaveTemplateIdFk` int(11) NOT NULL,
  `LeaveType` varchar(60) DEFAULT NULL,
  `DateTimeFrom` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DateTimeTo` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `REASON` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`LeaveIdPk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaverequest`
--

LOCK TABLES `leaverequest` WRITE;
/*!40000 ALTER TABLE `leaverequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaverequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leavetemplate`
--

DROP TABLE IF EXISTS `leavetemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leavetemplate` (
  `LeaveTempIdPk` int(11) NOT NULL AUTO_INCREMENT,
  `LeaveType` varchar(50) DEFAULT NULL,
  `NumOfdays` int(11) DEFAULT NULL,
  `Applicable` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LeaveTempIdPk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leavetemplate`
--

LOCK TABLES `leavetemplate` WRITE;
/*!40000 ALTER TABLE `leavetemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `leavetemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary` (
  `salaryIdPk` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  `cutamount` int(11) NOT NULL,
  PRIMARY KEY (`salaryIdPk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-31 10:39:38
