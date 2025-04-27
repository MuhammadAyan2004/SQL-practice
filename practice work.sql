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

select age from class10; 
select * from class10;
select * from class9;
-- truncate table class10;
-- drop table class9;


-- it shows you what type of data stored in database
-- show databases;
-- show tables;

create table emp (
id int primary key,
name varchar(50),
salary int default 20000
);

insert into emp(id,name) values(2,'Ayan');

select * from emp;


create table class8(
id int primary key,
name varchar(50),
age int not null,
marks int unsigned not null
);

alter table class8 add column city varchar(50) after marks;
update class8 set city = 'peshawar' where id = 9;

insert into class8 values
(1,'Ayan',14,95),
(2,'Usman',13,96),
(3,'Esar',16,97),
(4,'Mustufa',16,90),
(5,'Huzaifa',15,80),
(6,'Abdullah',13,92),
(7,'Ayesha',13,95),
(8,'Kinza',13,94),
(9,'Ammarah',16,99),
(10,'Sandal',14,98);

update class8 
set marks=82
where id =10;   
select *from class8;
select * from class8 where marks>=90 and age >=13;
select * from class8 where age=13;
select * from class8 where marks between 80 and 90;
select * from class8 where city not in('karachi','lahore');

select * from class8 where marks > 90 limit 3;
select * from class8 order by marks asc;
select * from class8 order by marks desc limit 3;




