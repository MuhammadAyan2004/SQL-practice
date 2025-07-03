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



create table students(
id int primary key,
name varchar(50),
age int unsigned,
marks int unsigned
);

insert into students values
(1,'Ayan',20,95),
(2,'Ayesha',19,97),
(3,'Usman',19,44),
(4,'Esar',22,78);

alter table students;

select * from students;



-- SELECT s.name AS Salesman, c.cust_name, s.city
-- FROM Salesman s
-- JOIN Customer c ON s.city = c.city;

-- SELECT o.ord_no, o.purch_amt, c.cust_name, c.city
-- FROM Orders o
-- JOIN Customer c ON o.customer_id = c.customer_id
-- WHERE o.purch_amt BETWEEN 500 AND 2000;

-- SELECT c.cust_name AS Customer_Name, c.city, s.name AS Salesman, s.commission
-- FROM Customer c
-- JOIN Salesman s ON c.salesman_id = s.salesman_id;

-- SELECT c.cust_name AS Customer_Name, c.city AS customer_city, s.name AS Salesman, s.commission
-- FROM Customer c
-- JOIN Salesman s ON c.salesman_id = s.salesman_id
-- WHERE s.commission > 0.12;

-- SELECT c.cust_name AS Customer_Name, c.city AS customer_city, s.name AS Salesman, s.city AS salesman_city, s.commission
-- FROM Customer c
-- JOIN Salesman s ON c.salesman_id = s.salesman_id
-- WHERE c.city <> s.city AND s.commission > 0.12;

-- SELECT o.ord_no, o.ord_date, o.purch_amt, c.cust_name AS Customer_Name, c.grade, s.name AS Salesman, s.commission
-- FROM Orders o
-- JOIN Customer c ON o.customer_id = c.customer_id
-- JOIN Salesman s ON o.salesman_id = s.salesman_id;

-- SELECT c.cust_name, c.city AS customer_city, c.grade, s.name AS Salesman, s.city AS salesman_city
-- FROM Customer c
-- JOIN Salesman s ON c.salesman_id = s.salesman_id
-- ORDER BY c.customer_id ASC;

-- SELECT s.name AS Salesman
-- FROM Salesman s
-- LEFT JOIN Customer c ON s.salesman_id = c.salesman_id
-- ORDER BY s.name ASC;

create database labs;
use labs;

create table employees (
emp_id int primary key,
name varchar(50), 
department varchar(50), 
salary int, 
hire_date date, 
position varchar(50)
);

INSERT INTO employees (emp_id, name, department, salary, hire_date, position) VALUES
(101, 'Alice Johnson', 'IT', 6000, '2020-03-15', 'Software Engineer'),
(102, 'Bob Smith', 'HR', 4500, '2019-07-22', 'HR Manager'),
(103, 'Charlie Brown', 'IT', 5500, '2021-01-10', 'System Analyst'),
(104, 'Diana Ross', 'Finance', 7000, '2018-11-05', 'Financial Analyst'),
(105, 'Ethan Hunt', 'Sales', 4800, '2022-04-01', 'Sales Executive'),
(106, 'Fiona Davis', 'IT', 5100, '2020-09-12', 'Database Admin'),
(107, 'George Lee', 'Marketing', 5200, '2017-06-30', 'Marketing Lead');


CREATE VIEW employee_info AS
SELECT emp_id, name, department
FROM employees
WHERE department = 'IT';

SELECT * FROM employee_info;

CREATE VIEW high_paid_employees AS
SELECT *
FROM employees
WHERE salary > 5000;

SELECT * FROM high_paid_employees;

DROP VIEW employee_info;

UPDATE employee_info
SET department = 'HR'
WHERE emp_id = 101;

drop table Employees;

-- Employee Table
CREATE TABLE Employees (
    Emp_ID INT PRIMARY KEY,
    F_NAME VARCHAR(50),
    L_NAME VARCHAR(50),
    Salary DECIMAL(10, 2),
    Department VARCHAR(50),
    isActive BIT
);

-- Product Table
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    P_NAME VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

INSERT INTO Employees (Emp_ID, F_NAME, L_NAME, Salary, Department, isActive) VALUES
(101, 'John', 'Doe', 6000.00, 'IT', 1),
(102, 'Jane', 'Smith', 4500.00, 'HR', 1),
(103, 'Alice', 'Johnson', 5200.00, 'Finance', 1),
(104, 'Bob', 'Brown', 4000.00, 'IT', 0),
(105, 'Mike', 'Davis', 7000.00, 'Marketing', 1);

INSERT INTO Product (Product_ID, P_NAME, Category, Price) VALUES
(201, 'Laptop', 'Electronics', 1200.00),
(202, 'Smartphone', 'Electronics', 800.00),
(203, 'Desk Chair', 'Furniture', 150.00),
(204, 'Notebook', 'Stationery', 5.00),
(205, 'Monitor', 'Electronics', 300.00);

-- Procedure to Get All Employees
DELIMITER $$
CREATE PROCEDURE GetEmployees()
BEGIN
    SELECT * FROM Employees;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE GetEmployeeCount()
BEGIN
    SELECT COUNT(*) AS TotalEmployees FROM Employees;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE UpdateEmployeeSalary()
BEGIN
    UPDATE Employees
    SET Salary = Salary + 500
    WHERE Emp_ID = 101;
END $$
DELIMITER ;










-- Procedure: Get Products by Category
DELIMITER $$
CREATE PROCEDURE GetProductsByCategory(IN Category VARCHAR(50))
BEGIN
    SELECT * FROM Product
    WHERE Category = Category;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE GetProductsByPriceRange(
    IN MinPrice DECIMAL(10,2),
    IN MaxPrice DECIMAL(10,2)
)
BEGIN
    SELECT * FROM Product
    WHERE Price BETWEEN MinPrice AND MaxPrice;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE SearchProductsByName(IN SearchTerm VARCHAR(100))
BEGIN
    SELECT * FROM Product
    WHERE P_NAME LIKE CONCAT('%', SearchTerm, '%');
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE UpdateProductPrice(
    IN ProductID INT,
    IN NewPrice DECIMAL(10,2)
)
BEGIN
    UPDATE Product
    SET Price = NewPrice
    WHERE Product_ID = ProductID;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insertintoproducts(
    IN ProductID INT,
    IN P_NAME VARCHAR(100),
    IN Category VARCHAR(50),
    IN Price DECIMAL(10,2)
)
BEGIN
    INSERT INTO Product (Product_ID, P_NAME, Category, Price)
    VALUES (ProductID, P_NAME, Category, Price);
END $$
DELIMITER ;




SELECT o.ord_no, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id
FROM Orders o
JOIN Salesman s ON o.salesman_id = s.salesman_id
WHERE s.name = 'Paul Adam';

SELECT o.ord_no, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id
FROM Orders o
WHERE o.salesman_id IN (
    SELECT salesman_id
    FROM Customer
    WHERE customer_id = 3007
);

SELECT commission
FROM Salesman
WHERE city = 'Paris';

SELECT *
FROM Customer c
JOIN Salesman s ON c.salesman_id = s.salesman_id
WHERE c.customer_id < 2001 AND s.name = 'Mc Lyon';

SELECT grade, COUNT(*) AS total_customers
FROM Customer
WHERE grade > (
    SELECT AVG(grade)
    FROM Customer
)
AND city = 'New York'
GROUP BY grade;







CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    performance_rating DECIMAL(5,2)
);

CREATE TABLE evaluation (
    eval_id INT AUTO_INCREMENT PRIMARY KEY,
    evaluator_id INT,
    emp_id INT,
    eval_date DATE,
    performance_score DECIMAL(5,2),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);


DELIMITER $$
CREATE TRIGGER update_performance_rating_trigger
AFTER INSERT ON evaluation
FOR EACH ROW
BEGIN
    DECLARE avg_score DECIMAL(5,2);
    SELECT AVG(performance_score)
    INTO avg_score
    FROM evaluation
    WHERE emp_id = NEW.emp_id;
    UPDATE employee
    SET performance_rating = avg_score
    WHERE emp_id = NEW.emp_id;
END $$
DELIMITER ;


-- Employees
INSERT INTO employee (emp_id, name, department, performance_rating) VALUES
(1, 'Ayan', 'IT', NULL),
(2, 'Sara', 'HR', NULL),
(3, 'John', 'Finance', NULL);

-- Evaluations
INSERT INTO evaluation (evaluator_id, emp_id, eval_date, performance_score) VALUES
(101, 1, '2025-06-01', 4.5),
(102, 1, '2025-06-03', 3.8),
(103, 2, '2025-06-02', 4.2),
(104, 1, '2025-06-05', 4.0),
(105, 3, '2025-06-04', 5.0);


SELECT * FROM employee;













