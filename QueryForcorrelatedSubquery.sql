USE ND_DB
GO
CREATE TABLE tbl_Qualfctn(
Qualification_ID INT PRIMARY KEY, 
Qualification varchar(15));

CREATE TABLE tbl_Emp(
Emp_ID varchar(15)	PRIMARY KEY, 
FName varchar(10),
LName varchar(10), 
DOB Date,
DOJ Date,
salary float,
Qualification_ID INT FOREIGN KEY REFERENCES tbl_Qualfctn(Qualification_ID)
);

INSERT INTO tbl_Qualfctn
VALUES(389847,'BA')
INSERT INTO tbl_Qualfctn
VALUES(90323,'BCom')
INSERT INTO tbl_Qualfctn
VALUES(844347,'BSc')
INSERT INTO tbl_Qualfctn
VALUES(24922,'BTech');

INSERT INTO tbl_Emp
VALUES('SA6473','Hitesh','Sharma','1987/06/09','2019/01/01', 36549.5, 389847);
INSERT INTO tbl_Emp
VALUES('RD2838','Ramesh','Yewade','1989/02/17','2018/04/01', 41559.10, 844347);
INSERT INTO tbl_Emp
VALUES('AC2326','Hitesh','Sharma','1987/06/09','2019/01/01', 45549.5, 90323);
INSERT INTO tbl_Emp
VALUES('SE74342','Hitesh','Sharma','1987/06/09','2019/01/01', 60000, 24922);


select *from tbl_Qualfctn
select *from tbl_Emp

PRINT('Using Inner Join')
SELECT q.Qualification_ID,q.Qualification,e.Emp_ID ,e.FName,E.salary 
FROM tbl_Qualfctn AS q INNER JOIN tbl_Emp AS e
on E.Emp_ID=Q.Qualification  

PRINT('Using Left Outer Join')
SELECT e.Emp_ID ,e.FName,E.salary, q.Qualification_ID,q.Qualification
FROM tbl_Emp AS e LEFT OUTER JOIN tbl_Qualfctn AS q
on Q.Qualification=E.Emp_ID  

PRINT('Using Right Outer Join')
SELECT e.Emp_ID ,e.FName,E.salary, q.Qualification_ID,q.Qualification
FROM tbl_Emp AS e RIGHT OUTER JOIN tbl_Qualfctn AS q
on Q.Qualification=E.Emp_ID  

