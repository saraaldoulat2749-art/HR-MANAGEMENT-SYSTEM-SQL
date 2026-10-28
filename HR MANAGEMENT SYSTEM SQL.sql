create database TechWorldHRDB
create table TemporaryStaff (
StaffID int Primary key ,
StaffName varchar(50),
HireDate date
)

create table  Department (
DepartmentID int Primary key ,
DepartmentName varchar(50) not null
)

create table Employee (
EmployeeID int Primary key ,
FullName varchar(100) not null,
Email varchar(100) unique,
Salary decimal(10,2),
DepartmentID int
)
select * from Employee

alter table Employee add PhoneNumber varchar(20)

drop table TemporaryStaff

insert into Department values (1,'IT')
insert into Department values (2,'HR')
insert into Department values (3,'Finance')

select * from Department

insert into Employee values (1,'Ahmad Ali', 'ahmad@techworld.com',1200.00,1,'0791111111')
insert into Employee values (2,'Sara Hassan', 'sara@techworld.com',950.00,2,'0792222222')
insert into Employee values (3,'Zaid Omar', 'zaid@techworld.com',1500.00,1,'0793333333')
insert into Employee values (4,'Mona Khaled', 'mona@techworld.com' ,800.00,3, '0794444444')

update Employee set Salary=1350.00 where EmployeeID=1

delete from Employee where EmployeeID=4

select * from Employee

select FullName from Employee

select  Salary from Employee

select  sum(Salary) from Employee

select avg(Salary) from Employee

select min (Salary) from Employee

select max(Salary) from Employee
 
select count(*) as TotalEmployees from Employee





