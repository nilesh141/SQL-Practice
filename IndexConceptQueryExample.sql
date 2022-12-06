USE ND_DB
GO
CREATE TABLE tbl_Employee(
Empid INT PRIMARY KEY,
FName VARCHAR(10),
LNAME VARCHAR(10),
DOB DATE,
DOJ DATE,
Salary FLOAT);

CREATE TABLE tbl_Dependent(
DId int PRIMARY KEY, 
DName VARCHAR(20),
DGender VARCHAR(10),
DRelation VARCHAR(20), 
DOB DATE,
EmpId INT FOREIGN KEY REFERENCES tbl_Employee(EmpId))

INSERT INTO tbl_Employee
VALUES(3423,'Rohan','Shah','1989/04/17','2013/10/23',67000);
INSERT INTO tbl_Employee
VALUES(2323,'Kanak','Mehule','1993/03/09','2015/11/15',56000);
INSERT INTO tbl_Employee
VALUES(4399,'Kevam','Murli','1988/09/12','2008/01/01',79000);

--inserting values for dependent
INSERT INTO tbl_Dependent
VALUES(1194,'HARISH','MALE','SON','1998/04/30',3423);

INSERT INTO tbl_Dependent
VALUES(2828,'JONIE','MALE','BROTHER','1996/03/27',2323);

INSERT INTO tbl_Dependent
VALUES(894,'LATA','FEMALE','DAUGHTER','1995/12/06',4399);

CREATE VIEW EmpDepndt_View     --creating view for employee & dependent
WITH SCHEMABINDING
AS
SELECT E.Empid,E.FName,E.LNAME,E.DOJ, D.DId,D.DName,D.DRelation FROM dbo.tbl_Employee AS E 
INNER JOIN dbo.tbl_Dependent AS D ON E.Empid=D.EmpId;

CREATE UNIQUE CLUSTERED INDEX Idx_EMPDepndt ON dbo.EmpDepndt_View(Empid,DId); --creating index

SELECT *FROM EmpDepndt_View

UPDATE EmpDepndt_View SET DOJ='2018/05/13' WHERE Empid=3423

SELECT *FROM EmpDepndt_View
