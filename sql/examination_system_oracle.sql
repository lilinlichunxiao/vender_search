/*
Navicat MySQL Data Transfer

Source Server         : oracle
Source Server Version : 11g
Source Host           : localhost:1521
Source Database       : xe

*/

drop table "college";
drop table "course";
drop table "role";
drop table "selectedcourse";
drop table "student";
drop table "teacher";
drop table "userlogin";

-- ----------------------------
-- Table structure for college
-- ----------------------------
CREATE TABLE college (
  collegeID NUMBER(11) NOT NULL PRIMARY KEY,
  collegeName VARCHAR2(200) NOT NULL
);

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO college VALUES ('1', '计算机系');
INSERT INTO college VALUES ('2', '设计系');
INSERT INTO college VALUES ('3', '财经系');

-- ----------------------------
-- Table structure for course
-- ----------------------------
CREATE TABLE course (
  courseID NUMBER(11) NOT NULL PRIMARY KEY,
  courseName VARCHAR2(200) NOT NULL,
  teacherID NUMBER(11) NOT NULL,
  courseTime VARCHAR2(200) DEFAULT NULL ,
  classRoom VARCHAR2(200) DEFAULT NULL,
  courseWeek NUMBER(38) DEFAULT NULL,
  courseType VARCHAR2(20) DEFAULT NULL ,
  collegeID NUMBER(11) NOT NULL  ,
  score NUMBER(11) NOT NULL 
) ;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO course VALUES ('1', 'C语言程序设计', '1001', '周二', '科401', '18', '必修课', '1', '3');
INSERT INTO course VALUES ('2', 'Python爬虫技巧', '1001', '周四', 'X402', '18', '必修课', '1', '3');
INSERT INTO course VALUES ('3', '数据结构', '1001', '周四', '科401', '18', '必修课', '1', '2');
INSERT INTO course VALUES ('4', 'Java程序设计', '1002', '周五', '科401', '18', '必修课', '1', '2');
INSERT INTO course VALUES ('5', '英语', '1002', '周四', 'X302', '18', '必修课', '2', '2');
INSERT INTO course VALUES ('6', '服装设计', '1003', '周一', '科401', '18', '选修课', '2', '2');

-- ----------------------------
-- Table structure for role
-- ----------------------------
CREATE TABLE role (
  roleID NUMBER(11) NOT NULL PRIMARY KEY,
  roleName VARCHAR2(20) NOT NULL,
  permissions VARCHAR2(255) DEFAULT NULL
) ;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO role VALUES ('0', 'admin', null);
INSERT INTO role VALUES ('1', 'teacher', null);
INSERT INTO role VALUES ('2', 'student', null);

-- ----------------------------
-- Table structure for selectedcourse
-- ----------------------------
CREATE TABLE selectedcourse(
  courseID NUMBER(11) NOT NULL,
  studentID NUMBER(11) NOT NULL,
  mark NUMBER(11) DEFAULT NULL
);

-- ----------------------------
-- Records of selectedcourse
-- ----------------------------
INSERT INTO selectedcourse VALUES ('2', '10001', '12');
INSERT INTO selectedcourse VALUES ('1', '10001', '95');
INSERT INTO selectedcourse VALUES ('1', '10002', '66');
INSERT INTO selectedcourse VALUES ('1', '10003', null);
INSERT INTO selectedcourse VALUES ('2', '10003', '99');
INSERT INTO selectedcourse VALUES ('5', '10001', null);
INSERT INTO selectedcourse VALUES ('3', '10001', null);

-- ----------------------------
-- Table structure for student
-- ----------------------------
CREATE TABLE student (
  userID NUMBER(11) NOT NULL,
  userName VARCHAR2(200) NOT NULL,
  sex VARCHAR2(20) DEFAULT NULL,
  birthYear date DEFAULT NULL,
  grade date DEFAULT NULL,
  collegeID NUMBER(11) NOT NULL,
  CONSTRAINT userID_PK PRIMARY KEY (userID)
);

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO student VALUES ('10001', '小黄', '男', sysdate, sysdate, '1');
INSERT INTO student VALUES ('10002', '小米', '女', to_date('1995-09-14','yyyy-mm-dd'), to_date('2015-09-02','yyyy-mm-dd'), '3');
INSERT INTO student VALUES ('10003', '小陈', '女', to_date('1996-09-02','yyyy-mm-dd'), to_date('2015-09-02','yyyy-mm-dd'), '2');
INSERT INTO student VALUES ('10004', '小华', '男', to_date('1996-09-02','yyyy-mm-dd'), to_date('2015-09-02','yyyy-mm-dd'), '2');
INSERT INTO student VALUES ('10005', '小左', '女', to_date('1996-09-02','yyyy-mm-dd'), to_date('2015-09-02','yyyy-mm-dd'), '2');
INSERT INTO student VALUES ('10006', '小拉', '女', to_date('1996-09-02','yyyy-mm-dd'), to_date('2015-09-02','yyyy-mm-dd'), '1');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
CREATE TABLE teacher (
  userID NUMBER(11) NOT NULL,
  userName VARCHAR2(200) NOT NULL,
  sex VARCHAR2(20) DEFAULT NULL,
  birthYear date NOT NULL,
  degree VARCHAR2(20) DEFAULT NULL,
  title VARCHAR2(255) DEFAULT NULL,
  grade date DEFAULT NULL,
  collegeID NUMBER(11) NOT NULL,
  CONSTRAINT teacher_userID_PK PRIMARY KEY (userID)
) ;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO teacher VALUES ('1001', '刘老师', '女', to_date('1990-03-08','yyyy-mm-dd'), '硕士', '副教授', to_date('2015-09-02','yyyy-mm-dd'), '2');
INSERT INTO teacher VALUES ('1002', '张老师', '男', to_date('1996-09-02','yyyy-mm-dd'), '本科', '普通教师', to_date('2015-09-02','yyyy-mm-dd'), '1');
INSERT INTO teacher VALUES ('1003', '软老师', '男', to_date('1996-09-02','yyyy-mm-dd'), '硕士', '助教', to_date('2017-07-07','yyyy-mm-dd'), '1');

-- ----------------------------
-- Table structure for userlogin
-- ----------------------------
CREATE TABLE userlogin(
  userID NUMBER(11) NOT NULL PRIMARY KEY,
  userName VARCHAR2(200) NOT NULL,
  password VARCHAR2(200) NOT NULL,
  role NUMBER(11) NOT NULL
);

-- ----------------------------
-- Records of userlogin
-- ----------------------------
INSERT INTO userlogin VALUES ('1', 'admin', '123', '0');
INSERT INTO userlogin VALUES ('8', '10001', '123', '2');
INSERT INTO userlogin VALUES ('9', '10002', '123', '2');
INSERT INTO userlogin VALUES ('10', '10003', '123', '2');
INSERT INTO userlogin VALUES ('11', '10005', '123', '2');
INSERT INTO userlogin VALUES ('12', '10004', '123', '2');
INSERT INTO userlogin VALUES ('13', '10006', '123', '2');
INSERT INTO userlogin VALUES ('14', '1001', '123', '1');
INSERT INTO userlogin VALUES ('15', '1002', '123', '1');
INSERT INTO userlogin VALUES ('16', '1003', '123', '1');
SET FOREIGN_KEY_CHECKS=1;
