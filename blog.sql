-- MySQL dump 10.13  Distrib 8.2.0, for macos14.0 (arm64)
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
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cover` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '博客封面',
  `rating` float NOT NULL COMMENT '评分',
  `is_private` int NOT NULL DEFAULT '0' COMMENT '是否私密',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Spring 1123213213','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,21,'2024-03-14 10:40:21','https://nextui.org/images/album-cover.png',4.84,0),(2,'Spring 基础Spring 基础Spring 基础Spring 基础Spring 基础S 基础Spring 基础Spring 基础Spring 基础Spring 基础Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,21,'2023-11-01 05:43:09','https://nextui.org/images/album-cover.png',4.84,0),(3,'Spring Spring 基础Spring 基础Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,21,'2023-11-01 06:54:17','https://nextui.org/images/album-cover.png',4.84,0),(4,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,21,'2023-11-01 07:03:33','https://nextui.org/images/album-cover.png',4.84,0),(5,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,21,'2023-11-08 09:38:50','https://nextui.org/images/album-cover.png',4.84,0),(6,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,21,'2023-11-10 17:37:07','https://nextui.org/images/album-cover.png',4.84,0),(7,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,21,'2023-11-13 17:46:43','https://nextui.org/images/album-cover.png',4.84,0),(8,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,21,'2023-11-13 17:48:28','https://nextui.org/images/album-cover.png',4.84,0),(9,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,21,'2023-11-13 17:57:03','https://nextui.org/images/album-cover.png',2.2,0),(10,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,21,'2023-11-13 18:02:46','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',3.2,0),(11,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,21,21,'2023-11-13 18:10:20','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',4.2,0),(12,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,1,21,'2024-02-13 18:56:09','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(13,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,1,0,21,'2023-11-13 19:00:36','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(14,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,2,2,21,'2023-11-13 19:01:11','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(15,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2023-11-13 19:01:28','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(16,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,4,2,21,'2023-11-13 19:02:02','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(17,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2023-11-13 19:03:02','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(18,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2023-11-13 19:07:35','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(19,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2023-11-13 19:08:39','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(20,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2023-11-14 13:51:05','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(21,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,1,2,21,'2023-11-14 13:56:14','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(22,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2023-11-15 11:26:29','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(23,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2023-11-15 11:53:21','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(24,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2023-11-15 11:54:20','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(25,'Spring 基础','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2023-11-15 11:56:22','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(26,'123123','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2023-11-15 13:00:47','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(27,'1','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2023-11-21 17:18:36','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(28,'Activity base','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2023-11-21 17:29:14','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(29,'1','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2023-12-01 21:25:36','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(30,'nn','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2024-01-30 11:57:27','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(31,'这是一个摘要','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2024-01-31 14:10:33','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(32,'这是一个摘要哦','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2024-01-31 14:12:52','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(33,'qewqwe','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2024-02-01 09:43:00','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(34,'123','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2024-02-29 11:08:29','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(35,'Vue Demo','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2024-03-11 11:26:22','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(36,'OTA 升级流程','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2024-03-11 15:59:39','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(37,'asdas','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><h4>这是一个标题四</h4><blockquote><p>这是一个引用</p></blockquote><pre><code>public class Student{}</code></pre><p><strong>这是一个加粗字体</strong></p><p><strong><em>这是一个斜体</em></strong></p><p><strong><em><s>这是一个删除线</s></em></strong></p><ol><li><p>这是一个有序列表</p></li></ol><ul><li><p>这是一个无序列表</p><ul><li><p>这也是一个无序列表</p></li></ul></li></ul><p><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https:///www.baidu.com\">这是一个百度链接</a></p><p><span style=\"color: red\">这是一个红色字体</span></p><p><mark data-color=\"red\" style=\"background-color: red; color: inherit\">这是一个红色背景</mark></p><p><code>这是一个引用</code></p>','这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要这是一个摘要',1,1,3,2,21,'2024-03-11 16:47:49','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1.2,0),(38,'asdasd','1','asdasd',1,1,1,2,21,'2024-03-18 17:31:49','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',1,0),(39,'1','1','1',1,0,0,0,21,'2024-04-14 21:30:29','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',5,0),(40,'1','1','1',1,0,0,0,21,'2024-04-14 21:31:37','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',5,0),(41,'1','1','1',1,0,0,0,21,'2024-04-14 21:50:35','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',5,0),(42,'1','1','1',1,0,0,0,21,'2024-04-14 22:00:40','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',5,0),(43,'1','1','1',1,0,0,0,21,'2024-04-14 22:03:47','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',5,1),(44,'1','1','1',1,0,0,0,21,'2024-04-14 22:05:51','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',5,1),(45,'1','1','1',1,0,0,0,21,'2024-04-14 22:05:52','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',5,1),(46,'1','3','2',1,0,NULL,NULL,NULL,'2024-04-14 23:14:10','1',5,1),(47,'1','3','2',1,0,NULL,NULL,NULL,'2024-04-14 23:14:16','1',5,0),(48,'123','<p>Example Text</p>','123123',1,0,NULL,NULL,NULL,'2024-04-14 23:28:32','http://localhost:8080/image/0a74db9e-dbc2-4d6c-93d4-13ba65582ec4.jpg',1,1),(49,'123','<p>Example Text</p>','123123',0,0,NULL,NULL,NULL,'2024-04-14 23:29:13','http://localhost:8080/image/064ee73f-6e4e-463a-b377-4b9e51b4999f.jpg',5,0),(50,'123','<p>Example Text</p>','123123',0,0,NULL,NULL,NULL,'2024-04-14 23:31:59','http://localhost:8080/image/064ee73f-6e4e-463a-b377-4b9e51b4999f.jpg',5,0),(51,'qwewqe','<p>qweqweqweqwewqe</p>','qweqwe',0,0,NULL,NULL,NULL,'2024-04-14 23:32:56','http://localhost:8080/image/064ee73f-6e4e-463a-b377-4b9e51b4999f.jpg',5,0),(52,'qwewqe','<p>qweqweqweqwewqe</p>','qweqwe',0,0,NULL,NULL,NULL,'2024-04-14 23:34:06','http://localhost:8080/image/064ee73f-6e4e-463a-b377-4b9e51b4999f.jpg',5,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_category`
--

LOCK TABLES `post_category` WRITE;
/*!40000 ALTER TABLE `post_category` DISABLE KEYS */;
INSERT INTO `post_category` VALUES (1,1,5),(2,39,4),(3,40,4),(4,41,4),(5,42,4),(6,43,4),(7,44,4),(8,45,4),(9,46,4),(10,47,4),(11,48,9),(12,49,9),(13,50,9),(14,51,9),(15,52,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` VALUES (1,1,1),(3,42,1),(4,42,2),(5,43,1),(6,43,2),(7,44,1),(8,44,2),(9,45,1),(10,45,2),(11,46,1),(12,46,2),(13,47,1),(14,47,2),(15,48,1),(16,48,2),(17,49,1),(18,50,1),(19,51,1),(20,51,2),(21,52,1),(22,52,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'暂存区'),(2,'OTA');
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
INSERT INTO `user` VALUES (0,'A better tomorrow','3499508634@qq.com','$2a$10$UAUNRELrTkQrHBRa9KscJ.21RHQlst7uXYIz4OJsHv4vBHnUJZzKG','时间所有的痛苦都来自于对外部世界的欲望','2024-03-15 13:58:17','https://images.pexels.com/photos/17037983/pexels-photo-17037983/free-photo-of-sunbeds-on-beach.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',24,0,'湖北省');
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
INSERT INTO `user_role` VALUES (0,0,0);
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

-- Dump completed on 2024-04-14 23:36:36
