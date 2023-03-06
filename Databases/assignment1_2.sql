/*
****************************************************** Assignment 1 & Assignment 2 ***************************************************************'**
*************************************1 point for each correct answer. Maximum of 12 points *******************************************************
*************************************Please submit the sql file. The file name should be firstname_lastname12.sql****************************
*/
#1. Write SQL statement to display the version of your currently installed MySQL Database Server
select version();

#2. Write SQL statement to display the list of databases. 

show databases;

#3. Write SQL statement to display lastName, firstname and email from the employees table.

use classicmodels;

select lastName,firstname,email from employees;

#4. Write SQL statement to get unique country from customers table.

select COUNT(DISTINCT country) from customers;

#5. Create a database named firstname_lastname.

create database firstname_lastname;

#6. Create a database named mydb11.

create database mydb11;

#7. Remove the database mydb11.

drop database mydb11;


/* 8. Create a table named persons with columns:
 P_ID, Last_NAme, First_Name, Address, City. 
 Make the P_ID as primary key. */
 
 create table persons
 (
 P_ID int auto_increment primary key,
 Last_Name varchar(20),
 First_Name varchar(20),
 Address varchar(20),
 City varchar(20)
 );

#9 Copy the structure of the employees table into employees1

create table employees1 like employees;

#10 Open the bookinfo.sql file and run the entire sql file to create database named bookinfo with tables and data. 

#I did

#11 Insert 5 records into the author table. 
describe author;
select * from author;
insert into author ( aut_ID, aut_name, country, home_city) values
('AUTO16','Aurel','Finland','Espoo'),
('AUTO17','Pekka','Finland','Tampere'),
('AUTO18','Lidija','Lithuania','Vilnius'),
('AUTO19','Markko','Finland','Helsinki'),
('AUTO20','Tommi','Finland','Hameenlinna');


#12 Create a temporary table name temp11 that includes authors from UK (aut_name, home_city & country)

CREATE TEMPORARY TABLE temp11 as select aut_name, home_city, country from author where country = 'UK' ;
