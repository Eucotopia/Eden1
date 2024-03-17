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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'JAVA',1),(2,'Spring',2),(3,'依赖注入',2),(4,'版本控制',4),(5,'Git',4),(6,'Apple',6),(7,'Swift',6),(8,'NextUI',8),(9,'考研',9);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
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
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章内容',
  `summary` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '摘要',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_top` int NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `user_id` int NOT NULL COMMENT '用户 ID',
  `likes` int DEFAULT '0' COMMENT '点赞数',
  `views` int DEFAULT '0' COMMENT '浏览数',
  `comments` int DEFAULT '0' COMMENT '评论数',
  `cover` longtext COMMENT '博客封面',
  `rating` float DEFAULT NULL COMMENT '评分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (54,'【Swift】The basics','<h2 id=\"1a2f9e85-b70c-4ee6-bd4f-4745f4eaf42a\" data-toc-id=\"1a2f9e85-b70c-4ee6-bd4f-4745f4eaf42a\">Declaring Constants and Variables</h2><p>Constants and variables must be declared before they’re used. You declare constants with the let keyword and variables with the var keyword.</p><pre><code class=\"language-swift\">let maximumNumberOfLoginAttempts = 10\nvar currentLoginAttempt = 0</code></pre><p>When you declare a constants or a variable, you can  git it a value as part of that declaration.Alternatively, you can assign its initial value later in the program</p><pre><code class=\"language-swift\">var environment = \"development\"\nlet maximumNumberOfLoginAttempts: Int\n// maximumNumberOfLoginAttempts has no value yet.\n\nif environment == \"development\" {\n    maximumNumberOfLoginAttempts = 100\n} else {\n    maximumNumberOfLoginAttempts = 10\n}\n// Now maximumNumberOfLoginAttempts has a value, and can be read.\n</code></pre><p>You can declare multiple constants or multiple variables on a single line, separated by commas</p><pre><code class=\"language-swift\">var x = 0.0, y = 0.0, z = 0.0</code></pre><p></p>','learn swift ','2024-02-07 18:45:30',0,1,20,21,NULL,'https://nextui.org/images/album-cover.png',NULL),(56,'Swift','<h2 id=\"5795654f-18d3-4da7-9fab-1b62e9eac3bb\" data-toc-id=\"5795654f-18d3-4da7-9fab-1b62e9eac3bb\">Assignment Operator</h2><p>The assignment operator(a = b)initializes or updates the value of a with the value of b:</p><pre><code class=\"language-swift\">let b = 10\nvar a = 5\na = b</code></pre><p>if the right side of the assignment is a tuple with multiple values, its elements can be decomposed into multiple constants or variables at once</p><pre><code class=\"language-swift\">let (x, y) = (1, 2)</code></pre><p>Unlike the assignment operator in C and Objective-C, the assignment operator in Swift doesn’t itself return a value. The following statement isn’t valid:</p><pre><code class=\"language-swift\">if x = y {\n   // This isn\'t valid, because x = y doesn\'t return a value\n}</code></pre><p>The feature prevents the assignment operator(=)from being used by accident when the equal to operator(=)is actually intended. By making if x = y invalid, Swift helps you to avoid these kinds of errors in your code.</p><h2 id=\"acf7bf6a-9b2c-4f20-ba21-9f87b1b7b6f6\" data-toc-id=\"acf7bf6a-9b2c-4f20-ba21-9f87b1b7b6f6\">Arithmetic Operators</h2><p>Swift supports the four standard <em>arithmetic operators</em> for all number types:</p><ul><li><p>Addition(+)</p></li><li><p>Subtraction(-)</p></li><li><p>Multiplication(*)</p></li><li><p>Division(/)</p></li></ul><pre><code>1 + 2\n5 - 3\n2 * 3\n10.0 / 2.5</code></pre><p>The addition operator is also supported for String concatenation:</p><pre><code class=\"language-swift\">\"hello, \" + \"world\"</code></pre><h3 id=\"14082ea6-1251-4191-9f92-6dd436b14702\" data-toc-id=\"14082ea6-1251-4191-9f92-6dd436b14702\">Remainder Operator</h3><p>The </p><p></p>','Swift','2024-02-08 21:20:17',1,1,21,21,NULL,'https://nextui.org/images/album-cover.png',NULL),(64,'git','<h1 id=\"9cd7a95b-1dfb-4cd7-ab70-88c447c1db10\" data-toc-id=\"9cd7a95b-1dfb-4cd7-ab70-88c447c1db10\" style=\"text-align: start\">起步</h1><h2 id=\"166222ed-4817-41a2-87b1-3cba1e594aa1\" data-toc-id=\"166222ed-4817-41a2-87b1-3cba1e594aa1\" style=\"text-align: start\">初次运行 Git 前的配置</h2><h3 id=\"41ebbfc2-584d-4009-8b14-2df8b1566a9b\" data-toc-id=\"41ebbfc2-584d-4009-8b14-2df8b1566a9b\" style=\"text-align: start\">用户信息</h3><pre><code class=\"language-Shell\">git config --global user.name \"\"\ngit config --global user.email \"\"\n</code></pre><h3 id=\"30cb8306-bc48-49e3-8cb0-58fb5420d617\" data-toc-id=\"30cb8306-bc48-49e3-8cb0-58fb5420d617\" style=\"text-align: start\">设置文本编辑器</h3><p style=\"text-align: start\">如果不进行配置，Git 会使用操作系统默认的文本编辑器，通常是 Vim</p><pre><code class=\"language-Shell\">git config --global core.editor emacs\n</code></pre><h3 id=\"e7490b4b-6468-4089-9eed-b7d4edd356f0\" data-toc-id=\"e7490b4b-6468-4089-9eed-b7d4edd356f0\" style=\"text-align: start\">检查配置信息</h3><p style=\"text-align: start\">如果想要检查 Git 的配置，可以使用 <code>git config --list</code> 命令来列出 Git 当时能找到的配置</p><pre><code class=\"language-Shell\">git config --list\n</code></pre><p style=\"text-align: start\">通过上述命令，我们可能会发现同一个变量具有多个值，这是因为 Git 会从多个配置文件（例如：<code>/etc/gitconfig</code> 与 <code>~/.gitconfig</code>）中查找，在这种情况下，Git 会使用找到每一个变量的最后一个配置</p><p style=\"text-align: start\">同时，我们可以使用 <code>git config &lt;key&gt;</code> 来检查 Git 的某一项配置</p><pre><code class=\"language-Shell\">$ git config user.name\nliwei\n$ git config user.email\nwli@pvetec.com\n</code></pre><h3 id=\"b8e6d513-aef0-4438-841d-40403bae3505\" data-toc-id=\"b8e6d513-aef0-4438-841d-40403bae3505\" style=\"text-align: start\">获取帮助</h3><p style=\"text-align: start\">若你使用 Git 时需要获取帮助，有三种方法可以找到 Git 命令的使用手册</p><pre><code class=\"language-Shell\">git help &lt;verb&gt;\ngit &lt;verb&gt; --help\nman git-&lt;verb&gt;\n</code></pre><h1 id=\"31718acc-d37d-45f5-a277-8cac6debd8d7\" data-toc-id=\"31718acc-d37d-45f5-a277-8cac6debd8d7\" style=\"text-align: start\">Git 基础</h1><h2 id=\"2fae4ff6-380c-4762-9cec-1b1dd71ad407\" data-toc-id=\"2fae4ff6-380c-4762-9cec-1b1dd71ad407\" style=\"text-align: start\">获取 Git 仓库</h2><p style=\"text-align: start\">有两种取得 Git 项目仓库的方法。第一种是在现有项目或目录下导入所有文件到 Git 中；第二种是从一个服务器克隆一个现有的 Git 仓库</p><h3 id=\"e9087e8f-586a-4bb5-89f5-55ccc2196f36\" data-toc-id=\"e9087e8f-586a-4bb5-89f5-55ccc2196f36\" style=\"text-align: start\">在现有仓库中初始化仓库</h3><p style=\"text-align: start\">如果我们打算通过 Git 来对现有项目进行管理，只需要进入该项目目录并输入</p><pre><code class=\"language-Shell\">git init\n</code></pre><p style=\"text-align: start\">该命令将会创建一个名为 <code>.git</code> 的子目录，这个子目录含有你初始化的 Git 仓库中所有的必要文件。这些文件是 Git 仓库的骨干。但是，在这个时候，我们仅仅只是做了一个初始化的操作，我们项目中的文件依旧没有被跟踪</p><p style=\"text-align: start\">如果是在一个已经存在文件的文件夹（不是空文件夹）中初始化 Git 仓库来进行版本版本控制的话，我们应该开始跟踪这些文件并提交</p><pre><code class=\"language-Shell\"># 添加文件到暂存区\ngit add *.c\ngit add LICENSE\n# 将暂存区的更改提交到版本控制系统\ngit commit -m \"initail project version\"\n</code></pre><h3 id=\"ba72b190-23cc-44ae-b76a-4495b9f1c485\" data-toc-id=\"ba72b190-23cc-44ae-b76a-4495b9f1c485\" style=\"text-align: start\">克隆现有的仓库</h3><p style=\"text-align: start\">克隆仓库的命令格式为 git clone [url]，例如</p><pre><code class=\"language-Shell\">git clone https://github.com/libgit2/libgit2\n</code></pre><p style=\"text-align: start\">这将会在当前目录下创建一个名为 <code>libgit2</code> 的目录，并在这个目录下初始化一个 <code>.git</code> 文件。从远程仓库中拉取下来的所有数据放入 <code>.git</code> 文件夹，然后从中读取最新版本的文件的拷贝。如果你进入到这个新建的 <code>libgit2</code> 文件夹，你会发现所有的项目文件已经在里面了，准备就绪等待后续的开发和使用。 如果你想在克隆远程仓库的时候，自定义本地仓库的名字，你可以使用如下命令：</p><pre><code class=\"language-Shell\">$ git clone https://github.com/libgit2/libgit2 mylibgit\n</code></pre><p style=\"text-align: start\">这将执行与上一个命令相同的操作，不过在本地创建的仓库名字变为 <code>mylibgit</code></p><h2 id=\"0f9f4709-6296-4f93-bb7f-aa2410d88213\" data-toc-id=\"0f9f4709-6296-4f93-bb7f-aa2410d88213\" style=\"text-align: start\">记录每次更新到仓库</h2><p style=\"text-align: start\">在我们的工作目录下的每一个文件都无外乎这两种状态：已跟踪或未跟踪。已跟踪的文件是指那些被纳入了版本控制的文件，在上一次快照中有它们的记录，在工作一段时间后，他们的状态可能处于未修改，已修改或已放入暂存区。工作目录中除已跟踪文件之外的所有其他文件都属于未跟踪文件，他们既不存在于上次快照的记录中，也没有放入暂存区。初次克隆某个仓库的时候，工作目录下所有的文件都属于已跟踪文件，并处于未修改状态。</p><p style=\"text-align: start\">编辑过某些文件后，由于自上次提交后你对它们做了修改，Git 将它们 标记为已修改文件，我们逐步将这些修改过的文件放入暂存区，然后提交所有暂存了的修改，如此反复。所以使用 Git 时文件的生命周期如下：</p><p style=\"text-align: start\"></p><h3 id=\"cdc5cc37-82e8-4f77-984a-12079288fe28\" data-toc-id=\"cdc5cc37-82e8-4f77-984a-12079288fe28\" style=\"text-align: start\">检查当前文件状态</h3><p style=\"text-align: start\">要查看哪些文件处于什么状态，可以使用 <code>git status</code> 命令。如果在克隆仓库后立即使用此命令，会看到类似这样的输出：</p><pre><code class=\"language-Shell\">git status\nOn branch master\nmothing to commit,working directory clean\n</code></pre><p style=\"text-align: start\">这说明当前的工作目录相当干净。换句话说，所有已跟踪的文件在上次提交之后都未被修改。同时，上述信息还表明，当前目录下没有出现任何处于未跟踪状态的新文件，否则 Git 会列出未跟踪的文件</p><p style=\"text-align: start\">现在，让我们在项目中创建一个新的 README 文件。如果之前并不存在这个文件，使用 <code>git status</code> 命令可以看到一个新的未跟踪文件：</p><pre><code class=\"language-Shell\">$ echo \'My Project\' &gt; README\n$ git status\nOn branch master\nUntracked files:\n  (use \"git add &lt;file&gt;...\" to include in what will be committed)\n\n    README\n\nnothing added to commit but untracked files present (use \"git add\" to track)\n</code></pre><p style=\"text-align: start\">上述信息可以看到新建的 README 文件出现在 <code>Untracked files</code>下面。未跟踪的文件意味着 Git 在之前的快照（提交）中没有这些文件；Git 不会自动将之纳入跟踪范围，除非你明明白白地告诉它\"我需要跟踪该文件\"，这样的处理让你不必担心将生成的二进制文件或其它不想被跟踪的文件包含进来。 不过现在的例子中，我们确实想要跟踪管理 README 这个文件</p><h3 id=\"c862131d-0d2b-413b-a9bf-89021854a8e9\" data-toc-id=\"c862131d-0d2b-413b-a9bf-89021854a8e9\" style=\"text-align: start\">跟踪新文件</h3><p style=\"text-align: start\">使用 <code>git add</code> 开始跟踪一个文件。所以，要跟踪 README 文件，运行：</p><pre><code class=\"language-Shell\">git add REAMDE\n</code></pre><p style=\"text-align: start\">此时再运行 <code>git status</code> 命令，会看到 README 文件已被跟踪，并处于暂存状态：</p><pre><code class=\"language-Shell\">$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    new file:   README\n</code></pre><p style=\"text-align: start\">只要是在 changes to be committed 下的文件，就说明是已暂存状态。如果此时进行提交，那么该文件此时此刻的版本将被留存在历史记录中。如果 <code>git add</code> 命令使用文件或者目录的路径作为参数，那么该命令将递归的跟踪该目录下的所有文件</p><h3 id=\"b17128fd-7308-44f0-929f-4655eccd0658\" data-toc-id=\"b17128fd-7308-44f0-929f-4655eccd0658\" style=\"text-align: start\">暂存已修改文件</h3><p style=\"text-align: start\">现在我们来修改一个已经被跟踪的文件。如果你修改了一个名为 <code>CONTRIBUTING.md</code> 的已被跟踪的文件，然后运行 <code>git status</code> 命令，会看到下面内容：</p><pre><code class=\"language-Shell\">$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    new file:   README\n\nChanges not staged for commit:\n  (use \"git add &lt;file&gt;...\" to update what will be committed)\n  (use \"git checkout -- &lt;file&gt;...\" to discard changes in working directory)\n\n    modified:   CONTRIBUTING.md\n</code></pre><p style=\"text-align: start\">文件 <code>CONTRIBUTING.md</code> 出现在 <code>Changes not staged for commit</code> 这行下面，说明已跟踪文件的内容发生了变化，但还没有放到暂存区。 要暂存这次更新，需要运行 <code>git add</code> 命令。 这是个多功能命令：可以用它开始跟踪新文件，或者把已跟踪的文件放到暂存区，还能用于合并时把有冲突的文件标记为已解决状态等。 将这个命令理解为“添加内容到下一次提交中”而不是“将一个文件添加到项目中”要更加合适。 现在让我们运行 <code>git add</code>将\"CONTRIBUTING.md\"放到暂存区，然后再看看 <code>git status</code> 的输出：</p><pre><code class=\"language-Shell\">$ git add CONTRIBUTING.md\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    new file:   README\n    modified:   CONTRIBUTING.md\n</code></pre><p style=\"text-align: start\">现在两个文件都已暂存，下次提交时就会一并记录到仓库。假设此时，你想要在 <code>CONTRIBUTING.md</code> 里再加条注释， 重新编辑存盘后，准备好提交。 不过且慢，再运行 <code>git status</code> 看看：</p><pre><code class=\"language-Shell\">$ vim CONTRIBUTING.md\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    new file:   README\n    modified:   CONTRIBUTING.md\n\nChanges not staged for commit:\n  (use \"git add &lt;file&gt;...\" to update what will be committed)\n  (use \"git checkout -- &lt;file&gt;...\" to discard changes in working directory)\n\n    modified:   CONTRIBUTING.md\n</code></pre><p style=\"text-align: start\">现在我们发现 <code>CONTRIBUTING.md</code> 文件同时出现在暂存区和非暂存区。实际上，Git 只会暂存你运行了 <code>git add</code> 命令时的版本，如果我们现在提交，那么 <code>CONTRIBUTING.md</code> 的版本是你最后一次运行 <code>git add</code> 命令时的那个版本，而不是你运行 <code>git commit</code> 时，在工作目录中的当前版本。所以运行了 <code>git add</code> 之后又作了修订的文件，需要重新运行 <code>git add</code> 把最新版本进行暂存起来</p><pre><code class=\"language-Shell\">$ git add CONTRIBUTING.md\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    new file:   README\n    modified:   CONTRIBUTING.md\n</code></pre><h3 id=\"50dc5364-8c54-4bd7-833e-270cfdff2755\" data-toc-id=\"50dc5364-8c54-4bd7-833e-270cfdff2755\" style=\"text-align: start\">状态简介</h3><p style=\"text-align: start\"><code>git status</code> 命令的输入十分详细，但其用语有些繁琐。 如果你使用 <code>git status -s</code> 命令或 <code>git status --short</code>命令，你将得到一种更为紧凑的格式输出。 运行 <code>git status -s</code> ，状态报告输出如下：</p><pre><code class=\"language-Shell\">$ git status -s\n M README\nMM Rakefile\nA  lib/git.rb\nM  lib/simplegit.rb\n?? LICENSE.txt\n</code></pre><ol><li><p>？？：表示新添加的文件没有被跟踪</p></li><li><p>_M：表示文件被修改但是没有加入暂存区</p></li><li><p>M_：表示文件被修改且加入到暂存区</p></li><li><p>MM：表示文件加入到暂存区后再一个进行了修改，所以在暂存区和工作区都有该文件被修改了的记录</p></li><li><p>A：表示新添加到暂存区的文件</p></li></ol><h3 id=\"91fbc75d-a8e4-48aa-b33e-10eaecc99f9b\" data-toc-id=\"91fbc75d-a8e4-48aa-b33e-10eaecc99f9b\" style=\"text-align: start\">忽略文件</h3><p style=\"text-align: start\">一般情况下又会有些文件不需要纳入 Git 的管理，也不希望它们总是出现在未被跟踪的文件列表中，通常都是些自动生成的文件，比如日志文件，或者编译过程中创建的临时文件等。这种情况下，我们可以创建一个名为 <code>.gitignore</code> 的文件，列出要忽略的文件模式。如下：</p><pre><code class=\"language-Shell\">$ cat .gitignore\n*.[oa]\n*~\n</code></pre><p style=\"text-align: start\">第一行告诉 Git 忽略所有以 <code>.o</code> 或 <code>.a</code> 结尾的文件。一般这类对象文件和存档文件都是编译过程中出现的。 第二行告诉 Git 忽略所有以波浪符（~）结尾的文件，许多文本编辑软件（比如 Emacs）都用这样的文件名保存副本。 此外，你可能还需要忽略 log，tmp 或者 pid 目录，以及自动生成的文档等等。 要养成一开始就设置好 .gitignore 文件的习惯，以免将来误提交这类无用的文件。</p><p style=\"text-align: start\">文件 <code>.gitignore</code> 的格式规范如下：</p><ul><li><p>所有空行或者以 <code>#</code> 开头的行都会被 Git 忽略</p></li><li><p>可以使用标准的 glob 模式匹配</p></li><li><p>匹配模式可以以（<code>/</code>）开头防止递归</p></li><li><p>匹配模式可以以（<code>/</code>）结尾指定目录</p></li><li><p>要忽略指定模式以外的文件或目录，可以在模式前加上惊叹号（<code>!</code>） 取反</p></li></ul><p style=\"text-align: start\">所谓的 glob 模式指的是 shell 所使用的简化版正则表达式。星号（<em>）表示匹配一个或者多个字符；[abc]表示匹配方括号中的某一个字符；问好（?）表示只匹配一个任意字符；如果方括号内用短划线分隔两个字符，表示所有在这两个字符之间内的都可以匹配（例如，</em><code>[0-9]</code> 表示匹配所有 0-9 之间的数字）；使用两个星号（）表示匹配任意中间目录（<code>/a/**/b</code> 可以匹配 <code>/a/c/b</code>、<code>/a/c/d/b</code>等）</p><h3 id=\"ed1709dd-478d-47ad-9279-ebb93f3823c6\" data-toc-id=\"ed1709dd-478d-47ad-9279-ebb93f3823c6\" style=\"text-align: start\">查看已暂存和未暂存的修改</h3><p style=\"text-align: start\">当我们使用 <code>git status</code> 所给出的结果可能相对模糊，我们无法知道具体那些地方被修改了。使用 <code>git diff</code> 可以很好的解决这个问题，它可以根据文件补丁的方式显示具体哪些行被修改了</p><p style=\"text-align: start\">假如再次修改 README 文件后暂存，然后编辑 <code>CONTRIBUTING.md</code> 后不暂存，运行 <code>git status</code> 命令将会看到：</p><pre><code class=\"language-Shell\">$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    modified:   README\n\nChanges not staged for commit:\n  (use \"git add &lt;file&gt;...\" to update what will be committed)\n  (use \"git checkout -- &lt;file&gt;...\" to discard changes in working directory)\n\n    modified:   CONTRIBUTING.md\n</code></pre><p style=\"text-align: start\">要查看尚未暂存的文件修改了哪些部分，不加参数直接输入 <code>git diff</code> ：</p><pre><code class=\"language-Shell\">$ git diff\ndiff --git a/CONTRIBUTING.md b/CONTRIBUTING.md\nindex 8ebb991..643e24f 100644\n--- a/CONTRIBUTING.md\n+++ b/CONTRIBUTING.md\n@@ -65,7 +65,8 @@ branch directly, things can get messy.\n Please include a nice description of your changes when you submit your PR;\n if we have to read the whole diff to figure out why you\'re contributing\n in the first place, you\'re less likely to get feedback and have your change\n-merged in.\n+merged in. Also, split your changes into comprehensive chunks if your patch is\n+longer than a dozen lines.\n\n If you are starting to work on a particular area, feel free to submit a PR\n that highlights your work in progress (and note in the PR title that it\'s\n</code></pre><p style=\"text-align: start\">需要注意的是，该命令比较的是工作目录中当前文件与暂存区快照之间的差异，也就是修改之后还没有暂存起来的变化内容</p><p style=\"text-align: start\">若要查看当前已经暂存的内容和要添加到下一次提交的内容（说白了，就是当前暂存的内容和最近一次提交内容的差异），可以用 <code>git diff --cached</code> 命令。Git 1.6.1 及更高版本还允许使用 <code>git diff --staged</code>，效果是相同的，但更好记些）</p><pre><code class=\"language-Shell\">$ git diff --staged\ndiff --git a/README b/README\nnew file mode 100644\nindex 0000000..03902a1\n--- /dev/null\n+++ b/README\n@@ -0,0 +1 @@\n+My Project\n</code></pre><p style=\"text-align: start\">请注意，git diff 本身只显示尚未暂存的改动，而不是自上次提交以来所做的所有改动。 所以有时候你一下子暂存了所有更新过的文件后，运行 <code>git diff</code> 后却什么也没有，就是这个原因</p><p style=\"text-align: start\">像之前说的，暂存 <code>CONTRIBUTING.md</code> 后再编辑，运行 <code>git status</code> 会看到暂存前后的两个版本。 如果我们的环境（终端输出）看起来如下：</p><pre><code class=\"language-Shell\">$ git add CONTRIBUTING.md\n$ echo \'# test line\' &gt;&gt; CONTRIBUTING.md\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    modified:   CONTRIBUTING.md\n\nChanges not staged for commit:\n  (use \"git add &lt;file&gt;...\" to update what will be committed)\n  (use \"git checkout -- &lt;file&gt;...\" to discard changes in working directory)\n\n    modified:   CONTRIBUTING.md\n</code></pre><p style=\"text-align: start\">现在运行 <code>git diff</code> 看暂存前后的变化：</p><pre><code class=\"language-Shell\">$ git diff\ndiff --git a/CONTRIBUTING.md b/CONTRIBUTING.md\nindex 643e24f..87f08c8 100644\n--- a/CONTRIBUTING.md\n+++ b/CONTRIBUTING.md\n@@ -119,3 +119,4 @@ at the\n ## Starter Projects\n\n See our [projects list](https://github.com/libgit2/libgit2/blob/development/PROJECTS.md).\n+# test line\n</code></pre><p style=\"text-align: start\">然后用 <code>git diff --cached</code> 查看已经暂存起来的变化：（--staged 和 --cached 是同义词）</p><pre><code class=\"language-Shell\">$ git diff --cached\ndiff --git a/CONTRIBUTING.md b/CONTRIBUTING.md\nindex 8ebb991..643e24f 100644\n--- a/CONTRIBUTING.md\n+++ b/CONTRIBUTING.md\n@@ -65,7 +65,8 @@ branch directly, things can get messy.\n Please include a nice description of your changes when you submit your PR;\n if we have to read the whole diff to figure out why you\'re contributing\n in the first place, you\'re less likely to get feedback and have your change\n-merged in.\n+merged in. Also, split your changes into comprehensive chunks if your patch is\n+longer than a dozen lines.\n\n If you are starting to work on a particular area, feel free to submit a PR\n that highlights your work in progress (and note in the PR title that it\'s\n</code></pre><h3 id=\"a1fa3f43-5c10-4534-887b-7dff755e16d9\" data-toc-id=\"a1fa3f43-5c10-4534-887b-7dff755e16d9\" style=\"text-align: start\">提交更新</h3><p style=\"text-align: start\">现在暂存区域已经准备妥当可以提交了。在此之前，一定要确定还有什么修改过的或新建的文件还没有 <code>git add</code>过，否则提交的时候不会记录这些还没暂存起来的变化。这些修改过的文件只会保留在本地磁盘。所以，每次准备提交前，先用 <code>git status</code> 看下，是否需要提交的代码都已经暂存起来了，然后再运行提交命令 <code>git commit</code>：</p><pre><code class=\"language-Shell\">git commit\n</code></pre><p style=\"text-align: start\">这种方式会启动文本编辑器以便输入本次提交的说明。(默认会启用 shell 的环境变量 <code>$EDITOR</code> 所指定的软件，一般都是 vim 或 emacs）</p><p style=\"text-align: start\">编辑器会显示类似下面的文本信息（本例选用 Vim 的屏显方式展示）：</p><pre><code class=\"language-Shell\"># Please enter the commit message for your changes. Lines starting\n# with \'#\' will be ignored, and an empty message aborts the commit.\n# On branch master\n# Changes to be committed:\n#    new file:   README\n#    modified:   CONTRIBUTING.md\n#\n~\n~\n~\n\".git/COMMIT_EDITMSG\" 9L, 283C\n</code></pre><p style=\"text-align: start\">可以看到，默认的提交消息包含最后一次运行 <code>git status</code> 的输出，放在注释行里，另外开头还有一空行，供你输入提交说明。 你完全可以去掉这些注释行，不过留着也没关系，多少能帮你回想起这次更新的内容有哪些。 (如果想要更详细的对修改了哪些内容的提示，可以用 <code>-v</code> 选项，这会将你所做的改变的 diff 输出放到编辑器中从而使你知道本次提交具体做了哪些修改。） 退出编辑器时，Git 会丢掉注释行，用你输入提交附带信息生成一次提交</p><p style=\"text-align: start\">另外，我们也可以在 <code>commit</code> 命令后添加 <code>-m</code> 选项，将提交信息与命令放在同一行，如下所示：</p><pre><code class=\"language-Shell\">$ git commit -m \"Story 182: Fix benchmarks for speed\"\n[master 463dc4f] Story 182: Fix benchmarks for speed\n 2 files changed, 2 insertions(+)\n create mode 100644 README\n</code></pre><p style=\"text-align: start\">好，现在你已经创建了第一个提交！ 可以看到，提交后它会告诉你，当前是在哪个分支（<code>master</code>）提交的，本次提交的完整 SHA-1 校验和是什么（<code>463dc4f</code>），以及在本次提交中，有多少文件修订过，多少行添加和删改过</p><p style=\"text-align: start\">请记住，提交时记录的是在暂存区域的快照。任何还未暂存的仍然保持已修改状态，可以在下次提交时纳入版本管理。每一次运行提交操作，都是对你项目做一次快照，以后可以回到这个状态，或者进行比较</p><h3 id=\"1a3fed42-dfea-4913-97aa-2b1d2cd0340f\" data-toc-id=\"1a3fed42-dfea-4913-97aa-2b1d2cd0340f\" style=\"text-align: start\">跳过使用暂存区域</h3><p style=\"text-align: start\">尽管使用暂存区域的方式可以精心准备要提交的细节，但有时候这么做略显繁琐。 Git 提供了一个跳过使用暂存区域的方式， 只要在提交的时候，给 <code>git commit</code> 加上 <code>-a</code> 选项，Git 就会自动把所有已经跟踪过的文件暂存起来一并提交，从而跳过 <code>git add</code> 步骤：</p><pre><code class=\"language-Shell\">$ git status\nOn branch master\nChanges not staged for commit:\n  (use \"git add &lt;file&gt;...\" to update what will be committed)\n  (use \"git checkout -- &lt;file&gt;...\" to discard changes in working directory)\n\n    modified:   CONTRIBUTING.md\n\nno changes added to commit (use \"git add\" and/or \"git commit -a\")\n$ git commit -a -m \'added new benchmarks\'\n[master 83e38c7] added new benchmarks\n 1 file changed, 5 insertions(+), 0 deletions(-)\n</code></pre><h3 id=\"18c84a57-c304-46b5-a5e3-2a1eae9b1ca3\" data-toc-id=\"18c84a57-c304-46b5-a5e3-2a1eae9b1ca3\" style=\"text-align: start\">移除文件</h3><p style=\"text-align: start\">要从 Git 中移除某个文件，就必须要从已跟踪文件清单中移除（确切地说，是从暂存区域移除），然后提交。可以用 <code>git rm</code> 命令完成此工作，并连带从工作目录中删除指定的文件，这样以后就不会出现在未跟踪文件清单中</p><p style=\"text-align: start\">如果只是简单地从工作目录中手工删除文件，运行 <code>git status</code> 时就会在 “Changes not staged for commit”部分（也就是未暂存清单）看到：</p><pre><code class=\"language-Shell\">PS C:\\Users\\LIWEI\\Desktop\\Trash\\demo&gt; rm 123.txt\nPS C:\\Users\\LIWEI\\Desktop\\Trash\\demo&gt; git status\nOn branch master\n\nNo commits yet\n\nChanges to be committed:\n  (use \"git rm --cached &lt;file&gt;...\" to unstage)\n        new file:   123.txt\n\nChanges not staged for commit:\n  (use \"git add/rm &lt;file&gt;...\" to update what will be committed)\n  (use \"git restore &lt;file&gt;...\" to discard changes in working directory)\n        deleted:    123.txt\n</code></pre><p style=\"text-align: start\">然后再运行 <code>git rm</code> 记录此次移除文件的操作：</p><pre><code class=\"language-Shell\">PS C:\\Users\\LIWEI\\Desktop\\Trash\\demo&gt; git rm 123.txt\nrm \'123.txt\'\nPS C:\\Users\\LIWEI\\Desktop\\Trash\\demo&gt; git status\nOn branch master\n\nNo commits yet\n\nnothing to commit (create/copy files and use \"git add\" to track)\n</code></pre><p style=\"text-align: start\">下一次提交时，该文件就不再纳入版本管理了。如果删除之前修改过并且已经放到暂存区域的话，则必须要使用强制删除选项 <code>-f</code>。这是一种安全特性，用于防止误删还没有添加到快照的数据，这样的数据不能被 Git 恢复</p><p style=\"text-align: start\">另外一种情况是，我们想把文件从 Git 仓库删除（即从暂存区域移除），但仍然希望保留在当前工作目录中。换句话说，你想让文件保留在磁盘，但并不想 Git 继续跟踪。当你忘记添加 <code>.gitignore</code> 文件，不小心把一个很大的日志目录或一堆 <code>.a</code> 这样的编译生成文件添加到暂存区时，这一做法尤其有用。为达到这一目的，使用 <code>--cached</code> 选项：</p><pre><code class=\"language-Shell\">$ git rm --cached README\n</code></pre><p style=\"text-align: start\"><code>git rm</code> 命令后面可以列出文件或者目录的名字，也可以使用 <code>glob</code> 模式。 比方说：</p><pre><code class=\"language-Shell\">$ git rm log/\\*.log\n</code></pre><p style=\"text-align: start\">注意到星号 <code>*</code> 之前的反斜杠 <code>\\</code>， 因为 Git 有它自己的文件模式扩展匹配方式，所以我们不用 shell 来帮忙展开。 此命令删除 <code>log/</code> 目录下扩展名为 <code>.log</code> 的所有文件。 类似的比如：</p><pre><code class=\"language-Shell\">$ git rm \\*~\n</code></pre><p style=\"text-align: start\">该命令为删除以 <code>~</code> 结尾的所有文件。</p><h3 id=\"9f167535-9c63-4308-81c2-33d7b789a765\" data-toc-id=\"9f167535-9c63-4308-81c2-33d7b789a765\" style=\"text-align: start\">移动文件</h3><p style=\"text-align: start\">不像其它的 VCS 系统，Git 并不显式跟踪文件移动操作。 如果在 Git 中重命名了某个文件，仓库中存储的元数据并不会体现出这是一次改名操作。 不过 Git 非常聪明，它会推断出究竟发生了什么，至于具体是如何做到的，我们稍后再谈。</p><p style=\"text-align: start\">既然如此，当你看到 Git 的 <code>mv</code> 命令时一定会困惑不已。 要在 Git 中对文件改名，可以这么做：</p><pre><code class=\"language-Shell\">$ git mv file_from file_to\n</code></pre><p style=\"text-align: start\">它会恰如预期般正常工作。 实际上，即便此时查看状态信息，也会明白无误地看到关于重命名操作的说明：</p><pre><code class=\"language-Shell\">$ git mv README.md README\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    renamed:    README.md -&gt; README\n</code></pre><p style=\"text-align: start\">其实，运行 <code>git mv</code> 就相当于运行了下面三条命令：</p><pre><code class=\"language-Shell\">$ mv README.md README\n$ git rm README.md\n$ git add README\n</code></pre><p style=\"text-align: start\">如此分开操作，Git 也会意识到这是一次改名，所以不管何种方式结果都一样。 两者唯一的区别是，<code>mv</code> 是一条命令而另一种方式需要三条命令，直接用 <code>git mv</code> 轻便得多。 不过有时候用其他工具批处理改名的话，要记得在提交前删除老的文件名，再添加新的文件名</p><h2 id=\"7021ba95-ea2a-4685-b692-4427a9141c2d\" data-toc-id=\"7021ba95-ea2a-4685-b692-4427a9141c2d\" style=\"text-align: start\">查看提交历史</h2><p style=\"text-align: start\">在提交了若干更新，又或者克隆了某个项目之后，你也许想回顾下提交历史。 完成这个任务最简单而又有效的工具是 <code>git log</code> 命令</p><p style=\"text-align: start\">接下来的例子会用我专门用于演示的 simplegit 项目， 运行下面的命令获取该项目源代码：</p><pre><code class=\"language-Shell\">git clone https://github.com/schacon/simplegit-progit\n</code></pre><p style=\"text-align: start\">然后在此项目中运行 git log，应该会看到下面的输出：</p><pre><code class=\"language-Shell\">$ git log\ncommit ca82a6dff817ec66f44342007202690a93763949\nAuthor: Scott Chacon &lt;schacon@gee-mail.com&gt;\nDate:   Mon Mar 17 21:52:11 2008 -0700\n\n    changed the version number\n\ncommit 085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7\nAuthor: Scott Chacon &lt;schacon@gee-mail.com&gt;\nDate:   Sat Mar 15 16:40:33 2008 -0700\n\n    removed unnecessary test\n\ncommit a11bef06a3f659402fe7563abf99ad00de2209e6\nAuthor: Scott Chacon &lt;schacon@gee-mail.com&gt;\nDate:   Sat Mar 15 10:31:28 2008 -0700\n\n    first commit\n</code></pre><p style=\"text-align: start\">默认不用任何参数的话，<code>git log</code> 会按提交时间列出所有的更新，最近的更新排在最上面。 正如你所看到的，这个命令会列出每个提交的 SHA-1 校验和、作者的名字和电子邮件地址、提交时间以及提交说明。</p><p style=\"text-align: start\"><code>git log</code> 有许多选项可以帮助你搜寻你所要找的提交， 接下来我们介绍些最常用的。</p><p style=\"text-align: start\">一个常用的选项是 <code>-p</code>，用来显示每次提交的内容差异。 你也可以加上 <code>-2</code> 来仅显示最近两次提交：</p><pre><code class=\"language-Shell\">$ git log -p -2\ncommit ca82a6dff817ec66f44342007202690a93763949\nAuthor: Scott Chacon &lt;schacon@gee-mail.com&gt;\nDate:   Mon Mar 17 21:52:11 2008 -0700\n\n    changed the version number\n\ndiff --git a/Rakefile b/Rakefile\nindex a874b73..8f94139 100644\n--- a/Rakefile\n+++ b/Rakefile\n@@ -5,7 +5,7 @@ require \'rake/gempackagetask\'\n spec = Gem::Specification.new do |s|\n     s.platform  =   Gem::Platform::RUBY\n     s.name      =   \"simplegit\"\n-    s.version   =   \"0.1.0\"\n+    s.version   =   \"0.1.1\"\n     s.author    =   \"Scott Chacon\"\n     s.email     =   \"schacon@gee-mail.com\"\n     s.summary   =   \"A simple gem for using Git in Ruby code.\"\n\ncommit 085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7\nAuthor: Scott Chacon &lt;schacon@gee-mail.com&gt;\nDate:   Sat Mar 15 16:40:33 2008 -0700\n\n    removed unnecessary test\n\ndiff --git a/lib/simplegit.rb b/lib/simplegit.rb\nindex a0a60ae..47c6340 100644\n--- a/lib/simplegit.rb\n+++ b/lib/simplegit.rb\n@@ -18,8 +18,3 @@ class SimpleGit\n     end\n\n end\n-\n-if $0 == __FILE__\n-  git = SimpleGit.new\n-  puts git.show\n-end\n\\ No newline at end of file\n</code></pre><p style=\"text-align: start\">该选项除了显示基本信息之外，还附带了每次 commit 的变化。 当进行代码审查，或者快速浏览某个搭档提交的 commit 所带来的变化的时候，这个参数就非常有用了。 你也可以为 <code>git log</code> 附带一系列的总结性选项。 比如说，如果你想看到每次提交的简略的统计信息，你可以使用 <code>--stat</code> 选项：</p><pre><code class=\"language-Shell\">$ git log --stat\ncommit ca82a6dff817ec66f44342007202690a93763949\nAuthor: Scott Chacon &lt;schacon@gee-mail.com&gt;\nDate:   Mon Mar 17 21:52:11 2008 -0700\n\n    changed the version number\n\n Rakefile | 2 +-\n 1 file changed, 1 insertion(+), 1 deletion(-)\n\ncommit 085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7\nAuthor: Scott Chacon &lt;schacon@gee-mail.com&gt;\nDate:   Sat Mar 15 16:40:33 2008 -0700\n\n    removed unnecessary test\n\n lib/simplegit.rb | 5 -----\n 1 file changed, 5 deletions(-)\n\ncommit a11bef06a3f659402fe7563abf99ad00de2209e6\nAuthor: Scott Chacon &lt;schacon@gee-mail.com&gt;\nDate:   Sat Mar 15 10:31:28 2008 -0700\n\n    first commit\n\n README           |  6 ++++++\n Rakefile         | 23 +++++++++++++++++++++++\n lib/simplegit.rb | 25 +++++++++++++++++++++++++\n 3 files changed, 54 insertions(+)\n</code></pre><p style=\"text-align: start\">正如你所看到的，<code>--stat</code> 选项在每次提交的下面列出所有被修改过的文件、有多少文件被修改了以及被修改过的文件的哪些行被移除或是添加了。 在每次提交的最后还有一个总结</p><p style=\"text-align: start\">另外一个常用的选项是 <code>--pretty</code>。 这个选项可以指定使用不同于默认格式的方式展示提交历史。 这个选项有一些内建的子选项供你使用。 比如用 <code>oneline</code> 将每个提交放在一行显示，查看的提交数很大时非常有用。 另外还有 <code>short</code>，<code>full</code> 和 <code>fuller</code> 可以用，展示的信息或多或少有些不同，请自己动手实践一下看看效果如何</p><pre><code class=\"language-Shell\">$ git log --pretty=oneline\nca82a6dff817ec66f44342007202690a93763949 changed the version number\n085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7 removed unnecessary test\na11bef06a3f659402fe7563abf99ad00de2209e6 first commit\n</code></pre><p style=\"text-align: start\">但最有意思的是 format，可以定制要显示的记录格式。 这样的输出对后期提取分析格外有用 — 因为你知道输出的格式不会随着 Git 的更新而发生改变：</p><pre><code class=\"language-Shell\">$ git log --pretty=format:\"%h - %an, %ar : %s\"\nca82a6d - Scott Chacon, 6 years ago : changed the version number\n085bb3b - Scott Chacon, 6 years ago : removed unnecessary test\na11bef0 - Scott Chacon, 6 years ago : first commit\n</code></pre><p style=\"text-align: start\"><code>git log --pretty=format</code> 常用的选项，列出了常用的格式占位符写法及其代表的意义:</p><p style=\"text-align: start\">|选项|说明| |-|-| |<code>%H</code>|提交对象（commit）的完整哈希字串| |<code>%h</code>|提交对象的简短哈希字串| |<code>%T</code>|树对象（tree）的完整哈希字串| |<code>%t</code>|树对象的简短哈希字串| |<code>%P</code>|父对象（parent）的完整哈希字串| |<code>%p</code>|父对象的简短哈希字串| |<code>%an</code>|作者（author）的名字| |<code>%ae</code>|作者的电子邮件地址| |<code>%ad</code>|作者修订日期（可以用 --date= 选项定制格式）| |<code>%ar</code>|作者修订日期，按多久以前的方式显示| |<code>%cn</code>|提交者（committer）的名字| |<code>%ce</code>|提交者的电子邮件地址| |<code>%cd</code>|提交日期| |<code>%cr</code>|提交日期，按多久以前的方式显示| |<code>%s</code>|提交说明|</p><p style=\"text-align: start\">你一定奇怪 <strong>作者</strong> 和 <strong>提交者</strong> 之间究竟有何差别， 其实作者指的是实际作出修改的人，提交者指的是最后将此工作成果提交到仓库的人。 所以，当你为某个项目发布补丁，然后某个核心成员将你的补丁并入项目时，你就是作者，而那个核心成员就是提交者。 我们会在 分布式 Git 再详细介绍两者之间的细微差别。</p><p style=\"text-align: start\">当 oneline 或 format 与另一个 <code>log</code> 选项 <code>--graph</code> 结合使用时尤其有用。 这个选项添加了一些ASCII字符串来形象地展示你的分支、合并历史：</p><pre><code class=\"language-Shell\">$ git log --pretty=format:\"%h %s\" --graph\n* 2d3acf9 ignore errors from SIGCHLD on trap\n*  5e3ee11 Merge branch \'master\' of git://github.com/dustin/grit\n|\\\n| * 420eac9 Added a method for getting the current branch.\n* | 30e367c timeout code and tests\n* | 5a09431 add timeout protection to grit\n* | e1193f8 support for heads with slashes in them\n|/\n* d6016bc require time for xmlschema\n*  11d191e Merge branch \'defunkt\' into local\n</code></pre><p style=\"text-align: start\">这种输出类型会在我们下一章学完分支与合并以后变得更加有趣。</p><p style=\"text-align: start\">以上只是简单介绍了一些 <code>git log</code> 命令支持的选项。 <code>git log</code> 的常用选项 列出了我们目前涉及到的和没涉及到的选项，以及它们是如何影响 log 命令的输出的：</p><p style=\"text-align: start\">|选项|说明| |-|-| |<code>-p</code>|按补丁格式显示每个更新之间的差异。| |<code>--stat</code>|显示每次更新的文件修改统计信息。| |<code>--shortstat</code>|只显示 --stat 中最后的行数修改添加移除统计。| |<code>--name-only</code>|仅在提交信息后显示已修改的文件清单。| |<code>--name-status</code>|显示新增、修改、删除的文件清单。| |<code>--abbrev-commit</code>|仅显示 SHA-1 的前几个字符，而非所有的 40 个字符。| |<code>--relative-date</code>|使用较短的相对时间显示（比如，“2 weeks ago”）。| |<code>--graph</code>|显示 ASCII 图形表示的分支合并历史。| |<code>--pretty</code>|使用其他格式显示历史提交信息。可用的选项包括 oneline，short，full，fuller 和 format（后跟指定格式）。|</p><h3 id=\"1f2b7afa-67cd-440f-97b6-6f12c888d05f\" data-toc-id=\"1f2b7afa-67cd-440f-97b6-6f12c888d05f\" style=\"text-align: start\">限制输出长度</h3><p style=\"text-align: start\">除了定制输出格式的选项之外，<code>git log</code> 还有许多非常实用的限制输出长度的选项，也就是只输出部分提交信息。 之前你已经看到过 <code>-2</code> 了，它只显示最近的两条提交， 实际上，这是 <code>-&lt;n&gt;</code> 选项的写法，其中的 <code>n</code> 可以是任何整数，表示仅显示最近的若干条提交。 不过实践中我们是不太用这个选项的，Git 在输出所有提交时会自动调用分页程序，所以你一次只会看到一页的内容。</p><p style=\"text-align: start\">另外还有按照时间作限制的选项，比如 <code>--since</code> 和 <code>--until</code> 也很有用。 例如，下面的命令列出所有最近两周内的提交：</p><pre><code class=\"language-Shell\">$ git log --since=2.weeks\n</code></pre><p style=\"text-align: start\">这个命令可以在多种格式下工作，比如说具体的某一天 <code>\"2008-01-15\"</code>，或者是相对地多久以前 <code>\"2 years 1 day 3 minutes ago\"</code>。</p><p style=\"text-align: start\">还可以给出若干搜索条件，列出符合的提交。 用 <code>--author</code> 选项显示指定作者的提交，用 <code>--grep</code> 选项搜索提交说明中的关键字。 （请注意，如果要得到同时满足这两个选项搜索条件的提交，就必须用 <code>--all-match</code> 选项。否则，满足任意一个条件的提交都会被匹配出来）</p><p style=\"text-align: start\">另一个非常有用的筛选选项是 <code>-S</code>，可以列出那些添加或移除了某些字符串的提交。 比如说，你想找出添加或移除了某一个特定函数的引用的提交，你可以这样使用：</p><pre><code class=\"language-Shell\">$ git log -S function_name\n</code></pre><p style=\"text-align: start\">最后一个很实用的 <code>git log</code> 选项是路径（path）， 如果只关心某些文件或者目录的历史提交，可以在 git log 选项的最后指定它们的路径。 因为是放在最后位置上的选项，所以用两个短划线（--）隔开之前的选项和后面限定的路径名。</p><p style=\"text-align: start\">在 限制 <code>git log</code> 输出的选项 中列出了常用的选项</p><p style=\"text-align: start\">|选项|说明| |-|-| |<code>-(n)</code>|仅显示最近的 n 条提交| |<code>--since</code>, <code>--after</code>|仅显示指定时间之后的提交。| |<code>--until</code>, <code>--before</code>|仅显示指定时间之前的提交。| |<code>--author</code>|仅显示指定作者相关的提交。| |<code>--committer</code>|仅显示指定提交者相关的提交。| |<code>--grep</code>|仅显示含指定关键字的提交| |<code>-S</code>|仅显示添加或移除了某个关键字的提交|</p><p style=\"text-align: start\">来看一个实际的例子，如果要查看 Git 仓库中，2008 年 10 月期间，Junio Hamano 提交的但未合并的测试文件，可以用下面的查询命令：</p><pre><code class=\"language-Shell\">$ git log --pretty=\"%h - %s\" --author=gitster --since=\"2008-10-01\" \\\n   --before=\"2008-11-01\" --no-merges -- t/\n5610e3b - Fix testcase failure when extended attributes are in use\nacd3b9e - Enhance hold_lock_file_for_{update,append}() API\nf563754 - demonstrate breakage of detached checkout with symbolic link HEAD\nd1a43f2 - reset --hard/read-tree --reset -u: remove unmerged new paths\n51a94af - Fix \"checkout --track -b newbranch\" on detached HEAD\nb0ad11e - pull: allow \"git pull origin $something:$current_branch\" into an unborn branch\n</code></pre><p style=\"text-align: start\">在近 40000 条提交中，上面的输出仅列出了符合条件的 6 条记录</p><h2 id=\"41583f03-6220-43a0-880d-13ea10d568ac\" data-toc-id=\"41583f03-6220-43a0-880d-13ea10d568ac\" style=\"text-align: start\">撤销操作</h2><p style=\"text-align: start\">在任何一个阶段，你都可能想要撤销某些操作。这里，我们将会学习几个撤销你所做修改的基本工具。注意，有些撤销操作是不逆的。这是在使用 Git 的过程中，会因为操作失误而导致之前的工作丢失的少有几个地方之一</p><p style=\"text-align: start\">有时候我们提交完了才发现漏掉了几个文件没有添加，或者提交信息写错了。此时，可以运行带有 <code>--amend</code> 选项的提交命令尝试重新提交：</p><pre><code class=\"language-Shell\">$ git commit --amend\n</code></pre><p style=\"text-align: start\">这个命令会将暂存区中的文件提交。如果自上次提交依赖你还未做任何修改（例如，在上次提交后马上执行了此命令），那么快照会保持不变，而你所修改的只是提交信息</p><p style=\"text-align: start\">文本编辑器启动后，可以看到之前的提交信息。 编辑后保存会覆盖原来的提交信息。</p><p style=\"text-align: start\">例如，你提交后发现忘记了暂存某些需要的修改，可以像下面这样操作：</p><pre><code class=\"language-Shell\">$ git commit -m \'initial commit\'\n$ git add forgotten_file\n$ git commit --amend\n</code></pre><p style=\"text-align: start\">最终你只会有一个提交 - 第二次提交将代替第一次提交的结果</p><h3 id=\"38c3e394-b20e-4e76-9e44-48ba12505fd2\" data-toc-id=\"38c3e394-b20e-4e76-9e44-48ba12505fd2\" style=\"text-align: start\">取消暂存文件</h3><p style=\"text-align: start\">接下来的两个小节演示如何操作暂存区域与工作目录中已修改的文件。 这些命令在修改文件状态的同时，也会提示如何撤消操作。 例如，你已经修改了两个文件并且想要将它们作为两次独立的修改提交，但是却意外地输入了 <code>git add *</code> 暂存了它们两个。 如何只取消暂存两个中的一个呢？ <code>git status</code> 命令提示了你：</p><pre><code class=\"language-Shell\">$ git add *\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    renamed:    README.md -&gt; README\n    modified:   CONTRIBUTING.md\n</code></pre><p style=\"text-align: start\">在 “Changes to be committed” 文字正下方，提示使用 <code>git reset HEAD &lt;file&gt;...</code> 来取消暂存。 所以，我们可以这样来取消暂存 <code>CONTRIBUTING.md</code> 文件：</p><pre><code class=\"language-Shell\">$ git reset HEAD CONTRIBUTING.md\nUnstaged changes after reset:\nM    CONTRIBUTING.md\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    renamed:    README.md -&gt; README\n\nChanges not staged for commit:\n  (use \"git add &lt;file&gt;...\" to update what will be committed)\n  (use \"git checkout -- &lt;file&gt;...\" to discard changes in working directory)\n\n    modified:   CONTRIBUTING.md\n</code></pre><p style=\"text-align: start\">这个命令有点儿奇怪，但是起作用了。 <code>CONTRIBUTING.md</code> 文件已经是修改未暂存的状态了</p><p style=\"text-align: start\">到目前为止这个神奇的调用就是你需要对 <code>git reset</code> 命令了解的全部。我们将会在 <strong>重置揭密</strong> 中了解 <code>reset</code> 的更多细节以及如何掌握它做一些真正有趣的事。</p><h3 id=\"bcb1b140-3aae-463a-82f4-2c9d4cca662b\" data-toc-id=\"bcb1b140-3aae-463a-82f4-2c9d4cca662b\" style=\"text-align: start\">撤消对文件的修改</h3><p style=\"text-align: start\">如果你并不想保留对 <code>CONTRIBUTING.md</code> 文件的修改怎么办？你该如何方便地撤销修改-将它还原成上次提交的样子（或者刚克隆完地样子，或者刚把它放入工作目录时地样子）？幸运的是，<code>git status</code> 也告诉了你应该怎么做。最后一个例子中，未暂存区域是这样的：</p><pre><code class=\"language-Shell\">Changes not staged for commit:\n  (use \"git add &lt;file&gt;...\" to update what will be committed)\n  (use \"git checkout -- &lt;file&gt;...\" to discard changes in working directory)\n\n    modified:   CONTRIBUTING.md\n</code></pre><p style=\"text-align: start\">它非常清楚地告诉了你如何撤消之前所做的修改。 让我们来按照提示执行：</p><pre><code class=\"language-Shell\">$ git checkout -- CONTRIBUTING.md\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    renamed:    README.md -&gt; README\n</code></pre><p style=\"text-align: start\">可以看到那些修改已经被撤消了</p><h2 id=\"0254ed86-5343-4d7e-b1a7-0e8991cb8cec\" data-toc-id=\"0254ed86-5343-4d7e-b1a7-0e8991cb8cec\" style=\"text-align: start\">远程仓库的使用</h2><p style=\"text-align: start\">为了能在任意 Git 项目上协作，你需要知道如何管理自己的远程仓库。远程仓库是指托管在因特网或其他网络上的你的项目的版本库。你可以有好几个远程仓库，通常有些仓库对你只读，有些则可以读写。与他人协作涉及管理远程仓库以及根据需要推送或拉去数据。管理远程仓库包括了解如何添加远程仓库、移除无效的远程仓库、管理不同的远程分支并定义他们是否被跟踪等等</p><h3 id=\"33ae9dbc-a2e7-4b52-96c2-5dd77843506c\" data-toc-id=\"33ae9dbc-a2e7-4b52-96c2-5dd77843506c\" style=\"text-align: start\">查看远程仓库</h3><p style=\"text-align: start\">如果想查看你已经配置的远程仓库服务器，可以运行 <code>git remote</code> 命令。它会列出你指定的每一个远程服务器的简写。如果你已经克隆了自己的仓库，那么至少应该能看到 <code>origin</code> -这是 Git 给你克隆的仓库服务器的默认名字：</p><pre><code class=\"language-Shell\">$ git clone https://github.com/schacon/ticgit\nCloning into \'ticgit\'...\nremote: Reusing existing pack: 1857, done.\nremote: Total 1857 (delta 0), reused 0 (delta 0)\nReceiving objects: 100% (1857/1857), 374.35 KiB | 268.00 KiB/s, done.\nResolving deltas: 100% (772/772), done.\nChecking connectivity... done.\n$ cd ticgit\n$ git remote\norigin\n</code></pre><p style=\"text-align: start\">你也可以指定选项 <code>-v</code>，会显示需要读写远程仓库使用的 Git 保存的简写与其对应的 URL</p><pre><code class=\"language-Shell\">$ git remote -v\norigin    https://github.com/schacon/ticgit (fetch)\norigin    https://github.com/schacon/ticgit (push)\n</code></pre><p style=\"text-align: start\">如果你的远程仓库不止一个，该命令会将它们全部列出。 例如，与几个协作者合作的，拥有多个远程仓库的仓库看起来像下面这样：</p><pre><code class=\"language-Shell\">$ cd grit\n$ git remote -v\nbakkdoor  https://github.com/bakkdoor/grit (fetch)\nbakkdoor  https://github.com/bakkdoor/grit (push)\ncho45     https://github.com/cho45/grit (fetch)\ncho45     https://github.com/cho45/grit (push)\ndefunkt   https://github.com/defunkt/grit (fetch)\ndefunkt   https://github.com/defunkt/grit (push)\nkoke      git://github.com/koke/grit.git (fetch)\nkoke      git://github.com/koke/grit.git (push)\norigin    git@github.com:mojombo/grit.git (fetch)\norigin    git@github.com:mojombo/grit.git (push)\n</code></pre><h3 id=\"db164ba7-631c-4645-a4e1-0b608cdeb6a9\" data-toc-id=\"db164ba7-631c-4645-a4e1-0b608cdeb6a9\" style=\"text-align: start\">添加远程仓库</h3><p style=\"text-align: start\">运行 <code>git remote add &lt;shortname&gt; &lt;url&gt;</code> 添加一个新的远程 Git 仓库，同时指定一个你可以轻松引用的简写：</p><pre><code class=\"language-Shell\">$ git remote\norigin\n$ git remote add pb https://github.com/paulboone/ticgit\n$ git remote -v\norigin    https://github.com/schacon/ticgit (fetch)\norigin    https://github.com/schacon/ticgit (push)\npb    https://github.com/paulboone/ticgit (fetch)\npb    https://github.com/paulboone/ticgit (push)\n</code></pre><p style=\"text-align: start\">现在就可以在命令行中使用字符串 <code>pd</code> 来代替整个 URL。例如，如果你想拉取 Paul 的仓库中有但你没有的信息，可以运行 <code>git fetch pb</code>：</p><pre><code class=\"language-Shell\">$ git fetch pb\nremote: Counting objects: 43, done.\nremote: Compressing objects: 100% (36/36), done.\nremote: Total 43 (delta 10), reused 31 (delta 5)\nUnpacking objects: 100% (43/43), done.\nFrom https://github.com/paulboone/ticgit\n * [new branch]      master     -&gt; pb/master\n * [new branch]      ticgit     -&gt; pb/ticgit\n</code></pre><p style=\"text-align: start\">现在 Paul 的 master 分支可以在本地通过 <code>pb/master</code> 访问到 - 你可以将它合并到自己的某个分支中，或者如果你想要查看它的话，可以检出一个指向该点的本地分支</p><h3 id=\"8ce3c49e-eaa5-4741-b16f-87b437e8810e\" data-toc-id=\"8ce3c49e-eaa5-4741-b16f-87b437e8810e\" style=\"text-align: start\">从远程仓库中抓取与拉取</h3><p style=\"text-align: start\">如上，从远程仓库中获取数据，可以执行：</p><pre><code class=\"language-Shell\">$ git fetch [remote-name]\n</code></pre><p style=\"text-align: start\">这个命令会访问远程仓库，从中拉取所有你还没有的数据。 执行完成后，你将会拥有那个远程仓库中所有分支的引用，可以随时合并或查看</p><p style=\"text-align: start\">如果你使用 <code>clone</code> 命令克隆了一个仓库，命令会自动将其添加为远程仓库并默认以 “origin” 为简写。 所以，<code>git fetch origin</code> 会抓取克隆（或上一次抓取）后新推送的所有工作。 必须注意 <code>git fetch</code> 命令会将数据拉取到你的本地仓库 - 它并不会自动合并或修改你当前的工作。 当准备好时你必须手动将其合并入你的工作</p><p style=\"text-align: start\">如果有一个分支设置为跟踪一个远程分支，可以使用 <code>git pull</code> 命令来自动抓取然后合并远程分知道当前分支。这可能是一个更为简单和舒服的工作流程；默认情况下，<code>git clone</code> 命令会自动设置本地 master 分支跟踪克隆的远程仓库的 master 分支。运行 <code>git pull</code> 通常会从最初克隆的服务器上抓取数据并自动尝试合并到当前所在分支</p><h3 id=\"2c3fd9b9-a6ae-43ac-9ddd-32f4ef0632b8\" data-toc-id=\"2c3fd9b9-a6ae-43ac-9ddd-32f4ef0632b8\" style=\"text-align: start\">推送到远程仓库</h3><p style=\"text-align: start\">当你想分享你的项目时，必须将其推送到上游。这个命令很简单：<code>git push [remote-name] [branch-name]</code>。放你想要将 master 分支推送到 <code>origin</code> 服务器时（再次说明，克隆时通常会自动帮你设置好那两个名字），那么运行这个命令就可以将你所做的备份到服务器：</p><pre><code class=\"language-Shell\">$ git push origin master\n</code></pre><p style=\"text-align: start\">只有当你有所克隆服务器的写入权限，并且之前没有人推送过时，这条命令才能生效。 当你和其他人在同一时间克隆，他们先推送到上游然后你再推送到上游，你的推送就会毫无疑问地被拒绝。 你必须先将他们的工作拉取下来并将其合并进你的工作后才能推送</p><h3 id=\"ee3e5816-6276-45df-93ed-6a1f2d07677d\" data-toc-id=\"ee3e5816-6276-45df-93ed-6a1f2d07677d\" style=\"text-align: start\">查看远程仓库</h3><p style=\"text-align: start\">如果想要查看某一个远程仓库的更多信息，可以使用 <code>git remote show [remote-name]</code> 命令。 如果想以一个特定的缩写名运行这个命令，例如 <code>origin</code>，会得到像下面类似的信息：</p><pre><code class=\"language-Shell\">$ git remote show origin\n* remote origin\n  Fetch URL: https://github.com/schacon/ticgit\n  Push  URL: https://github.com/schacon/ticgit\n  HEAD branch: master\n  Remote branches:\n    master                               tracked\n    dev-branch                           tracked\n  Local branch configured for \'git pull\':\n    master merges with remote master\n  Local ref configured for \'git push\':\n    master pushes to master (up to date)\n</code></pre><p style=\"text-align: start\">它同样会列出远程仓库的 URL 与跟踪分支的信息。 这些信息非常有用，它告诉你正处于 master 分支，并且如果运行 git pull，就会抓取所有的远程引用，然后将远程 master 分支合并到本地 master 分支。 它也会列出拉取到的所有远程引用。</p><p style=\"text-align: start\">这是一个经常遇到的简单例子。 如果你是 Git 的重度使用者，那么还可以通过 <code>git remote show</code> 看到更多的信息</p><pre><code class=\"language-Shell\">$ git remote show origin\n* remote origin\n  URL: https://github.com/my-org/complex-project\n  Fetch URL: https://github.com/my-org/complex-project\n  Push  URL: https://github.com/my-org/complex-project\n  HEAD branch: master\n  Remote branches:\n    master                           tracked\n    dev-branch                       tracked\n    markdown-strip                   tracked\n    issue-43                         new (next fetch will store in remotes/origin)\n    issue-45                         new (next fetch will store in remotes/origin)\n    refs/remotes/origin/issue-11     stale (use \'git remote prune\' to remove)\n  Local branches configured for \'git pull\':\n    dev-branch merges with remote dev-branch\n    master     merges with remote master\n  Local refs configured for \'git push\':\n    dev-branch                     pushes to dev-branch                     (up to date)\n    markdown-strip                 pushes to markdown-strip                 (up to date)\n    master                         pushes to master                         (up to date)\n</code></pre><p style=\"text-align: start\">这个命令列出了当你在特定的分支上执行 <code>git push</code> 会自动地推送到哪一个远程分支。 它也同样地列出了哪些远程分支不在你的本地，哪些远程分支已经从服务器上移除了，还有当你执行 <code>git pull</code> 时哪些分支会自动合并</p><h3 id=\"d6fe8e8d-2d77-4e45-b1b8-fbd337a7b890\" data-toc-id=\"d6fe8e8d-2d77-4e45-b1b8-fbd337a7b890\" style=\"text-align: start\">远程仓库的移除与重命名</h3><p style=\"text-align: start\">如果想要重命名引用的名字可以运行 <code>git remote rename</code> 去修改一个远程仓库的简写名。 例如，想要将 <code>pb</code> 重命名为 <code>paul</code>，可以用 <code>git remote rename</code> 这样做：</p><pre><code class=\"language-Shell\">$ git remote rename pb paul\n$ git remote\norigin\npaul\n</code></pre><p style=\"text-align: start\">值得注意的是这同样也会修改你的远程分支名字。 那些过去引用 <code>pb/master</code> 的现在会引用 <code>paul/master</code></p><p style=\"text-align: start\">如果因为一些原因想要移除一个远程仓库 - 你已经从服务器上搬走了或不再想使用某一个特定的镜像了，又或者某一个贡献者不再贡献了 - 可以使用 <code>git remote rm</code> ：</p><pre><code class=\"language-Shell\">$ git remote rm paul\n$ git remote\norigin\n</code></pre><h2 id=\"8c4b24b1-e344-4087-8561-2fb1c681d069\" data-toc-id=\"8c4b24b1-e344-4087-8561-2fb1c681d069\" style=\"text-align: start\">打标签</h2><p></p>','git','2024-02-08 22:33:16',1,1,1,21,NULL,'https://nextui.org/images/album-cover.png',NULL),(66,'【Swift】String and character','<h2 id=\"180f3da4-fce6-4ae4-938e-c08f4accdda7\" data-toc-id=\"180f3da4-fce6-4ae4-938e-c08f4accdda7\">String Literals</h2><p>You can include predefined String values within your code as string literals. A string literal is a sequence of characters surrounded by double quotation marks(“)</p><pre><code class=\"language-swfit\">let someString = \"some string literal value\"</code></pre><h2 id=\"3fd999b3-5592-48ba-876f-06659316b82f\" data-toc-id=\"3fd999b3-5592-48ba-876f-06659316b82f\">Multiline String Literals</h2><p>If you need a string that spans several lines, use a multiline string literal.</p><pre><code class=\"language-swift\">let quotation = \"\"\"\nThe White Rabbit put on his spectacles.  \"Where shall I begin,\nplease your Majesty?\" he asked.\n\n\"Begin at the beginning,\" the King said gravely, \"and go on\ntill you come to the end; then stop.\"\n\"</code></pre><h2 id=\"743c7ab1-4cea-45cf-9285-3d8918627b9f\" data-toc-id=\"743c7ab1-4cea-45cf-9285-3d8918627b9f\">Initializing an Empty String</h2><p>To create an empty String value as the starting point for building a longer string, either assign an empty string literal to a variable or initialize a new String instance with initializer syntax:</p><pre><code class=\"language-swift\">var emptyString = \"\"\nvar anotherEmptyString = String()</code></pre><p>Find out whether a String value is empty by checking its Boolean isEmpty property:</p><pre><code class=\"language-swift\">// 注意，isEmpty 是属性而不是函数\nif emptyString.isEmpty{\n}</code></pre><h2 id=\"77d76a2c-37f3-4171-af1d-34f4e0276ccd\" data-toc-id=\"77d76a2c-37f3-4171-af1d-34f4e0276ccd\">String Mutability</h2><pre><code class=\"language-swift\">var variableString = \"Horse\"\nvariableString += \" and carriage\"\nlet constantString = \"Highlander\"\nconstantString = \" and another Highlander\"   // 报错</code></pre><h3 id=\"90bf0aa0-d08e-4517-8802-b47a9a21704b\" data-toc-id=\"90bf0aa0-d08e-4517-8802-b47a9a21704b\">Working with Characters</h3><pre><code class=\"language-swift\">for character in \"Dog!🐶\"{\n     print(character)\n}\n// D\n// o\n// g\n// !\n// 🐶</code></pre><p>Alternatively, you can create a stand-alone Character constant or variable from a single-character string literal by providing a Character type annotation:</p><pre><code class=\"language-swift\">let exclamationMark: Character = \"!\"</code></pre><p>String value can be constructed by passing an array of character values as an argument to its initializer:</p><pre><code class=\"language-swift\">let catCharacters: [Character] = [\"C\",\"a\",\"t\",\"!\",\"🐶\"]\nlet catString = String(catCharacters)</code></pre><h2 id=\"72a95466-de77-4660-be1b-7edb550c6b78\" data-toc-id=\"72a95466-de77-4660-be1b-7edb550c6b78\">Concatenating Strings and Characters</h2><p>String values can be added together with the addition operator to create a new String value:</p><pre><code class=\"language-swift\">let string1 = \"hello\"\nlet string2 = \" there\"\nvar welcome = string1 + string2</code></pre><p>You can also append a String value to an existing String variable with the addition assignment operator:</p><pre><code class=\"language-swift\">var instruction = \"look over\"\ninstruction += string2</code></pre><p>You can append a character value to a String variable with the String type’s append() method:</p><pre><code class=\"language-swift\">let exclamationMark: character = \"!\"\nwelcome.append(exclamationMark)</code></pre><p>if you’re using multiline string literals to build up the lines of a longer string, you want every line in the string to end with a line break, including the last line</p><pre><code class=\"language-swift\">let badStart = \"\"\"\n    one \n    two\n    \"\"\"\nlet end = \"\"\"\n    three\n    \"\"\"\nprint(badStart + end) \n// one \n// twothree\nlet goodStart = \"\"\"\n    one \n    two\n\n    \"\"\"\n// one\n// two\n// three</code></pre><h2 id=\"c4dbd96e-4500-4da1-a5c6-bf65ad31ec2a\" data-toc-id=\"c4dbd96e-4500-4da1-a5c6-bf65ad31ec2a\">String Interpolation</h2><pre><code class=\"language-swift\">let multiplier = 3\nlet message = \"\\(multiplier) times 2.5 is \\(Double(multiplier) * 2.5)\"\n// message is \"3 times 2.5 is 7.5\"</code></pre><p>You can use extended string delimiters to create strings containing characters that would otherwise be treated as a string interpolation.</p><pre><code class=\"language-swift\">print(#\"Write an interpolated string in Swift using \\(multiplier).\"#)\n//6 times 7 is \\(6*7)\n//6 times 7 is 42\nprint(#\"6 times 7 is \\(6*7)\"#)\nprint(#\"6 times 7 is \\#(6*7)\"#)</code></pre><p></p>','learn Swift','2024-02-10 00:13:16',1,1,1,21,NULL,'https://nextui.org/images/album-cover.png',NULL),(70,'add','<p>adf1111111</p>','adfasdfds','2024-02-24 12:54:59',1,1,21,21,NULL,'https://nextui.org/images/album-cover.png',NULL),(71,'2024年2月24号 考研打卡👻','<h1 id=\"322a782c-b422-407d-8b29-ee531301fccd\" data-toc-id=\"322a782c-b422-407d-8b29-ee531301fccd\">核心目标</h1><ul><li><p>争取在三月底完成高等数学的视频课程</p></li><li><p>并看完计算机组成原理 </p></li></ul><h1 id=\"3d503b8f-c6f0-41cb-a516-0354910deb4d\" data-toc-id=\"3d503b8f-c6f0-41cb-a516-0354910deb4d\">2024年2月24号 考研打卡</h1><p>今天是第一天写关于考研的日记，也希望自己以后能够每一天坚持打卡</p><p>基础30讲的函数极限与连续已经正式学完，相关的题目也都已经做完了，但是对于<mark data-color=\"#22c9c5\" style=\"background-color: #22c9c5; color: inherit\">基础知识</mark>还没有进行总结和巩固。明天基本上可以讲函数极限与连续的相关例题全部看完（实际已经做完了，但是需要看张宇的视频课反正漏掉一些关键内容）</p><p class=\"has-focus\">接下来的目标：</p><ol><li><p class=\"has-focus\">整理函数极限与连续的基础知识，像是极限定义、有界性的定义以及极限性质等等内容都需要做一定的总结归纳</p></li><li><p class=\"has-focus\">重新梳理函数极限与连续的例题，所有的例题都需要反复的做，同时也需要有一定的归纳总结</p></li><li><p class=\"has-focus\">准备收纳经典例题（初步所有的例题都收纳）</p></li></ol><h2 id=\"158a4332-0331-4bb3-bb87-c99b6972a2eb\" data-toc-id=\"158a4332-0331-4bb3-bb87-c99b6972a2eb\">函数的概念</h2><ul><li><p>函数概念：单值函数和多值函数</p></li><li><p>反函数概念：以及相关充分条件</p></li><li><p>复合函数：如何求复合函数、复合函数的求导</p></li><li><p>隐函数</p></li><li><p>四种特征：各个性质的概念，碰到相关问题的思路总结</p><ol><li><p>有界性</p></li><li><p>单调性</p></li><li><p>奇偶性</p></li><li><p>周期性</p></li></ol></li></ul><h2 id=\"8a56d4e4-fa31-4bba-b5ca-9bfa0aa70e81\" data-toc-id=\"8a56d4e4-fa31-4bba-b5ca-9bfa0aa70e81\">函数图像</h2><ul><li><p>基本初等函数与初等函数：典型的初等函数的图像一定要记住</p></li><li><p>分段函数</p></li></ul><h2 id=\"f7b0f941-0b1b-4586-a003-b39635475d3c\" data-toc-id=\"f7b0f941-0b1b-4586-a003-b39635475d3c\">函数的极限的概念和性质</h2><ul><li><p>领域</p></li><li><p>函数极限的定义</p></li><li><p>无穷小的定义</p></li><li><p>无穷小的性质</p></li><li><p>无穷小的比阶</p></li><li><p>常用的等价无穷小</p></li><li><p>无穷大的定义</p></li></ul><h2 id=\"e62b50a4-364e-4fbf-8aa3-43d0b76d14d8\" data-toc-id=\"e62b50a4-364e-4fbf-8aa3-43d0b76d14d8\">计算</h2><ul><li><p>极限四则运算规则</p></li><li><p>洛必达法则</p></li><li><p>泰勒公式</p></li><li><p>无穷小的运算</p></li><li><p>泰勒公式应用时的展开原则</p></li><li><p>两个重要极限</p></li><li><p>夹逼准则</p></li><li><p>七种未定式的计算</p></li></ul><h2 id=\"87e89097-f21f-4814-b147-5d7153b6f002\" data-toc-id=\"87e89097-f21f-4814-b147-5d7153b6f002\">函数的连续与间断</h2><ul><li><p>连续点的定义</p></li><li><p>间断点的定义与分类</p></li></ul><p></p>','关于函数极限与连续的相关总结和规划','2024-02-25 00:09:37',1,1,21,21,NULL,'https://nextui.org/images/album-cover.png',NULL),(72,'2024年2月25号 考研打卡✊','<h2 id=\"7c84dfd2-e475-4f62-be28-daf20f347d47\" data-toc-id=\"7c84dfd2-e475-4f62-be28-daf20f347d47\">今日学习内容</h2><ul><li><p>完成函数极限与连续的所有例题</p></li><li><p>复习英语单词</p></li></ul><p>高等数学第一讲函数极限与连续的所有内容全部完结，后面的习题也已经全部做完了，但是并没有进行总结，明天需要对例题进行总结以及对函数极限与连续的基础知识进行总结和归纳</p><p>这是第一个考研复习的周末，总的来说效率还是比较低下的，主要反映在一下几点</p><ul><li><p>起床太晚了，基本都是中午才起床复习的</p></li><li><p>睡的太晚了，而且没睡并不是因为在复习</p></li><li><p>复习的效率很低，都是一边复习一边玩手机，这样的状态十分糟糕</p></li></ul><h2 id=\"87f16bb2-23b3-40b4-8670-913b0810c47f\" data-toc-id=\"87f16bb2-23b3-40b4-8670-913b0810c47f\">下周目标</h2><ul><li><p>完成函数极限与连续的全部内容并持续复习和巩固</p></li><li><p>完成高等数学第二讲：数列极限（包括例题和基础知识的总结）</p></li><li><p>英语单词照常更近复习</p></li><li><p>完成计算机组成原理第一篇内容</p><ul><li><p>计算机系统概论</p></li><li><p>计算机发展与应用</p></li></ul></li></ul><p>希望下周能够尽量不加班吧，同时自己也需要考量是否真的需要离职考研，对于自己老说，确实很难接受在深圳这个鬼地方深耕，希望未来有机会能够回到县里去工作吧。</p><p></p>','完结函数极限与连续的所有例题','2024-02-25 23:00:17',1,1,21,21,NULL,'https://nextui.org/images/album-cover.png',NULL),(73,'2024年 2月26号 考研打卡👻','<h2 id=\"99693dc4-c705-4ad2-9263-1f325ff1bb73\" data-toc-id=\"99693dc4-c705-4ad2-9263-1f325ff1bb73\">核心目标</h2><ul><li><p>争取在三月份完成高等数学部分</p></li><li><p>并在三月份大致看完计算机组成原理</p></li></ul><h2 id=\"a55a8a66-750e-4031-85a0-50294d804a43\" data-toc-id=\"a55a8a66-750e-4031-85a0-50294d804a43\">今日完成</h2><ol><li><p>观看高等数学第二讲：数列极限</p></li><li><p>复习英语单词</p></li></ol><h2 id=\"5bfaf08b-5d5a-4445-9291-bc8b792e6bb7\" data-toc-id=\"5bfaf08b-5d5a-4445-9291-bc8b792e6bb7\">未完成目标</h2><ol><li><p>函数极限与连续并没有对课后习题进行梳理</p></li><li><p>函数极限与连续并没有进行基础知识的梳理</p></li></ol><h2 id=\"bbc3770f-bab4-4b41-97f2-6ede7c2eb432\" data-toc-id=\"bbc3770f-bab4-4b41-97f2-6ede7c2eb432\">计划</h2><ol><li><p>2024年3月4号开始前面所有内容的总结，并在3月5号完成该计划</p></li><li><p>前面的题目也要反复训练</p></li></ol><p></p><p></p>','初步学习数列极限','2024-02-26 23:53:13',1,1,21,21,NULL,'https://nextui.org/images/album-cover.png',NULL),(74,'2024年 2月27号 考研打卡👊','<h2 id=\"2e763bc7-87cb-45e5-95ee-6eba67955978\" data-toc-id=\"2e763bc7-87cb-45e5-95ee-6eba67955978\">考研前的目标</h2><ol><li><p>完成高等数学所有的概念总结</p></li><li><p>完成三遍市面上所有的高等数学题目</p></li><li><p>每天记60个英语单词</p></li><li><p>在5月之前开始408复习</p></li></ol><h2 id=\"8d9880c4-97dd-4ca9-a1a6-033215c97ee0\" data-toc-id=\"8d9880c4-97dd-4ca9-a1a6-033215c97ee0\">核心目标</h2><ul><li><p>三月份完成高等数学</p></li><li><p>三月份完成计算机组成原理</p></li><li><p>坚持复习英语单词</p></li></ul><h2 id=\"f0f5b973-3711-4d2d-87ba-da0797dc80ac\" data-toc-id=\"f0f5b973-3711-4d2d-87ba-da0797dc80ac\">今日完成</h2><ol><li><p>函数极限与连续的课后习题重新做了一遍</p></li><li><p>复习完成英语单词</p></li><li><p>数列极限视频课看完（但是状态不佳），后续微分看了一小部分</p></li></ol><h2 id=\"869c3cc0-54f2-463e-a238-6ed6132f9b11\" data-toc-id=\"869c3cc0-54f2-463e-a238-6ed6132f9b11\">本周有待完成</h2><ol><li><p>完成函数极限与连续的课后习题和基础知识总结（明天必须完成基础知识的总结）</p></li><li><p>完成数列极限和一元函数微分的基础知识总结、例题以及课后习题</p></li><li><p>坚持复习英语单词</p></li><li><p>计算机组成原理能看就看吧，看不了随缘</p></li></ol><p>今天晚上一直在想在职真的能考的上武大么？同时也在想考上武大该多好呀，以后还是尽量少想这些，竟然自己决定要在职考武大，就应该花费更多的时间和精力去学习而不是自我压力</p><p></p>','关于考研总体规划，以及截止今日的复习状况','2024-02-28 00:35:03',1,1,21,21,NULL,'https://nextui.org/images/album-cover.png',NULL);
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
  KEY `post_category_category_id_fk` (`category_id`),
  KEY `post_category_post_id_fk` (`post_id`),
  CONSTRAINT `post_category_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `post_category_post_id_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_category`
--

LOCK TABLES `post_category` WRITE;
/*!40000 ALTER TABLE `post_category` DISABLE KEYS */;
INSERT INTO `post_category` VALUES (12,54,5),(14,56,7),(22,64,5),(24,66,7),(28,70,1),(29,71,9),(30,72,9),(31,73,9),(32,74,9);
/*!40000 ALTER TABLE `post_category` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_pk` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'1');
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
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户昵称',
  `age` int DEFAULT NULL COMMENT '年龄',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户密码',
  `motto` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '座右铭',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar` longtext COMMENT '用户头像',
  `state` int DEFAULT NULL COMMENT '账号状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_pk2` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'1','1',1,'1','1','1','2024-03-16 10:13:46','1',1);
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
  CONSTRAINT `user_role_role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `user_role_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1);
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

-- Dump completed on 2024-03-17 20:49:58
