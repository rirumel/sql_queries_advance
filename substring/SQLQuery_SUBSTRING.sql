 -- SUBQUERIES

 --SELECT
 SELECT FirstName, LastName, Age, (SELECT AVG(Age) FROM SQLTutorial.dbo.EmployeeDemographics) AS AVGAge
 FROM SQLTutorial.dbo.EmployeeDemographics

 -- PARTITION
 SELECT FirstName, LastName, Age, AVG(Age) OVER() AS AVGAge
 FROM SQLTutorial.dbo.EmployeeDemographics

 -- GROUP BY
 SELECT FirstName, LastName, Age, AVG(Age) AS AVGAge, COUNT(AGE) AS CountAGE
 FROM SQLTutorial.dbo.EmployeeDemographics
 GROUP BY FirstName, LastName, Age
 Order by 3


 --FROM (Not Recommended, Instead use Temp Tables)
 SELECT EmpSal.EmployeeID, EmpSal.Salary, (SELECT AVG(Salary) FROM SQLTutorial.dbo.EmployeeSalary) as AVGSalary
 FROM (SELECT * FROM SQLTutorial.dbo.EmployeeSalary) AS EmpSal

 -- WHERE

 SELECT *
 FROM SQLTutorial.dbo.EmployeeSalary
 WHERE EmployeeID IN (SELECT EmployeeID FROM SQLTutorial.dbo.EmployeeDemographics AS Dem WHERE Dem.Gender = 'Male')
