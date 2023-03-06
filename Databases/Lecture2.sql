# Creating a database 
create database mydb1; #creates a new database named mydb1
# if not exists is optinal
create database if not exists mydb2; 
#To display all databases on the database server  
show databases;
# you can also use
show SCHEMAS;
#MySQL select database :  to see which database is currently selected.
select database();
# to filter results when displaying databases
show databases like 'myd%';
/* remeber to select a database to work with using use keyword
Use database_name;*/
use mydb1;
# to remove database use drop keyword
drop DATABASE mydb1;
show DATABASES;
/* Creating a table: create keyword
Create table table_name
(
col_name1 datatype(size),
col_name1 datatype(size),
col_name1 datatype(size)
);
*/
# Creating a table named author
use mydb2;
CREATE TABLE author 
(
aut_id INT AUTO_INCREMENT PRIMARY KEY, 
aut_name VARCHAR(50) NOT NULL,
country VARCHAR(25) NOT NULL,
home_city VARCHAR(25),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
# inserting data into table 
insert into author (aut_name, country, home_city) values
('Pekka', 'Finland', 'Kajaani'),
('Deepak', 'Finland', 'Helsinki'),
('Tapio', 'Finland', 'Oulu'),
('Sari', 'Finland', 'Tornio');
select * from author;
/*  task 1 
Create a table name category 
Column Names: 
cate_id (Primay key, integer, auto_increment Not null)
cate_description (varchar(25) Not null)
*/
create table category1 
(
cate_id INT AUTO_INCREMENT PRIMARY KEY Not null, 
cate_description varchar(25) Not null, 
product_category varchar (25) not null default 'cat1'
);
#descripe table_name : Describes  the columns and default values for a table.
describe category1;
# Task 2: insert 5 random records into your category1 table 
insert into category1 (cate_description, product_category) values
('TV & Video', default),
('Kitchen','kit');
select * from category1;
#Task 3: create table book_rec and insert 5 random records into your table
create table book_rec (
book_id int not null auto_increment primary key, 
book_name varchar(50) not null default 'no book name',
no_pages decimal(5,0) not null default '0', 
pub_lang varchar(15) not null, 
book_price decimal (8,2) not null default '0.00');
describe book_rec;
#to display the list of tables in the selected database 
show tables;
#**************************************************************************
/*  CREATE TABLE IF NOT EXISTS 
to prevent an error from occurring if the table exists. */
CREATE TABLE IF NOT EXISTS author1
(
aut_id varchar(8),
aut_name varchar(50),  
country varchar(25),  
city  varchar(25) NULL
); 
#to copy the structure of the table 
CREATE TABLE copy_book_rec LIKE book_rec;
select * from author;
# change your working database to classicmodels
use classicmodels;
select * from customers where country = 'Finland';
create table copy_customers like customers;
select * from copy_customers; # notice that when using like with create table, it copies only the structure but no data or records
#change the working database to mydb2
use mydb2;
#copy table with data 
select * from author;
create table author_copy 
as select * 
from author;
select * from author_copy;
# to copy specific data only
create table author_Kajaani as select * from author 
where home_city='Kajaani';
#check if it has copied all data as per the condition
select * from author_kajaani;
#***********************************************************************************************************************
#creating a temporary table 
CREATE TEMPORARY TABLE temp1
SELECT * FROM products;
select * from temp1;
#*************************************************************************************************************************
#drop table table_name to delete tables from a database
drop table newauthor, copy_book_rec;
#***************************************************************************************************************************



