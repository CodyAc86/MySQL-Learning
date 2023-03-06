/* Operators: 
***********************************************************************************************
Arithmetic Operators:  + - * / % 
*/
select 5+5;
select 5*5;
select 5/5;
# *************************************************************************************************
/* **********************************Comparison Operators ********************************************************************************
= Equal to, != not equal to, <> not equal to, >, <, >= ,<= ,!< Not less than , !> not greater than
*/
# Create the table grade 
create table grades (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
course_name VARCHAR(255) NOT NULL,
grade int Not Null
); 
# insert records as below
insert into grades (name, course_name, grade) values
('Pekka', 'Windows OS', 5),
('Pekka', 'Data Processing ', 4),
('Pekka', 'Basics of Programming', 3),
('Pekka', 'Finnish 1', 2),
('Pekka', 'Orientation Studies', 3),
('John', 'Windows OS', 1),
('John', 'Data Processing ', 2),
('John', 'Basics of Programming', 3),
('John', 'Finnish 1', 4),
('John', 'Orientation Studies', 5),
('Markku', 'Windows OS', 0),
('Markku', 'Data Processing ', 0),
('Markku', 'Basics of Programming', 1),
('Markku', 'Finnish 1', 2),
('Markku', 'Orientation Studies', 1),
('Niina', 'Windows OS', 3),
('Niina', 'Data Processing ', 1),
('Niina', 'Basics of Programming', 4),
('Niina', 'Finnish 1', 2),
('Niina', 'Orientation Studies', 1),
('Sari', 'Windows OS', 4),
('Sari', 'Data Processing ', 3),
('Sari', 'Basics of Programming', 2),
('Sari', 'Finnish 1', 1),
('Sari', 'Orientation Studies', 0);
#AVG() to calculate the average alter
select avg(5,4,3,2,1);
#check all records have been inserted into the table
select * from grades;
# create temporary table pekka_grades and list all grades for Pekka
create temporary table pekka_grades
select * from grades where name='Pekka';
#check you have listed all grades for Pekka
select * from pekka_grades;
#select grades for the course Windows OS
select * from grades where course_name='Windows OS';
# find students who have failed a course or courses
select * from grades where grade=0;
# find students whose grade is greater than 3 
select * from grades where grade>3;
# Use AVG(grade) and group by to get the average grade for all students
select name, AVG(grade) as 'Average Grade' from grades group by name;
# Calculate the average grade for each course
select course_name, AVG(grade) from grades group by course_name;
#********************************************* PRIMARY KEY********************************************************************************************************'*
/*
Uniquely identifies each record in a database table
Must contain unique values and Not NULL
Most tables have a primary key
A table has only one primary key
Primary key column’s type should be an integer type (INT or BIGINT)
Primary key column often has AUTO_INCREMENT attribute that generates a unique sequence for the key automatically. 
*/
#************************************************************************************************************************************************************************************************************************************************************
#*********************************************************UNIQUE CONSTRAINT*****************************************************************************************************************************************************************************************************
/* 
It is used to ensure values in a column are unique such as for email ids and 
phone numbers. 
Syntax
CREATE TABLE table_name(
    ...,
    column_name data_type UNIQUE,
    ...
);
*/
# Indexes - creating at the time of creating a table
CREATE TABLE table1(
   col1 INT PRIMARY KEY,
   col2 INT NOT NULL,
   col3 INT NOT NULL,
   col4 VARCHAR(10),
   INDEX (col2,col3) 
);
#creating a new index col4 on table1
create index index4 on table1(col4);
# to see indexes from a table 
SHOW INDEXES FROM table1;
describe table1;
#**************************************************************************MySQL Update & Alter Table ******************************************************************
# Create a new database mydb44
create database mydb44;
#select your working database as mydb44
use mydb44;
#Open mydb44.sql file and run all queries to insert tables and records in the mydb44 database. You can find the file in the required files folder
# MySQL Update table Examples
# to update email for Steven King as sking@hamk.fi
update employees set email='sking@hamk.fi' where EMPLOYEE_ID=100;
#check if the email has been updated
select * from employees where EMPLOYEE_ID=100;
# to update email id for everyone in the table as not available run the following query
UPDATE employees SET email='not available';
# please write why you were not able to update the email id. DO NOT DISABLE THE SAFE MODE"
# You can use limit to limit the number of rows 
SELECT * FROM employees LIMIT 4;
/* Update the email and commission_pct column of employees table with 'not available' and 0.10 for 
those employees whose department_id is 110. */
UPDATE employees 
SET email='not available', commission_pct=0.10 
WHERE department_id=100;
#check that the update has been done correctly
select * from employees WHERE department_id=100;
/*  update salary by 1000 (that is if someone has 7000 his salary is going to be 7000+1000)
for those employees with COMMISSION_PCT greater than 0.30  and  department_id=80*/
select * from employees where COMMISSION_PCT > 0.30 and department_id=80; 
UPDATE employees 
SET salary=salary+1000
WHERE commission_pct>.30 and department_id=80;
#*******************************************************************************************************************************
use mydb44;
CREATE TABLE test ( id INT, name VARCHAR(20));
describe test;
# to delete id column from test 
# Syntax ALTER TABLE table_name DROP column_name
alter table test drop id ;
# Adding a new column to exisiting table 
# Syntax: ALTER TABLE table_name ADD column_name;
/*  to add  email column to the test table
Syntax: alter table table_name add col_name datatype */
alter table test add email varchar(50);
# to rename the table test to test1
alter table test rename test1;
/* to change column email from varchar(50) to varchar(30), NOT NULL & Default value to 'email not available'
, change column name to fname , add column lname varchar (50) */
alter table test1 modify email varchar(30) not null default 'email not available',
change name fname varchar(50), 
add lname varchar(50);
describe test1;
# Add timestamp column to test1
alter table test1 add created_at timestamp;
# Add an indext on column created_at and a unique index on column email
alter table test1 add index (created_at), 
add unique (email);
# remove column email 
alter table test1 drop column email;
# add a new column id as Auto_increment and make it a primary key
alter table test1 add id int auto_increment primary key;
/* When we add new column, it is added as the last column, you can add column
as the first column or after a column, lets add col1 as first column and col2 after lname */
alter table test1
add col1 int first, 
add col2 int after lname ;
#to change column name col2 to col22
alter table test1 change col2 col22 int;
# to provide default value as 10 for col2
alter table test1 modify col2 int not null default 10;
# to change the default value for a column. lets change 10 to 20 for col2
alter table test1 alter col2 set default 20;
#to remove default constraint
alter table test1 alter col2 drop default;
describe test1;