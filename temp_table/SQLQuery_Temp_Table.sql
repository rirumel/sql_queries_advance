-- Temp Table

-- Scope of use: When there are tables with millions of data and you still need to join a multiple tables
-- Also you don't need all of the data from those tables
-- It's always good that you create temp tables where you can keep only those values and columns that you need
-- Even though it won't take any permanent space in the database, it is reusable.

-- Creating temp tables are as similar as creating tables.
-- only difference is one '#' needs to be placed before table name

-- CREATING a temp table
DROP TABLE IF EXISTS #temp_employeeinfo
CREATE TABLE #temp_employeeinfo
(EmployeeID int,
FirstName varchar(100),
LastName varchar(100),
Gender varchar(100),
Age int,
Jobtitle varchar(100),
Salary int
)

-- Looking into a temp table

SELECT *
FROM #temp_employeeinfo

-- Insert Values into the temp table (A fresh information for a new employee)

INSERT INTO #temp_employeeinfo VALUES
(0069, 'Ray', 'Harrington', 'Male', 29, 'Data Analyst', 50000),
(0036, 'Khus', 'Wheeler', 'Female', 24, 'Researcher', 45000)

-- Looking into the table again

SELECT *
FROM #temp_employeeinfo

-- Now insert values from Employee Demographics and Employee Salary into this temp table

INSERT INTO #temp_employeeinfo
SELECT Demo.EmployeeID, FirstName, LastName, Gender, Age, JobTitle, Salary
FROM SQLTutorial.dbo.EmployeeDemographics AS Demo
INNER JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
WHERE Salary IS NOT NULL

-- Now look into the table again

SELECT *
FROM #temp_employeeinfo

-- Since the table is ready, now look into the total job per position, employee's average age and salary:

SELECT Jobtitle, COUNT(Jobtitle) AS TotalJob, AVG(Age) AS AVGAge, AVG(Salary) AS AVGSalary
FROM #temp_employeeinfo
GROUP BY Jobtitle
ORDER BY Jobtitle Desc

