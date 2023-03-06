use vaalikone;
describe ehdokkaat;
select * from kysymykset;
select * from vastaukset;
desc ehdokkaat;
alter table ehdokkaat 
modify column username varchar(255) unique null;
alter table ehdokkaat modify column PASSWORD VARCHAR(255) DEFAULT NULL;
alter table ehdokkaat modify column EHDOKAS_ID INT auto_increment;
delete from `ehdokkaat` where ehdokas_id = 19;
select * from ehdokkaat;
insert into ehdokkaat(username, password, sukunimi, etunimi, puolue, KOTIPAIKKAKUNTA, IKA, MIKSI_EDUSKUNTAAN, MITA_ASIOITA_HALUAT_EDISTAA, AMMATTI) values ('test','Candidate','Codarcea','Aurel','Suomen Keskusta','Espoo','33','Olen opiskelja','Minä Haluan hyvän arvosasan luokassa','developer'); 
create table userpass (User_ID int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, Username varchar(255) NOT NULL, Password varchar(255) DEFAULT NULL); 
alter table ehdokkaat add column password varchar(255) default null after username;
update `ehdokkaat` set password=sukunimi;