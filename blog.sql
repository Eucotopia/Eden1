-- MySQL dump 10.13  Distrib 8.1.0, for macos13.3 (arm64)
--
-- Host: 127.0.0.1    Database: blog
-- ------------------------------------------------------
-- Server version	8.1.0

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
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_top` int NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `user_id` int NOT NULL COMMENT '用户 ID',
  `likes` int DEFAULT '0' COMMENT '点赞数',
  `views` int DEFAULT '0' COMMENT '浏览数',
  `comments` int DEFAULT '0' COMMENT '评论数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'这是 id 为1的标题','<h1>这是标题一</h1><p><span data-type=\"mention\" class=\"mention\" data-id=\"Lea Thompson\">@Lea Thompson</span> </p><p><code>这是一个代码</code><br><span style=\"color: red\">阿道夫</span></p><pre><code> 这是一个代码块</code></pre>','这是一个摘要','2023-10-28 02:52:50',1,1,1,1,1),(3,'这是 id 为2的标题','<h1>起步</h1><p> </p><h2>初次运行 Git 前的配置</h2><p></p><h3>用户信息</h3><p> </p><pre><code class=\"language-Shell\">git config --global user.name \"\"\ngit config --global user.email \"\"</code></pre><p> </p><h3>设置文本编辑器</h3><p> </p><p>如果不进行配置，Git 会使用操作系统默认的文本编辑器，通常是 Vim</p><p> </p><pre><code class=\"language-Shell\">git config --global core.editor emacs\n</code></pre><p> </p><h3>检查配置信息</h3><p> </p><p>如果想要检查 Git 的配置，可以使用 <code>git config --list</code> 命令来列出 Git 当时能找到的配置</p><p> </p><pre><code class=\"language-Shell\">git config --list\n</code></pre><p> </p><p>通过上述命令，我们可能会发现同一个变量具有多个值，这是因为 Git 会从多个配置文件（例如：<code>/etc/gitconfig</code> 与 <code>~/.gitconfig</code>）中查找，在这种情况下，Git 会使用找到每一个变量的最后一个配置</p><p> </p><p>同时，我们可以使用 <code>git config &lt;key&gt;</code> 来检查 Git 的某一项配置</p><p> </p><pre><code class=\"language-Shell\">$ git config --username\nliwei\n$ git config --email\nwli@pvetec.com\n</code></pre><p></p><h3>获取帮助</h3><p>若你使用 Git 时需要获取帮助，有三种方法可以找到 Git 命令的使用手册</p><p> </p><pre><code class=\"language-Shell\">git help &lt;verb&gt;\ngit &lt;verb&gt; --help\nman git-&lt;verb&gt;\n</code></pre><p> </p><h1>Git 基础</h1><p> </p><h2>获取 Git 仓库</h2><p> </p><p>有两种取得 Git 项目仓库的方法。第一种是在现有项目或目录下导入所有文件到 Git 中；第二种是从一个服务器克隆一个现有的 Git 仓库</p><p> </p><h3>在现有仓库中初始化仓库</h3><p> </p><p>如果我们打算通过 Git 来对现有项目进行管理，只需要进入该项目目录并输入</p><p> </p><pre><code class=\"language-Shell\">git init\n</code></pre><p> </p><p>该命令将会创建一个名为 <code>.git</code> 的子目录，这个子目录含有你初始化的 Git 仓库中所有的必要文件。这些文件是 Git 仓库的骨干。但是，在这个时候，我们仅仅只是做了一个初始化的操作，我们项目中的文件依旧没有被跟踪</p><p> </p><p>如果是在一个已经存在文件的文件夹（不是空文件夹）中初始化 Git 仓库来进行版本版本控制的话，我们应该开始跟踪这些文件并提交</p><p> </p><pre><code class=\"language-Shell\"># 添加文件到暂存区\ngit add *.c\ngit add LICENSE\n# 将暂存区的更改提交到版本控制系统\ngit commit -m \"initail project version \"\n</code></pre><p> </p><h3>克隆现有的仓库</h3><p> </p><p>克隆仓库的命令格式为 git clone [url]，例如</p><p> </p><pre><code class=\"language-Shell\">git clone https://github.com/libgit2/libgit2\n</code></pre><p> </p><p>这将会在当前目录下创建一个名为 <code>libgit2</code> 的目录，并在这个目录下初始化一个 <code>.git</code> 文件。从远程仓库中拉取下来的所有数据放入 <code>.git</code> 文件夹，然后从中读取最新版本的文件的拷贝。如果你进入到这个新建的 <code>libgit2</code> 文件夹，你会发现所有的项目文件已经在里面了，准备就绪等待后续的开发和使用。 如果你想在克隆远程仓库的时候，自定义本地仓库的名字，你可以使用如下命令：</p><p> </p><pre><code class=\"language-Shell\">$ git clone https://github.com/libgit2/libgit2 mylibgit\n</code></pre><p> </p><p>这将执行与上一个命令相同的操作，不过在本地创建的仓库名字变为 <code>mylibgit</code></p><p> </p><h2>记录每次更新到仓库</h2><p> </p><p>在我们的工作目录下的每一个文件都无外乎这两种状态：已跟踪或未跟踪。已跟踪的文件是指那些被纳入了版本控制的文件，在上一次快照中有它们的记录，在工作一段时间后，他们的状态可能处于未修改，已修改或已放入暂存区。工作目录中除已跟踪文件之外的所有其他文件都属于未跟踪文件，他们既不存在于上次快照的记录中，也没有放入暂存区。初次克隆某个仓库的时候，工作目录下所有的文件都属于已跟踪文件，并处于未修改状态。</p><p> </p><p>编辑过某些文件后，由于自上次提交后你对它们做了修改，Git 将它们 标记为已修改文件，我们逐步将这些修改过的文件放入暂存区，然后提交所有暂存了的修改，如此反复。所以使用 Git 时文件的生命周期如下：</p><p> </p><p></p><p> </p><h3>检查当前文件状态</h3><p> </p><p>要查看哪些文件处于什么状态，可以使用 <code>git status</code> 命令。如果在克隆仓库后立即使用此命令，会看到类似这样的输出：</p><p> </p><pre><code class=\"language-Shell\">git status\nOn branch master\nmothing to commit,working directory clean\n</code></pre><p> </p><p>这说明当前的工作目录相当干净。换句话说，所有已跟踪的文件在上次提交之后都未被修改。同时，上述信息还表明，当前目录下没有出现任何处于未跟踪状态的新文件，否则 Git 会列出未跟踪的文件</p><p> </p><p>现在，让我们在项目中创建一个新的 README 文件。如果之前并不存在这个文件，使用 <code>git status</code> 命令可以看到一个新的未跟踪文件：</p><p> </p><pre><code class=\"language-Shell\">$ echo \'My Project\' &gt; README\n$ git status\nOn branch master\nUntracked files:\n  (use \"git add &lt;file&gt;...\" to include in what will be committed)\n\n    README\n\nnothing added to commit but untracked files present (use \"git add\" to track)\n</code></pre><p> </p><p>上述信息可以看到新建的 README 文件出现在 <code>Untracked files</code>下面。未跟踪的文件意味着 Git 在之前的快照（提交）中没有这些文件；Git 不会自动将之纳入跟踪范围，除非你明明白白地告诉它\"我需要跟踪该文件\"，这样的处理让你不必担心将生成的二进制文件或其它不想被跟踪的文件包含进来。 不过现在的例子中，我们确实想要跟踪管理 README 这个文件</p><p> </p><h3>跟踪新文件</h3><p> </p><p>使用 <code>git add</code> 开始跟踪一个文件。所以，要跟踪 README 文件，运行：</p><p> </p><pre><code class=\"language-Shell\">git add REAMDE\n</code></pre><p> </p><p>此时再运行 <code>git status</code> 命令，会看到 README 文件已被跟踪，并处于暂存状态：</p><p> </p><pre><code class=\"language-Shell\">$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    new file:   README\n</code></pre><p> </p><p>只要是在 changes to be committed 下的文件，就说明是已暂存状态。如果此时进行提交，那么该文件此时此刻的版本将被留存在历史记录中。如果 <code>git add</code> 命令使用文件或者目录的路径作为参数，那么该命令将递归的跟踪该目录下的所有文件</p><p> </p><h3>暂存已修改文件</h3><p> </p><p>现在我们来修改一个已经被跟踪的文件。如果你修改了一个名为 <code>CONTRIBUTING.md</code> 的已被跟踪的文件，然后运行 <code>git status</code> 命令，会看到下面内容：</p><p> </p><pre><code class=\"language-Shell\">$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    new file:   README\n\nChanges not staged for commit:\n  (use \"git add &lt;file&gt;...\" to update what will be committed)\n  (use \"git checkout -- &lt;file&gt;...\" to discard changes in working directory)\n\n    modified:   CONTRIBUTING.md\n</code></pre><p> </p><p>文件 <code>CONTRIBUTING.md</code> 出现在 <code>Changes not staged for commit</code> 这行下面，说明已跟踪文件的内容发生了变化，但还没有放到暂存区。 要暂存这次更新，需要运行 <code>git add</code> 命令。 这是个多功能命令：可以用它开始跟踪新文件，或者把已跟踪的文件放到暂存区，还能用于合并时把有冲突的文件标记为已解决状态等。 将这个命令理解为“添加内容到下一次提交中”而不是“将一个文件添加到项目中”要更加合适。 现在让我们运行 <code>git add</code> 将\"CONTRIBUTING.md\"放到暂存区，然后再看看 <code>git status</code> 的输出：</p><p> </p><pre><code class=\"language-Shell\">$ git add CONTRIBUTING.md\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    new file:   README\n    modified:   CONTRIBUTING.md\n</code></pre><p> </p><p>现在两个文件都已暂存，下次提交时就会一并记录到仓库。假设此时，你想要在 <code>CONTRIBUTING.md</code> 里再加条注释， 重新编辑存盘后，准备好提交。 不过且慢，再运行 <code>git status</code> 看看：</p><p> </p><pre><code class=\"language-Shell\">$ vim CONTRIBUTING.md\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    new file:   README\n    modified:   CONTRIBUTING.md\n\nChanges not staged for commit:\n  (use \"git add &lt;file&gt;...\" to update what will be committed)\n  (use \"git checkout -- &lt;file&gt;...\" to discard changes in working directory)\n\n    modified:   CONTRIBUTING.md\n</code></pre><p> </p><p>现在我们发现 <code>CONTRIBUTING.md</code> 文件同时出现在暂存区和非暂存区。实际上，Git 只会暂存你运行了 <code>git add</code> 命令时的版本，如果我们现在提交，那么 <code>CONTRIBUTING.md</code> 的版本是你最后一次运行 <code>git add</code> 命令时的那个版本，而不是你运行 <code>git commit</code> 时，在工作目录中的当前版本。所以运行了 <code>git add</code> 之后又作了修订的文件，需要重新运行 <code>git add</code> 把最新版本进行暂存起来</p><p> </p><pre><code class=\"language-Shell\">$ git add CONTRIBUTING.md\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    new file:   README\n    modified:   CONTRIBUTING.md\n</code></pre><p> </p><h3>状态简介</h3><p> </p><p><code>git status</code> 命令的输入十分详细，但其用语有些繁琐。 如果你使用 <code>git status -s</code> 命令或 <code>git status --short</code> 命令，你将得到一种更为紧凑的格式输出。 运行 <code>git status -s</code> ，状态报告输出如下：</p><p> </p><pre><code class=\"language-Shell\">$ git status -s\n M README\nMM Rakefile\nA  lib/git.rb\nM  lib/simplegit.rb\n?? LICENSE.txt\n</code></pre><p> </p><ol><li><p>？？：表示新添加的文件没有被跟踪</p></li><li><p>_M：表示文件被修改但是没有加入暂存区</p></li><li><p>M_：表示文件被修改且加入到暂存区</p></li><li><p>MM：表示文件加入到暂存区后再一个进行了修改，所以在暂存区和工作区都有该文件被修改了的记录</p></li><li><p>A：表示新添加到暂存区的文件</p></li></ol><p> </p><h3>忽略文件</h3><p> </p><p>一般情况下又会有些文件不需要纳入 Git 的管理，也不希望它们总是出现在未被跟踪的文件列表中，通常都是些自动生成的文件，比如日志文件，或者编译过程中创建的临时文件等。这种情况下，我们可以创建一个名为 <code>.gitignore</code> 的文件，列出要忽略的文件模式。如下：</p><p> </p><pre><code class=\"language-Shell\">$ cat .gitignore\n*.[oa]\n*~\n</code></pre><p> </p><p>第一行告诉 Git 忽略所有以 <code>.o</code> 或 <code>.a</code> 结尾的文件。一般这类对象文件和存档文件都是编译过程中出现的。 第二行告诉 Git 忽略所有以波浪符（~）结尾的文件，许多文本编辑软件（比如 Emacs）都用这样的文件名保存副本。 此外，你可能还需要忽略 log，tmp 或者 pid 目录，以及自动生成的文档等等。 要养成一开始就设置好 .gitignore 文件的习惯，以免将来误提交这类无用的文件。</p><p> </p><p>文件 <code>.gitignore</code> 的格式规范如下：</p><p> </p><ul><li><p>所有空行或者以 <code>#</code> 开头的行都会被 Git 忽略</p></li><li><p>可以使用标准的 glob 模式匹配</p></li><li><p>匹配模式可以以（<code>/</code>）开头防止递归</p></li><li><p>匹配模式可以以（<code>/</code>）结尾指定目录</p></li><li><p>要忽略指定模式以外的文件或目录，可以在模式前加上惊叹号（<code>!</code>） 取反</p></li></ul><p> </p><p>所谓的 glob 模式指的是 shell 所使用的简化版正则表达式。星号（<em>）表示匹配一个或者多个字符；[abc]表示匹配方括号中的某一个字符；问好（?）表示只匹配一个任意字符；如果方括号内用短划线分隔两个字符，表示所有在这两个字符之间内的都可以匹配（例如，</em><code>[0-9]</code> 表示匹配所有 0-9 之间的数字）；使用两个星号（）表示匹配任意中间目录（<code>/a/**/b</code> 可以匹配 <code>/a/c/b</code>、<code>/a/c/d/b</code>等）</p><p> </p><h3>查看已暂存和未暂存的修改</h3><p> </p><p>当我们使用 <code>git status</code> 所给出的结果可能相对模糊，我们无法知道具体那些地方被修改了。使用 <code>git diff</code> 可以很好的解决这个问题，它可以根据文件补丁的方式显示具体哪些行被修改了</p><p> </p><p>假如再次修改 README 文件后暂存，然后编辑 <code>CONTRIBUTING.md</code> 后不暂存，运行 <code>git status</code> 命令将会看到：</p><p> </p><pre><code class=\"language-Shell\">$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    modified:   README\n\nChanges not staged for commit:\n  (use \"git add &lt;file&gt;...\" to update what will be committed)\n  (use \"git checkout -- &lt;file&gt;...\" to discard changes in working directory)\n\n    modified:   CONTRIBUTING.md\n</code></pre><p> </p><p>要查看尚未暂存的文件修改了哪些部分，不加参数直接输入 <code>git diff</code> ：</p><p> </p><pre><code class=\"language-Shell\">$ git diff\ndiff --git a/CONTRIBUTING.md b/CONTRIBUTING.md\nindex 8ebb991..643e24f 100644\n--- a/CONTRIBUTING.md\n+++ b/CONTRIBUTING.md\n@@ -65,7 +65,8 @@ branch directly, things can get messy.\n Please include a nice description of your changes when you submit your PR;\n if we have to read the whole diff to figure out why you\'re contributing\n in the first place, you\'re less likely to get feedback and have your change\n-merged in.\n+merged in. Also, split your changes into comprehensive chunks if your patch is\n+longer than a dozen lines.\n\n If you are starting to work on a particular area, feel free to submit a PR\n that highlights your work in progress (and note in the PR title that it\'s\n</code></pre><p> </p><p>需要注意的是，该命令比较的是工作目录中当前文件与暂存区快照之间的差异，也就是修改之后还没有暂存起来的变化内容</p><p> </p><p>若要查看当前已经暂存的内容将要添加到下一次提交的内容（说白了，就是当前暂存的内容和最近一次提交内容的差异），可以用 <code>git diff --cached</code> 命令。Git 1.6.1 及更高版本还允许使用 <code>git diff --staged</code>，效果是相同的，但更好记些）</p><p> </p><pre><code class=\"language-Shell\">$ git diff --staged\ndiff --git a/README b/README\nnew file mode 100644\nindex 0000000..03902a1\n--- /dev/null\n+++ b/README\n@@ -0,0 +1 @@\n+My Project\n</code></pre><p> </p><p>请注意，git diff 本身只显示尚未暂存的改动，而不是自上次提交以来所做的所有改动。 所以有时候你一下子暂存了所有更新过的文件后，运行 <code>git diff</code> 后却什么也没有，就是这个原因</p><p> </p><p>像之前说的，暂存 <code>CONTRIBUTING.md</code> 后再编辑，运行 <code>git status</code> 会看到暂存前后的两个版本。 如果我们的环境（终端输出）看起来如下：</p><p> </p><pre><code class=\"language-Shell\">$ git add CONTRIBUTING.md\n$ echo \'# test line\' &gt;&gt; CONTRIBUTING.md\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    modified:   CONTRIBUTING.md\n\nChanges not staged for commit:\n  (use \"git add &lt;file&gt;...\" to update what will be committed)\n  (use \"git checkout -- &lt;file&gt;...\" to discard changes in working directory)\n\n    modified:   CONTRIBUTING.md\n</code></pre><p> </p><p>现在运行 <code>git diff</code> 看暂存前后的变化：</p><p> </p><pre><code class=\"language-Shell\">$ git diff\ndiff --git a/CONTRIBUTING.md b/CONTRIBUTING.md\nindex 643e24f..87f08c8 100644\n--- a/CONTRIBUTING.md\n+++ b/CONTRIBUTING.md\n@@ -119,3 +119,4 @@ at the\n ## Starter Projects\n\n See our [projects list](https://github.com/libgit2/libgit2/blob/development/PROJECTS.md).\n+# test line\n</code></pre><p> </p><p>然后用 <code>git diff --cached</code> 查看已经暂存起来的变化：（--staged 和 --cached 是同义词）</p><p> </p><pre><code class=\"language-Shell\">$ git diff --cached\ndiff --git a/CONTRIBUTING.md b/CONTRIBUTING.md\nindex 8ebb991..643e24f 100644\n--- a/CONTRIBUTING.md\n+++ b/CONTRIBUTING.md\n@@ -65,7 +65,8 @@ branch directly, things can get messy.\n Please include a nice description of your changes when you submit your PR;\n if we have to read the whole diff to figure out why you\'re contributing\n in the first place, you\'re less likely to get feedback and have your change\n-merged in.\n+merged in. Also, split your changes into comprehensive chunks if your patch is\n+longer than a dozen lines.\n\n If you are starting to work on a particular area, feel free to submit a PR\n that highlights your work in progress (and note in the PR title that it\'s\n</code></pre><p> </p><h3>提交更新</h3><p> </p><p>现在暂存区域已经准备妥当可以提交了。在此之前，一定要确定还有什么修改过的或新建的文件还没有 <code>git add</code> 过，否则提交的时候不会记录这些还没暂存起来的变化。这些修改过的文件只会保留再在本地磁盘。所以，每次准备提交前，先用 <code>git status</code> 看下，是否需要提交的代码都已经暂存起来了，然后再运行提交命令 <code>git commit</code>：</p><p> </p><pre><code class=\"language-Shell\">git commit\n</code></pre><p> </p><p>这种方式会启动文本编辑器以便输入本次提交的说明。(默认会启用 shell 的环境变量 <code>$EDITOR</code> 所指定的软件，一般都是 vim 或 emacs）</p><p> </p><p>编辑器会显示类似下面的文本信息（本例选用 Vim 的屏显方式展示）：</p><p> </p><pre><code class=\"language-Shell\"># Please enter the commit message for your changes. Lines starting\n# with \'#\' will be ignored, and an empty message aborts the commit.\n# On branch master\n# Changes to be committed:\n#    new file:   README\n#    modified:   CONTRIBUTING.md\n#\n~\n~\n~\n\".git/COMMIT_EDITMSG\" 9L, 283C\n</code></pre><p> </p><p>可以看到，默认的提交消息包含最后一次运行 <code>git status</code> 的输出，放在注释行里，另外开头还有一空行，供你输入提交说明。 你完全可以去掉这些注释行，不过留着也没关系，多少能帮你回想起这次更新的内容有哪些。 (如果想要更详细的对修改了哪些内容的提示，可以用 <code>-v</code> 选项，这会将你所做的改变的 diff 输出放到编辑器中从而使你知道本次提交具体做了哪些修改。） 退出编辑器时，Git 会丢掉注释行，用你输入提交附带信息生成一次提交</p><p> </p><p>另外，我们也可以在 <code>commit</code> 命令后添加 <code>-m</code> 选项，将提交信息与命令放在同一行，如下所示：</p><p> </p><pre><code class=\"language-Shell\">$ git commit -m \"Story 182: Fix benchmarks for speed\"\n[master 463dc4f] Story 182: Fix benchmarks for speed\n 2 files changed, 2 insertions(+)\n create mode 100644 README\n</code></pre><p> </p><p>好，现在你已经创建了第一个提交！ 可以看到，提交后它会告诉你，当前是在哪个分支（<code>master</code>）提交的，本次提交的完整 SHA-1 校验和是什么（<code>463dc4f</code>），以及在本次提交中，有多少文件修订过，多少行添加和删改过</p><p> </p><p>请记住，提交时记录的是在暂存区域的快照。任何还未暂存的仍然保持已修改状态，可以在下次提交时纳入版本管理。每一次运行提交操作，都是对你项目做一次快照，以后可以回到这个状态，或者进行比较</p><p> </p><h3>跳过使用暂存区域</h3><p> </p><p>尽管使用暂存区域的方式可以精心准备要提交的细节，但有时候这么做略显繁琐。 Git 提供了一个跳过使用暂存区域的方式， 只要在提交的时候，给 <code>git commit</code> 加上 <code>-a</code> 选项，Git 就会自动把所有已经跟踪过的文件暂存起来一并提交，从而跳过 <code>git add</code> 步骤：</p><p> </p><pre><code class=\"language-Shell\">$ git status\nOn branch master\nChanges not staged for commit:\n  (use \"git add &lt;file&gt;...\" to update what will be committed)\n  (use \"git checkout -- &lt;file&gt;...\" to discard changes in working directory)\n\n    modified:   CONTRIBUTING.md\n\nno changes added to commit (use \"git add\" and/or \"git commit -a\")\n$ git commit -a -m \'added new benchmarks\'\n[master 83e38c7] added new benchmarks\n 1 file changed, 5 insertions(+), 0 deletions(-)\n</code></pre><p> </p><h3>移除文件</h3><p> </p><p>要从 Git 中移除某个文件，就必须要从已跟踪文件清单中移除（确切地说，是从暂存区域移除），然后提交。可以用 <code>git rm</code> 命令完成此工作，并连带从工作目录中删除指定的文件，这样以后就不会出现在未跟踪文件清单中</p><p> </p><p>如果只是简单地从工作目录中手工删除文件，运行 <code>git status</code> 时就会在 “Changes not staged for commit”部分（也就是未暂存清单）看到：</p><p> </p><pre><code class=\"language-Shell\">PS C:\\Users\\LIWEI\\Desktop\\Trash\\demo&gt; rm 123.txt\nPS C:\\Users\\LIWEI\\Desktop\\Trash\\demo&gt; git status\nOn branch master\n\nNo commits yet\n\nChanges to be committed:\n  (use \"git rm --cached &lt;file&gt;...\" to unstage)\n        new file:   123.txt\n\nChanges not staged for commit:\n  (use \"git add/rm &lt;file&gt;...\" to update what will be committed)\n  (use \"git restore &lt;file&gt;...\" to discard changes in working directory)\n        deleted:    123.txt\n</code></pre><p> </p><p>然后再运行 <code>git rm</code> 记录此次移除文件的操作：</p><p> </p><pre><code class=\"language-Shell\">PS C:\\Users\\LIWEI\\Desktop\\Trash\\demo&gt; git rm 123.txt\nrm \'123.txt\'\nPS C:\\Users\\LIWEI\\Desktop\\Trash\\demo&gt; git status\nOn branch master\n\nNo commits yet\n\nnothing to commit (create/copy files and use \"git add\" to track)\n</code></pre><p> </p><p>下一次提交时，该文件就不再纳入版本管理了。如果删除之前修改过并且已经放到暂存区域的话，则必须要使用强制删除选项 <code>-f</code>。这是一种安全特性，用于防止误删还没有添加到快照的数据，这样的数据不能被 Git 恢复</p><p> </p><p>另外一种情况是，我们想把文件从 Git 仓库删除（即从暂存区域移除），但仍然希望保留在当前工作目录中。换句话说，你想让文件保留在磁盘，但并不想 Git 继续跟踪。当你忘记添加 <code>.gitignore</code> 文件，不小心把一个很大的日志目录或一堆 <code>.a</code> 这样的编译生成文件添加到暂存区时，这一做法尤其有用。为达到这一目的，使用 <code>--cached</code> 选项：</p><p> </p><pre><code class=\"language-Shell\">$ git rm --cached README\n</code></pre><p> </p><p><code>git rm</code> 命令后面可以列出文件或者目录的名字，也可以使用 <code>glob</code> 模式。 比方说：</p><p> </p><pre><code class=\"language-Shell\">$ git rm log/\\*.log\n</code></pre><p> </p><p>注意到星号 <code>*</code> 之前的反斜杠 <code>\\</code>， 因为 Git 有它自己的文件模式扩展匹配方式，所以我们不用 shell 来帮忙展开。 此命令删除 <code>log/</code> 目录下扩展名为 <code>.log</code> 的所有文件。 类似的比如：</p><p> </p><pre><code class=\"language-Shell\">$ git rm \\*~\n</code></pre><p> </p><p>该命令为删除以 <code>~</code> 结尾的所有文件。</p><p> </p><h3>移动文件</h3><p> </p><p>不像其它的 VCS 系统，Git 并不显式跟踪文件移动操作。 如果在 Git 中重命名了某个文件，仓库中存储的元数据并不会体现出这是一次改名操作。 不过 Git 非常聪明，它会推断出究竟发生了什么，至于具体是如何做到的，我们稍后再谈。</p><p> </p><p>既然如此，当你看到 Git 的 <code>mv</code> 命令时一定会困惑不已。 要在 Git 中对文件改名，可以这么做：</p><p> </p><pre><code class=\"language-Shell\">$ git mv file_from file_to\n</code></pre><p> </p><p>它会恰如预期般正常工作。 实际上，即便此时查看状态信息，也会明白无误地看到关于重命名操作的说明：</p><p> </p><pre><code class=\"language-Shell\">$ git mv README.md README\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    renamed:    README.md -&gt; README\n</code></pre><p> </p><p>其实，运行 <code>git mv</code> 就相当于运行了下面三条命令：</p><p> </p><pre><code class=\"language-Shell\">$ mv README.md README\n$ git rm README.md\n$ git add README\n</code></pre><p> </p><p>如此分开操作，Git 也会意识到这是一次改名，所以不管何种方式结果都一样。 两者唯一的区别是，<code>mv</code> 是一条命令而另一种方式需要三条命令，直接用 <code>git mv</code> 轻便得多。 不过有时候用其他工具批处理改名的话，要记得在提交前删除老的文件名，再添加新的文件名</p><p> </p><h2>查看提交历史</h2><p> </p><p>在提交了若干更新，又或者克隆了某个项目之后，你也许想回顾下提交历史。 完成这个任务最简单而又有效的工具是 <code>git log</code> 命令</p><p> </p><p>接下来的例子会用我专门用于演示的 simplegit 项目， 运行下面的命令获取该项目源代码：</p><p> </p><pre><code class=\"language-Shell\">git clone https://github.com/schacon/simplegit-progit\n</code></pre><p> </p><p>然后在此项目中运行 git log，应该会看到下面的输出：</p><p> </p><pre><code class=\"language-Shell\">$ git log\ncommit ca82a6dff817ec66f44342007202690a93763949\nAuthor: Scott Chacon &lt;schacon@gee-mail.com&gt;\nDate:   Mon Mar 17 21:52:11 2008 -0700\n\n    changed the version number\n\ncommit 085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7\nAuthor: Scott Chacon &lt;schacon@gee-mail.com&gt;\nDate:   Sat Mar 15 16:40:33 2008 -0700\n\n    removed unnecessary test\n\ncommit a11bef06a3f659402fe7563abf99ad00de2209e6\nAuthor: Scott Chacon &lt;schacon@gee-mail.com&gt;\nDate:   Sat Mar 15 10:31:28 2008 -0700\n\n    first commit\n</code></pre><p> </p><p>默认不用任何参数的话，<code>git log</code> 会按提交时间列出所有的更新，最近的更新排在最上面。 正如你所看到的，这个命令会列出每个提交的 SHA-1 校验和、作者的名字和电子邮件地址、提交时间以及提交说明。</p><p> </p><p><code>git log</code> 有许多选项可以帮助你搜寻你所要找的提交， 接下来我们介绍些最常用的。</p><p> </p><p>一个常用的选项是 <code>-p</code>，用来显示每次提交的内容差异。 你也可以加上 <code>-2</code> 来仅显示最近两次提交：</p><p> </p><pre><code class=\"language-Shell\">$ git log -p -2\ncommit ca82a6dff817ec66f44342007202690a93763949\nAuthor: Scott Chacon &lt;schacon@gee-mail.com&gt;\nDate:   Mon Mar 17 21:52:11 2008 -0700\n\n    changed the version number\n\ndiff --git a/Rakefile b/Rakefile\nindex a874b73..8f94139 100644\n--- a/Rakefile\n+++ b/Rakefile\n@@ -5,7 +5,7 @@ require \'rake/gempackagetask\'\n spec = Gem::Specification.new do |s|\n     s.platform  =   Gem::Platform::RUBY\n     s.name      =   \"simplegit\"\n-    s.version   =   \"0.1.0\"\n+    s.version   =   \"0.1.1\"\n     s.author    =   \"Scott Chacon\"\n     s.email     =   \"schacon@gee-mail.com\"\n     s.summary   =   \"A simple gem for using Git in Ruby code.\"\n\ncommit 085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7\nAuthor: Scott Chacon &lt;schacon@gee-mail.com&gt;\nDate:   Sat Mar 15 16:40:33 2008 -0700\n\n    removed unnecessary test\n\ndiff --git a/lib/simplegit.rb b/lib/simplegit.rb\nindex a0a60ae..47c6340 100644\n--- a/lib/simplegit.rb\n+++ b/lib/simplegit.rb\n@@ -18,8 +18,3 @@ class SimpleGit\n     end\n\n end\n-\n-if $0 == __FILE__\n-  git = SimpleGit.new\n-  puts git.show\n-end\n\\ No newline at end of file\n</code></pre><p> </p><p>该选项除了显示基本信息之外，还附带了每次 commit 的变化。 当进行代码审查，或者快速浏览某个搭档提交的 commit 所带来的变化的时候，这个参数就非常有用了。 你也可以为 <code>git log</code> 附带一系列的总结性选项。 比如说，如果你想看到每次提交的简略的统计信息，你可以使用 <code>--stat</code> 选项：</p><p> </p><pre><code class=\"language-Shell\">$ git log --stat\ncommit ca82a6dff817ec66f44342007202690a93763949\nAuthor: Scott Chacon &lt;schacon@gee-mail.com&gt;\nDate:   Mon Mar 17 21:52:11 2008 -0700\n\n    changed the version number\n\n Rakefile | 2 +-\n 1 file changed, 1 insertion(+), 1 deletion(-)\n\ncommit 085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7\nAuthor: Scott Chacon &lt;schacon@gee-mail.com&gt;\nDate:   Sat Mar 15 16:40:33 2008 -0700\n\n    removed unnecessary test\n\n lib/simplegit.rb | 5 -----\n 1 file changed, 5 deletions(-)\n\ncommit a11bef06a3f659402fe7563abf99ad00de2209e6\nAuthor: Scott Chacon &lt;schacon@gee-mail.com&gt;\nDate:   Sat Mar 15 10:31:28 2008 -0700\n\n    first commit\n\n README           |  6 ++++++\n Rakefile         | 23 +++++++++++++++++++++++\n lib/simplegit.rb | 25 +++++++++++++++++++++++++\n 3 files changed, 54 insertions(+)\n</code></pre><p> </p><p>正如你所看到的，<code>--stat</code> 选项在每次提交的下面列出额所有被修改过的文件、有多少文件被修改了以及被修改过的文件的哪些行被移除或是添加了。 在每次提交的最后还有一个总结</p><p> </p><p>另外一个常用的选项是 <code>--pretty</code>。 这个选项可以指定使用不同于默认格式的方式展示提交历史。 这个选项有一些内建的子选项供你使用。 比如用 <code>oneline</code> 将每个提交放在一行显示，查看的提交数很大时非常有用。 另外还有 <code>short</code>，<code>full</code> 和 <code>fuller</code> 可以用，展示的信息或多或少有些不同，请自己动手实践一下看看效果如何</p><p> </p><pre><code class=\"language-Shell\">$ git log --pretty=oneline\nca82a6dff817ec66f44342007202690a93763949 changed the version number\n085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7 removed unnecessary test\na11bef06a3f659402fe7563abf99ad00de2209e6 first commit\n</code></pre><p> </p><p>但最有意思的是 format，可以定制要显示的记录格式。 这样的输出对后期提取分析格外有用 — 因为你知道输出的格式不会随着 Git 的更新而发生改变：</p><p> </p><pre><code class=\"language-Shell\">$ git log --pretty=format:\"%h - %an, %ar : %s\"\nca82a6d - Scott Chacon, 6 years ago : changed the version number\n085bb3b - Scott Chacon, 6 years ago : removed unnecessary test\na11bef0 - Scott Chacon, 6 years ago : first commit\n</code></pre><p> </p><p><code>[git log --pretty=format](https://www.progit.cn/#pretty_format)</code><a target=\"_blank\" rel=\"noopener noreferrer nofollow\" href=\"https://www.progit.cn/#pretty_format\"> 常用的选项</a> 列出了常用的格式占位符写法及其代表的意义:</p><p> </p><p>|选项|说明| |-|-| |<code>%H</code>|提交对象（commit）的完整哈希字串| |<code>%h</code>|提交对象的简短哈希字串| |<code>%T</code>|树对象（tree）的完整哈希字串| |<code>%t</code>|树对象的简短哈希字串| |<code>%P</code>|父对象（parent）的完整哈希字串| |<code>%p</code>|父对象的简短哈希字串| |<code>%an</code>|作者（author）的名字| |<code>%ae</code>|作者的电子邮件地址| |<code>%ad</code>|作者修订日期（可以用 --date= 选项定制格式）| |<code>%ar</code>|作者修订日期，按多久以前的方式显示| |<code>%cn</code>|提交者（committer）的名字| |<code>%ce</code>|提交者的电子邮件地址| |<code>%cd</code>|提交日期| |<code>%cr</code>|提交日期，按多久以前的方式显示| |<code>%s</code>|提交说明|</p><p> </p><p>你一定奇怪 <em>作者</em> 和 <em>提交者</em> 之间究竟有何差别， 其实作者指的是实际作出修改的人，提交者指的是最后将此工作成果提交到仓库的人。 所以，当你为某个项目发布补丁，然后某个核心成员将你的补丁并入项目时，你就是作者，而那个核心成员就是提交者。 我们会在 分布式 Git 再详细介绍两者之间的细微差别。</p><p> </p><p>当 oneline 或 format 与另一个 <code>log</code> 选项 <code>--graph</code> 结合使用时尤其有用。 这个选项添加了一些ASCII字符串来形象地展示你的分支、合并历史：</p><p> </p><pre><code class=\"language-Shell\">$ git log --pretty=format:\"%h %s\" --graph\n* 2d3acf9 ignore errors from SIGCHLD on trap\n*  5e3ee11 Merge branch \'master\' of git://github.com/dustin/grit\n|\\\n| * 420eac9 Added a method for getting the current branch.\n* | 30e367c timeout code and tests\n* | 5a09431 add timeout protection to grit\n* | e1193f8 support for heads with slashes in them\n|/\n* d6016bc require time for xmlschema\n*  11d191e Merge branch \'defunkt\' into local\n</code></pre><p> </p><p>这种输出类型会在我们下一章学完分支与合并以后变得更加有趣。</p><p> </p><p>以上只是简单介绍了一些 <code>git log</code> 命令支持的选项。 <code>git log</code> 的常用选项 列出了我们目前涉及到的和没涉及到的选项，以及它们是如何影响 log 命令的输出的：</p><p> </p><p>|选项|说明| |-|-| |<code>-p</code>|按补丁格式显示每个更新之间的差异。| |<code>--stat</code>|显示每次更新的文件修改统计信息。| |<code>--shortstat</code>|只显示 --stat 中最后的行数修改添加移除统计。| |<code>--name-only</code>|仅在提交信息后显示已修改的文件清单。| |<code>--name-status</code>|显示新增、修改、删除的文件清单。| |<code>--abbrev-commit</code>|仅显示 SHA-1 的前几个字符，而非所有的 40 个字符。| |<code>--relative-date</code>|使用较短的相对时间显示（比如，“2 weeks ago”）。| |<code>--graph</code>|显示 ASCII 图形表示的分支合并历史。| |<code>--pretty</code>|使用其他格式显示历史提交信息。可用的选项包括 oneline，short，full，fuller 和 format（后跟指定格式）。|</p><p> </p><h3>限制输出长度</h3><p> </p><p>除了定制输出格式的选项之外，<code>git log</code> 还有许多非常实用的限制输出长度的选项，也就是只输出部分提交信息。 之前你已经看到过 <code>-2</code> 了，它只显示最近的两条提交， 实际上，这是 <code>-&lt;n&gt;</code> 选项的写法，其中的 <code>n</code> 可以是任何整数，表示仅显示最近的若干条提交。 不过实践中我们是不太用这个选项的，Git 在输出所有提交时会自动调用分页程序，所以你一次只会看到一页的内容。</p><p> </p><p>另外还有按照时间作限制的选项，比如 <code>--since</code> 和 <code>--until</code> 也很有用。 例如，下面的命令列出所有最近两周内的提交：</p><p> </p><pre><code class=\"language-Shell\">$ git log --since=2.weeks\n</code></pre><p> </p><p>这个命令可以在多种格式下工作，比如说具体的某一天 <code>\"2008-01-15\"</code>，或者是相对地多久以前 <code>\"2 years 1 day 3 minutes ago\"</code>。</p><p> </p><p>还可以给出若干搜索条件，列出符合的提交。 用 <code>--author</code> 选项显示指定作者的提交，用 <code>--grep</code> 选项搜索提交说明中的关键字。 （请注意，如果要得到同时满足这两个选项搜索条件的提交，就必须用 <code>--all-match</code> 选项。否则，满足任意一个条件的提交都会被匹配出来）</p><p> </p><p>另一个非常有用的筛选选项是 <code>-S</code>，可以列出那些添加或移除了某些字符串的提交。 比如说，你想找出添加或移除了某一个特定函数的引用的提交，你可以这样使用：</p><p> </p><pre><code class=\"language-Shell\">$ git log -Sfunction_name\n</code></pre><p> </p><p>最后一个很实用的 <code>git log</code> 选项是路径（path）， 如果只关心某些文件或者目录的历史提交，可以在 git log 选项的最后指定它们的路径。 因为是放在最后位置上的选项，所以用两个短划线（--）隔开之前的选项和后面限定的路径名。</p><p> </p><p>在 限制 <code>git log</code> 输出的选项 中列出了常用的选项</p><p> </p><p>|选项|说明| |-|-| |<code>-(n)</code>|仅显示最近的 n 条提交| |<code>--since</code>, <code>--after</code>|仅显示指定时间之后的提交。| |<code>--until</code>, <code>--before</code>|仅显示指定时间之前的提交。| |<code>--author</code>|仅显示指定作者相关的提交。| |<code>--committer</code>|仅显示指定提交者相关的提交。| |<code>--grep</code>|仅显示含指定关键字的提交| |<code>-S</code>|仅显示添加或移除了某个关键字的提交|</p><p> </p><p>来看一个实际的例子，如果要查看 Git 仓库中，2008 年 10 月期间，Junio Hamano 提交的但未合并的测试文件，可以用下面的查询命令：</p><p> </p><pre><code class=\"language-Shell\">$ git log --pretty=\"%h - %s\" --author=gitster --since=\"2008-10-01\" \\\n   --before=\"2008-11-01\" --no-merges -- t/\n5610e3b - Fix testcase failure when extended attributes are in use\nacd3b9e - Enhance hold_lock_file_for_{update,append}() API\nf563754 - demonstrate breakage of detached checkout with symbolic link HEAD\nd1a43f2 - reset --hard/read-tree --reset -u: remove unmerged new paths\n51a94af - Fix \"checkout --track -b newbranch\" on detached HEAD\nb0ad11e - pull: allow \"git pull origin $something:$current_branch\" into an unborn branch\n</code></pre><p> </p><p>在近 40000 条提交中，上面的输出仅列出了符合条件的 6 条记录</p><p> </p><h2>撤销操作</h2><p> </p><p>在任何一个阶段，你都可能想要撤销某些操作。这里，我们将会学习几个撤销你所做修改的基本工具。注意，有些撤销操作是不逆的。这是在使用 Git 的过程中，会因为操作失误而导致之前的工作丢失的少有几个地方之一</p><p> </p><p>有时候我们提交完了才发现漏掉了几个文件没有添加，或者提交信息写错了。此时，可以运行带有 <code>--amend</code> 选项的提交命令尝试重新提交：</p><p> </p><pre><code class=\"language-Shell\">$ git commit --amend\n</code></pre><p> </p><p>这个命令会将暂存区中的文件提交。如果自上次提交依赖你还未做任何修改（例如，在上次提交后马上执行了此命令），那么快照会保持不变，而你所修改的只是提交信息</p><p> </p><p>文本编辑器启动后，可以看到之前的提交信息。 编辑后保存会覆盖原来的提交信息。</p><p> </p><p>例如，你提交后发现忘记了暂存某些需要的修改，可以像下面这样操作：</p><p> </p><pre><code class=\"language-Shell\">$ git commit -m \'initial commit\'\n$ git add forgotten_file\n$ git commit --amend\n</code></pre><p> </p><p>最终你只会有一个提交 - 第二次提交将代替第一次提交的结果</p><p> </p><h3>取消暂存文件</h3><p> </p><p>接下来的两个小节演示如何操作暂存区域与工作目录中已修改的文件。 这些命令在修改文件状态的同时，也会提示如何撤消操作。 例如，你已经修改了两个文件并且想要将它们作为两次独立的修改提交，但是却意外地输入了 <code>git add *</code> 暂存了它们两个。 如何只取消暂存两个中的一个呢？ <code>git status</code> 命令提示了你：</p><p> </p><pre><code class=\"language-Shell\">$ git add *\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    renamed:    README.md -&gt; README\n    modified:   CONTRIBUTING.md\n</code></pre><p> </p><p>在 “Changes to be committed” 文字正下方，提示使用 <code>git reset HEAD &lt;file&gt;...</code> 来取消暂存。 所以，我们可以这样来取消暂存 <code>CONTRIBUTING.md</code> 文件：</p><p> </p><pre><code class=\"language-Shell\">$ git reset HEAD CONTRIBUTING.md\nUnstaged changes after reset:\nM    CONTRIBUTING.md\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    renamed:    README.md -&gt; README\n\nChanges not staged for commit:\n  (use \"git add &lt;file&gt;...\" to update what will be committed)\n  (use \"git checkout -- &lt;file&gt;...\" to discard changes in working directory)\n\n    modified:   CONTRIBUTING.md\n</code></pre><p> </p><p>这个命令有点儿奇怪，但是起作用了。 <code>CONTRIBUTING.md</code> 文件已经是修改未暂存的状态了</p><p> </p><p>到目前为止这个神奇的调用就是你需要对 <code>git reset</code> 命令了解的全部。我们将会在 重置揭密 中了解 <code>reset</code> 的更多细节以及如何掌握它做一些真正有趣的事。</p><p> </p><h3>撤消对文件的修改</h3><p> </p><p>如果你并不想保留对 <code>CONTRIBUTING.md</code> 文件的修改怎么办？你该如何方便地撤销修改-将它还原成上次提交的样子（或者刚克隆完地样子，或者刚把它放入工作目录时地样子）？幸运的是，<code>git status</code> 也告诉了你应该怎么做。最后一个例子中，未暂存区域是这样的：</p><p> </p><pre><code class=\"language-Shell\">Changes not staged for commit:\n  (use \"git add &lt;file&gt;...\" to update what will be committed)\n  (use \"git checkout -- &lt;file&gt;...\" to discard changes in working directory)\n\n    modified:   CONTRIBUTING.md\n</code></pre><p> </p><p>它非常清楚地告诉了你如何撤消之前所做的修改。 让我们来按照提示执行：</p><p> </p><pre><code class=\"language-Shell\">$ git checkout -- CONTRIBUTING.md\n$ git status\nOn branch master\nChanges to be committed:\n  (use \"git reset HEAD &lt;file&gt;...\" to unstage)\n\n    renamed:    README.md -&gt; README\n</code></pre><p> </p><p>可以看到那些修改已经被撤消了</p>','','2023-10-28 02:52:50',1,1,1,1,1),(4,'这是 id 为3的标题','<h1>这是一个标题</h1><pre><code class=\"language-java\">public class A{}</code></pre><p>下面是无序列表</p><ul><li><p>这是一个无序列表</p></li></ul><p>下面是一个代办事项</p><ul data-type=\"taskList\"><li data-checked=\"false\" data-type=\"taskItem\"><label><input type=\"checkbox\"><span></span></label><div><p>写java</p></div></li></ul><p><code>你觉得这个编辑器怎么样呢</code></p><p><strong>我觉得很不错呀</strong></p><p></p>','','2023-10-31 15:17:08',1,1,1,1,1),(5,'这是 id 为4','<h1>这是一个标题一</h1><h2>这是一个标题二</h2><h3>这是一个标题三</h3><pre><code>这是一个代码块</code></pre><p><strong>这是一个加粗</strong></p><p><em>这是一个斜体</em></p><p><em><s>这是一个删除线</s></em></p>','','2023-11-01 14:22:45',1,1,1,1,1),(6,'这是 id 为5','这是一个博客内容','asdf','2023-11-01 14:29:34',1,1,1,1,1),(7,'这是 id 为6','<p>这是一个博客内容123123</p>','123asdf','2023-11-01 14:29:57',1,1,1,1,1),(8,'这是 id 为7','<p>这是一个博客内容1231231231t</p>','112312231233as123123df','2023-11-01 14:31:07',1,1,1,1,1),(9,'这是 id 为8','这是一个博客内容','qwe999mm','2023-11-01 15:14:54',1,1,NULL,NULL,NULL),(10,'这是 id 为9','<div data-youtube-video=\"\"><iframe width=\"640\" height=\"480\" allowfullscreen=\"true\" autoplay=\"false\" disablekbcontrols=\"false\" enableiframeapi=\"false\" endtime=\"0\" ivloadpolicy=\"0\" loop=\"false\" modestbranding=\"false\" origin=\"\" playlist=\"\" src=\"https://www.youtube.com/embed/Ct36mme8eHQ?controls=0\" start=\"0\"></iframe></div>','','2023-11-01 16:01:32',1,1,NULL,NULL,NULL),(12,'这是 id 为11','<p>这不是一个</p>','这是一个摘要','2023-11-02 13:06:04',1,1,NULL,NULL,NULL),(13,'这是 id 为12','<p><mark>这是一个代码</mark></p>','','2023-11-06 16:54:02',1,1,NULL,NULL,NULL),(14,'这是 id 为13','<pre><code>阿师傅的师傅\nasdfafasdf</code></pre><p>阿斯顿发送到发asdfasfaf</p><p></p><p>asdf</p><p>af</p><p></p>','','2023-11-10 16:13:26',1,1,NULL,NULL,NULL);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_pk` (`name`)
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
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_pk2` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'3499508634@qq.com','A better tomorrow','$2a$12$DgkBOMoKJYu0w.jNF6w80.1BKsZWTgSgAYIh6x1JiVimRN3xdXzQi','没什么大不了','2023-10-30 21:44:32');
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

-- Dump completed on 2023-11-16 21:26:04
