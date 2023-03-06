# ********************************LECTURE 6 - MySQL Functions************************************************
/* A function is simpy a stored program that you can pass parameters into which then returns a value. 
MySQL Comparison Functions : between and,  not between and ,like, not like ......
MySQL Control Flow Function: case operator, if() , ifnull(), nullif()
MySQL String Functions: ascii, bin, lower
MySQL Mathematical Functions: DIV, MOD, 
MySQL Data & Time Functions:
MySQL Encryption and Compression Functions:ENCRYPT(), SHA1(), MD5()
For more information and reading : https://dev.mysql.com/doc/refman/8.0/en/functions.html 
List of Functions & Operators: https://dev.mysql.com/doc/refman/8.0/en/func-op-summary-ref.html
*/
# will return a date after adding 10 days with the specified date.
SELECT ADDDATE('2019-11-25', INTERVAL 10 DAY) as required_date;
# will return a date after adding 10 Months with the specified date.
SELECT ADDDATE('2019-11-15', INTERVAL 10 MONTH) as required_date;
# will return a date after adding 2 years  with the specified date.
SELECT ADDDATE('2019-11-15', INTERVAL 2 YEAR) as required_date;
 # will return the current date and time in ‘YYYY-MM-DD HH:MM:SS’ format.
 SELECT CURRENT_TIMESTAMP();
 #will return the current time
 SELECT CURDATE();
 #************************************************************************************************************************************
use mydb44;
/* MySQL Count
It returns the count of an expression. 
It includes only records in the count that is it does not inlcude a NULL value. */
select count(EMPLOYEE_ID) from employees;
#***********************************************************************************************************************************************
/* MySQL MAX
Returns the maximum value of an expression.
*/
SELECT MAX(SALARY) from employees ;
SELECT DEPARTMENT_ID, MAX(SALARY) from EMPLOYEES group by DEPARTMENT_ID;
#*****************************************************************************************************************************************
/*  MySQL MIN
It returns the minimun value of an expression. 
*/
SELECT MIN(SALARY) from employees ;
SELECT DEPARTMENT_ID, MIN(SALARY) from EMPLOYEES group by DEPARTMENT_ID;
#********************************************************************************************************************************************************************
/* MySQL AVG
It returns the average value of an expression.
*/
SELECT AVG(SALARY) from employees ;
#*****************************************************************************************************************************
/* MySQL LENGTH
It returns the length of the string.
*/
select length('hello world');
#**********************************************************************************************
/* MySQL LOWER
It converts all characters to lowercase.
*/
Select lower('HELLO WORLD');
#************************************************** Databases Import & Export ********************************************************************************
# Exporting database (s)
/* Using the GUI in MySQL Workbench
Go to the administration table >> Data Export >> select a database or databases to export  >>
3 Options Dump Structure & Data (default), Dump Data , Dump Structure >> Export Progress >> Start Export 
*/
/*  Importing Database(s)
Using the GUI in MySQL Workbench
Go to the administration table >> Data Import/Restore >> select 
Import from dump project folder or Import From Self Contained File  >>
Locate the file or folder >> Import Progress >> Start Import
*/
#***************************************************************************************************************************************************************************************************************************
/* MySQL Connectors  (for your information / optional)
For building database applications in different languages (language of your choice)  
https://www.mysql.com/products/connector/
MySQL Java Connector: https://dev.mysql.com/downloads/connector/j/ 
Using JDBC statement Objects to Execute SQL: 
https://dev.mysql.com/doc/connector-j/8.0/en/connector-j-usagenotes-statements.html#connector-j-examples-execute-select
*/
#***************************************************************************************************************************************************************************************************************************
/*  Information About Exam
Total Points : 50 
Time 2 Hours & 15 Minutes 
7- 10 Questions and each question will have 2 -3 statments 
All types of resources are allowed to use in the exam.
No cheating/ No emailing / No talking / No Social Media Usage
After exam, you have to submit your database as well as SQL statements. 
All the best with the exam. 
*/
