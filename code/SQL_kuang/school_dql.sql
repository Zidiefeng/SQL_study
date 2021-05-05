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




