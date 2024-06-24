-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: 127.0.0.1    Database: blog
-- ------------------------------------------------------
-- Server version	8.3.0

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (0,'ROOT',0),(1,'JAVA',1),(2,'Spring',2),(3,'依赖注入',2),(4,'版本控制',4),(5,'Git',4),(6,'Android',6),(7,'OTA',6);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '评论 ID',
  `date` datetime NOT NULL COMMENT '评论日期',
  `likes` int NOT NULL DEFAULT '0' COMMENT '评论点赞数',
  `user_id` int NOT NULL COMMENT '用户 ID',
  `post_id` int NOT NULL COMMENT '文章 ID',
  `content` longtext NOT NULL COMMENT '评论内容',
  `parent_id` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '父评论 ID',
  `title` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`),
  UNIQUE KEY `comment_pk` (`id`),
  UNIQUE KEY `comment_pk_2` (`id`),
  KEY `comment_comment_id_fk` (`parent_id`),
  KEY `comment_post_id_fk` (`post_id`),
  KEY `comment_user_id_fk` (`user_id`),
  KEY `comment_id_index` (`id`),
  CONSTRAINT `comment_post_id_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `comment_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES ('25a5bf01-5d65-446a-8fa9-3983b70f0f58','2024-06-25 00:35:09',0,0,182,'1','0','123213'),('39d25451-0e99-4467-bc3a-d27fa73691d6','2024-06-25 01:21:47',0,0,161,'1113213','0','123121111'),('5e1fe56d-1b78-4587-8d17-77710c94077b','2024-06-25 01:22:34',0,0,161,'1113213','0','123121111'),('c56d5f66-5e2e-4876-9b83-d6a9d763afb5','2024-06-25 00:36:24',0,0,182,'1','0','123213'),('d61426f6-85fe-4273-86a2-4a9269dd8a7a','2024-06-25 01:20:23',0,0,161,'1113213','0','123121111'),('da7a098f-69cf-4347-b72a-ecc32c7bf814','2024-06-25 01:23:29',0,0,161,'12321','0','123'),('e2c07ad5-68c3-4ce0-b88c-28be08e1295a','2024-06-25 01:20:04',0,0,161,'3213','0','12312'),('fc506524-d236-4099-9f8e-f579a830da91','2024-06-25 00:41:28',0,0,182,'1','0','123213');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` longtext NOT NULL,
  `answer` longtext,
  `create_time` datetime DEFAULT (now()),
  PRIMARY KEY (`id`),
  UNIQUE KEY `faq_pk2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (1,'Why should I start a blog?','不知道处于什么原因，我注销了陪伴自己多年的 qq 空间，同时清除了所有的动态（现在想想还是挺后悔的）。至此，我踏上了微信朋友圈之旅。不得不承认，起初朋友圈确实是一个好的地方，它在一定程度上成为了人们“talk”的平台。随着商业的侵蚀，朋友圈俨然称为各种广告的天下了。不过这并不是放弃朋友圈的真正原因，不知道从何时起发现，朋友圈已经无法成为聆听和欣赏的平台了，就像大制作的视频被短视频取代一样，这里充斥着没有营养的内容。所谓的营养并不是说我们的文字多么高深、我们的视频多么精细，而是它们应该是被细心雕琢的、有感而发的。因此，我产生了建立一个个人博客的想法，我想重新回到长文章、复杂文章的时代，哪怕没有一个人原因驻留10s.','2024-05-03 22:09:28'),(2,'How can I apply to the Open Source Discount?','The Open Source Discount is available for everyone who is building an open source project. You can apply to the discount by sending an email to support@acme.com','2024-05-03 22:09:58'),(3,'Can I use Acme for my freelance projects?','Yes, you can use Acme for your freelance projects. You can purchase the Freelancer License from our website.','2024-04-30 12:45:03'),(4,'What is your refund policy?','We do not provide refunds. However, we can help you with any issues you may have.','2024-05-03 22:10:41'),(5,'Can I cancel my subscription?','Yes, you can cancel and renew your subscription at any time.','2024-05-03 22:11:28'),(6,'你好呀','我很好','2024-05-03 22:13:06');
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_link`
--

DROP TABLE IF EXISTS `friend_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_link` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '网站标题',
  `description` longtext NOT NULL COMMENT '网站描述',
  `link` varchar(200) NOT NULL COMMENT '网站链接',
  `avatar` varchar(200) NOT NULL COMMENT '网站图片',
  `status` int NOT NULL COMMENT '站点状态--- 0:zh',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `level` int NOT NULL DEFAULT '0' COMMENT '友联等级',
  PRIMARY KEY (`id`),
  UNIQUE KEY `"friend_link_pk2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='友链';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_link`
--

LOCK TABLES `friend_link` WRITE;
/*!40000 ALTER TABLE `friend_link` DISABLE KEYS */;
INSERT INTO `friend_link` VALUES (2,'1','11','1','1',1,'2024-05-28 23:15:10',0),(3,'2','2','2','2',2,'2024-05-28 23:15:18',1),(4,'3','3','3','3',3,'2024-05-28 23:15:26',2);
/*!40000 ALTER TABLE `friend_link` ENABLE KEYS */;
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
  `status` int DEFAULT '0' COMMENT '文章状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (156,'','<p></p>','',0,30,NULL,2,NULL,'2024-05-15 17:28:48','',1,0,NULL),(157,'qe','<p>zzzzzzzzzzzzz</p>','qweqwe',1,30,NULL,3,NULL,'2024-05-15 17:29:59','',1,0,NULL),(158,'z','<p>111111111111</p>','z',0,0,NULL,4,NULL,'2024-05-15 17:31:42','',1,0,0),(159,'111111111111','<p>111111111111</p>','1111111111111111',1,30,NULL,5,NULL,'2024-05-17 09:35:29','',1,1,0),(160,'','<p><span style=\"font-size: 18px; font-family: Times\">1111</span></p>','',0,0,NULL,NULL,NULL,'2024-05-22 10:13:15','',5,0,0),(161,'这是一个 demo，你懂的','<p>真嗣u夜光</p>','qe re w r',1,1,NULL,NULL,NULL,'2024-06-07 18:13:04','',5,0,0),(162,'z z z z z z zzz','<p>zzzzz</p>','zzzzzzzzzzz',0,1,NULL,NULL,NULL,'2024-06-07 18:16:19','',5,0,0),(163,'123','<snippetcode></snippetcode><p>asd</p><p></p><p><em><u>asdf</u></em></p><p><em><u>µµ</u></em></p><p></p><p><em><u>asdf</u></em></p><p></p>','123123123',0,0,NULL,NULL,NULL,'2024-06-13 01:48:38','',5,0,0),(164,'sdaf','<snippetcode></snippetcode><p></p>','sdfasfsa',0,0,NULL,NULL,NULL,'2024-06-13 01:50:16','',5,0,0),(165,'1231','<snippetcode></snippetcode><p></p>','312312321',0,0,NULL,NULL,NULL,'2024-06-13 01:53:00','',5,0,0),(166,',,','<snippetcode></snippetcode><p></p>','..',0,0,NULL,NULL,NULL,'2024-06-13 01:53:38','',5,0,0),(167,'12313123123','<snippetcode></snippetcode><p></p>','2312312312312',0,0,NULL,NULL,NULL,'2024-06-13 02:07:32','',5,0,0),(168,'n','<snippet></snippet><p>mm</p>','n\n',0,0,NULL,NULL,NULL,'2024-06-13 02:09:19','',5,0,0),(169,'q','<snippet>qqq</snippet><p></p>','q',0,0,NULL,NULL,NULL,'2024-06-13 02:09:43','',5,0,0),(170,'asdfasfd','<snippet>aasdfasdfasdfsf</snippet><p></p>','asdfasdfasdf',0,0,NULL,NULL,NULL,'2024-06-13 02:10:07','',5,0,0),(171,'m','<snippet1></snippet1><p></p>','m\n',0,0,NULL,NULL,NULL,'2024-06-13 02:11:25','',5,0,0),(172,'1','<snippet1>e</snippet1><p></p>','1',0,0,NULL,NULL,NULL,'2024-06-13 02:12:36','',1,0,0),(173,'1','<snippet></snippet><p></p>','2',0,0,NULL,NULL,NULL,'2024-06-13 02:13:10','',5,0,0),(174,'a','<snippet color=\"red\"></snippet><p></p>','a',0,0,NULL,NULL,NULL,'2024-06-13 02:16:08','',5,0,0),(175,'z','<snippet>1213123123123qweqwesad</snippet><p></p>','x',0,0,NULL,NULL,NULL,'2024-06-13 02:20:11','',5,0,0),(176,'qq','<snippet></snippet><p></p>','qqqq',0,0,NULL,NULL,NULL,'2024-06-13 02:21:21','',5,0,0),(177,'11','<snippet>mm</snippet><p></p>','',0,0,NULL,NULL,NULL,'2024-06-13 02:23:13','',5,0,0),(178,'123','<snippet>qweqeqwe12312312</snippet><p></p>','123123',0,0,NULL,NULL,NULL,'2024-06-13 02:23:49','',5,0,0),(179,'123','<snippet>123123123123</snippet><p></p>','123123',0,0,NULL,NULL,NULL,'2024-06-13 02:24:54','',5,0,0),(180,'123123','<snippet>asdfsadfsdfa</snippet><p></p>','123123',0,0,NULL,NULL,NULL,'2024-06-13 02:28:23','',5,0,0),(181,'123','<snippet>dfasdfsdfasf</snippet><p></p>','123123123',0,0,NULL,NULL,NULL,'2024-06-13 02:38:41','',5,0,0),(182,'asdfasd','<snippet>asdfasdfasdfasd</snippet><p></p>','fasfadfa',0,0,NULL,NULL,NULL,'2024-06-13 02:39:03','',1,0,0),(183,'adfa','<snippet></snippet><p></p>','sdfasdf',0,0,NULL,NULL,NULL,'2024-06-13 02:41:20','',5,0,0),(184,'a','<p>asdfsdfas</p><snippet>asdfsdfa121111你好</snippet><p></p>','a',0,0,NULL,NULL,NULL,'2024-06-13 02:41:56','',5,0,0),(185,'a','<snippet>zzzzzzz</snippet><p></p>','a',0,0,NULL,NULL,NULL,'2024-06-13 02:42:30','',5,0,0),(186,'asdf','<snippet></snippet><p></p>','asdfasdf',0,0,NULL,NULL,NULL,'2024-06-13 02:43:15','',5,0,0),(187,'zz','<snippet>as2131231231231212312312312df</snippet><p></p>','zzzzz',0,0,NULL,NULL,NULL,'2024-06-13 02:47:30','',5,0,0),(188,'12312','<snippet></snippet><p></p>','123123123',0,0,NULL,NULL,NULL,'2024-06-13 02:47:49','',1,0,0),(189,'123123123','<snippet></snippet><p></p>','123',0,0,NULL,NULL,NULL,'2024-06-13 02:52:37','',5,0,0),(190,'123','<snippet></snippet><p></p>','123123213',0,0,NULL,NULL,NULL,'2024-06-13 02:53:01','',1,0,0),(191,'z','<snippet></snippet><p></p>','z',0,0,NULL,NULL,NULL,'2024-06-13 02:53:28','',5,0,0),(192,'a','<snippet></snippet><p></p>','a',0,0,NULL,NULL,NULL,'2024-06-13 02:53:56','',5,0,0),(193,'asdfasdf','<snippet></snippet><p></p>','asdf',0,0,NULL,NULL,NULL,'2024-06-13 02:54:26','',1,0,0),(194,'sdfasdfasdf','<snippet></snippet><p></p>','asdfa',0,0,NULL,NULL,NULL,'2024-06-13 02:54:58','',5,0,0),(195,'a','<snippet>zzzzzz</snippet><p></p>','a',0,0,NULL,NULL,NULL,'2024-06-13 02:55:17','',1,0,0),(196,'zzz','<snippet>ads9812oiqwehuuqeqwyeuiqyeiqwe</snippet><p></p>','zzzz',0,0,NULL,NULL,NULL,'2024-06-13 02:55:36','',1,0,0),(197,'adsf','<snippet></snippet><p></p>','asfasfasd',0,0,NULL,NULL,NULL,'2024-06-13 02:56:12','',5,0,0),(198,'adfasf','<snippet>asfasfasf123123123123</snippet><p></p>','asdfasdfsdf',0,0,NULL,NULL,NULL,'2024-06-13 02:58:38','',1,0,0),(199,'asdfas','<snippet>z<br># 你觉得呢<br># 我也这么认为z<br># 你觉得呢<br># 我也这么认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111认为zaaaaaaaaaa1111<br># 你觉得呢<br># 我也这么认为z<br># 你觉得呢<br># 我也这么认为<br># 哈哈<br></snippet><p></p>','fasdfsadfsd',0,0,NULL,NULL,NULL,'2024-06-13 03:06:39','',5,0,0),(200,'asdf','<snippet>public class A{<br>   import {NodeViewContent, NodeViewWrapper} from \"@tiptap/react\";\nimport {Snippet} from \"@nextui-org/react\";\n\nconst SnippetView = () =&gt; {\n    return (\n        &lt;NodeViewWrapper&gt;\n            &lt;Snippet\n                variant={\"bordered\"}\n                // symbol=\"#\"\n                hideSymbol\n                classNames={{\n                    base:\"flex flex-row justify-between items-start\"\n                }}\n                onCopy={() =&gt; {\n                    alert(\"nice\")\n                }}\n            &gt;\n                &lt;NodeViewContent&gt;\n                &lt;/NodeViewContent&gt;\n            &lt;/Snippet&gt;\n\n        &lt;/NodeViewWrapper&gt;\n    )\n}\nexport default SnippetView<br>}</snippet><p></p>','sad fa s fa s',0,0,NULL,NULL,NULL,'2024-06-13 03:09:01','',5,0,0),(201,'mmm','<snippet>asdfasdfasdfas<br>asdfasdf<br>asdf<br>asdf<br>adasd<br>Asdasdasdas<br>asdasdasdsd</snippet><p></p><p></p>','mmm',0,0,NULL,NULL,NULL,'2024-06-13 03:14:30','',5,0,0),(202,'a','<snippet>asfasf<br>asfasdf<br>asfasf<br>asdfasf<br>asdfasdf<br>asdfasdf</snippet><p></p>','a',0,0,NULL,NULL,NULL,'2024-06-13 03:15:17','',5,0,0),(203,'asdf','<snippet>aaaaa</snippet><p></p>','asdfasdfasdf',0,0,NULL,NULL,NULL,'2024-06-13 03:15:31','',1,0,0),(204,'asdfa','<snippet>safasfsadfasf</snippet><p></p>','sdfasdfasdf',0,0,NULL,NULL,NULL,'2024-06-13 03:16:28','',5,0,0),(205,'asdfasdfd','<snippet>asdfasdfzasdf<br>asdfasdf<br>asdfasdf<br>asdfasdfasdf</snippet><p></p>','asdfadsf',0,0,NULL,NULL,NULL,'2024-06-13 03:16:48','',1,0,0),(206,'123','<div data-color=\"default\" data-variant=\"bordered\" data-type=\"snippet-block\">da bu liao zi</div><p></p>','123123',0,0,NULL,NULL,NULL,'2024-06-13 19:59:10','',5,0,0),(207,'123','<div data-color=\"default\" data-variant=\"bordered\" data-type=\"snippet-block\">adb shell cat</div><p></p>','123123',0,0,NULL,NULL,NULL,'2024-06-13 20:00:45','',1,0,0),(208,'12','<div data-color=\"default\" data-variant=\"bordered\" data-type=\"snippet-block\"></div><p></p>','123123',0,0,NULL,NULL,NULL,'2024-06-13 20:58:02','',5,0,0),(209,'123','<div data-color=\"default\" data-variant=\"bordered\" data-value=\"1\" data-type=\"snippet-block\"></div><p></p>','123123213',0,0,NULL,NULL,NULL,'2024-06-13 21:03:24','',5,0,0),(210,'234','<div data-color=\"default\" data-variant=\"bordered\" data-value=\"a\" data-type=\"snippet-block\"></div><p></p>','2234234',0,0,NULL,NULL,NULL,'2024-06-13 21:31:38','',5,0,0),(211,'mm','<div data-color=\"primary\" data-variant=\"flat\" data-value=\"\" data-type=\"snippet-block\">mmmmmmm</div><div data-color=\"success\" data-variant=\"flat\" data-value=\"\" data-type=\"snippet-block\"></div><p></p>','mmm',0,0,NULL,NULL,NULL,'2024-06-13 21:50:13','',5,0,0),(212,'123','<div data-color=\"default\" data-variant=\"bordered\" data-value=\"\" data-type=\"snippet-block\"></div><p></p>','12312321',0,0,NULL,NULL,NULL,'2024-06-13 21:53:24','',1,0,0),(213,'123','<div data-color=\"default\" data-variant=\"bordered\" data-type=\"snippet-block\"></div><p><a target=\"\" rel=\"noopener noreferrer nofollow\" class=\"link\" href=\"https://www.baidu.com\">sadfasdf</a></p>','123123213',0,0,NULL,NULL,NULL,'2024-06-13 23:37:21','',5,0,0),(214,'sdf','<div data-color=\"primary\" data-variant=\"bordered\" data-type=\"snippet-block\"></div><p></p>','asdfasdfasdf',0,0,NULL,NULL,NULL,'2024-06-13 23:39:15','',1,0,0),(215,'12','<div data-color=\"default\" data-variant=\"bordered\" data-type=\"snippet-block\">asdfasdfasdfasdfasdfasdfasdf</div><p></p>','123123123',0,0,NULL,NULL,NULL,'2024-06-13 23:57:49','',5,0,0),(216,'234','<div data-color=\"default\" data-variant=\"shadow\" data-type=\"snippet-block\">import {Editor, NodeViewContent, NodeViewWrapper,useReactNodeView} from \"@tiptap/react\";\nimport {Button, Dropdown, DropdownItem, DropdownMenu, DropdownTrigger, Snippet} from \"@nextui-org/react\";\nimport {useState} from \"react\";\nimport {SnippetProps,} from \"@nextui-org/react\";\n\ninterface SnippetViewProps {\n    editor: Editor;\n    getPos: () =&gt; number;\n    node: Node &amp; {\n        attrs: {\n            color: SnippetProps[\'color\'];\n            variant: SnippetProps[\'variant\'];\n        }\n    };\n    updateAttributes: (attrs: Record&lt;string, any&gt;) =&gt; void;\n}\n\nconst SnippetView = (props: SnippetViewProps) =&gt; {\n\n    const { node, updateAttributes } = props;\n\n    const { nodeViewContentRef } = useReactNodeView()\n\n    return (\n        &lt;NodeViewWrapper&gt;\n            &lt;Snippet\n                ref={nodeViewContentRef}\n                classNames={{\n                    base: \"relative flex flex-row flex-start justify-start\",\n                    content: \"max-h-96 overflow-scroll scrollbar-hide\",\n                    pre: \"max-h-96 overflow-scroll scrollbar-hide\",\n                    copyButton: \"absolute top-3 right-3\"\n                }}\n                variant={node.attrs.variant as SnippetProps[\'variant\']}\n                color={node.attrs.color as SnippetProps[\'color\']}\n                hideSymbol\n                autoFocus\n                radius={\"sm\"}\n                fullWidth\n            &gt;\n            &lt;/Snippet&gt;\n        &lt;/NodeViewWrapper&gt;\n    )\n}\nexport default SnippetView</div><p></p>','234324234',0,0,NULL,NULL,NULL,'2024-06-14 00:07:26','',5,0,0),(217,'1231','<div data-color=\"default\" data-variant=\"bordered\" data-type=\"snippet-block\"></div><p></p>','23123123',0,0,NULL,NULL,NULL,'2024-06-14 00:07:49','',1,0,0),(218,'123','<div data-color=\"default\" data-variant=\"bordered\" data-type=\"snippet-block\"></div><p></p>','312321312',0,0,NULL,NULL,NULL,'2024-06-14 00:09:01','',1,0,0),(219,'123','<div data-color=\"default\" data-variant=\"bordered\" data-type=\"snippet-block\">import {Editor, NodeViewContent, NodeViewWrapper,useReactNodeView} from \"@tiptap/react\";\nimport {Button, Dropdown, DropdownItem, DropdownMenu, DropdownTrigger, Input, Snippet} from \"@nextui-org/react\";\nimport {useState} from \"react\";\nimport {SnippetProps,} from \"@nextui-org/react\";\n\ninterface SnippetViewProps {\n    editor: Editor;\n    getPos: () =&gt; number;\n    node: Node &amp; {\n        attrs: {\n            color: SnippetProps[\'color\'];\n            variant: SnippetProps[\'variant\'];\n        }\n    };\n    updateAttributes: (attrs: Record&lt;string, any&gt;) =&gt; void;\n}\n\nconst SnippetView = (props: SnippetViewProps) =&gt; {\n\n    const { node, updateAttributes } = props;\n\n    const { nodeViewContentRef } = useReactNodeView()\n\n    return (\n        &lt;NodeViewWrapper&gt;\n            &lt;Snippet\n                ref={nodeViewContentRef}\n                classNames={{\n                    base: \"relative flex flex-row flex-start justify-start\",\n                    content: \"max-h-96 overflow-scroll scrollbar-hide\",\n                    // pre: \"max-h-96 overflow-scroll scrollbar-hide\",\n                    copyButton: \"absolute top-3 right-3\"\n                }}\n                variant={node.attrs.variant as SnippetProps[\'variant\']}\n                color={node.attrs.color as SnippetProps[\'color\']}\n                hideSymbol\n                autoFocus\n                radius={\"sm\"}\n                fullWidth\n            &gt;\n            &lt;/Snippet&gt;\n        &lt;/NodeViewWrapper&gt;\n    )\n}\nexport default SnippetView</div><p></p><p></p>','123123213',0,0,NULL,NULL,NULL,'2024-06-14 00:09:57','',1,0,0),(220,'fasdfasdfsadf','<div data-color=\"default\" data-variant=\"bordered\" data-type=\"snippet-block\">asdfasdfsdfsad/</div><p></p>','asdfas',0,0,NULL,NULL,NULL,'2024-06-14 00:19:32','',5,0,0),(221,'asdfasd','<div data-color=\"default\" data-variant=\"bordered\" data-type=\"snippet-block\">asdfasdfsadfasdf</div><p></p>','fsafsdf',0,0,NULL,NULL,NULL,'2024-06-14 00:20:11','',1,0,0),(222,'32412','<div data-color=\"default\" data-variant=\"bordered\" data-type=\"snippet-block\">sdsadasd2131232132131</div><p></p>','1231',0,0,NULL,NULL,NULL,'2024-06-14 00:23:36','',5,0,0),(223,'123','<div data-color=\"default\" data-variant=\"bordered\" data-type=\"snippet-block\"> 你好呀我是李伟</div><p></p>','123123',0,0,NULL,NULL,NULL,'2024-06-14 00:34:45','',5,0,0),(224,'asdf','<p>This is still the text editor you’re used to, but enriched with node views.</p><react-component>This is easdfasdfasfdasdfasfasdfasdfasdf</react-component><p>Did you see that? That’s a React component. We are really living in the future.</p>','asdfasdf',0,0,NULL,NULL,NULL,'2024-06-14 01:15:14','',5,0,0),(225,'mm','<p>,,</p>','mm',0,0,0,0,0,'2024-06-23 12:40:24','',5,0,0),(226,'mmmm','<p></p>','mmmm',0,25,0,0,0,'2024-06-23 12:41:10','',1,0,0),(227,'123123','<p>12321321321312321321</p>','213qweqwewqewqeqwe',0,30,0,0,0,'2024-06-23 12:59:32','',5,0,0),(228,'nnnnmm','<p>rrrrr</p>','bbbnnnnnn',0,30,0,0,0,'2024-06-23 13:01:50','',1,0,0),(229,'zz','<p>zzzz</p>','zzz',0,30,0,0,0,'2024-06-23 13:02:02','',1,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_category`
--

LOCK TABLES `post_category` WRITE;
/*!40000 ALTER TABLE `post_category` DISABLE KEYS */;
INSERT INTO `post_category` VALUES (1,158,1),(2,163,1),(3,162,1),(4,158,2),(5,159,2),(6,160,2),(7,162,2),(8,158,7),(9,159,7),(10,162,7),(90,159,1),(91,161,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章_专栏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_column`
--

LOCK TABLES `post_column` WRITE;
/*!40000 ALTER TABLE `post_column` DISABLE KEYS */;
INSERT INTO `post_column` VALUES (78,159,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` VALUES (168,159,7);
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
INSERT INTO `role` VALUES (0,'ADMIN'),(1,'GUEST');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='专栏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'OTA','OTA','https://images.pexels.com/photos/3769138/pexels-photo-3769138.jpeg?auto=compress&cs=tinysrgb&w=1260&',5),(2,'React','adf','https://pbs.twimg.com/profile_images/1785867863191932928/EpOqfO6d_400x400.png',4),(3,'123123','ad','12312',5),(4,'123123','ad','12312',NULL),(5,'123','123123','',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (6,'Mysql'),(27,'NextJs'),(5,'RabbitMQ'),(3,'React'),(7,'Recovery'),(4,'redis'),(9,'SpringBoot'),(28,'update_engine'),(8,'virtual A/B');
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
  `status` int NOT NULL DEFAULT '0' COMMENT '账号状态',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_pk2` (`username`),
  UNIQUE KEY `user_pk` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0,'A better tomorrow','3499508634@qq.com','$2a$10$UAUNRELrTkQrHBRa9KscJ.21RHQlst7uXYIz4OJsHv4vBHnUJZzKG','时间所有的痛苦都来自于对外部世界的欲望','2024-03-15 13:58:17','https://images.pexels.com/photos/17037983/pexels-photo-17037983/free-photo-of-sunbeds-on-beach.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',24,0,'sdfasfdasdfsdfasfdasdfsdfasfdasdf'),(1,'A better tomor','2278098503@qq.com','$2a$10$UAUNRELrTkQrHBRa9KscJ.21RHQlst7uXYIz4OJsHv4vBHnUJZzKG','时间所有的痛苦都来自于对外部世界的欲望','2024-04-16 20:48:53','https://images.pexels.com/photos/17037983/pexels-photo-17037983/free-photo-of-sunbeds-on-beach.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',23,1,'1'),(23,'asdasd','2278098503m@qq.com','$2a$10$34Ak1HZwEBJ2uE7/wMooLO662JUu/SXl41e6yAJ1d.87jEQqf8azS',NULL,'2024-06-08 09:37:06',NULL,NULL,0,NULL),(24,'07faa4fe-d2eb-445f-8bf2-55562bf8bcd2','22780985031m@qq.com','$2a$10$JcZe1KP0t5fGSgcTNcRYIulPwusY6Fms89bS4COBhS6aIbp37M7wu',NULL,'2024-06-08 09:40:02',NULL,NULL,0,NULL),(25,'eaac353a-e2ce-4f73-9906-4dc930ec4812','3141282040@qq.com','$2a$10$mQhNCgnigToOURMR3E/7s.2GRs62SWlrjPjlXGRGcOyC0JWiw5/oq',NULL,'2024-06-08 09:50:13',NULL,NULL,0,NULL),(26,'ca2d8c35-ff88-4e74-b26c-c659a00ee17f','349950861134@qq.com','$2a$10$zc6U1QTDhzr03awk3X2nXul1hUkj.bAGtjuoHpyXnP5ZX5yHaNDCi',NULL,'2024-06-08 10:11:49',NULL,NULL,0,NULL),(27,'899a0a29-6f7f-4a5a-a038-497a3c0e8e6b','123123123@qq.com','$2a$10$aVezs47A81u7lce4rCxN3uuVFxdeVZtTjg6EROq4qcxuar3nB6dAO',NULL,'2024-06-08 10:13:13',NULL,NULL,0,NULL),(28,'65062e0b-037c-4127-8a5a-e43862397523','123@qq.com','$2a$10$RMQAqTDd9ji4ToQnWajTueCeIH0eWMQgVp7ywouFWNLxLqLQcCxpu',NULL,'2024-06-08 15:14:33',NULL,NULL,0,NULL),(29,'12a40d9e-e16e-4929-abd8-0c4113217a8b','18710397393@qq.com','$2a$10$Ree//4.vFL3cCDA5OAU5/eAoQac9DLQFaCv.wj7/JRca8bLWy3Knq',NULL,'2024-06-09 18:45:54',NULL,NULL,0,NULL),(30,'755918e6-ffab-4cf1-b235-cc76814657f4','mmmm@qq.com','$2a$10$8S7hskBDghUZXhgKsjxXj.18bEpO/CACosQGdGIck98w7DDrXPn02',NULL,'2024-06-23 12:58:59',NULL,NULL,0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (0,0,0),(1,0,1),(2,1,0),(3,1,1),(12,26,1),(13,27,1),(14,28,1),(15,29,1),(16,30,1);
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

-- Dump completed on 2024-06-25  1:25:57
