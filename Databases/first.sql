#I have no clue what to comment
select version(), current_date();
create database mydb1;
#show databeses
show databases;
use mydb1;
select database();
create database mydb2;
#to remove - drop database database_name
drop database mydb2;
drop table mytb1;
create table mytb1
(
col1 varchar(20),
col2 varchar(30),
col3 varchar(25)
);
create table author
(
aut_id int auto_increment primary key,
aut_name varchar(50) not null,
country varchar(25) not null,
home_city varchar(25),
created_at timestamp default current_timestamp
);

#structure of the table
describe mytb1;
insert into mytb1(col1,col2,col3)
values ('value1','value2','value3'),
('value11','value22','value33');

describe author;

insert into author( aut_name, country, home_city) values
('Pekka','Finland','Kajaani'),
('Deepak','Finland','Helsinki'),
('Tapio','Finland','Oulu'),
('Sari','Finland','Tomio');
select * from author;

create table category1
(
cate_id int auto_increment primary key not null,
cate_description varchar(25) Not null,
product_category varchar(25) not null default 'cat1'
);
describe category1;

#Exercises 1-3

create database newdb;
use newdb;

create table project_plan
(
id int(11) auto_increment primary key,
task_desc varchar(255) not null,
start_date date not null,
end_date date
);

#Exercise 4

create table user_info
(
user_id int(11) auto_increment primary key not null,
fName varchar(50) not null,
lName varchar(50) not null,
Address varchar(50) not null,
Phone_Number bigint(20),
birth_date date not null,
created_at timestamp default current_timestamp
);
describe user_info;

#Exercise 5

describe project_plan;

insert into project_plan(task_desc,start_date,end_date) values
('list task',20191031,null),
('task 1',20191101,null),
('task 2',20191109,20191115),
('task 3',20191115,20191119),
('task 4',20191121,20191121);

#Exercise 6

select * from project_plan;

#Exercise 7

describe user_info;

insert into user_info(fName,lName,Address,Phone_Number,birth_date) values
('Pekka','Mertoniemi','Street Name 1','12312421',18321220),
('Marko','Bertoniemi','Street Name 2','12456421',19520805),
('Aurel','Codarcea','Kaitalahdenranta 4','0456401399',19861122),
('Mikko','No Finnish family name coming to my mind','Street Name 3','521312231',19460220),
('Alan','No family name coming to my mind','Street Name 4','423123123',19981221);

#Exercise 8

select * from user_info;




