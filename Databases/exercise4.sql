# 1. Arithmetic Operator: Write SQL statement to add two numbers 25 and 46.
select 25 + 46;

#2. Arithmetic Operator: Write SQL statement to multiply two numbers 123 and 426. 
select 123 * 426;

/*3.  Write SQL statement to create a table named persons with columns: P_ID, Last_Name, First_Name, Address, City. 
Make the P_ID as primary key. */
use mydb1;
create table persons 
(
P_ID int auto_increment primary key,
Last_Name varchar(30),
First_Name varchar(30),
Address varchar(50),
City varchar(20)
);

#4.  Create a table named book_rec by running the following sql script
CREATE TABLE book_rec (
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

#5.  Add column id to the table book_rec
alter table book_rec add id int; 

/*6.   Insert Column FIRST: Use table ‘book_rec’. Delete the column ‘id’. 
 Insert a column ‘id’ of integer type as first column of the table ‘book_rec’. 
 (Check the structure of the table using ‘DESCRIBE’ . 
 Note id becomes the first column) 
 */
 alter table book_rec 
 drop id,
 add id int first;
 describe book_rec;
 
 /*7.  Insert a column AFTER the specific column. Use table ‘book_rec’. 
 To add columns c1 and c2 after id and aut_id columns respectively. 
 Check the structure of the table using ‘DESCRIBE’. */
 alter table book_rec
 add c1 int after id,
 add c2 int after aut_id;
 describe book_rec;
 
# 8 Add an index named cate_id on cate_id column for the table ‘book_rec’. 
create index cate_id on book_rec(cate_id); 

# 9 Add an UNIQUE INDEX named pub_id on pub_id column for the table ‘book_rec’
create unique index pub_id on book_rec(pub_id);

#10 Rename the table 'persons' to persons_new. 
alter table persons rename persons_new;

#11 Drop the pub_id unique index. 
drop index pub_id on book_rec;
