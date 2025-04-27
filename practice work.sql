-- it shows how database is create or delete or check exixting database 
create database school;
-- create database if not exists school;
-- drop database if exists school1;

-- use database by selecting their name
use school;

create table class10(
id int primary key,-- it's uniquly identify column
name varchar(50),
age int not null
);

create table class9(
id int primary key,
name varchar(50),
age int unsigned not null -- unsigned used for positive value only
);

insert into class10
(id,name,age)
values
(9,'Ayan',20),
(10,'Ayan',20),
(11,'Ayan',20),
(12,'Ayan',20);

insert into class9 values
(1,'usamn',19),
(2,'usamn',19),
(3,'usamn',19),
(4,'usamn',19);


select * from class10;
select * from class9;
-- truncate table class10;
-- drop table class9;


-- it shows you what type of data stored in database
-- show databases;
-- show tables;
