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


