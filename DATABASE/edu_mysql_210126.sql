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
INSERT INTO `tbl_attach` VALUES ('a2a29dc5-be7f-4d4b-8a19-682d2c79a3d1.jpg','mosque.jpg',118,'2021-01-14 06:01:58'),('dc90befa-661a-4bf0-9de1-5dfe63b59f2a.jpg','hamburg.jpg',118,'2021-01-14 06:01:58');
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
  `board_type` varchar(45) DEFAULT NULL COMMENT '게시판타입:tbl_board_type테이블의 값을 가져다 사용\n',
  `title` varchar(255) DEFAULT NULL COMMENT '게시물제목\n',
  `content` text DEFAULT NULL COMMENT '게시물내용\n',
  `writer` varchar(45) DEFAULT NULL COMMENT '작성자\n',
  `view_count` int(11) DEFAULT 0 COMMENT '게시물조회수\n\n',
  `reply_count` int(11) DEFAULT 0 COMMENT '댓글수',
  `reg_date` timestamp NULL DEFAULT current_timestamp() COMMENT '등록일시\n',
  `update_date` timestamp NULL DEFAULT current_timestamp() COMMENT '수정일시\n',
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COMMENT='게시물관리\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_board`
--

LOCK TABLES `tbl_board` WRITE;
/*!40000 ALTER TABLE `tbl_board` DISABLE KEYS */;
INSERT INTO `tbl_board` VALUES (1,'gallery','1번째 게시물','게시물 내용','admin',0,0,'2020-12-23 03:20:48','2020-12-23 03:20:48'),(3,'gallery','3번째 공지 게시물','<p>게시물 내용</p><p>&lt;script&gt;alert(\"작동함\");&lt;/script&gt;<br></p>','admin',34,0,'2020-12-23 04:58:20','2021-01-25 03:21:43'),(4,'notice','4번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(5,'notice','5번째 게시물','게시물 내용','admin',11,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(6,'notice','6번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(7,'notice','7번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(8,'notice','8번째 게시물','게시물 내용','admin',1,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(9,'notice','9번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(10,'notice','10번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(11,'notice','11번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(12,'notice','12번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(13,'notice','13번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(14,'notice','14번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(15,'notice','15번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(16,'notice','16번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(17,'notice','17번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(18,'notice','18번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(19,'notice','19번째 게시물','게시물 내용','admin',2,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(20,'notice','20번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(21,'notice','21번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(22,'notice','22번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(23,'notice','23번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(24,'notice','24번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(25,'notice','25번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(26,'notice','26번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(27,'notice','27번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(28,'notice','28번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(29,'notice','29번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(30,'notice','30번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(31,'notice','31번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(32,'notice','32번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(33,'notice','33번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(34,'notice','34번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(35,'notice','35번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(36,'notice','36번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(37,'notice','37번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(38,'notice','38번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(39,'notice','39번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(40,'notice','40번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(41,'notice','41번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(42,'notice','42번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(43,'notice','43번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(44,'notice','44번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(46,'notice','46번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(47,'notice','47번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(48,'notice','48번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(49,'notice','49번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(50,'notice','50번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(51,'notice','51번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(52,'notice','52번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(53,'notice','53번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(54,'notice','54번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(55,'notice','55번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(56,'notice','56번째 게시물','게시물 내용','admin',1,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(57,'notice','57번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(58,'notice','58번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(59,'notice','59번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(60,'notice','60번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(61,'notice','61번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(62,'notice','62번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(63,'notice','63번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(64,'notice','64번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(65,'notice','65번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(66,'notice','66번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(67,'notice','67번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(68,'notice','68번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(69,'notice','69번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(70,'notice','70번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(71,'notice','71번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(72,'notice','72번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(73,'notice','73번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(74,'notice','74번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(75,'notice','75번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(76,'notice','76번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(77,'notice','77번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(78,'notice','78번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(79,'notice','79번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(80,'notice','80번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(81,'notice','81번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(82,'notice','82번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(83,'notice','83번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(84,'notice','84번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(85,'notice','85번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(86,'notice','86번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(87,'notice','87번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(88,'notice','88번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(89,'notice','89번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(90,'notice','90번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(91,'notice','91번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(92,'notice','92번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(93,'notice','93번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(94,'notice','94번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(95,'notice','95번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(96,'notice','96번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(97,'notice','97번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(98,'notice','98번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(99,'notice','99번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(100,'notice','100번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(101,'notice','101번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(102,'notice','102번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(103,'notice','103번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(104,'notice','104번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(105,'notice','105번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(106,'notice','106번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(107,'notice','107번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(108,'notice','108번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(109,'notice','109번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(110,'notice','110번째 게시물','게시물 내용','admin',0,0,'2020-12-23 04:58:20','2020-12-23 04:58:20'),(113,'notice','글수정1','<p>글 수정입니다.</p><p><span style=\'font-family: \"궁서\"; font-size: 50px;\'><strong>궁서체입니다.</strong></span><br></p>','작성자',24,0,'2020-12-29 07:07:28','2021-01-22 08:47:01'),(118,'notice','다중 파일 업데이트','<p>다중 파일 업데이트<br></p>','이시은',135,7,'2021-01-04 03:14:18','2021-01-14 06:02:34');
/*!40000 ALTER TABLE `tbl_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_board_type`
--

DROP TABLE IF EXISTS `tbl_board_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_board_type` (
  `board_type` varchar(45) NOT NULL COMMENT '름게시판 타입(영문) ex) notice, gallery, QnA...\n',
  `board_name` varchar(45) DEFAULT NULL COMMENT '게시판 이름(한글)\n',
  `board_sun` int(11) DEFAULT NULL COMMENT '게시판 출력 순서\n',
  PRIMARY KEY (`board_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='게시판 생성 : 게시판 타입 생성';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_board_type`
--

LOCK TABLES `tbl_board_type` WRITE;
/*!40000 ALTER TABLE `tbl_board_type` DISABLE KEYS */;
INSERT INTO `tbl_board_type` VALUES ('gallery','갤러리',2),('notice','공지사항',1),('test','테스트게시판',3);
/*!40000 ALTER TABLE `tbl_board_type` ENABLE KEYS */;
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
INSERT INTO `tbl_member` VALUES ('admin','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 03:02:46','2020-12-23 03:02:46'),('dummy_10','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_100','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_101','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_102','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_103','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_104','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_105','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_106','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_107','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_108','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_109','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_11','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_110','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_12','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_13','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_14','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_15','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_16','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_17','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_18','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_19','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_2','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','홍길동','admin@abc.com',0,0,'ROLE_USER','2020-12-23 04:59:00','2020-12-23 05:12:28'),('dummy_20','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_21','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_22','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_23','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_24','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_25','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_26','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_27','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_28','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_29','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_3','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_30','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_31','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_32','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_33','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_34','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_35','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_36','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_37','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_38','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_39','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_4','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_40','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_41','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_42','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_43','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_44','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_45','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_46','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_47','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_48','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_49','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_5','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_50','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_51','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_52','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_53','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_54','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_55','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_56','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_57','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_58','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_59','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_6','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_60','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_61','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_62','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_63','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_64','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_65','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_66','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_67','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_68','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_69','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_7','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_70','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_71','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_72','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_73','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_74','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_75','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_76','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_77','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_78','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_79','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_8','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_80','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_81','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_82','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_83','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_84','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_85','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_86','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_87','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_88','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_89','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_9','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_90','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_91','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_92','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_93','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_94','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_95','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_96','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_97','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_98','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('dummy_99','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:59:00','2020-12-23 04:59:00'),('user','$2a$10$vzyeYd37hD7WbbuHEsVpx.7fGCFbKgZbD5S0LwW0WXH/Z8iO6/UCa','사용자','user@abc.com',0,1,'ROLE_USER','2020-12-23 05:21:58','2021-01-12 07:35:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='댓글관리\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reply`
--

LOCK TABLES `tbl_reply` WRITE;
/*!40000 ALTER TABLE `tbl_reply` DISABLE KEYS */;
INSERT INTO `tbl_reply` VALUES (39,118,'댓글 수정 완료 2','td','2021-01-07 06:10:33','2021-01-14 02:39:40'),(40,118,'댓글입력','작성자','2021-01-13 08:17:57','2021-01-13 08:17:57'),(41,118,'댓글등록','작성자2','2021-01-14 01:14:59','2021-01-14 01:14:59'),(42,118,'댓글등록','작성자3','2021-01-14 01:16:17','2021-01-14 01:16:17'),(43,118,'댓글','홍길동','2021-01-14 01:18:31','2021-01-14 01:18:31'),(44,118,'댓글 수정 완료','아무개','2021-01-14 01:18:42','2021-01-14 02:39:22'),(47,118,'댓글 등록','사용자','2021-01-14 02:39:49','2021-01-14 02:39:49');
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

-- Dump completed on 2021-01-26 15:56:07
