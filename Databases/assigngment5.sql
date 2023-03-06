# Assignment 5 : 6 Points

#------------------------------------------JOINS----------------------------------------------------------------------------------------------------------------------------------------------------
/* 1. In the required files folder, you will find lecture5db.sql, run the sql script to create a database and required tables for this exercise.
Write steps for running the script. 
i use CTRL+SHIFT+O for open sql script file
then i use CTRL+A to select all then i run the script


*/
# 2. Write the SQL statement to display all tables in the newly created database (lecture5db)

show tables;

#3. What is total number of records in the employees table? Hint: Use select, count function for EMPLOYEE_ID

select count(employee_id) from employees;

/* 4. Form a team of 2-4 people. 
The link includes exercises on MySQL Joins. 
https://www.w3resource.com/mysql-exercises/join-exercises/index.php
It include 13 tasks, you will complete them by discussing with each other and understanding joins. 
Make a simple explaination(note) of each of those tasks. I will come randomly to your groups and ask to 
explain the joins you have implemented. */

#1
select 
l.location_id,
l.street_address,
l.city,
l.state_province,
c.country_name
from locations l
natural join countries c;
/* This means that all the selected columns from the two tables will be shown together without repeating columns.*/
#2

select 
first_name,
last_name,
department_id,
department_name
from employees
join departments using (department_id);

/* I understand from this exercise that using join by itself will default to inner join. It shows all the employees sorted by the department_id */

#3
select
e.first_name,
e.last_name,
e.job_id,
e.department_id,
d.department_name
from employees e
join departments d on (e.department_id = d.department_id)
join locations l on (d.location_id = l.location_id)
where lower(l.city) = 'London';

/*i understand what i did here but i don't know how to explain it :D. 
Basically it searches for all the employees that work in London, and we need the 
"on" conditions in order to link the employees table to locations table through the departments table because
employees and locations don't have any columns of the same type and name.*/

 #4
 select
 e.employee_id 'Emp_ID',
 e.last_name 'Employee',
 m.employee_id 'Mgr_ID',
 m.last_name 'Manager'
 from employees e
 join employees m
 on (e.manager_id = m.employee_id);

/*here it lists all the employees (except Steven King) showing their mangers, the reason why
King is not in the employees column is because he doesn't have a manager (BIG BOSS ALERT! :D ).*/ 

#5
SELECT e.first_name, e.last_name, e.hire_date 
FROM employees e 
JOIN employees davies 
ON (davies.last_name = 'Jones') 
WHERE davies.hire_date < e.hire_date;

/*it's pretty obvious what happened here, we basically checked the hire date from all employees and
 compared it to the hire date of 'Jones' then listed all the employees that were hired after him)
