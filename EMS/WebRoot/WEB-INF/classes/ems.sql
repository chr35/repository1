/*
Navicat MySQL Data Transfer

Source Server         : aaa
Source Server Version : 50613
Source Host           : localhost:3307
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50613
File Encoding         : 65001

Date: 2017-06-13 02:07:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for classcourse
-- ----------------------------
DROP TABLE IF EXISTS `classcourse`;
CREATE TABLE `classcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classid` int(11) NOT NULL,
  `teacherid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `RefClassInfo6` (`classid`),
  KEY `RefTeacher7` (`teacherid`),
  KEY `Refcourse8` (`courseid`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classcourse
-- ----------------------------
INSERT INTO `classcourse` VALUES ('1', '1', '1', '1');
INSERT INTO `classcourse` VALUES ('19', '1', '5', '3');
INSERT INTO `classcourse` VALUES ('18', '1', '4', '2');
INSERT INTO `classcourse` VALUES ('20', '1', '2', '4');
INSERT INTO `classcourse` VALUES ('21', '1', '0', '6');

-- ----------------------------
-- Table structure for classinfo
-- ----------------------------
DROP TABLE IF EXISTS `classinfo`;
CREATE TABLE `classinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classid` varchar(20) NOT NULL,
  `classname` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classinfo
-- ----------------------------
INSERT INTO `classinfo` VALUES ('1', '10011301', '计科1301');
INSERT INTO `classinfo` VALUES ('2', '13001302', '计科1302');
INSERT INTO `classinfo` VALUES ('3', '13001303', '计科1303');
INSERT INTO `classinfo` VALUES ('4', '10011304', '计科1304');
INSERT INTO `classinfo` VALUES ('5', '13001201', '计科1201');
INSERT INTO `classinfo` VALUES ('6', '13001202', '计科1202');

-- ----------------------------
-- Table structure for classroom
-- ----------------------------
DROP TABLE IF EXISTS `classroom`;
CREATE TABLE `classroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomid` varchar(20) NOT NULL,
  `roomname` varchar(32) NOT NULL,
  `address` varchar(32) NOT NULL,
  `type` varchar(32) DEFAULT NULL,
  `container` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classroom
-- ----------------------------
INSERT INTO `classroom` VALUES ('1', '03201', '#3201', '西校', '通用教室', '200');
INSERT INTO `classroom` VALUES ('2', '06501', '#6622', '东校', '语音教室', '100');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` varchar(32) NOT NULL,
  `coursename` varchar(50) NOT NULL,
  `type` varchar(32) DEFAULT NULL,
  `credit` float(8,1) DEFAULT NULL,
  `creditType` varchar(32) DEFAULT NULL,
  `courseType` varchar(32) DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '1000', '程序设计基础', null, '1.5', null, '科学与技术', '');
INSERT INTO `course` VALUES ('2', '1001', '计算机组成原理', null, '1.0', null, '科学与技术', '');
INSERT INTO `course` VALUES ('3', '1002', '大学物理', null, '3.0', null, '全校性选课', '');
INSERT INTO `course` VALUES ('4', '1003', '体育', null, '1.0', null, '全校性选课', '');
INSERT INTO `course` VALUES ('5', '1004', '面向对象的程序设计', null, '1.0', null, '科学与技术', '');
INSERT INTO `course` VALUES ('6', '1005', '软件工程（一）', null, '1.5', null, '科学与技术', '');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ccid` int(11) NOT NULL,
  `studentid` int(11) NOT NULL,
  `termgrade` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `RefClassCourse11` (`ccid`),
  KEY `RefStudent12` (`studentid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('2', '1', '1', '90');
INSERT INTO `grade` VALUES ('4', '19', '1', '100');
INSERT INTO `grade` VALUES ('5', '19', '3', '100');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classid` int(11) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `name` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `HJSZD` varchar(50) DEFAULT NULL,
  `sex` varchar(4) NOT NULL,
  `birth` varchar(32) DEFAULT NULL,
  `RXSJ` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_unique` (`userid`) USING HASH,
  KEY `RefClassInfo5` (`classid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '1', '13110581009', '小崔', '123456', '河北', '1', '1994-05-17', '2013-09');
INSERT INTO `student` VALUES ('2', '6', '13110581007', '小刘', '000000', '淄博', '1', '1994-01-11', '2017-6');
INSERT INTO `student` VALUES ('3', '1', 'stu001', 'askfd', '0000', '淄博', '1', '1994-05-17', '2017-6');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `sex` varchar(4) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '10011', '张三', '123456', '1', '1');
INSERT INTO `teacher` VALUES ('2', '10022', '李四', '123456', '1', '2');
INSERT INTO `teacher` VALUES ('3', '10033', '王丽', '123456', '2', '2');
INSERT INTO `teacher` VALUES ('4', '10044', '孙尚香', '123456', '2', '2');
INSERT INTO `teacher` VALUES ('5', '10000', '曹操', '1234', '1', '1');
INSERT INTO `teacher` VALUES ('7', 'admin', 'admin', '0000', '1', '2');
INSERT INTO `teacher` VALUES ('9', '11012', '张飞', '123456', '1', '1');
INSERT INTO `teacher` VALUES ('10', '11012', '张飞', '123456', '1', '1');
INSERT INTO `teacher` VALUES ('11', '11023', '张飞', '123456', '2', '2');
INSERT INTO `teacher` VALUES ('12', '22255', '张飞', '123456', '2', '1');
INSERT INTO `teacher` VALUES ('13', '22222', '张飞', '123456', '2', '1');
INSERT INTO `teacher` VALUES ('14', '1111111', '啊啊', '0000', '1', '1');

-- ----------------------------
-- Table structure for teachergrade
-- ----------------------------
DROP TABLE IF EXISTS `teachergrade`;
CREATE TABLE `teachergrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ccid` int(11) DEFAULT NULL,
  `evaluateitem` varchar(8) DEFAULT NULL,
  `evaluategrade` varchar(16) DEFAULT NULL,
  `studentid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teachergrade
-- ----------------------------
INSERT INTO `teachergrade` VALUES ('1', '1', null, '12345', '1');
INSERT INTO `teachergrade` VALUES ('2', '19', null, '11111', '1');
INSERT INTO `teachergrade` VALUES ('3', '19', null, '44444', '1');
INSERT INTO `teachergrade` VALUES ('4', '1', null, '22222', '1');
INSERT INTO `teachergrade` VALUES ('5', '20', null, '12255', '1');

-- ----------------------------
-- Table structure for timenplace
-- ----------------------------
DROP TABLE IF EXISTS `timenplace`;
CREATE TABLE `timenplace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ccid` int(11) NOT NULL,
  `sksj` varchar(10) DEFAULT NULL,
  `roomid` int(11) DEFAULT NULL,
  `skpl` varchar(10) DEFAULT NULL,
  `firstweek` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `RefClassRoom9` (`roomid`),
  KEY `RefClassCourse10` (`ccid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of timenplace
-- ----------------------------
INSERT INTO `timenplace` VALUES ('7', '19', '34', '1', '否', '1-12');
INSERT INTO `timenplace` VALUES ('2', '18', '22', '2', '双周', '1-1');
INSERT INTO `timenplace` VALUES ('4', '1', '15', '1', '否', '1-10');
INSERT INTO `timenplace` VALUES ('6', '20', '41', '2', '否', '2-10');

-- ----------------------------
-- View structure for tgitem
-- ----------------------------
DROP VIEW IF EXISTS `tgitem`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `tgitem` AS SELECT id,ccid,substring(evaluategrade, 1, 1) itemval,1 as item from teachergrade UNION
SELECT id,ccid,substring(evaluategrade, 2, 1) itemval,2 as item from teachergrade UNION
SELECT id,ccid,substring(evaluategrade, 3, 1) itemval,3 as item from teachergrade UNION
SELECT id,ccid,substring(evaluategrade, 4, 1) itemval,4 as item from teachergrade UNION
SELECT id,ccid,substring(evaluategrade, 5, 1) itemval,5 as item from teachergrade ;
