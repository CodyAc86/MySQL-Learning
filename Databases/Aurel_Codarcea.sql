#******************************* DATABASES - 2 OP - Exam 14.11.2019**************************************************************************************
/* Total: 50 Points, To Pass: 20 Points
Instructions:  (For correctly following the instructions and uploading required file and database to Moodle - 5 Points)
1. Import the database 'examdb19.sql'  to get all tables required for the exam. 
2.	All required tables for the exam should be created in the same database that is your working database in the exam is  'examdb19.sql'
3. You need to upload your database and SQL queries, that is after completing all tasks, you will export your database and upload to the Moodle
along with your SQL queries.  
*/
#****************************************************************************************************************************************************************************
/* 1. Create a table named grades that includes columns student_id, student_name, course_name and grade. 
Make sure that the default value for grade is 0. Insert 5 random records into this table. - 5 Points */

create table grades(student_id int auto_increment primary key not null, student_name varchar(40) not null, course_name varchar(20), grade int(1) default(0) not null);
describe grades;
insert into grades(student_name,course_name,grade) values
('Aurel Codarcea','Computer Aplications','5'),
('Pekka Ulkonen','Business IT','3'),
('John Doe','IT','4'),
('Andi Gray','Management','5'),
('Ben Affleck','Hollywood','2');

/*2. Create a new table named employees123, that has columns: job_id, job_title, min_salary and max_salary . 
job_id is unique and auto incremental. min_salary by default should be 1000 and max_salary by default should be 5000. - 5 Points */

create table employees123(job_id int auto_increment primary key not null, job_title varchar(20), min_salary int(20) default(1000) not null, max_salary int(20) default(5000) not null);
describe employees123;

/*3. Make the student_id column in the table named grades (created in task 1) a primary key. 
Make the course_name column in the same table as “Unique” . - 5 Points  */

alter table grades modify student_id int auto_increment primary key not null;
alter table grades add unique(course_name);

/*4. Use table “grades”. Delete the column named course_name. Add a new column course_title  after grade.  
Add two more columns to the table: group19 and starting_date
for  “group19” assign the default value as “BBCAP19”
for "starting_date" assign the default value as 2019-11-11
Rename the table grades to new_grades.  - 5 Points*/

alter table grades drop course_name, add course_title int after grade;
alter table grades add group19 varchar(20) default('BBCAP19'), add starting_date timestamp default(20191111);
alter table grades rename new_grades;
select * from new_grades;

# 5 Create a table named employees90 and copy records whose DEPARTMEND_iD is 90 or 80  from the table employees. 

create table employees90 select * from employees where department_id=90 or department_id=80;
select * from employees90;

# 6 Create a table named records6 by running the following sql script - 1 Point
CREATE TABLE records6 (
  book_id varchar(15) NOT NULL DEFAULT '',
  book_name varchar(50) NOT NULL DEFAULT '',
  isbn_no varchar(15) NOT NULL DEFAULT '',
  cate_id varchar(8) NOT NULL DEFAULT '',
  aut_id varchar(8) NOT NULL DEFAULT '',
  pub_id varchar(8) NOT NULL DEFAULT '',
  dt_of_pub date NOT NULL DEFAULT '0000-00-00',
  pub_lang varchar(15) DEFAULT NULL,
  no_page decimal(5,0) NOT NULL DEFAULT '0',
  book_price decimal(8,2) NOT NULL DEFAULT '0.00'
);
# Add an index named cate_id on cate_id column for the table ‘records6’.  - 2 Points
create index cate_id on records6(cate_id);

# Add a column ‘id’ of integer type as first column of the table ‘records6’.  - 2 Points
alter table records6 add id int first;

/* 7 Use the employees table for following tasks:
- Update email for Steven King as sking@hamk.fi  - 1 Point
- Update salary by adding 1000 to the current salary  
for those employees with COMMISSION_PCT greater than 0.20  and  department_id=80  - 2 Points
- Update email id for everyone in the table as not available. If you are not able to update email ids for everyone,
please write the reason why you were not able to update the email id. - 2 Points */
describe employees;
update employees set email='sking@hamk.fi' where first_name='Steven' and last_name='King';
select * from employees where commission_pct>0.20 and department_id=80;
update employees set salary=salary + 1000 where commission_pct>0.20 and department_id=80;
/*8 Get FIRST_NAME, LAST_NAME, SALARY & DEPARTMENT NAME 
FOR EMPLOYESS WHOSE SALARY IS GREATER THAN 10000. (Hint: Left Join and use appropriate tables) - 5 Points */
select
e.first_name,
e.last_name,
e.salary,
d.department_name
from
employees e
left join departments d using(department_id) where salary>10000;

# 9 Get the first name, last name, hire date, salary of the manager for all managers whose salary is greater than 10000. - 5 Points

select 
	e.first_name,
    e.last_name,
    e.hire_date,
    e.salary,
    d.department_name
from
employees e inner join departments d using(manager_id) where salary > 10000;
