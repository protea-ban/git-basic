-- ----------------------------
-- Table structure for `tags`
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `userId` int(11) NOT NULL,
  `movieId` int(11) NOT NULL,
  `tag` varchar(500) NOT NULL,
  `timestamp` varchar(50) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `ratings`
-- ----------------------------
DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (
  `userId` int(11) NOT NULL,
  `movieId` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `timestamp` varchar(50) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `movies`
-- ----------------------------
DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies` (
  `movieId` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `timestamp` varchar(500) NOT NULL,
  PRIMARY KEY (`movieId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `links`
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `movieId` int(11) NOT NULL,
  `imdbId` int(11) NOT NULL,
  `tmdbId` int(11) NOT NULL,
  PRIMARY KEY (`movieId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 为需要查询的数据创建对应的数据库索引
CREATE INDEX userId ON tags (userId);
CREATE INDEX userId ON ratings (userId);
CREATE INDEX movieId ON movies (movieId);
CREATE INDEX movieId ON links (movieId);
-- 一共有多少不同的用户
SELECT
	COUNT(DISTINCT ratings.userId)
FROM ratings;
-- 一共有多少不同的电影
SELECT
	COUNT(DISTINCT t1.movieId)
FROM movies t1
-- 一共有多少不同的电影种类
SELECT
	COUNT(DISTINCT t1.tag)
FROM tags t1
-- 一共有多少电影没有外部链接
SELECT
	t1.movieId
FROM links t1
WHERE t1.imdbId IS NULL
AND t1.tmdbId IS NULL
-- 2018年一共有多少人进行过电影评分
SELECT
	COUNT(DISTINCT t1.userId)
FROM ratings t1
WHERE t1.time_year = 2018
-- 2018年评分5分以上的电影及其对应的标签
SELECT
	t1.title
	,GROUP_CONCAT(t2.tag)
FROM movies t1
JOIN tags t2
ON t1.movieId = t2.movieId
JOIN ratings t3
ON t1.movieId = t3.movieId
WHERE t3.time_year = 2018
AND t3.rating >= 5
GROUP BY t1.title