-- MySQL dump 10.13  Distrib 8.2.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: blog
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类 ID',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '分类名称',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT '父分类 ID',
  PRIMARY KEY (`id`),
  KEY `category_category_id_fk` (`parent_id`),
  CONSTRAINT `category_category_id_fk` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'JAVA',1),(2,'Spring',2),(3,'依赖注入',2),(4,'版本控制',4),(5,'Git',4),(6,'Android',6),(7,'OTA',6);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '评论 ID',
  `comment_date` datetime NOT NULL COMMENT '评论日期',
  `comment_likes` int DEFAULT '0' COMMENT '评论点赞数',
  `user_id` int NOT NULL COMMENT '用户 ID',
  `post_id` int NOT NULL COMMENT '文章 ID',
  `comment_content` longtext NOT NULL COMMENT '评论内容',
  `parent_id` int NOT NULL COMMENT '父评论 ID',
  PRIMARY KEY (`id`),
  KEY `comment_comment_id_fk` (`parent_id`),
  KEY `comment_post_id_fk` (`post_id`),
  KEY `comment_user_id_fk` (`user_id`),
  CONSTRAINT `comment_comment_id_fk` FOREIGN KEY (`parent_id`) REFERENCES `comment` (`id`),
  CONSTRAINT `comment_post_id_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `comment_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '权限 ID',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '权限名称',
  `description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '权限描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'addPost','添加文章');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '文章 ID',
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文章标题',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文章内容',
  `summary` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '摘要',
  `is_top` int NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `user_id` int NOT NULL COMMENT '用户 ID',
  `likes` int DEFAULT '0' COMMENT '点赞数',
  `views` int DEFAULT '0' COMMENT '浏览数',
  `comments` int DEFAULT '0' COMMENT '评论数',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `cover` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '博客封面',
  `rating` float NOT NULL COMMENT '评分',
  `is_private` int NOT NULL DEFAULT '0' COMMENT '是否私密',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (79,'1','1','1',1,1,1,1,1,'2024-04-25 10:09:44','1',1,1),(85,'1123123123123123213','1','1',1,0,1,1,1,'2024-04-25 13:42:46','1',1.2,1),(86,'1123123123123123213','1','1',1,0,1,1,1,'2024-04-25 13:42:55','1',1.2,1),(97,'1123123123123123213','1','1',1,0,1,1,1,'2024-04-25 13:58:20','1',1.2,1),(98,'1','<p style=\"text-align: center\">asdasdasdasd</p><p style=\"text-align: center\">zcxvxzcv</p><p style=\"text-align: center\">zcvzxcvzxcv</p><p style=\"text-align: center\">z</p><p style=\"text-align: center\">s</p><p style=\"text-align: center\">adf</p><p style=\"text-align: center\">a</p><p style=\"text-align: center\">sf</p><p style=\"text-align: center\">sad</p><p style=\"text-align: center\">f</p>','1',1,0,NULL,NULL,NULL,'2024-04-25 13:59:20','',5,1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_category`
--

DROP TABLE IF EXISTS `post_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL COMMENT '文章 ID',
  `category_id` int NOT NULL COMMENT '类别 ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_category_pk_2` (`id`),
  KEY `post_category_category_id_fk` (`category_id`),
  KEY `post_category_post_id_fk` (`post_id`),
  CONSTRAINT `post_category_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `post_category_post_id_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_category`
--

LOCK TABLES `post_category` WRITE;
/*!40000 ALTER TABLE `post_category` DISABLE KEYS */;
INSERT INTO `post_category` VALUES (41,85,1),(42,86,1),(43,97,1),(44,98,6);
/*!40000 ALTER TABLE `post_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_column`
--

DROP TABLE IF EXISTS `post_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_column` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `post_id` int NOT NULL COMMENT '文章 ID',
  `column_id` int NOT NULL COMMENT '专栏 ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_column_pk2` (`id`),
  KEY `post_column_column_id_fk` (`column_id`),
  KEY `post_column_post_id_fk` (`post_id`),
  CONSTRAINT `post_column_column_id_fk` FOREIGN KEY (`column_id`) REFERENCES `section` (`id`),
  CONSTRAINT `post_column_post_id_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章_专栏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_column`
--

LOCK TABLES `post_column` WRITE;
/*!40000 ALTER TABLE `post_column` DISABLE KEYS */;
INSERT INTO `post_column` VALUES (39,85,1),(40,86,1),(41,97,1),(42,98,2);
/*!40000 ALTER TABLE `post_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tag` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `post_id` int NOT NULL COMMENT '文章 ID',
  `tag_id` int NOT NULL COMMENT '标签 ID',
  PRIMARY KEY (`id`),
  KEY `post_tag_post_id_fk` (`post_id`),
  KEY `post_tag_tag_id_fk` (`tag_id`),
  CONSTRAINT `post_tag_post_id_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `post_tag_tag_id_fk` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` VALUES (69,85,2),(70,86,2),(71,97,2),(72,98,6),(73,98,1),(74,98,3),(75,98,4),(76,98,2),(77,98,8),(78,98,7),(79,98,5);
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'zhu''j',
  `name` varchar(100) NOT NULL COMMENT '物品名称',
  `href` varchar(200) NOT NULL,
  `price` varchar(10) NOT NULL COMMENT '物品价格',
  `rating` int NOT NULL COMMENT '评分',
  `description` longtext NOT NULL COMMENT '描述',
  `information` longtext NOT NULL COMMENT '详细信息',
  `image_src` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_pk_2` (`name`),
  UNIQUE KEY `product_pk_3` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='好物';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (2,'MacBook Pro 14-in','https://www.apple.com.cn/macbook-pro/','15K',5,'M1 Max chip\n32GB unified memory\n1TB storage\n','Hardware-accelerated H.264, HEVC, ProRes, and ProRes RAW\nVideo decode engine\nVideo encode engine\nProRes encode and decode engine','http://localhost:8080/image/1ec1b946-8bdb-4f03-ba15-2eb6f56aeea4.jpg'),(3,'Nintendo Switch – OLED Model','https://www.nintendo.com/us/switch/oled-model/','2K',4,'7-inch OLED screen\nTegra X1\n64GB storage\n','The new system features a vibrant 7-inch OLED screen, a wide adjustable stand, a dock with a wired LAN port, 64 GB of internal storage, and enhanced audio.','http://localhost:8080/image/a1de62e3-c6e3-4c77-b0f3-d2a6f2fd05fb.jpg'),(4,'iPhone X','https://www.gsmarena.com/apple_iphone_x-8858.php','7K',5,'Apple A11 Bionic (10 nm)\n64GB storage\n','Glass front (Corning-made glass), glass back (Corning-made glass), stainless steel frame','http://localhost:8080/image/5be19fa1-e651-4e7e-ab70-bb392ed9ecd2.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '角色 ID',
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (0,'ADMIN'),(1,'CUSTOMER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission` (
  `id` int DEFAULT NULL COMMENT 'zhu''j',
  `role_id` int NOT NULL COMMENT '角色 ID',
  `permission_id` int NOT NULL COMMENT '权限 ID',
  KEY `role_permission_permission_id_fk` (`permission_id`),
  KEY `role_permission_role_id_fk` (`role_id`),
  CONSTRAINT `role_permission_permission_id_fk` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`),
  CONSTRAINT `role_permission_role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(50) NOT NULL COMMENT '专栏名称',
  `description` longtext COMMENT '专栏描述',
  `avatar` varchar(100) DEFAULT NULL COMMENT '封面',
  `rating` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `column_pk2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='专栏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'OTA','OTA 升999级','123',5),(2,'Bluetooth','adf','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&',4);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `log_type` varchar(50) NOT NULL COMMENT '日志类型',
  `create_user_code` varchar(64) NOT NULL COMMENT '创建用户编码',
  `create_user_name` varchar(100) NOT NULL COMMENT '创建用户名称',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `request_uri` varchar(500) DEFAULT NULL COMMENT '请求URI',
  `request_method` varchar(10) DEFAULT NULL COMMENT '请求方式',
  `request_params` text COMMENT '请求参数',
  `request_ip` varchar(20) NOT NULL COMMENT '请求IP',
  `server_address` varchar(50) NOT NULL COMMENT '请求服务器地址',
  `is_exception` char(1) DEFAULT NULL COMMENT '是否异常',
  `exception_info` text COMMENT '异常信息',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `execute_time` int DEFAULT NULL COMMENT '执行时间',
  `user_agent` varchar(500) DEFAULT NULL COMMENT '用户代理',
  `device_name` varchar(100) DEFAULT NULL COMMENT '操作系统',
  `browser_name` varchar(100) DEFAULT NULL COMMENT '浏览器名称',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_log_lt` (`log_type`) USING BTREE,
  KEY `idx_sys_log_cub` (`create_user_code`) USING BTREE,
  KEY `idx_sys_log_ie` (`is_exception`) USING BTREE,
  KEY `idx_sys_log_cd` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '标签 ID',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '标签名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_pk` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (18,'11111'),(3,'Hooks'),(6,'Mysql'),(2,'OTA777'),(5,'RabbitMQ'),(7,'Recovery Mode'),(4,'redis'),(8,'virtual A/B'),(1,'暂存区');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme`
--

DROP TABLE IF EXISTS `theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `theme_name` varchar(20) DEFAULT NULL COMMENT '主题名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='主题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme`
--

LOCK TABLES `theme` WRITE;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
INSERT INTO `theme` VALUES (1,'light'),(2,'dark'),(3,'purple-dark');
/*!40000 ALTER TABLE `theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户 ID',
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '邮箱',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户密码',
  `motto` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '座右铭',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `avatar` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '头像',
  `age` int DEFAULT NULL COMMENT '年龄',
  `state` int NOT NULL DEFAULT '0' COMMENT '账号状态',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_pk2` (`username`),
  UNIQUE KEY `user_pk` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0,'A better tomorrow','3499508634@qq.com','$2a$10$UAUNRELrTkQrHBRa9KscJ.21RHQlst7uXYIz4OJsHv4vBHnUJZzKG','时间所有的痛苦都来自于对外部世界的欲望','2024-03-15 13:58:17','https://images.pexels.com/photos/17037983/pexels-photo-17037983/free-photo-of-sunbeds-on-beach.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',24,0,'湖北省'),(1,'1','1','1','1','2024-04-16 20:48:53','1',1,1,'1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `user_id` int NOT NULL COMMENT '用户 ID',
  `role_id` int NOT NULL COMMENT '角色 ID',
  PRIMARY KEY (`id`),
  KEY `user_role_role_id_fk` (`role_id`),
  KEY `user_role_user_id_fk` (`user_id`),
  CONSTRAINT `user_role_role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (0,0,0),(1,0,1),(2,1,0),(3,1,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-25 14:01:35
