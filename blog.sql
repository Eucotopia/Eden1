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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'JAVA',1),(2,'Spring',2),(3,'依赖注入',2),(4,'版本控制',4),(5,'Git',4);
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
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文章标题',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文章内容',
  `summary` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '摘要',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `isTop` int NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `user_id` int NOT NULL COMMENT '用户 ID',
  `likes` int DEFAULT '0' COMMENT '点赞数',
  `views` int DEFAULT '0' COMMENT '浏览数',
  `comments` int DEFAULT '0' COMMENT '评论数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Git','# 起步\n\n## 初次运行 Git 前的配置\n\n### 用户信息\n\n```Shell\ngit config --global user.name \"\"\ngit config --global user.email \"\"\n```\n\n### 设置文本编辑器\n\n如果不进行配置，Git 会使用操作系统默认的文本编辑器，通常是 Vim\n\n```Shell\ngit config --global core.editor emacs\n```\n\n### 检查配置信息\n\n如果想要检查 Git 的配置，可以使用 `git config --list` 命令来列出 Git 当时能找到的配置\n\n```Shell\ngit config --list\n```\n\n通过上述命令，我们可能会发现同一个变量具有多个值，这是因为 Git 会从多个配置文件（例如：`/etc/gitconfig` 与 `~/.gitconfig`）中查找，在这种情况下，Git 会使用找到每一个变量的最后一个配置\n\n同时，我们可以使用 `git config <key>` 来检查 Git 的某一项配置\n\n```Shell\n$ git config --username\nliwei\n$ git config --email\nwli@pvetec.com\n```\n\n### 获取帮助\n\n若你使用 Git 时需要获取帮助，有三种方法可以找到 Git 命令的使用手册\n\n```Shell\ngit help <verb>\ngit <verb> --help\nman git-<verb>\n```\n\n# Git 基础\n\n## 获取 Git 仓库\n\n有两种取得 Git 项目仓库的方法。第一种是在现有项目或目录下导入所有文件到 Git 中；第二种是从一个服务器克隆一个现有的 Git 仓库\n\n### 在现有仓库中初始化仓库\n\n如果我们打算通过 Git 来对现有项目进行管理，只需要进入该项目目录并输入\n\n```Shell\ngit init\n```\n\n该命令将会创建一个名为 `.git` 的子目录，这个子目录含有你初始化的 Git 仓库中所有的必要文件。这些文件是 Git 仓库的骨干。但是，在这个时候，我们仅仅只是做了一个初始化的操作，我们项目中的文件依旧没有被跟踪\n\n如果是在一个已经存在文件的文件夹（不是空文件夹）中初始化 Git 仓库来进行版本版本控制的话，我们应该开始跟踪这些文件并提交\n\n```Shell\n# 添加文件到暂存区\ngit add *.c\ngit add LICENSE\n# 将暂存区的更改提交到版本控制系统\ngit commit -m \"initail project version \"\n```\n\n### 克隆现有的仓库\n\n克隆仓库的命令格式为 git clone [url]，例如\n\n```Shell\ngit clone https://github.com/libgit2/libgit2\n```\n\n这将会在当前目录下创建一个名为 `libgit2` 的目录，并在这个目录下初始化一个 `.git` 文件。从远程仓库中拉取下来的所有数据放入 `.git` 文件夹，然后从中读取最新版本的文件的拷贝。如果你进入到这个新建的 `libgit2` 文件夹，你会发现所有的项目文件已经在里面了，准备就绪等待后续的开发和使用。 如果你想在克隆远程仓库的时候，自定义本地仓库的名字，你可以使用如下命令：\n\n```Shell\n$ git clone https://github.com/libgit2/libgit2 mylibgit\n```\n\n这将执行与上一个命令相同的操作，不过在本地创建的仓库名字变为 `mylibgit`\n\n## 记录每次更新到仓库\n\n在我们的工作目录下的每一个文件都无外乎这两种状态：已跟踪或未跟踪。已跟踪的文件是指那些被纳入了版本控制的文件，在上一次快照中有它们的记录，在工作一段时间后，他们的状态可能处于未修改，已修改或已放入暂存区。工作目录中除已跟踪文件之外的所有其他文件都属于未跟踪文件，他们既不存在于上次快照的记录中，也没有放入暂存区。初次克隆某个仓库的时候，工作目录下所有的文件都属于已跟踪文件，并处于未修改状态。\n\n编辑过某些文件后，由于自上次提交后你对它们做了修改，Git 将它们 标记为已修改文件，我们逐步将这些修改过的文件放入暂存区，然后提交所有暂存了的修改，如此反复。所以使用 Git 时文件的生命周期如下：\n\n![屏幕截图 2023-10-23 151859.png](Git+1fe55e79-8db2-4e11-84e1-cfa3bcc33247/屏幕截图+2023-10-23+151859.png)\n\n### 检查当前文件状态\n\n要查看哪些文件处于什么状态，可以使用 `git status` 命令。如果在克隆仓库后立即使用此命令，会看到类似这样的输出：\n\n```Shell\ngit status\nOn branch master\nmothing to commit,working directory clean\n```\n\n这说明当前的工作目录相当干净。换句话说，所有已跟踪的文件在上次提交之后都未被修改。同时，上述信息还表明，当前目录下没有出现任何处于未跟踪状态的新文件，否则 Git 会列出未跟踪的文件\n\n现在，让我们在项目中创建一个新的 README 文件。如果之前并不存在这个文件，使用 `git status` 命令可以看到一个新的未跟踪文件：\n\n```Shell\n$ echo \'My Project\' > README\n$ git status\nOn branch master\nUntracked files:\n  (use \"git add <file>...\" to include in what will be committed)\n\n    README\n\nnothing added to commit but untracked files present (use \"git add\" to track)\n```\n\n上述信息可以看到新建的 README 文件出现在 `Untracked files`下面。未跟踪的文件意味着 Git 在之前的快照（提交）中没有这些文件；Git 不会自动将之纳入跟踪范围，除非你明明白白地告诉它\"我需要跟踪该文件\"，这样的处理让你不必担心将生成的二进制文件或其它不想被跟踪的文件包含进来。 不过现在的例子中，我们确实想要跟踪管理 README 这个文件\n\n### 跟踪新文件\n\n使用 `git add` 开始跟踪一个文件。所以，要跟踪 README 文件，运行：\n\n```Shell\ngit add REAMDE\n```\n\n此时再运行 `git status` 命令，会看到 README 文件已被跟踪，并处于暂存状态：\n\n```Shell\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD <file>...\" to unstage)\n\n    new file:   README\n```\n\n只要是在 changes to be committed 下的文件，就说明是已暂存状态。如果此时进行提交，那么该文件此时此刻的版本将被留存在历史记录中。如果 `git add` 命令使用文件或者目录的路径作为参数，那么该命令将递归的跟踪该目录下的所有文件\n\n### 暂存已修改文件\n\n现在我们来修改一个已经被跟踪的文件。如果你修改了一个名为 `CONTRIBUTING.md` 的已被跟踪的文件，然后运行 `git status` 命令，会看到下面内容：\n\n```Shell\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD <file>...\" to unstage)\n\n    new file:   README\n\nChanges not staged for commit:\n  (use \"git add <file>...\" to update what will be committed)\n  (use \"git checkout -- <file>...\" to discard changes in working directory)\n\n    modified:   CONTRIBUTING.md\n```\n\n文件 `CONTRIBUTING.md` 出现在 `Changes not staged for commit` 这行下面，说明已跟踪文件的内容发生了变化，但还没有放到暂存区。 要暂存这次更新，需要运行 `git add` 命令。 这是个多功能命令：可以用它开始跟踪新文件，或者把已跟踪的文件放到暂存区，还能用于合并时把有冲突的文件标记为已解决状态等。 将这个命令理解为“添加内容到下一次提交中”而不是“将一个文件添加到项目中”要更加合适。 现在让我们运行 `git add` 将\"CONTRIBUTING.md\"放到暂存区，然后再看看 `git status` 的输出：\n\n```Shell\n$ git add CONTRIBUTING.md\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD <file>...\" to unstage)\n\n    new file:   README\n    modified:   CONTRIBUTING.md\n```\n\n现在两个文件都已暂存，下次提交时就会一并记录到仓库。假设此时，你想要在 `CONTRIBUTING.md` 里再加条注释， 重新编辑存盘后，准备好提交。 不过且慢，再运行 `git status` 看看：\n\n```Shell\n$ vim CONTRIBUTING.md\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD <file>...\" to unstage)\n\n    new file:   README\n    modified:   CONTRIBUTING.md\n\nChanges not staged for commit:\n  (use \"git add <file>...\" to update what will be committed)\n  (use \"git checkout -- <file>...\" to discard changes in working directory)\n\n    modified:   CONTRIBUTING.md\n```\n\n现在我们发现 `CONTRIBUTING.md` 文件同时出现在暂存区和非暂存区。实际上，Git 只会暂存你运行了 `git add` 命令时的版本，如果我们现在提交，那么 `CONTRIBUTING.md` 的版本是你最后一次运行 `git add` 命令时的那个版本，而不是你运行 `git commit` 时，在工作目录中的当前版本。所以运行了 `git add` 之后又作了修订的文件，需要重新运行 `git add` 把最新版本进行暂存起来\n\n```Shell\n$ git add CONTRIBUTING.md\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD <file>...\" to unstage)\n\n    new file:   README\n    modified:   CONTRIBUTING.md\n```\n\n### 状态简介\n\n`git status` 命令的输入十分详细，但其用语有些繁琐。 如果你使用 `git status -s` 命令或 `git status --short` 命令，你将得到一种更为紧凑的格式输出。 运行 `git status -s` ，状态报告输出如下：\n\n```Shell\n$ git status -s\n M README\nMM Rakefile\nA  lib/git.rb\nM  lib/simplegit.rb\n?? LICENSE.txt\n```\n\n1. ？？：表示新添加的文件没有被跟踪\n\n2. _M：表示文件被修改但是没有加入暂存区\n\n3. M_：表示文件被修改且加入到暂存区\n\n4. MM：表示文件加入到暂存区后再一个进行了修改，所以在暂存区和工作区都有该文件被修改了的记录\n\n5. A：表示新添加到暂存区的文件\n\n### 忽略文件\n\n一般情况下又会有些文件不需要纳入 Git 的管理，也不希望它们总是出现在未被跟踪的文件列表中，通常都是些自动生成的文件，比如日志文件，或者编译过程中创建的临时文件等。这种情况下，我们可以创建一个名为 `.gitignore` 的文件，列出要忽略的文件模式。如下：\n\n```Shell\n$ cat .gitignore\n*.[oa]\n*~\n```\n\n第一行告诉 Git 忽略所有以 `.o` 或 `.a` 结尾的文件。一般这类对象文件和存档文件都是编译过程中出现的。 第二行告诉 Git 忽略所有以波浪符（~）结尾的文件，许多文本编辑软件（比如 Emacs）都用这样的文件名保存副本。 此外，你可能还需要忽略 log，tmp 或者 pid 目录，以及自动生成的文档等等。 要养成一开始就设置好 .gitignore 文件的习惯，以免将来误提交这类无用的文件。\n\n文件 `.gitignore` 的格式规范如下：\n\n- 所有空行或者以 `#` 开头的行都会被 Git 忽略\n\n- 可以使用标准的 glob 模式匹配\n\n- 匹配模式可以以（`/`）开头防止递归\n\n- 匹配模式可以以（`/`）结尾指定目录\n\n- 要忽略指定模式以外的文件或目录，可以在模式前加上惊叹号（`!`） 取反\n\n所谓的 glob 模式指的是 shell 所使用的简化版正则表达式。星号（*）表示匹配一个或者多个字符；[abc]表示匹配方括号中的某一个字符；问好（?）表示只匹配一个任意字符；如果方括号内用短划线分隔两个字符，表示所有在这两个字符之间内的都可以匹配（例如，`[0-9]` 表示匹配所有 0-9 之间的数字）；使用两个星号（*）表示匹配任意中间目录（`/a/**/b` 可以匹配 `/a/c/b`、`/a/c/d/b`等）\n\n### 查看已暂存和未暂存的修改\n\n当我们使用 `git status` 所给出的结果可能相对模糊，我们无法知道具体那些地方被修改了。使用 `git diff` 可以很好的解决这个问题，它可以根据文件补丁的方式显示具体哪些行被修改了\n\n假如再次修改 README 文件后暂存，然后编辑 `CONTRIBUTING.md` 后不暂存，运行 `git status` 命令将会看到：\n\n```Shell\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD <file>...\" to unstage)\n\n    modified:   README\n\nChanges not staged for commit:\n  (use \"git add <file>...\" to update what will be committed)\n  (use \"git checkout -- <file>...\" to discard changes in working directory)\n\n    modified:   CONTRIBUTING.md\n```\n\n要查看尚未暂存的文件修改了哪些部分，不加参数直接输入 `git diff` ：\n\n```Shell\n$ git diff\ndiff --git a/CONTRIBUTING.md b/CONTRIBUTING.md\nindex 8ebb991..643e24f 100644\n--- a/CONTRIBUTING.md\n+++ b/CONTRIBUTING.md\n@@ -65,7 +65,8 @@ branch directly, things can get messy.\n Please include a nice description of your changes when you submit your PR;\n if we have to read the whole diff to figure out why you\'re contributing\n in the first place, you\'re less likely to get feedback and have your change\n-merged in.\n+merged in. Also, split your changes into comprehensive chunks if your patch is\n+longer than a dozen lines.\n\n If you are starting to work on a particular area, feel free to submit a PR\n that highlights your work in progress (and note in the PR title that it\'s\n```\n\n需要注意的是，该命令比较的是工作目录中当前文件与暂存区快照之间的差异，也就是修改之后还没有暂存起来的变化内容\n\n若要查看当前已经暂存的内容将要添加到下一次提交的内容（说白了，就是当前暂存的内容和最近一次提交内容的差异），可以用 `git diff --cached` 命令。Git 1.6.1 及更高版本还允许使用 `git diff --staged`，效果是相同的，但更好记些）\n\n```Shell\n$ git diff --staged\ndiff --git a/README b/README\nnew file mode 100644\nindex 0000000..03902a1\n--- /dev/null\n+++ b/README\n@@ -0,0 +1 @@\n+My Project\n```\n\n请注意，git diff 本身只显示尚未暂存的改动，而不是自上次提交以来所做的所有改动。 所以有时候你一下子暂存了所有更新过的文件后，运行 `git diff` 后却什么也没有，就是这个原因\n\n像之前说的，暂存 `CONTRIBUTING.md` 后再编辑，运行 `git status` 会看到暂存前后的两个版本。 如果我们的环境（终端输出）看起来如下：\n\n```Shell\n$ git add CONTRIBUTING.md\n$ echo \'# test line\' >> CONTRIBUTING.md\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD <file>...\" to unstage)\n\n    modified:   CONTRIBUTING.md\n\nChanges not staged for commit:\n  (use \"git add <file>...\" to update what will be committed)\n  (use \"git checkout -- <file>...\" to discard changes in working directory)\n\n    modified:   CONTRIBUTING.md\n```\n\n现在运行 `git diff` 看暂存前后的变化：\n\n```Shell\n$ git diff\ndiff --git a/CONTRIBUTING.md b/CONTRIBUTING.md\nindex 643e24f..87f08c8 100644\n--- a/CONTRIBUTING.md\n+++ b/CONTRIBUTING.md\n@@ -119,3 +119,4 @@ at the\n ## Starter Projects\n\n See our [projects list](https://github.com/libgit2/libgit2/blob/development/PROJECTS.md).\n+# test line\n```\n\n然后用 `git diff --cached` 查看已经暂存起来的变化：（--staged 和 --cached 是同义词）\n\n```Shell\n$ git diff --cached\ndiff --git a/CONTRIBUTING.md b/CONTRIBUTING.md\nindex 8ebb991..643e24f 100644\n--- a/CONTRIBUTING.md\n+++ b/CONTRIBUTING.md\n@@ -65,7 +65,8 @@ branch directly, things can get messy.\n Please include a nice description of your changes when you submit your PR;\n if we have to read the whole diff to figure out why you\'re contributing\n in the first place, you\'re less likely to get feedback and have your change\n-merged in.\n+merged in. Also, split your changes into comprehensive chunks if your patch is\n+longer than a dozen lines.\n\n If you are starting to work on a particular area, feel free to submit a PR\n that highlights your work in progress (and note in the PR title that it\'s\n```\n\n### 提交更新\n\n\n\n','Git 教程','2023-10-28 10:52:50',1,1,0,0,0);
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
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '角色 ID',
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN');
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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户 ID',
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户昵称',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户密码',
  `motto` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '座右铭',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_pk2` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'3499508634@qq.com','A better tomorrow','$2y$10$mBLhCCNMg.crwRWTU3hCIeP.LOjfxo27nZ1/Vbynf8t7naVUXd3pq','没什么大不了','2023-11-01 04:59:25');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户角色表';
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

-- Dump completed on 2023-11-01 13:01:08
