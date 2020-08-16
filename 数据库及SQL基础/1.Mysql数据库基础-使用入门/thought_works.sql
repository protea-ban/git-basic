CREATE DATABASE /*!32312 IF NOT EXISTS*/`student_examination_sys` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `student_examination_sys`;

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` varchar(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`id`) REFERENCES `score` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `subject`
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` varchar(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `teacher` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`id`) REFERENCES `score` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `score`
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `id` varchar(11) NOT NULL,
  `student_id` varchar(11) NOT NULL,
  `subject_id` varchar(50) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `score_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
  CONSTRAINT `score_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------

INSERT INTO `student` VALUES ('001','张三','18','男');
INSERT INTO `student` VALUES ('002','李四','20','女');

-- ----------------------------
-- Records of subject
-- ----------------------------

INSERT INTO `subject` VALUES ('1001','语文','王老师','本次考试比较简单');
INSERT INTO `subject` VALUES ('1002','数学','刘老师','本次考试比较难');

-- ----------------------------
-- Records of score
-- ----------------------------

INSERT INTO `score` VALUES ('1','001','1001','80');
INSERT INTO `score` VALUES ('2','002','1002','60');
INSERT INTO `score` VALUES ('3','001','1001','70');
INSERT INTO `score` VALUES ('4','002','1002','60.5');





