-- check mysql version
SELECT VERSION();

-- delete db
DROP DATABASE IF EXISTS westos;
-- create db
CREATE DATABASE IF NOT EXISTS westos;
-- use db
USE `westos`;

-- should use ``
USE school;
SELECT `age` FROM student;






-- create table
DROP TABLE `student`IF EXISTS student;
CREATE TABLE IF NOT EXISTS `student`(
	`id` INT(4) NOT NULL AUTO_INCREMENT COMMENT 'student id',
	`name` VARCHAR(30) NOT NULL DEFAULT 'Anonymous' COMMENT 'student name',
	`pwd` VARCHAR(20) NOT NULL DEFAULT '000000' COMMENT 'passworc',
	`gender` VARCHAR(7) NOT NULL DEFAULT 'female' COMMENT 'gender',
	`birthday` DATETIME DEFAULT NULL COMMENT 'birthday',
	`address` VARCHAR(100) DEFAULT NULL COMMENT 'home address',
	`email` VARCHAR(500) DEFAULT NULL COMMENT 'email address',
	PRIMARY KEY(`id`)
)ENGINE = INNODB DEFAULT CHARSET=utf8;


-- show create query of db
SHOW CREATE DATABASE school;

-- show create query of table
SHOW CREATE TABLE `student`;

-- describe table structure
DESC student;


-- alter table name
ALTER TABLE teacher RENAME AS teacher1;
-- alter table to add another feature
ALTER TABLE teacher 1 ADD age INT(11);
-- alter constraints of a feature
ALTER TABLE teacher1 MODIFY age VARCHAR(11);
-- rename a feature
ALTER TABLE teacher1 CHANGE age age1 INT(11);



-- delete a feature
ALTER TABLE teacher1 DROP age1;

-- delete a table
DROP TABLE IF EXISTS teacher1;

-- --------------------- foreign key - method 1
-- create table `grade`
CREATE TABLE IF NOT EXISTS `grade` (
	`gradeid` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'grade id',
	`gradename` VARCHAR(50) NOT NULL COMMENT 'grade name',
	PRIMARY KEY (`gradeid`)
)ENGINE=INNODB DEFAULT CHARSET = utf8;


-- student gradeid引用 grade表的 gradeid
-- 定义Foreign Key
-- 给这个FK 添加constraint reference
USE school;
DROP TABLE IF EXISTS `student` ;
CREATE TABLE IF NOT EXISTS `student`(
	`id` INT(4) NOT NULL AUTO_INCREMENT COMMENT 'student id',
	`name` VARCHAR(30) NOT NULL DEFAULT 'Anonymous' COMMENT 'student name',
	`pwd` VARCHAR(20) NOT NULL DEFAULT '000000' COMMENT 'passworc',
	`gender` VARCHAR(7) NOT NULL DEFAULT 'female' COMMENT 'gender',
	`birthday` DATETIME DEFAULT NULL COMMENT 'birthday',
	`address` VARCHAR(100) DEFAULT NULL COMMENT 'home address',
	`email` VARCHAR(500) DEFAULT NULL COMMENT 'email address',
	`gradeid` INT(10) NOT NULL COMMENT 'student grade',
	PRIMARY KEY(`id`),
	KEY `FK_gradeid` (`gradeid`),
	CONSTRAINT `FK_gradeid` FOREIGN KEY (`gradeid`) REFERENCES `grade` (`gradeid`)
)ENGINE = INNODB DEFAULT CHARSET=utf8;




-- --------------------- foreign key - method 2
-- create table `grade`
USE school;
DROP TABLE IF EXISTS `grade` ;
CREATE TABLE IF NOT EXISTS `grade` (
	`gradeid` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'grade id',
	`gradename` VARCHAR(50) NOT NULL COMMENT 'grade name',
	PRIMARY KEY (`gradeid`)
)ENGINE=INNODB DEFAULT CHARSET = utf8;

-- create table `student` without FK
DROP TABLE IF EXISTS `student` ;
CREATE TABLE IF NOT EXISTS `student`(
	`id` INT(4) NOT NULL AUTO_INCREMENT COMMENT 'student id',
	`name` VARCHAR(30) NOT NULL DEFAULT 'Anonymous' COMMENT 'student name',
	`pwd` VARCHAR(20) NOT NULL DEFAULT '000000' COMMENT 'passworc',
	`gender` VARCHAR(7) NOT NULL DEFAULT 'female' COMMENT 'gender',
	`birthday` DATETIME DEFAULT NULL COMMENT 'birthday',
	`address` VARCHAR(100) DEFAULT NULL COMMENT 'home address',
	`email` VARCHAR(500) DEFAULT NULL COMMENT 'email address',
	`gradeid` INT(10) NOT NULL COMMENT 'student grade',
	PRIMARY KEY(`id`)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

-- add constraint FK
ALTER TABLE `student` ADD CONSTRAINT `FK_gradeid` FOREIGN KEY (`gradeid`) REFERENCES `grade` (`gradeid`);




-- ---------------DML-insert
-- insert into 表名([col1,col2,col3]) values('value1', 'value2', 'value3')
INSERT INTO `grade` (`gradename`) VALUES ('大四');
-- 可以省略primary key（因为auto-increment）
INSERT INTO `grade` VALUES ('大三'); -- failed

-- 插入多行
INSERT INTO `grade` (`gradename`) VALUES ('大一'),('大二');

-- 插入一行，多列
INSERT INTO `student` (`name`,`gradeid`) VALUES ('张三', '1');

-- 插入多行，多列
INSERT INTO `student` (`name`,`gradeid`,`gender`) VALUES ('李四', '1','male'), ('王五', '2','male');

-- value一一对应，可以省略column name
INSERT INTO `student` VALUES (4,'李四四','123456', 'male','2020-01-01','beijing','ee@gmail.com','2');



-- ---------------DML-update
-- 根据条件修改行
UPDATE `student` SET `birthday`='2000-01-01' WHERE id = 1;

-- 不指定条件，会改动所有行
UPDATE `student` SET `gender`='female';

-- 修改多个属性
UPDATE `student` SET `birthday`='2000-01-01', `email` = 'ggg@gmail.com' WHERE id = 1;


-- ---------------DML-delete
-- delete from 表名 [where 条件]

-- 这样会全删。不要这样做
DELETE FROM `student`

-- 删除指定数据
DELETE FROM `student` WHERE id=1;

-- ---------------DML-truncate
TRUNCATE `student`;

-- delete 与 truncate区别
CREATE TABLE `test`(
	`id` INT(4) NOT NULL AUTO_INCREMENT,
	`col1` VARCHAR(20) NOT NULL,
	PRIMARY KEY (`id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO `test`(`col1`) VALUES('1'),('2'),('3');
DELETE FROM `test`;
INSERT INTO `test`(`col1`) VALUES('1'),('2'),('3');

TRUNCATE TABLE `test`;
INSERT INTO `test`(`col1`) VALUES('1'),('2'),('3');


 

