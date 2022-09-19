-- Common Table Expression (CTE)

-- A temporary table that allows us to quickly query over. 
-- This table will not be saved anywhere so everytime you want to query on this table you have to first 
-- execute the WITH statement where you actually design the temporary table

WITH CTE_EMPLOYEE AS (
SELECT Demo.FirstName, Demo.LastName, Gender, COUNT(Demo.Gender) OVER(PARTITION BY Demo.Gender) AS TotalGender, 
Salary, AVG(Sal.Salary) OVER(Partition BY Demo.Gender) AS AVGSalary
FROM SQLTutorial.dbo.EmployeeDemographics AS Demo
INNER JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
WHERE Sal.Salary IS NOT NULL
)
SELECT FirstName+' '+LastName AS FullName, AVGSalary
FROM CTE_Employee

-- In the SELECT query I intentionally used column names with and without the alias names of the tables
-- just to see it works in both ways