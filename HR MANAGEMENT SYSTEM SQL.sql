create table AccessCards (   
CardID int primary key ,
CardNumber varchar(100) not null unique ,
EemID int FOREIGN KEY References Employee(EmployeeID)
)
insert into AccessCards values(1,'Card 101',1),(2,'Card 102',2),
(3,'Card 103',3)

select * from AccessCards
select * from Employee

create table Project (   
ProjectID int primary key ,
ProjectName varchar(100) not null 
)
insert into Project values(1,'AI & Security Training'),(2,'Cloud Migration')

select * from Project
select * from Department

create table EmployeeProject (   
PRIMARY KEY (EemID, ProjID),
EemID int FOREIGN KEY References Employee(EmployeeID),
ProjID int FOREIGN KEY References Project(ProjectID),
AssignedDate date
)
insert into EmployeeProject values(1,1,'2026-10-29'),(1,2,'2026-10-29'),
(2,1,'2026-10-29'),(3,2,'2026-10-29')
select * from EmployeeProject
select * from Department
SELECT Employee.FullName,Employee.Salary,Department.DepartmentName from Employee inner join Department
on Employee.DepartmentID=Department.DepartmentID

SELECT * from Department left join  Employee
on Employee.DepartmentID=Department.DepartmentID

SELECT Employee.FullName,AccessCards.CardNumber from Employee inner join AccessCards
on Employee.DepartmentID=AccessCards.CardID

SELECT Employee.FullName,Project.ProjectName,EmployeeProject.AssignedDate
FROM Employee INNER JOIN EmployeeProject ON Employee.EmployeeID = EmployeeProject.EemID
INNER JOIN Project ON EmployeeProject.ProjID = Project.ProjectID


select DepartmentID,sum(Salary) AS TotalSalary,count(EmployeeID) AS EmployeeCount from Employee
group by DepartmentID

select DepartmentID,AVG(Salary) AS AvgSalary from Employee
group by DepartmentID having avg(Salary) > 1000.00

select avg(Salary) from Employee


select * from Employee where Salary>(select avg(Salary) from Employee)

create view vw_EmployeeDetails as
select Employee.EmployeeID , Employee.FullName , Employee.Email , Department.DepartmentName
from Employee inner join Department on Employee.DepartmentID=Department.DepartmentID

select * from vw_EmployeeDetails

create procedure  sp_GetEmployeesByDepartment @DeptID int as begin  SELECT *
FROM Employee WHERE DepartmentID = @DeptID;
END;

--EXEC sp_GetEmployeesByDepartment @DeptID = 1;

create table EmployeeAudit (   
AuditID int primary key ,
EmployeeID INT, 
Action varchar(50) ,
ActionDate DATETIME
)
select * from EmployeeAudit
create trigger EmployeAudit on EmployeeAudit after delete as begin 
print('AFTER DELETE trigger on Employees that logs deleted employee IDs')
end 
delete from EmployeeAudit