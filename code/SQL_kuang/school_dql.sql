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