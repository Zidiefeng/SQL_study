-- ----------------------------------------------
-- select
-- must with "from"
USE employees;
SELECT *
FROM employees;
    
-- set a condition upon which to specify what do to retrieve (ctrl+b for format)
SELECT *
FROM employees
WHERE first_name = 'Denis';
    
-- -----------------------
--  AND & OR
SELECT *
FROM employees
WHERE first_name = 'Denis' and gender ="M";

--  "AND" can only apply to different columns, or return NULL, but "or" can work on same column
SELECT *
FROM employees
WHERE first_name = 'Denis' and first_name = 'Denis';  
    
--  or 
SELECT *
FROM    employees
WHERE first_name = 'Denis' OR gender = 'M';
    
-- if both "and" and "or", machine will firstly run "and" first, so use "()"

-- -------------------------
-- in 
select *
from employees
where first_name in ('Cathie','Mark','Mathan');
-- same as "or"
select *
from employees
where first_name = 'Cathie' or 
first_Name = 'Mark' or
first_name= 'Mathan'; 

-- not in 
select *
from employees
where first_name not in ('Cathie','Mark','Mathan'); # not equal to any of them

-- ------------------------
--  like
select *
from employees
where first_name like ('Mar%'); # this return all starting with Mar
-- %:substitue for some chars
select *
from employees
where first_name like ('Mar_') ;
-- _:substitue for only a single char

-- not like
select *
from employees
where first_name not like ('M%') ; # nothing like M%
-- wildcard character include: *, %, _

-- -----------------------------
-- between
select *
from employees
where hire_date between '1990-01-01' and '1990-01-10';
-- can be applied to date, number and string

-- not between
select *
from employees
where hire_date not between '1990-01-01' and '1990-01-10'; # return two parts 

-- --------------------------
-- is not null
select *
from employees
where first_name is not null;

-- is null
select *
from employees
where first_name is null;

-- --------------------------
-- operation  > >= < <= != or <> 
select * 
from employees
where first_name <> 'Mark';

-- ---------------
-- distinct 
select distinct gender # first do select gender, then find distinct
from employees;

-- ----------------------
-- aggregate function
-- apply on multiple rows (of one column), return only one value

-- count()
-- number of non-null record (include numeric, & non-numeric)
select count(emp_no)
from employees;

select count(distinct first_name)
from employees;

-- sum()
-- sum non-null values
select sum(salary)
from salaries;

-- min()
-- max()

-- avg()
-- round()
-- non null record
select round(avg(salary))
from salaries;

-- non null record
select round(avg(salary),3) #number of decimal places
from salaries;


-- ------------------------------
-- order by
-- how to display the output dataframe
select *
from employees
order by first_name desc;

select *
from employees
order by first_name asc;

-- can order by >1 cols 
select *
from employees
order by first_name asc, last_name desc;

-- ---------------------------
-- group by
-- must after "where", before "order by"
-- if a string column is select, just return the first one (for other software, maybe return error)
select first_name, count(first_name) # always include the groupby column in "select"
from employees
group by first_name # distinct here
order by first_name;

-- for duplicate records, can group by ID, for example
-- --------------------------------
-- having
-- "where" for groups
-- compare "having" and "where":
-- 1. after "having", can apply to an aggregate function, but "where" can‘t
-- 2. if no group, use "having" instead of "where" still work
-- 3. however, if group is used, "non-aggregate" condition can not mix with "aggregate function"in on having 
-- 4. if both used, first do "where" and then take output into groupby
select first_name, count(first_name) as names_count
from employees
group by first_name
having count(first_name) >250
order by first_name;

-- "where" + "having"
select first_name, count(first_name) as names_count
from employees
where hire_date>'1999-01-01'
group by first_name
having count(first_name) < 200
order by first_name desc;

-- ---------------------------
-- aliases (as)
-- change filed name in output
select first_name, count(first_name) as numbers 
from employees
group by first_name # distinct here
order by first_name;

-- ----------------------------------------
-- limit
-- limit of number of rows to display, at the end, only focus on the output
select *
from salaries
order by emp_no desc
limit 10;

-- limit: also can be set on the bar above

-- the default maximum number of rows to display
-- where to set: edit-preferences-sql editor - sql execution - select query results
 

-- ----------------------------
-- insert 

-- see the data
select * 
from employees
limit 10;

insert into employees # table nuame
( #can view the column info from the table by clicking
	emp_no,
    birth_date,
    first_name)
values
(	999123091,
	'1988-01-01',
    'Jess');

-- if same order, all entered, no need to type column names
insert into employees
values(
	9999999,
	'1888-09-09',
	'Jessy',
	'Sun',
	'F',
	'2091-03-03');
    
-- insert from another table
-- create a new table
create table departments_dup(
dept_no char(4) not null,
dept_name varchar(100) not null
);

-- see, nothing here yet
select * 
from departments_dup;







-- insert from another table
insert into departments_dup
(	dept_no,
	dept_name)
select * # can use where to filter rows that to enter
from departments;

-- see, inserted
select * 
from departments_dup;

-- -------------------------------
--  commit & rollback
-- commit: save transactions in the database
-- rollback: commit1 commmit2, commit3, operations, rollback, back to commit3
-- to use roll back, cancel clicking "the button on the left from limit", also, cancel auto save

-- edit- preferences-sql editor - "save updates", please turn it off
-- when update,delete, be very very very carelly！

-- -------------------------------
-- update one line
-- check original record
use employees;
select *
from employees
where first_name ='Jessy';

-- update
update employees
set
	first_name = 'Jessy01', #new status
    gender = 'M'
where first_name ='Jessy';  # original status, if not exists, --> error

-- check whether succeed
select *
from employees
where first_name ='Jessy01';




-- update 
-- see original dataset
select *
from departments_dup
order by dept_no;

-- save the dataset as we see it
commit;

-- if no "where", edit every line to the same, a mistake!
update departments_dup
set
	dept_no= 'd011',
    dept_name='Quality';

-- check    
select *
from departments_dup;

-- back to the last commit
rollback;

-- check    
select *
from departments_dup
order by dept_no;

-- ---------------------
-- delete
commit;

-- delete one record
-- check original
select *
from employees
where emp_No ='99903';

select *
from titles
where emp_No ='99903';

delete from employees 
where emp_No ='99903';

-- check whether sucessful
select *
from employees
where emp_No ='99903';

-- for a related table(child by emp_no), the record associated with 99903 is also deleted, since it is a "on delete cascade"
select *
from titles
where emp_No ='99903';

-- rollback before delete
rollback;
select *
from employees
where emp_No ='99903';

-- if no "where", delete all records from 
delete from departments_dup;
select *
from departments_dup;
rollback;

-- -----------------------
-- drop, truncate, delete
-- drop: structure, index, constraints, everything deleted for a table
	--  cannot be rollback/restore
-- truncate: remove all records in a table 
-- delete: delete row by row, however, for an auto-augmented row 1,2,3,4,5, if "delete" all, start from 6


-- --------------------------
-- ifnull()
-- must exactly 2 inputs
-- ifnull(col to desplay, if it is null what to enter)
-- use with select: when select something, if "null" will output, output another expression instead
select dept_no, ifnull(dept_name,'none provided') as dept_name
from departments_dup
order by dept_name;

-- --------------------------
-- coalesce()
-- coalesce(col to desplay, if it is null what to enter(if this not null),if it is null what to enter(if this not null),……)
select dept_no, coalesce(dept_name,dept_name,'none provided') as dept_name
# output dept_name if not null, if null output dept_name(if dept_name not null), if all previous null, output 'none provided'
from departments_dup
order by dept_name;

-- if only one input, output a column
select dept_no, coalesce('none provided') as fake_col
from departments_dup
order by dept_name;

-- -------------------------------
-- inner join
-- for records contains the key that shows in both tables
-- only non-null matching values returned
-- no constrain that 2 tables should be already linked by foreign key
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- “JOIN" = "INNER JOIN"
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager m
		JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- use "where m.dept_no = d.dept_no" is old version of jion, time consuming--> not use!


-- ---------------------
-- left join
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager m
        LEFT OUTER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- LEFT OUTER JOIN = LEFT JOIN
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;
-- if left join, left is m, use m.dept_no for orderby, instead of right table

-- right join
-- same as left join
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager m
        RIGHT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

-- RIGHT JOIN = RIGHT OUTER JOIN
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager m
        RIGHT OUTER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- -------------------------------
-- cross join
-- A cross join produces a cartesian product between the two tables, returning all possible combinations of all rows. 
-- It has no on clause because you're just joining everything to everything.
SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

-- cross join = join (without "on" what), but please use "cross join", be professional
SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;


-- 216 rows returned, = nrow of dept_manager(24) *  nrow of departments(9)
select count(*)
from dept_manager;
select count(*)
from departments;

-- can cross join many tables, but may very big



-- -----------------------------------------
-- join >2 tables
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no;

-- left join >2 table
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    employees e
        Right JOIN
    dept_manager m ON e.emp_no = m.emp_no
        LEFT OUTER JOIN
    departments d ON m.dept_no = d.dept_no;

-- join + groupby
-- joined, then grouped, then filter group by having, then, order by
select d.dept_name,avg(salary) as average_salary
from departments d
join
dept_manager m on d.dept_no=m.dept_no
join salaries s on m.emp_no = s.emp_no
group by d.dept_name
having average_salary>60000
order by average_salary desc;

-- -----------------------
-- union
-- must union same col/data type
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees e
WHERE
    e.emp_no = 10001 
UNION ALL SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_Date
FROM
    dept_manager m;
-- union all select = union select / union all =union

-- -----------------
-- sub query by "in"
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);

-- -------------------------
-- exists 
--  check row by row, "exists" return T/F 
	--  row by row:	first row in employee, select (e.first_name, e.last_name),see if （e.emp_no）,the same row, exists in table "dm.emp_no = e.emp_no"
-- if exist(x) = True (at least have one record), put it into output as a record, if False, do not output as a record
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no);
            
-- "exists" VS "in"
-- exists: test row value, quicker with large amounts of data
-- in: search among values, faster with small databases

-- where to put order by: 
	--  more professional to put "order by" in outer query

-- -----------------
-- sub query in "select", "from"
-- task: 
-- assign employee no 110022 as a manager to all employees from 10001-10020, 
-- amd employee no110039 as manager to employees 10021-10040
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(DE.DEPT_NO) AS DEPARTMENT_CODE,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS MANAGER_ID
    FROM
        EMPLOYEES E
    JOIN DEPT_EMP DE ON E.EMP_NO = DE.EMP_NO
    WHERE
        E.EMP_NO <= 10020
    GROUP BY E.EMP_NO
    ORDER BY E.EMP_NO) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.EMP_NO AS employee_ID,
            MIN(DE.DEPT_NO),
            (SELECT 
                    EMP_NO
                FROM
                    DEPT_MANAGER
                WHERE
                    emp_no = 110039) AS MANAGER_ID
    FROM
        EMPLOYEES e
    JOIN DEPT_EMP DE ON DE.emp_no = e.emp_no
    WHERE
        e.emp_No BETWEEN 10021 AND 10040
    GROUP BY E.EMP_NO
    ORDER BY E.EMP_NO
    LIMIT 20) AS B;


-- ----------------------------
-- SELF JOIN
-- using 2 aliases is obligatory to distinguish two tables
-- task: from the emp_manager table,
-- extract records only of those employees who are amangers as well
SELECT 
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE
    e2.emp_no IN (SELECT 
            manager_no
        FROM
            emp_manager);
-- (this does not work because of lack of table)

-- --------------------------------
-- view
-- see created view on the navigator
-- let other see result instead of let them see by coding
-- or: create or replace view Name as
create view Name as
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no);

select * 
from Name;








