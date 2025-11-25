use ITI
----------part1-----------
----------1----------
select count(St_Id) from Student where St_Age is not null
----------2----------
select distinct ins_Name from Instructor 
----------3----------
select St_id as [Student id] , (isNull(St_Fname , ' ')+' '+isNull(St_Lname  , ' ') ) as [Student full name],ISNULL( Dept_Name , 'no department') as [Department name] 
from Student
inner join Department 
on Student.Dept_Id = Department.Dept_Id
----------4----------
select Instructor.Ins_Name , Department.Dept_Name from Instructor 
left join Department 
on Department.Dept_Id = Instructor.Dept_Id
----------5----------
select St_Fname+' '+St_Lname as 'student full name' , Course.Crs_Name from Student 
inner join Stud_Course 
on  Student.St_Id  = Stud_Course.St_Id
inner join Course
on Course.Crs_Id = Stud_Course.Crs_Id
where Stud_Course.Grade is not null
----------6----------
select count(Crs_id) , Top_Name from Course
inner join Topic
on Topic.Top_Id = Course.Top_Id
group by Top_Name
----------7----------
select Max(salary) , Min(salary) from Instructor
----------8----------
select salary from Instructor
where salary < (select AVG(salary) from Instructor)
----------9----------
select Dept_Name , Min(Salary) from Department
inner join Instructor
on Department.Dept_Id=Instructor.Dept_Id
group by Dept_Name
-----
select distinct Dept_Name from Department
inner join Instructor
on Department.Dept_Id=Instructor.Dept_Id
where Instructor.Salary = (select Min(salary) from Instructor)
----------10-----------
select top(2) Salary from Instructor
order by Salary desc
----------11-----------
select Ins_Name , coalesce(cast(Salary as Varchar(20) ) , 'bonus') from Instructor
----------12-----------
select AVG(Salary) from Instructor
----------13-----------
select x.St_Fname , y.* from Student x
inner join Student y
on x.St_super = y.St_Id
----------14-----------
select salary , Dept_Id
from (select * , DENSE_RANK() over(PArtition by Dept_Id order by salary desc) as DR from Instructor ) as newTable
where DR<=2
----------15-----------
select *
from (select *,Row_number() over(PArtition by Dept_Id order by newid()) as RN
      from Student) as newtable
      where RN=1
-----------------------------------------------------------------------------------------------------------------
-----------part2----------------
use AdventureWorks2012
------1-------
select SalesOrderID, ShipDate from Sales.SalesOrderHeader
where OrderDate between '7/28/2002' and '7/29/2014'
------2-------
select ProductID, Name from Production.Product
where StandardCost<110
------3-------
select ProductID, Name from Production.Product
where weight is null
------4-------
select * from Production.Product
where color in ('Silver', 'Black','Red')
------5-------
select * from Production.Product
where name like 'b%'
------6-------
UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3

select * from Production.ProductDescription
where Description like '%_%'
------7--------
select sum(TotalDue) from Sales.SalesOrderHeader 
where OrderDate between '7/1/2001' and '7/31/2014'
------8--------
select distinct HireDate from HumanResources.Employee
------9--------
select AVG(distinct ListPrice) from Production.Product
------10-------
select 'The ' + Name + ' is only! ' + cast( ListPrice as varchar(20)) from Production.Product
WHERE ListPrice BETWEEN 100 AND 120
ORDER BY ListPrice;
------11-------
select rowguid,Name,SalesPersonID,Demographics into [Store_Archive]  from  Sales.Store 

select rowguid,Name,SalesPersonID,Demographics into [Store_Archive]  from  Sales.Store  where 1=0
------12-------
SELECT CONVERT(varchar, GETDATE(), 101)
UNION
SELECT CONVERT(varchar, GETDATE(), 103)                              
UNION
SELECT CONVERT(varchar, GETDATE(), 105)                              
UNION
SELECT CONVERT(varchar, GETDATE(), 108)                              
UNION
SELECT CONVERT(varchar, GETDATE(), 120)
UNION
SELECT FORMAT(GETDATE(), 'MM/dd/yyyy')
UNION
SELECT FORMAT(GETDATE(), 'dd/MM/yyyy')
UNION
SELECT FORMAT(GETDATE(), 'dddd, MMMM dd, yyyy') 
UNION
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd HH:mm:ss')
UNION
SELECT FORMAT(GETDATE(), 'hh:mm tt')

