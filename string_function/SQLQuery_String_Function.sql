-- String Functions

CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

INSERT into EmployeeErrors VALUES
('5000', 'Kevino', 'Maloneyo')

SELECT *
FROM EmployeeErrors

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics

-- This table contains a lot of errors and/ or wrong formats. Now I will go through different string functions
-- to format the table values

-- TRIM, LTRIM, RTRIM

SELECT EmployeeID, TRIM(EmployeeID) AS TRIMMEDID
FROM EmployeeErrors

SELECT EmployeeID, LTRIM(EmployeeID) AS LEFTTRIMMEDID
FROM EmployeeErrors

SELECT EmployeeID, RTRIM(EmployeeID) AS RIGHTTRIMMEDID
FROM EmployeeErrors

-- REPLACE

SELECT LastName, REPLACE(LastName, ' - Fired', '') AS FixedLastName
FROM EmployeeErrors


-- SUBSTRING

-- One example of Fuzzy Match using SUBSTRING
SELECT Dem.FirstName, SUBSTRING(Dem.FirstName, 1, 3) AS DemFirstName, EmpErr.FirstName, SUBSTRING(EmpErr.FirstName, 1, 3) AS EmpErrFirstName  
FROM SQLTutorial.dbo.EmployeeDemographics AS Dem
INNER JOIN SQLTutorial.dbo.EmployeeErrors AS EmpErr
	ON SUBSTRING(Dem.FirstName, 1, 3) = SUBSTRING(EmpErr.FirstName, 1, 3)

-- Upper and Lower strings

-- UPPER

SELECT UPPER(FirstName)+' '+UPPER(LastName) AS FullName
FROM SQLTutorial.dbo.EmployeeDemographics

-- LOWER

SELECT LOWER(FirstName)+' '+LOWER(LastName) AS FullName
FROM SQLTutorial.dbo.EmployeeDemographics
