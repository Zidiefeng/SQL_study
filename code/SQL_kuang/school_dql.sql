-- -------------------DQL, easy query

-- all students
SELECT * FROM student;

-- selected columns
SELECT `studentname`,`sex` FROM `student`;

-- us other name, 可以给table， column， 结果 起别名
SELECT `studentname` AS `name`,`sex` AS gender FROM `student` ;

-- 函数 concat 拼接string
SELECT CONCAT('name:',`studentname`) AS new_name FROM student;


-- ------------de-duplicate

SELECT * FROM result ;
SELECT `studentno` FROM result;
SELECT DISTINCT `studentno` FROM result;


-- ------------ other things to select
-- select system version of mysql（函数）
SELECT VERSION();

-- calculator（表达式）
SELECT 100*3-1 AS result; 

-- 查询自增的步长（变量）
SELECT @@auto_increment_increment;


-- grade +1
SELECT `studentno`, `studentresult`+1 AS '提分后' FROM result;

-- ---------------where
USE school;

-- and
SELECT studentno, studentresult 
FROM result
WHERE studentresult>=95 AND studentresult <=100;

-- &&
SELECT studentno, studentresult 
FROM result
WHERE studentresult>=95 && studentresult <=100;

-- between and 
SELECT studentno, studentresult 
FROM result
WHERE studentresult BETWEEN 95 AND 100;

-- !=
SELECT studentno, studentresult 
FROM result
WHERE studentresult !=98;

-- not
SELECT studentno, studentresult 
FROM result
WHERE NOT studentresult =98;

-- ----------------模糊查询like

-- 赵某某
SELECT `studentno`, `studentname`
FROM `student`
WHERE studentname LIKE '赵_';

-- 赵某
SELECT `studentno`, `studentname`
FROM `student`
WHERE studentname LIKE '赵__';

-- 赵开头的
SELECT `studentno`, `studentname`
FROM `student`
WHERE studentname LIKE '赵%';

-- 名字中带有伟的
SELECT `studentno`, `studentname`
FROM `student`
WHERE studentname LIKE '%伟%';

-- ----------------模糊查询in
-- 查询1000，1002，1003的学员
SELECT `studentno`, `studentname`
FROM `student`
WHERE studentno IN (1000,1002,1003);

-- 查询gradeid为1或2的科目
SELECT `subjectname`, `classhour`, gradeid
FROM `subject`
WHERE gradeid IN (1,2);

-- ----------------模糊查询null
-- address为空
SELECT studentno, studentname, address FROM student
WHERE address = '' OR address IS NULL;

-- 出生日期不为空
SELECT studentno, studentname, borndate FROM student
WHERE borndate IS NOT NULL;

-- ----------------- sub query
-- 原始：找到高等数学科目的学生成绩和科目
SELECT studentno, subjectname, studentresult
FROM result r
INNER JOIN SUBJECT sub
ON r.`subjectno` = sub.`subjectno`
WHERE subjectname LIKE '高等数学%'
ORDER BY studentresult DESC;

-- sub query 方法（注意用in）
SELECT studentno, subjectno, studentresult
FROM result
WHERE subjectno IN (
	SELECT subjectno
	FROM `subject`
	WHERE subjectname LIKE '高等数学%'
)
ORDER BY studentresult DESC;

-- ------------------常用函数

-- math
SELECT ABS(-8);
SELECT CEILING(9.3); -- 向上取整,10
SELECT FLOOR(9.6); -- 向下取整,9
SELECT RAND(); -- 返回一个 0~1 随机数
SELECT SIGN(-3); -- 符号，-1负数，0为0，1正数

-- string
SELECT CHAR_LENGTH("this is an example"); -- 18
SELECT CHAR_LENGTH("再小的帆也能远航"); -- 8
SELECT CONCAT("我","爱","你们"); -- 拼接
SELECT INSERT('12345678',2,3,'abcd'); -- 1abcd5678, 从位置2开始，用后面的string（abcd）替换掉之前3个字符（234）
SELECT LOWER('KuangShen');
SELECT UPPER('KuangShen');
SELECT INSTR('13aasdoi123','3'); -- 第一次出现指定字符3的位置：2
SELECT REPLACE("坚持就能成功，坚持吧","坚持",'努力'); -- ‘努力就能成功，努力吧’替换所有指定string 为后面的string
SELECT SUBSTR('abcde',2,3); -- 起始位置，截取长度
SELECT REVERSE("坚持就能成功"); -- 倒序string

-- example
SELECT * FROM student
WHERE studentname LIKE '赵%';

-- 可以对一个结果进行操作
SELECT REPLACE(studentname,'赵','藻')
FROM student
WHERE studentname LIKE '赵%';

-- 可以对多行进行操作，类似apply
SELECT REPLACE(studentname,'赵','藻')
FROM student;


-- 日期，时间
SELECT CURRENT_DATE(); -- 2021-05-05
SELECT CURDATE(); -- 2021-05-05
SELECT NOW(); -- 2021-05-05 13:32:27
SELECT LOCALTIME(); -- 2021-05-05 13:32:27
SELECT SYSDATE(); -- 2021-05-05 13:33:07
SELECT YEAR(NOW()); 
SELECT MONTH(NOW()); 
SELECT DAY(NOW()); 
SELECT HOUR(NOW()); 
SELECT MINUTE(NOW()); 
SELECT SECOND(NOW()); 


-- system
SELECT SYSTEM_USER(); -- root@localhost
SELECT USER(); -- root@localhost
SELECT VERSION();

-- ---------------------聚合函数

-- 统计行数
SELECT COUNT(studentname) FROM student; -- 一般作用在PK上，最快，但会忽略该列的null值,只会计数非null的行数
SELECT COUNT(*) FROM student; -- null也会计数，计算行数，走所有的列
SELECT COUNT(1) FROM student; -- null也会计数，计算行数，按行走，把一行当成1(?)，较快


SELECT SUM(studentresult) AS 总分 FROM result;
SELECT AVG(studentresult) AS 均分 FROM result;
SELECT MAX(studentresult) AS 最高分 FROM result;
SELECT MIN(studentresult) AS 最低分 FROM result;


-- ---------------------MD5
CREATE TABLE `testmd5`(
	`id` INT(4) NOT NULL,
	`name` VARCHAR(20) NOT NULL,
	`pwd` VARCHAR(50) NOT NULL,
	PRIMARY KEY(`id`)
)ENGINE = INNODB DEFAULT CHARSET = utf8;


INSERT INTO testmd5 VALUES (1, '张三','123456'),(2, '李四','123456'),(3, '王五','123456');

-- encode
-- update testmd5 set pwd=MD5(pwd) where id=1;
UPDATE testmd5 SET pwd=MD5(pwd);

-- 插入时加密
INSERT INTO testmd5 VALUES(4,'jessy',MD5('123456'));

-- 校验：对比加密后的值
SELECT * FROM testmd5 WHERE `name`='jessy' AND pwd = MD5('123456');


-- -------------------transaction
SET autocommit = 1 -- 开启（默认）
SET autocommit = 0 -- 关闭

-- 手动处理事务

--  关闭自动commit
SET autocommit = 0 -- 关闭

--  transaction 开始
START TRANSACTION -- 标记事务开启，表示同一组transaction

INSERT ***
INSERT ***

-- 提交，持久化（陈工）
COMMIT 

-- 回滚，回到原来（失败）
ROLLBACK 

-- 回复自动commit
SET autocommit = 1 -- 开启（默认）

-- 中间的话可以保存
SAVEPOINT 保存名称 -- 设置checkpoint
ROLLBACK TO SAVEPOINT 保存名称 -- 回滚到保存点
RELEASE SAVEPOINT 保存名称 -- 撤销保存点
;

-- --------------模拟转账
CREATE DATABASE shop CHARACTER SET utf8 COLLATE utf8_general_ci;
USE shop;
CREATE TABLE `account`(
	`id` INT(3) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(30) NOT NULL,
	`money` DECIMAL(9,2) NOT NULL,
	PRIMARY KEY(`id`)
)ENGINE = INNODB DEFAULT CHARSET=utf8;
INSERT INTO `account`(`name`,`money`)
VALUES ('A',2000.00),('B',10000.00);

-- 转账
SET autocommit =0;
START TRANSACTION ;
UPDATE `account` SET money = money-500 WHERE `name`='A';
UPDATE `account` SET money = money+500 WHERE `name`='B';

COMMIT;
ROLLBACK;

SET autocommit =1;
