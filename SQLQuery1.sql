create table Employee
(
   Id int primary key not null, 
   Name varchar(50),
   Email varchar(50)
)

 insert into Employee values(1, 'Vikas', 'vikas@gmail.com')
 insert into Employee values(2, 'Vikas', 'vikas@gmail.com')
 insert into Employee values(3, 'Vikas', 'vikas@gmail.com')
 insert into Employee values(4, 'Vikas', 'vikas@gmail.com')
 insert into Employee values(5, 'Vikas', 'vikas@gmail.com')

 select * from Employee

 select * from Employee 
 where salary= 
 (select max(salary) from Employee 
 where salary < (
 select salary from Employee
 where salary >= (select max(salary) from Employee)))

 alter table Employee
 add Salary bigint

 alter table Employee
 alter column Salary int

 alter table Employee
 drop column salary

 create procedure AddData @Id int, @Name varchar(50), @Email varchar(50), @Salary int
 as begin
 insert into Employee (Id, Name, Email, Salary) values
 ( @Id, @Name, @Email, @Salary )
 end
 select * from Employee

 create procedure DeleteData @Id int
 as begin
 delete from Employee where Id = @Id
 end
 exec DeleteData @Id = 2
 exec AddData @Id = 2, @Name = 'JP', @Email = 'jp@gmail.com', @Salary = 18000
 select * from Employee

 update Employee set  salary = 20000
 where Id = 3

 create function FindGrossSalary(@Email varchar(50))
 return int
 as begin
 declare @Hra int, @DA int, @PF int, @GrossSal int, @Netsal int
 select @Netsal = Salary from Employee where Email = @Email
 set @Hra = @Netsal*0.1
 set @DA = @Netsal*0.1
 set @PF = @Netsal*0.2
 set @GrossSal = @Netsal + @Hra + @DA + @PF
 return @GrossSal
 end
 
 select FindGrossSalary('vikas@gmail.com')

Create function Fun_EmployeeInformation()
returns table
as
return(select * from Employee  )

select dbo.Fun_EmployeeInformation()
select EmployeeDB.Fun_EmployeeInformation()

create function checkVote(@age as int)
returns varchar(20)
as begin
declare @str varchar(20)
if @age > 18
 begin
    set @str = 'eligible'
 end
else 
 begin
    set @str = 'not eligible'
 end
return @str
end

select dbo.checkVote(19)

sp_help [Fun_EmployeeInformation]

Create table tbl_Employees
(  
     Id int unique not null, 
     FirstName varchar(50),  
     LastName varchar(20),  
     Location varchar(20),  
     Gender varchar(50),  
     Salary int  
) 
select * from tbl_Employees1
drop table tbl_Employees1

insert into tbl_Employees1
select * from tbl_Employees

(Id, FirstName, LastName, Location, Gender, Salary)
select Id, FirstName, LastName, Location, Gender, Salary
from tbl_Employees

(Id, FirstName, LastName, Location, Gender, Salary)

Insert into tbl_Employees values (1,'Chittaranjan', 'Swain','Odisha', 'Male', 80000)  
Insert into tbl_Employees values (2,'Chandin', 'Swain', 'Pune','Female', 76000)  
Insert into tbl_Employees values (3,'Mitu', 'Pradhan','Delhi', 'Male', 55000)  
Insert into tbl_Employees values (4,'Jeni', 'Swain','Chennai', 'Female', 76000)  
Insert into tbl_Employees values (5,'Adyashree', 'Swain','UK', 'Female', 49000)  
Insert into tbl_Employees values (6,'Ram', 'Kumar','US', 'Male', 39000)  
Insert into tbl_Employees values (7,'Jitendra', 'Gouad','Hydrabad', 'Male', 35000)  
Insert into tbl_Employees values (8,'Dibas', 'Hembram','Bangalore', 'Male', 55000)  

select * from tbl_Employees



select distinct top 2 salary from tbl_Employees order by Salary desc 
Select Max(Salary) as Salary from tbl_Employees where Salary <(select MAX(Salary) from tbl_Employees)

select top 3 * from tbl_Employees
where salary < (select max(salary) from tbl_Employees)
order by Salary desc

WITH RESULT AS  
(  
    SELECT SALARY,  
           DENSE_RANK() OVER (ORDER BY SALARY DESC) AS DENSERANK  
    FROM tbl_Employees  
)  
SELECT TOP 1 SALARY  
FROM RESULT  
WHERE DENSERANK = 2  

create table Employee1
(
  Id int unique not null,
  Name varchar(100) not null,
  Address varchar(100)
)
drop table Employee1
insert into Employee1(Id, Name) values(1, 'abhishek')
select * from Employee1

select * from Employee

CREATE TABLE  "AGENTS" 
   (	
    "AGENT_CODE" CHAR(6) NOT NULL PRIMARY KEY, 
	"AGENT_NAME" CHAR(40), 
	"WORKING_AREA" CHAR(35), 
	"COMMISSION" DECIMAL(10,2), 
	"PHONE_NO" CHAR(15), 
	"COUNTRY" VARCHAR(25) 
	 );

	 INSERT INTO AGENTS VALUES ('A007', 'Ramasundar', 'Bangalore', '0.15', '077-25814763', '');
INSERT INTO AGENTS VALUES ('A003', 'Alex ', 'London', '0.13', '075-12458969', '');
INSERT INTO AGENTS VALUES ('A008', 'Alford', 'New York', '0.12', '044-25874365', '');
INSERT INTO AGENTS VALUES ('A011', 'Ravi Kumar', 'Bangalore', '0.15', '077-45625874', '');
INSERT INTO AGENTS VALUES ('A010', 'Santakumar', 'Chennai', '0.14', '007-22388644', '');
INSERT INTO AGENTS VALUES ('A012', 'Lucida', 'San Jose', '0.12', '044-52981425', '');
INSERT INTO AGENTS VALUES ('A005', 'Anderson', 'Brisban', '0.13', '045-21447739', '');
INSERT INTO AGENTS VALUES ('A001', 'Subbarao', 'Bangalore', '0.14', '077-12346674', '');
INSERT INTO AGENTS VALUES ('A002', 'Mukesh', 'Mumbai', '0.11', '029-12358964', '');
INSERT INTO AGENTS VALUES ('A006', 'McDen', 'London', '0.15', '078-22255588', '');
INSERT INTO AGENTS VALUES ('A004', 'Ivan', 'Torento', '0.15', '008-22544166', '');
INSERT INTO AGENTS VALUES ('A009', 'Benjamin', 'Hampshair', '0.11', '008-22536178', '');

SELECT * FROM AGENTS

CREATE TABLE  "CUSTOMER" 
   (	"CUST_CODE" VARCHAR(6) NOT NULL PRIMARY KEY, 
	"CUST_NAME" VARCHAR(40) NOT NULL, 
	"CUST_CITY" CHAR(35), 
	"WORKING_AREA" VARCHAR(35) NOT NULL, 
	"CUST_COUNTRY" VARCHAR(20) NOT NULL, 
	"GRADE" DECIMAL, 
	"OPENING_AMT" DECIMAL(12,2) NOT NULL, 
	"RECEIVE_AMT" DECIMAL(12,2) NOT NULL, 
	"PAYMENT_AMT" DECIMAL(12,2) NOT NULL, 
	"OUTSTANDING_AMT" DECIMAL(12,2) NOT NULL, 
	"PHONE_NO" VARCHAR(17) NOT NULL, 
	"AGENT_CODE" CHAR(6) NOT NULL REFERENCES AGENTS
); 

INSERT INTO CUSTOMER VALUES ('C00013', 'Holmes', 'London', 'London', 'UK', '2', '6000.00', '5000.00', '7000.00', '4000.00', 'BBBBBBB', 'A003');
INSERT INTO CUSTOMER VALUES ('C00001', 'Micheal', 'New York', 'New York', 'USA', '2', '3000.00', '5000.00', '2000.00', '6000.00', 'CCCCCCC', 'A008');
INSERT INTO CUSTOMER VALUES ('C00020', 'Albert', 'New York', 'New York', 'USA', '3', '5000.00', '7000.00', '6000.00', '6000.00', 'BBBBSBB', 'A008');
INSERT INTO CUSTOMER VALUES ('C00025', 'Ravindran', 'Bangalore', 'Bangalore', 'India', '2', '5000.00', '7000.00', '4000.00', '8000.00', 'AVAVAVA', 'A011');
INSERT INTO CUSTOMER VALUES ('C00024', 'Cook', 'London', 'London', 'UK', '2', '4000.00', '9000.00', '7000.00', '6000.00', 'FSDDSDF', 'A006');
INSERT INTO CUSTOMER VALUES ('C00015', 'Stuart', 'London', 'London', 'UK', '1', '6000.00', '8000.00', '3000.00', '11000.00', 'GFSGERS', 'A003');
INSERT INTO CUSTOMER VALUES ('C00002', 'Bolt', 'New York', 'New York', 'USA', '3', '5000.00', '7000.00', '9000.00', '3000.00', 'DDNRDRH', 'A008');
INSERT INTO CUSTOMER VALUES ('C00018', 'Fleming', 'Brisban', 'Brisban', 'Australia', '2', '7000.00', '7000.00', '9000.00', '5000.00', 'NHBGVFC', 'A005');
INSERT INTO CUSTOMER VALUES ('C00021', 'Jacks', 'Brisban', 'Brisban', 'Australia', '1', '7000.00', '7000.00', '7000.00', '7000.00', 'WERTGDF', 'A005');
INSERT INTO CUSTOMER VALUES ('C00019', 'Yearannaidu', 'Chennai', 'Chennai', 'India', '1', '8000.00', '7000.00', '7000.00', '8000.00', 'ZZZZBFV', 'A010');
INSERT INTO CUSTOMER VALUES ('C00005', 'Sasikant', 'Mumbai', 'Mumbai', 'India', '1', '7000.00', '11000.00', '7000.00', '11000.00', '147-25896312', 'A002');
INSERT INTO CUSTOMER VALUES ('C00007', 'Ramanathan', 'Chennai', 'Chennai', 'India', '1', '7000.00', '11000.00', '9000.00', '9000.00', 'GHRDWSD', 'A010');
INSERT INTO CUSTOMER VALUES ('C00022', 'Avinash', 'Mumbai', 'Mumbai', 'India', '2', '7000.00', '11000.00', '9000.00', '9000.00', '113-12345678','A002');
INSERT INTO CUSTOMER VALUES ('C00004', 'Winston', 'Brisban', 'Brisban', 'Australia', '1', '5000.00', '8000.00', '7000.00', '6000.00', 'AAAAAAA', 'A005');
INSERT INTO CUSTOMER VALUES ('C00023', 'Karl', 'London', 'London', 'UK', '0', '4000.00', '6000.00', '7000.00', '3000.00', 'AAAABAA', 'A006');
INSERT INTO CUSTOMER VALUES ('C00006', 'Shilton', 'Torento', 'Torento', 'Canada', '1', '10000.00', '7000.00', '6000.00', '11000.00', 'DDDDDDD', 'A004');
INSERT INTO CUSTOMER VALUES ('C00010', 'Charles', 'Hampshair', 'Hampshair', 'UK', '3', '6000.00', '4000.00', '5000.00', '5000.00', 'MMMMMMM', 'A009');
INSERT INTO CUSTOMER VALUES ('C00017', 'Srinivas', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '4000.00', '3000.00', '9000.00', 'AAAAAAB', 'A007');
INSERT INTO CUSTOMER VALUES ('C00012', 'Steven', 'San Jose', 'San Jose', 'USA', '1', '5000.00', '7000.00', '9000.00', '3000.00', 'KRFYGJK', 'A012');
INSERT INTO CUSTOMER VALUES ('C00008', 'Karolina', 'Torento', 'Torento', 'Canada', '1', '7000.00', '7000.00', '9000.00', '5000.00', 'HJKORED', 'A004');
INSERT INTO CUSTOMER VALUES ('C00003', 'Martin', 'Torento', 'Torento', 'Canada', '2', '8000.00', '7000.00', '7000.00', '8000.00', 'MJYURFD', 'A004');
INSERT INTO CUSTOMER VALUES ('C00009', 'Ramesh', 'Mumbai', 'Mumbai', 'India', '3', '8000.00', '7000.00', '3000.00', '12000.00', 'Phone No', 'A002');
INSERT INTO CUSTOMER VALUES ('C00014', 'Rangarappa', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '11000.00', '7000.00', '12000.00', 'AAAATGF', 'A001');
INSERT INTO CUSTOMER VALUES ('C00016', 'Venkatpati', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '11000.00', '7000.00', '12000.00', 'JRTVFDD', 'A007');
INSERT INTO CUSTOMER VALUES ('C00013', 'Sundariya', 'Chennai', 'Chennai', 'India', '3', '7000.00', '11000.00', '7000.00', '11000.00', 'PPHGRTS', 'A010');

SELECT * FROM CUSTOMER

create function sumTotal (@CUST_CODE VARCHAR(6))
returns int
as begin

declare @total int, @opening_amt int, @outstanding_amt int
select @opening_amt = OPENING_AMT, @outstanding_amt = OUTSTANDING_AMT from CUSTOMER
set @total = @opening_amt + @outstanding_amt
return @total
end

select dbo.sumTotal('C00001')

create procedure sumMethod @opening_amt int, @outstanding_amt int 
as begin
select * from CUSTOMER
end

exec sumMethod 12, 12

(select opening_amt from CUSTOMER where CUST_CODE = 'C00013') ( select outstanding_amt from CUSTOMER where CUST_CODE = 'C00013')


ALTER table voter_table
(
  Id int,
  Name varchar(50),
  Age int
)
select * from voter_table
alter table voter_table alter column Id int not null
alter table voter_table add primary key(Id)
alter table voter_table drop constraint [PK__voter_ta__3214EC07C92A4A79]
alter table voter_table add unique(Id)
alter table voter_table drop constraint [UQ__voter_ta__3214EC060F0E7BDF]

create table students
(
  id int,
  gender char(10)
)
insert into students values
(1,'M'),(2,'F'),(3,'F'),(4,'F'),(5,'F'),(6,'F'),(7,'F'),(8,'F'),(9,'F')

UPDATE students
SET gender = CASE 
WHEN gender = 'M' THEN 'F'
WHEN gender = 'F' THEN 'M'

CREATE PROCEDURE CREATE_TABLE @TblName varchar(50)
as begin
declare @query varchar(100)
set @query = 'create table' + @TblName + '(Id int identity(100,1)
  Name varchar(20),
  Email varchar(20),
  City varchar(20),
  Pincode int)'
  sp_execute(@query)
  end
