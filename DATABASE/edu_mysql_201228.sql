-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: edu
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.13-MariaDB

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
-- Table structure for table `tbl_attach`
--

DROP TABLE IF EXISTS `tbl_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_attach` (
  `save_file_name` varchar(255) NOT NULL COMMENT '서버에 저장되는 한글명이 아닌 파일명\n\n',
  `real_file_name` varchar(45) DEFAULT NULL,
  `bno` int(11) NOT NULL COMMENT '부모게시물의 일련번호\n',
  `reg_date` timestamp NULL DEFAULT current_timestamp() COMMENT '등록일시\n\n',
  PRIMARY KEY (`save_file_name`),
  KEY `fk_tbl_attach_tbl_board_idx` (`bno`),
  CONSTRAINT `fk_tbl_attach_tbl_board` FOREIGN KEY (`bno`) REFERENCES `tbl_board` (`bno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='게시물첨부파일\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_attach`
--

LOCK TABLES `tbl_attach` WRITE;
/*!40000 ALTER TABLE `tbl_attach` DISABLE KEYS */;
INSERT INTO `tbl_attach` VALUES ('file.jpg','입사지원서.jpg',2,'2020-12-28 08:33:50');
/*!40000 ALTER TABLE `tbl_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_board`
--

DROP TABLE IF EXISTS `tbl_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_board` (
  `bno` int(11) NOT NULL AUTO_INCREMENT COMMENT '게시물일련번호 Auto Increment\n',
  `title` varchar(255) DEFAULT NULL COMMENT '게시물제목\n',
  `content` text DEFAULT NULL COMMENT '게시물내용\n',
  `writer` varchar(45) DEFAULT NULL COMMENT '작성자\n',
  `view_count` int(11) DEFAULT 0 COMMENT '게시물조회수\n\n',
  `reply_count` int(11) DEFAULT 0 COMMENT '댓글수',
  `reg_date` timestamp NULL DEFAULT current_timestamp() COMMENT '등록일시\n',
  `update_date` timestamp NULL DEFAULT current_timestamp() COMMENT '수정일시\n',
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='게시물관리\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_board`
--

LOCK TABLES `tbl_board` WRITE;
/*!40000 ALTER TABLE `tbl_board` DISABLE KEYS */;
INSERT INTO `tbl_board` VALUES (1,'1번째 게시물','게시물 내용','admin',0,0,'2020-12-23 03:20:48','2020-12-23 03:20:48'),(2,'2번째 게시물','게시물 내용','admin',8,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(3,'3번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(4,'4번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(5,'5번째 게시물','게시물 내용','admin',3,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(6,'6번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(7,'7번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(8,'8번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(9,'9번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(10,'10번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(11,'11번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(12,'12번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(13,'13번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(14,'14번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(15,'15번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(16,'16번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(17,'17번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(18,'18번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(19,'19번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(20,'20번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(21,'21번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(22,'22번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(23,'23번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(24,'24번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(25,'25번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(26,'26번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(27,'27번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(28,'28번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(29,'29번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(30,'30번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(31,'31번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(32,'32번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(33,'33번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(34,'34번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(35,'35번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(36,'36번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(37,'37번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(38,'38번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(39,'39번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(40,'40번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(41,'41번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(42,'42번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(43,'43번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(44,'44번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(45,'45번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(46,'46번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(47,'47번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(48,'48번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(49,'49번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(50,'50번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(51,'51번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(52,'52번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(53,'53번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(54,'54번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(55,'55번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(56,'56번째 게시물','게시물 내용','admin',1,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(57,'57번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(58,'58번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(59,'59번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(60,'60번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(61,'61번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(62,'62번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(63,'63번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(64,'64번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(65,'65번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(66,'66번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(67,'67번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(68,'68번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(69,'69번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(70,'70번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(71,'71번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(72,'72번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(73,'73번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(74,'74번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(75,'75번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(76,'76번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(77,'77번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(78,'78번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(79,'79번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(80,'80번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(81,'81번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(82,'82번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(83,'83번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(84,'84번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(85,'85번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(86,'86번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(87,'87번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(88,'88번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(89,'89번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(90,'90번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(91,'91번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(92,'92번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(93,'93번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(94,'94번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(95,'95번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(96,'96번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(97,'97번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(98,'98번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(99,'99번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(100,'100번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(101,'101번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(102,'102번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(103,'103번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(104,'104번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(105,'105번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(106,'106번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(107,'107번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(108,'108번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(109,'109번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(110,'110번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20');
/*!40000 ALTER TABLE `tbl_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_member`
--

DROP TABLE IF EXISTS `tbl_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_member` (
  `user_id` varchar(45) NOT NULL COMMENT '회원아이디',
  `user_pw` varchar(255) DEFAULT NULL COMMENT '회원로그인암호\n',
  `user_name` varchar(255) DEFAULT NULL COMMENT '회원이름\n',
  `email` varchar(255) DEFAULT NULL COMMENT '회원이메일\n',
  `point` int(11) DEFAULT 0 COMMENT '회원적립포인트\n',
  `enabled` int(1) DEFAULT 1 COMMENT '인증,활동가능한회원여부, 0 로그인불가능, 1 로그인가능\n',
  `levels` varchar(45) DEFAULT 'ROLE_USER' COMMENT '권한, 회원등급 2가지, ROLE_ADMIN(관리자), ROLE_USER(사용자)\n\n',
  `reg_date` timestamp NULL DEFAULT current_timestamp() COMMENT '등록일시\n\n',
  `update_date` timestamp NULL DEFAULT current_timestamp() COMMENT '수정일시\n\n',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원관리\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_member`
--

LOCK TABLES `tbl_member` WRITE;
/*!40000 ALTER TABLE `tbl_member` DISABLE KEYS */;
INSERT INTO `tbl_member` VALUES ('admin','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 03:02:46','2020-12-23 03:02:46'),('dummy_10','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_100','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_101','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_102','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_103','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_104','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_105','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_106','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_107','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_108','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_109','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_11','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_110','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_12','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_13','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_14','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_15','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_16','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_17','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_18','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_19','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_2','1234a','홍길동','admin@abc.com',0,0,'ROLE_USER','2020-12-23 04:59:00','2020-12-23 05:12:28'),('dummy_20','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_21','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_22','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_23','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_24','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_25','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_26','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_27','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_28','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_29','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_3','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_30','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_31','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_32','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_33','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_34','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_35','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_36','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_37','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_38','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_39','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_4','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_40','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_41','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_42','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_43','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_44','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_45','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_46','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_47','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_48','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_49','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_5','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_50','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_51','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_52','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_53','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_54','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_55','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_56','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_57','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_58','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_59','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_6','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_60','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_61','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_62','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_63','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_64','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_65','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_66','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_67','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_68','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_69','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_7','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_70','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_71','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_72','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_73','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_74','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_75','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_76','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_77','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_78','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_79','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_8','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_80','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_81','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_82','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_83','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_84','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_85','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_86','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_87','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_88','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_89','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_9','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_90','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_91','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_92','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_93','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_94','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_95','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_96','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_97','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_98','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_99','1234a','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('user','123456789','사용자','user@abc.com',0,1,'ROLE_USER','2020-12-23 05:21:58','2020-12-23 05:21:58');
/*!40000 ALTER TABLE `tbl_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reply`
--

DROP TABLE IF EXISTS `tbl_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_reply` (
  `rno` int(11) NOT NULL AUTO_INCREMENT COMMENT '댓글일련번호\n',
  `bno` int(11) NOT NULL COMMENT '부모게시물의 일련번호\n',
  `reply_text` varchar(1000) DEFAULT NULL COMMENT '댓글내용\n',
  `replyer` varchar(45) DEFAULT NULL COMMENT '작성자\n',
  `reg_date` timestamp NULL DEFAULT current_timestamp() COMMENT '등록일시\n',
  `update_date` timestamp NULL DEFAULT current_timestamp() COMMENT '수정일시\n',
  PRIMARY KEY (`rno`),
  KEY `fk_tbl_reply_tbl_board1_idx` (`bno`),
  CONSTRAINT `fk_tbl_reply_tbl_board1` FOREIGN KEY (`bno`) REFERENCES `tbl_board` (`bno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='댓글관리\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reply`
--

LOCK TABLES `tbl_reply` WRITE;
/*!40000 ALTER TABLE `tbl_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'edu'
--
/*!50003 DROP PROCEDURE IF EXISTS `dummyBoard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dummyBoard`(IN p_loop int)
BEGIN
	DECLARE cnt int default 2;
    delete from tbl_board where bno>1;
    while cnt<=p_loop do
		  INSERT INTO tbl_board(bno, title, content, writer)
          VALUES 
          (cnt, concat(cnt,'번째 게시물'), '게시물 내용', 'admin');
          SET cnt=cnt+1;
    end while;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dummyMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dummyMember`(IN p_loop int)
BEGIN
	DECLARE cnt int default 1; #반복문에 쓰일 변수 선언
    delete from tbl_member where user_id like 'dummy%';
    while cnt <= p_loop do
		INSERT INTO tbl_member(user_id, user_pw, user_name, email, point, enabled, levels) 
		VALUES 
		(concat('dummy_',cnt), '1234a', '관리자', 'admin@abc.com', '0', '1', 'ROLE_ADMIN');
		SET cnt=cnt+1;
    end  while;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-28 17:49:01
