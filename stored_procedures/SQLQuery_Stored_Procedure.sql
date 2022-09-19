 -- Stored Procedures

 -- Create a Procedure

 CREATE PROCEDURE Example_Employee
 AS
 SELECT *
 FROM SQLTutorial.dbo.EmployeeDemographics AS Dem
 INNER JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
	ON Dem.EmployeeID = Sal.EmployeeID
 WHERE Sal.Salary IS NOT NULL
 ORDER BY Age

 -- Execute the created procedure

 EXEC Example_Employee

 -- Example 2 using temp table

 CREATE PROCEDURE Temp_Employee
 AS
 DROP TABLE IF EXISTS #temp_employee
 CREATE TABLE #temp_employee
 (EmployeeID int,
 FirstName varchar(100),
 LastName varchar(100),
 Gender varchar(100),
 Age int,
 Jobtitle varchar(100),
 Salary int
 )
 INSERT INTO #temp_employee
 SELECT Demo.EmployeeID, FirstName, LastName, Gender, Age, JobTitle, Salary
 FROM SQLTutorial.dbo.EmployeeDemographics AS Demo
 INNER JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
 WHERE Salary IS NOT NULL
 SELECT *
FROM #temp_employee

-- Execute the created procedure

EXEC Temp_Employee