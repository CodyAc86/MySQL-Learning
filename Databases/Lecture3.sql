#Connection to the vcommander when you are not using school's computer
/*
Step 1: Use Vmware Horizon Client
Step 2: When using your  personal devices, for the first time you need to type in the "Enter the name of the Connection Server" >> vdi.hamk.fi
Step 3: Type your school's username and password. Select HAMK Student Win10
Step 4: Open Firefox or Google Chrome in HAMK Student Win 10 and type the url https://vcommander.hamk.fi/portal/login.xhtml 
Step 5: Login by typing your username as hamk\username and your password. 
Step 6. Open MySQL workbench that is installed on the virtual machine and connect to your database server. You are now able to execute SQL queries. 

******************* Please Remember to Shutdown your virtual machine when you are not using it. *******************************************************************

*/
#************************************************************************************************************************************************************************

#Storage Engine :  From version 5.5, MySQL uses InnoDB as the default storage engine.
# http://www.mysqltutorial.org/understand-mysql-table-types-innodb-myisam.aspx
#*******************************************************************************************************************************
/* Data Types - examples
#  http://www.mysqltutorial.org/mysql-data-types.aspx
----------------------------------------------------------------------------------------------------------------------------------------------
Decimal:
Syntax:  column_name  DECIMAL(P,D);
P >> the precision that represents the number of significant digits. (1 - 65)
D >> the scale that that represents the number of digits after the decimal point. (0 - 30)
column_name  Decimal(6,2);  # this can store 6 digits with 2 decimal places (9999.99 to -9999.99)
if you want only postive values, use UNSIGNED attribute
the column with DECIMAL UNSIGNED will not accept negative values. 
ZEROFILL attribute >> to  pad the display value by 0 up to display width specified by the column definition. 
Example: cost DECIMAL(7,4) zerofill 
if you insert 554.67 it will be displayed as 00554.67
-----------------------------------------------------------------------------------------------------------------------------------------------------------
VARCHAR
It is the variable-length string . The length can be upto 65,535
before MySQL version 5.0.3 it was capable of storing 255 characters but now 65,535 characters
Example: title VARCHAR(30)
---------------------------------------------------------------------------------------------------------------------------------------------------------
DATE 
To store data values. . MySQL uses yyyy-mm-dd format for storing a date value which can not be changed
Example birth_date DATE
DATE FUNCTIONS
SELECT NOW();
SELECT DATE(NOW()); #to get date only
SELECT CURDATE(); # to get the system date
----------------------------------------------------------------------------------------------------------------------------------------------------
TIME
MySQL uses HH:MM:SS' format for querying and displaying a time value
Syntaxt column_name TIME;.
Example: time TIME;
----------------------------------------------------------------------------------------------------------------------------------------------------
TIMESTAMP
the combination of date and time in the format YYYY-MM-DD HH:MM:SS
Syntaxt: col_name TIMESTAMP
*******************************************************************************************************************************
*/
/* **********************  NULL VALUES  *********************************************************************************
In MySQL a NULL value means an unknown value. It is different than an empty string or 0
NULL value is generally used for indicating that the data is missing, unknown or not applicable. 
Example, you can define PhoneNumber column as a Null  which can be added lateron.
At the time of inserting data, you can use NULL if some value is missing. 
*/
/********************************* NOT NULL *********************************************************************************
It is a column constraint to ensure values are stored in a column that is values are not NULL
Syntax: col_name data_type NOT NULL;
********************************************************************************************************************************
*/
#*******************************************DEFAULT*************************************************************
/*
DEFAULT defines a default value for a column
It is a value used in the case, there is no value specified by user.
Example product_category varchar (25) not null default 'cat1'
*/
#***********************************************************************************************************************
/* *************************************** TEMPORARY TABLE ********************************************************
TEMPORARY keyword can be used to create a table. 
TEMPORARY table is only visible to the current connection, and dropped automatically with the connection closed.
***************************************************************************************************************************************
*/
#AUTO INCREMENT 
# automatically generates a sequential integer whenever you insert a new row into the table.

#PRIMAY KEY
/* 
Uniquely identifies each record in a database table
Must contain unique values and Not NULL
Most tables have a primary key
A table has only one primary key
Primary key column’s type should be an integer type (INT or BIGINT)
Primary key column often has AUTO_INCREMENT attribute that generates a unique sequence for the key automatically. 
 The primary key sometimes may consist of multiple columns, the combination of values in these columns must be unique.
*/
#*********************************************TASKS****************************************************************
use mydb2;
create table project_plan (
id INT AUTO_INCREMENT PRIMARY KEY,
task_desc VARCHAR(255) NOT NULL,
start_date DATE Not NULL,
end_date DATE
);
create table user_info(
user_id INT AUTO_INCREMENT PRIMARY KEY,
fName VARCHAR(50) NOT NULL,
lName VARCHAR(50) NOT NULL,
Address VARCHAR(50) NOT NULL,
Phone_Number bigint, 
birth_date DATE Not NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
describe user_info;
describe project_plan;
# Insert 5 random records into project_plan
insert into project_plan (task_desc, start_date, end_date) values
('list task', 20191031, NULL),
('task 1', 20191101, NULL),
('task 2', 20191109, 20191115),
('task 3', 20191115, 20191119),
('task 4', 20191121, 20191121),
select * from project_plan;
# Insert 5 random records into user_info 
describe user_info;
insert into user_info (fName, lName, Address, Phone_Number, birth_date) values
('Markku','Henrikson', 'Kajaani', 1234567, 19951216);
select * from user_info;

# ******************* Please Remember to Shutdown your virtual machine when you are not using it. *******************************************************************