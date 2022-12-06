USE ND_DB
GO
CREATE TABLE tbl_Emp14(    --creating employee table with this name as exercise dated for 14oct & already there're employee table 
Emp_Id INT PRIMARY KEY,
Emp_FName VARCHAR(10),
Emp_LName VARCHAR(10),
Emp_Salary FLOAT)

INSERT INTO tbl_Emp14 --insering data to table
VALUES (453,'Shyam', 'Shinde',50000);
INSERT INTO tbl_Emp14 
values (382,'Jalak', 'Kanan',64000.75);
INSERT INTO tbl_Emp14 
values (389,'Yogesh','Jadhav',70000);

CREATE PROCEDURE SProc_updt_Slry   --creating stored procedure to update salary if id exist otherwise raise exception
 
 @up_id int,
 @up_Salary int
AS
BEGIN
 IF NOT EXISTS(SELECT Emp_Id FROM tbl_Emp14 WHERE Emp_Id =@up_id)
 BEGIN
     RAISERROR ('Employee id %s does not exist',1,1,@up_id)
 END
 ELSE
  BEGIN TRY
   update tbl_Emp14 set Emp_Salary=@up_Salary where Emp_Id= @up_id
  END TRY
  BEGIN CATCH
    SELECT ERROR_NUMBER() as ErrorNumber,
    ERROR_MESSAGE() as ErrorMessage,
    ERROR_PROCEDURE() as ErrorProcedure,
    ERROR_STATE() as ErrorState,
    ERROR_SEVERITY() as ErrorSeverity,
    ERROR_LINE() as ErrorLine 
  END CATCH
end;

Create table tbl_EmpAudit(AuditDate DateTime,AuditEmpId int,updtdSlry FLOAT);--creating Audit table

CREATE TRIGGER trg_EmpAudit  --creating trigger for auditing update details in tbl_Emp14
ON tbl_Emp14
after update
AS
BEGIN
DECLARE @AuditEmpId INT
DECLARE @updtdSlry FLOAT
SELECT @AuditEmpId=Emp_Id, @updtdSlry=Emp_Salary from INSERTED
INSERT INTO tbl_EmpAudit
values(GETDATE(),@AuditEmpId,@updtdSlry)
end;

exec SProc_updt_Slry @up_id=453, @up_Salary=76000; --executing stored procedure

select* from tbl_Emp14
select *from tbl_EmpAudit
