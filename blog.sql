-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.34

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
INSERT INTO `category` VALUES (0,'Root',0),(1,'JAVA',1),(2,'Spring',2),(3,'依赖注入',2),(4,'版本控制',4),(5,'Git',4),(6,'Android',6),(7,'OTA',6),(8,'Apple',0),(9,'Android',0),(10,'Web',0),(11,'123',0),(12,'12312',0),(13,'12313',0),(14,'123123',0);
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
  `cover` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '博客封面',
  `rating` float NOT NULL COMMENT '评分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Spring 1123213213','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,0,'2024-03-14 10:40:21','https://nextui.org/images/album-cover.png',4.84),(2,'Spring 基础Spring 基础Spring 基础Spring 基础Spring 基础S 基础Spring 基础Spring 基础Spring 基础Spring 基础Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,1,'2023-11-01 05:43:09','https://nextui.org/images/album-cover.png',4.84),(3,'Spring Spring 基础Spring 基础Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,1,'2023-11-01 06:54:17','https://nextui.org/images/album-cover.png',4.84),(4,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,1,'2023-11-01 07:03:33','https://nextui.org/images/album-cover.png',4.84),(5,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,NULL,'2023-11-08 09:38:50','https://nextui.org/images/album-cover.png',4.84),(6,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,NULL,'2023-11-10 17:37:07','https://nextui.org/images/album-cover.png',4.84),(7,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,NULL,'2023-11-13 17:46:43','https://nextui.org/images/album-cover.png',4.84),(8,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,NULL,'2023-11-13 17:48:28','https://nextui.org/images/album-cover.png',4.84),(9,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,0,'2023-11-13 17:57:03','https://nextui.org/images/album-cover.png',2.2),(10,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,NULL,'2023-11-13 18:02:46','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',3.2),(11,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,NULL,'2023-11-13 18:10:20','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',4.2),(12,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,NULL,NULL,'2024-02-13 18:56:09','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(13,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,1,0,NULL,'2023-11-13 19:00:36','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(14,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,2,NULL,'2023-11-13 19:01:11','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(15,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2023-11-13 19:01:28','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(16,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,4,2,NULL,'2023-11-13 19:02:02','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(17,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2023-11-13 19:03:02','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(18,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2023-11-13 19:07:35','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(19,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2023-11-13 19:08:39','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(20,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2023-11-14 13:51:05','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(21,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,1,2,1,'2023-11-14 13:56:14','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(22,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2023-11-15 11:26:29','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(23,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2023-11-15 11:53:21','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(24,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2023-11-15 11:54:20','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(25,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2023-11-15 11:56:22','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(26,'123123','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2023-11-15 13:00:47','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(27,'','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2023-11-21 17:18:36','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(28,'Activity base','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2023-11-21 17:29:14','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(29,'','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2023-12-01 21:25:36','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(30,'nn','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2024-01-30 11:57:27','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(31,'这是一个摘要','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2024-01-31 14:10:33','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(32,'这是一个摘要哦','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2024-01-31 14:12:52','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(33,'qewqwe','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2024-02-01 09:43:00','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(34,'123','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2024-02-29 11:08:29','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(35,'Vue Demo','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2024-03-11 11:26:22','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(36,'OTA 升级流程','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2024-03-11 15:59:39','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(37,'asdas','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,NULL,'2024-03-11 16:47:49','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2),(38,'asdasd','asdasd','asdasd',1,1,1,2,1,'2024-03-18 17:31:49','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_category`
--

DROP TABLE IF EXISTS `post_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_category` (
  `id` int DEFAULT NULL,
  `post_id` int NOT NULL COMMENT '文章 ID',
  `category_id` int NOT NULL COMMENT '类别 ID',
  KEY `post_category_category_id_fk` (`category_id`),
  KEY `post_category_post_id_fk` (`post_id`),
  CONSTRAINT `post_category_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `post_category_post_id_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_category`
--

LOCK TABLES `post_category` WRITE;
/*!40000 ALTER TABLE `post_category` DISABLE KEYS */;
INSERT INTO `post_category` VALUES (1,1,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章_专栏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_column`
--

LOCK TABLES `post_column` WRITE;
/*!40000 ALTER TABLE `post_column` DISABLE KEYS */;
INSERT INTO `post_column` VALUES (1,36,1),(2,38,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` VALUES (1,1,1);
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int DEFAULT NULL COMMENT 'zhu''j',
  `name` varchar(100) NOT NULL COMMENT '物品名称',
  `href` varchar(200) NOT NULL,
  `price` double NOT NULL COMMENT '物品价格',
  `rating` int NOT NULL COMMENT '评分',
  `description` longtext NOT NULL COMMENT '描述',
  `information` longtext NOT NULL COMMENT '详细信息',
  `image_src` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='好物';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'MacBook Pro','https://nextui.org/images/album-cover.png',15500,1,'1','1','https://nextuipro.nyc3.cdn.digitaloceanspaces.com/components-images/shoes/19.png'),(2,'Switch','https://nextui.org/images/album-cover.png',15500,1,'1','1','https://nextuipro.nyc3.cdn.digitaloceanspaces.com/components-images/shoes/19.png'),(3,'MacBook Pro','https://nextui.org/images/album-cover.png',15500,1,'1','1','https://nextuipro.nyc3.cdn.digitaloceanspaces.com/components-images/shoes/19.png'),(4,'Switch','https://nextui.org/images/album-cover.png',15500,1,'1','1','https://nextuipro.nyc3.cdn.digitaloceanspaces.com/components-images/shoes/19.png'),(5,'MacBook Pro','https://nextui.org/images/album-cover.png',15500,1,'1','1','https://nextuipro.nyc3.cdn.digitaloceanspaces.com/components-images/shoes/19.png'),(6,'Switch','https://nextui.org/images/album-cover.png',15500,1,'1','1','https://nextuipro.nyc3.cdn.digitaloceanspaces.com/components-images/shoes/19.png'),(7,'MacBook Pro','https://nextui.org/images/album-cover.png',15500,1,'1','1','https://nextuipro.nyc3.cdn.digitaloceanspaces.com/components-images/shoes/19.png'),(8,'Switch','https://nextui.org/images/album-cover.png',15500,1,'1','1','https://nextuipro.nyc3.cdn.digitaloceanspaces.com/components-images/shoes/19.png'),(9,'MacBook Pro','https://nextui.org/images/album-cover.png',15500,1,'1','1','https://nextuipro.nyc3.cdn.digitaloceanspaces.com/components-images/shoes/19.png'),(10,'Switch','https://nextui.org/images/album-cover.png',15500,1,'1','1','https://nextuipro.nyc3.cdn.digitaloceanspaces.com/components-images/shoes/19.png'),(11,'MacBook Pro','https://nextui.org/images/album-cover.png',15500,1,'1','1','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fad9ba469-9751-4443-8902-5eaf591c6889%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999'),(12,'Switch','https://nextui.org/images/album-cover.png',15500,1,'1','1','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fad9ba469-9751-4443-8902-5eaf591c6889%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999'),(13,'MacBook Pro','https://nextui.org/images/album-cover.png',15500,1,'1','1','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fad9ba469-9751-4443-8902-5eaf591c6889%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999'),(14,'Switch','https://nextui.org/images/album-cover.png',15500,1,'1','1','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fad9ba469-9751-4443-8902-5eaf591c6889%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999'),(15,'MacBook Pro','https://nextui.org/images/album-cover.png',15500,1,'1','1','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fad9ba469-9751-4443-8902-5eaf591c6889%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999'),(16,'Switch','https://nextui.org/images/album-cover.png',15500,1,'1','1','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fad9ba469-9751-4443-8902-5eaf591c6889%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999'),(17,'MacBook Pro','https://nextui.org/images/album-cover.png',15500,1,'1','1','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fad9ba469-9751-4443-8902-5eaf591c6889%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999'),(18,'Switch','https://nextui.org/images/album-cover.png',15500,1,'1','1','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fad9ba469-9751-4443-8902-5eaf591c6889%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999');
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
INSERT INTO `role` VALUES (0,'ADMIN');
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
  `description` longtext NOT NULL COMMENT '专栏描述',
  `avatar` varchar(100) DEFAULT NULL COMMENT '封面',
  PRIMARY KEY (`id`),
  UNIQUE KEY `column_pk2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='专栏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'OTA','OTA（Over-the-Air）升级是一种通过无线网络实现设备固件或软件的远程升级方法。它为设备制造商和用户提供了便捷的升级方式，能够快速推送新功能、修复漏洞和改进性能。本专栏将深入探讨OTA升级的原理和实践，帮助读者全面了解OTA升级的工作原理、升级流程以及相关技术和工具','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&'),(2,'Bluetooth','adf','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'暂存区');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
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
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '邮箱',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户密码',
  `motto` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '座右铭',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `avatar` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '头像',
  `age` int DEFAULT NULL COMMENT '年龄',
  `state` int NOT NULL DEFAULT '0' COMMENT '账号状态',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_pk2` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0,'A better tomorrow','3499508634@qq.com','123213','时间所有的痛苦都来自于对外部世界的欲望','2024-03-15 13:58:17','https://images.pexels.com/photos/17037983/pexels-photo-17037983/free-photo-of-sunbeds-on-beach.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',24,0,'湖北省'),(1,'1','3499508634@qq.com','123213','时间所有的痛苦都来自于对外部世界的欲望','2024-03-15 13:58:17','https://i.pravatar.cc/150?u=a042581f4e29026024d',24,1,'湖北省'),(2,'2','3499508634@qq.com','123213','时间所有的痛苦都来自于对外部世界的欲望','2024-03-15 13:58:17','https://i.pravatar.cc/150?u=a042581f4e29026024d',24,2,'湖北省');
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
INSERT INTO `user_role` VALUES (0,0,0),(1,1,0),(2,2,0);
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

-- Dump completed on 2024-04-02 19:52:11
