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

-- feature to turn off safe mode 
set sql_safe_updates = 0;

-- update function 
update class8  set marks=18 where id =10;   

-- funtion to delete in a rows
delete from class8 where marks < 33;

select *from class8;

-- operators used to compare  
select * from class8 where marks>=90 and age >=13;
select * from class8 where age=13;
select * from class8 where marks between 80 and 90;
select * from class8 where city not in('karachi','lahore');

-- function of limit and asceding or descending order 
select * from class8 where marks > 90 limit 3;
select * from class8 order by marks asc;
select * from class8 order by marks desc limit 3;

-- aggregation funtions to be used 
select marks from class8;
select max(marks) from class8;
select min(marks) from class8;
select avg(marks) from class8;
select count(id) from class8;

-- feature of group by 
select city,avg(marks)
from class8  
group by city 
order by avg(marks) asc;


create table customer (
customer_id int primary key,
customer_Name varchar(50),
method varchar(50),
payment int,
city varchar(50)
);
 
insert into customer values 
(101,'Ayan','netbanking','1000','karachi'),
(102,'Usman','credit card','927','karachi'),
(103,'Esar','netbanking','2987','peshawar'),
(104,'Mustufa','debit card','827','hydrabad'),
(105,'Huzaifa','debit card','9827','sakhar'),
(106,'Abdullah','netbanking','7236','lahore'),
(107,'Ayesha','netbanking','1000','karachi'),
(108,'Kinza','debit card','9230','rawalpindi'),
(109,'Ammarah','credit card','736','multan'),
(110,'Alia','credit card','10','lahore');

-- truncate customer;
select * from customer;
select method,count(payment)
from customer
group by method;

-- having clause in sql

select city,customer_name 
from customer
group by city,customer_name
having max(payment) >= 1000
order by max(payment);

select city, customer_name, max(payment) as max_payment
from customer
group by city,customer_name
having max(payment) >= 1000
order by max_payment;

select city,method,max(payment) as max_payment
from customer
where method = 'netbanking'
group by city,method
having max(payment)>=1000
order by max_payment;


create table student(
id int primary key,
name varchar(50),
age int not null,
marks int unsigned not null
);

alter table student drop column age;
alter table student rename to semester1;
alter table semester1 change column name S_Name varchar(50) not null;
alter table semester1 modify marks varchar(50);

insert into semester1 values(109,'Uzair','91');

create table dept(
id int primary key,
name varchar(50)
);

alter table dept add column HOD varchar(50) after name;
update dept set HOD = 'Dr.Ayan' where id ='18';
 
create table teacher(
id int primary key,
name varchar(50),
dept_id int,
foreign key (dept_id) references dept(id)
on update cascade
on delete cascade
);


insert into student values 
(1,'Ayan',14,95),
(2,'Usman',13,96),
(3,'Esar',16,97),
(4,'Mustufa',16,90),
(5,'Huzaifa',15,80);

insert into dept values
(12,'chemical engineering','Dr.Shahab');

update dept set id = 29 where id = 19;

delete from dept where id = 14;

insert into teacher values
(325,'Zulfiqar Ahmed','12'),
(635,'Talha Shakel','18'),
(167,'manzoor hussain','19');

select * from semester1;
select * from dept;
select * from teacher;





